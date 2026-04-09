<template>
  <div class="map-picker">
    <div v-if="!embedded">
      <el-button type="primary" plain icon="Location" @click="openMapPicker" :disabled="disabled">
        地图点选
      </el-button>

      <el-dialog
        title="地图选点"
        v-model="dialogVisible"
        width="900px"
        append-to-body
        draggable
        destroy-on-close
      >
        <div class="map-container-wrapper">
          <div v-if="!amapKey" class="no-key-tip">
            <el-empty description="高德地图 Key 未配置">
              <template #image>
                <svg class="icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="64" height="64">
                  <path d="M512 0C228.7 0 0 228.7 0 512s228.7 512 512 512 512-228.7 512-512S795.3 0 512 0zm-1 830.6c-7.4 0-14.7-0.5-22-1.4C333.2 807.1 192 629.8 192 421.2 192 230.4 346.4 76 537.2 76c50.7 0 99.2 10.8 143.6 30.7C730.5 133 768 184.8 768 244.5c0 74.6-60.6 135.2-135.2 135.2-57.6 0-106.9-35.8-127.6-86.5-26.9 65.6-98.9 111.6-179.5 111.6-100.8 0-184.3-77.6-195.1-176.5 67.1 0 132.3 25.8 181.1 72.2 47.5 45 73.7 105 73.7 169.2 0 160.3-130.3 290.6-290.6 290.6z" fill="#4285F4"/>
                </svg>
              </template>
              <el-button type="primary" @click="openEnvSettings">配置地图 Key</el-button>
            </el-empty>
          </div>

          <div v-show="amapKey" class="map-area">
            <div class="search-bar">
              <el-input
                v-model="searchAddress"
                placeholder="输入地址搜索定位"
                class="search-input"
                clearable
                @keyup.enter="searchByAddress"
              >
                <template #append>
                  <el-button icon="Search" @click="searchByAddress" :loading="searchLoading">搜索</el-button>
                </template>
              </el-input>
            </div>
            <div id="map-picker-container" class="map-container"></div>
            <div class="coordinate-info" v-if="selectedLngLat">
              <span>经度：{{ selectedLngLat.lng.toFixed(6) }}</span>
              <span>纬度：{{ selectedLngLat.lat.toFixed(6) }}</span>
              <span v-if="selectedAddress" class="address-text">地址：{{ selectedAddress }}</span>
            </div>
          </div>
        </div>

        <template #footer>
          <div class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="confirmSelection" :disabled="!selectedLngLat">确 定</el-button>
          </div>
        </template>
      </el-dialog>
    </div>

    <div v-else class="map-embedded">
      <div v-if="!amapKey" class="no-key-tip">
        <el-empty description="高德地图 Key 未配置" />
      </div>
      <div v-show="amapKey" class="map-area">
        <div class="map-toolbar">
          <div class="toolbar-left">
            <el-input
              v-model="searchAddress"
              placeholder="输入地址搜索定位"
              class="search-input"
              clearable
              @keyup.enter="searchByAddress"
            >
              <template #append>
                <el-button icon="Search" @click="searchByAddress" :loading="searchLoading">搜索</el-button>
              </template>
            </el-input>
            <el-input v-if="selectedLngLat" v-model="selectedLngLat.lng" class="coord-input" readonly placeholder="经度">
              <template #prefix><span class="coord-label">经度</span></template>
            </el-input>
            <el-input v-if="selectedLngLat" v-model="selectedLngLat.lat" class="coord-input" readonly placeholder="纬度">
              <template #prefix><span class="coord-label">纬度</span></template>
            </el-input>
          </div>
          <div class="toolbar-right">
            <el-button @click="clearSelection">清空</el-button>
          </div>
        </div>
        <div id="map-embedded-container" class="map-container"></div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted, nextTick } from 'vue'
import { ElMessage } from 'element-plus'
import AMapLoader from '@amap/amap-jsapi-loader'

const props = defineProps({
  modelValue: {
    type: Object,
    default: null
  },
  address: {
    type: String,
    default: ''
  },
  disabled: {
    type: Boolean,
    default: false
  },
  embedded: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['update:modelValue', 'change'])

const amapKey = import.meta.env.VITE_AMAP_KEY || ''
const amapSecurityCode = import.meta.env.VITE_AMAP_SECURITY_CONFIG || ''

const dialogVisible = ref(false)
const map = ref(null)
const marker = ref(null)
const geocoder = ref(null)
const selectedLngLat = ref(null)
const selectedAddress = ref('')
const searchAddress = ref('')
const searchLoading = ref(false)

const DEFAULT_CENTER = [112.6949, 22.3765]
const DEFAULT_ZOOM = 14

function openMapPicker() {
  dialogVisible.value = true
  if (props.modelValue) {
    selectedLngLat.value = {
      lng: Number(props.modelValue.longitude),
      lat: Number(props.modelValue.latitude)
    }
    selectedAddress.value = props.address || ''
    searchAddress.value = props.address || ''
  } else {
    selectedLngLat.value = null
    selectedAddress.value = ''
    searchAddress.value = ''
  }
  if (amapKey && dialogVisible.value) {
    setTimeout(() => {
      initMap()
    }, 100)
  }
}

function openEnvSettings() {
  ElMessage.info('请在 .env 文件中配置 VITE_AMAP_KEY')
}

let amapInstance = null

async function initMap(containerId = 'map-picker-container') {
  if (!amapKey) return

  if (amapSecurityCode) {
    window._AMapSecurityConfig = {
      securityJsCode: amapSecurityCode
    }
  }

  try {
    amapInstance = await AMapLoader.load({
      key: amapKey,
      version: '2.0',
      plugins: ['AMap.Geocoder', 'AMap.AutoComplete']
    })

    const hasLocation = selectedLngLat.value
    const centerPoint = hasLocation
      ? [Number(selectedLngLat.value.lng), Number(selectedLngLat.value.lat)]
      : DEFAULT_CENTER

    map.value = new amapInstance.Map(containerId, {
      zoom: DEFAULT_ZOOM,
      center: centerPoint,
      isHotspot: false,
      showLabel: true,
      mapStyle: 'amap://styles/normal'
    })

    geocoder.value = new amapInstance.Geocoder()

    if (hasLocation) {
      addMarker(amapInstance, selectedLngLat.value.lng, selectedLngLat.value.lat)
    } else if (props.address) {
      searchAddress.value = props.address
      geocodeAddress(props.address)
    }

    map.value.on('click', (e) => {
      const lng = e.lnglat.getLng()
      const lat = e.lnglat.getLat()
      selectedLngLat.value = { lng, lat }

      if (marker.value) {
        marker.value.setPosition([lng, lat])
      } else {
        addMarker(amapInstance, lng, lat)
      }
      map.value.setCenter([lng, lat])
      reverseGeocode(lng, lat)

      if (props.embedded) {
        emit('update:modelValue', { longitude: lng, latitude: lat })
        emit('change', {
          longitude: lng,
          latitude: lat,
          address: selectedAddress.value
        })
      }
    })
  } catch (error) {
    console.error('初始化高德地图失败:', error)
    ElMessage.error('初始化地图失败，请检查 Key 配置')
  }
}

function addMarker(AMap, lng, lat) {
  if (marker.value) {
    map.value.remove(marker.value)
  }

  const lngNum = Number(lng)
  const latNum = Number(lat)

  marker.value = new amapInstance.Marker({
    position: new amapInstance.LngLat(lngNum, latNum),
    title: '选中位置',
    draggable: true,
    cursor: 'move'
  })

  marker.value.on('dragend', (e) => {
    const lngLat = e.lnglat
    const lng = lngLat.getLng()
    const lat = lngLat.getLat()
    selectedLngLat.value = { lng, lat }
    reverseGeocode(lng, lat)
  })

  map.value.add(marker.value)
}

async function reverseGeocode(lng, lat) {
  if (!geocoder.value) return

  try {
    const result = await geocoder.value.getAddress([lng, lat])
    if (result.info === 'OK' && result.regeocode) {
      selectedAddress.value = result.regeocode.formattedAddress
    }
  } catch (error) {
    console.error('逆地理编码失败:', error)
  }
}

async function geocodeAddress(address) {
  if (!address) return

  searchLoading.value = true
  try {
    if (!geocoder.value) {
      if (amapSecurityCode) {
        window._AMapSecurityConfig = {
          securityJsCode: amapSecurityCode
        }
      }
      await AMapLoader.load({
        key: amapKey,
        version: '2.0',
        plugins: ['AMap.Geocoder']
      })
      geocoder.value = new amapInstance.Geocoder()
    }

    const result = await geocoder.value.getLocation(address)
    if (result && result.info === 'OK' && result.geocodes && result.geocodes.length > 0) {
      const location = result.geocodes[0].location
      if (location) {
        const lng = Number(location.lng)
        const lat = Number(location.lat)

        selectedLngLat.value = { lng, lat }
        selectedAddress.value = result.geocodes[0].formattedAddress

        if (marker.value) {
          marker.value.setPosition([lng, lat])
        }
        map.value.setCenter([lng, lat])
        map.value.setZoom(DEFAULT_ZOOM)
      }
    }
  } catch (error) {
    console.error('地理编码失败:', error)
  } finally {
    searchLoading.value = false
  }
}

async function searchByAddress() {
  const address = searchAddress.value.trim()
  if (!address) {
    ElMessage.warning('请输入要搜索的地址')
    return
  }
  await geocodeAddress(address)
}

function confirmSelection() {
  if (selectedLngLat.value) {
    const result = {
      longitude: selectedLngLat.value.lng,
      latitude: selectedLngLat.value.lat,
      address: selectedAddress.value
    }
    emit('update:modelValue', { longitude: selectedLngLat.value.lng, latitude: selectedLngLat.value.lat })
    emit('change', result)
  }
  dialogVisible.value = false
}

function clearSelection() {
  selectedLngLat.value = null
  selectedAddress.value = ''
  searchAddress.value = ''
  emit('update:modelValue', null)
  emit('change', null)
}

watch(dialogVisible, (val) => {
  if (!val && map.value) {
    setTimeout(() => {
      map.value.destroy()
      map.value = null
      marker.value = null
      geocoder.value = null
    }, 300)
  }
})

watch(() => props.modelValue, (val) => {
  if (val) {
    selectedLngLat.value = {
      lng: Number(val.longitude),
      lat: Number(val.latitude)
    }
    if (map.value && amapInstance) {
      map.value.setCenter([Number(val.longitude), Number(val.latitude)])
      if (marker.value) {
        marker.value.setPosition([Number(val.longitude), Number(val.latitude)])
      } else {
        addMarker(amapInstance, val.longitude, val.latitude)
      }
    }
  }
}, { immediate: true })

onMounted(() => {
  if (props.embedded && amapKey) {
    nextTick(() => {
      const container = document.getElementById('map-embedded-container')
      if (container) {
        if (props.modelValue) {
          selectedLngLat.value = {
            lng: Number(props.modelValue.longitude),
            lat: Number(props.modelValue.latitude)
          }
          selectedAddress.value = props.address || ''
          searchAddress.value = props.address || ''
        }
        initMap('map-embedded-container')
      }
    })
  }
})
</script>

<style scoped>
.map-container-wrapper {
  width: 100%;
  min-height: 400px;
}

.no-key-tip {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 400px;
  background: #f5f7fa;
  border-radius: 4px;
}

.map-area {
  position: relative;
}

.search-bar {
  margin-bottom: 10px;
}

.search-input {
  width: 400px;
}

.map-container {
  width: 100%;
  height: 400px;
  border-radius: 4px;
  overflow: hidden;
}

.coordinate-info {
  position: absolute;
  bottom: 10px;
  left: 10px;
  right: 10px;
  background: rgba(255, 255, 255, 0.95);
  padding: 8px 16px;
  border-radius: 4px;
  font-size: 13px;
  color: #606266;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  z-index: 10;
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.coordinate-info span {
  flex-shrink: 0;
}

.address-text {
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.map-embedded {
  padding: 10px;
}

.map-embedded .map-area {
  position: relative;
}

.map-embedded .map-container {
  height: 350px;
}

.map-toolbar {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 10px;
  gap: 10px;
  position: relative;
}

.toolbar-left {
  display: flex;
  gap: 10px;
  justify-content: center;
  flex-wrap: wrap;
}

.toolbar-left .search-input {
  width: 300px;
}

.toolbar-left .coord-input {
  width: 150px;
}

.coord-label {
  font-size: 12px;
}

.toolbar-right {
  display: flex;
  gap: 10px;
}
</style>
