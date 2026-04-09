<template>
  <div class="app-container">
    <el-card class="filter-card" shadow="hover">
      <el-form :model="queryParams" :inline="true">
        <el-form-item label="镇街">
          <el-select v-model="queryParams.townStreet" placeholder="请选择区域" clearable style="width: 200px">
            <el-option label="水口镇" value="水口镇" />
            <el-option label="长沙街道" value="长沙街道" />
            <el-option label="三埠街道" value="三埠街道" />
            <el-option label="月山镇" value="月山镇" />
            <el-option label="苍城镇" value="苍城镇" />
            <el-option label="龙胜镇" value="龙胜镇" />
            <el-option label="大沙镇" value="大沙镇" />
            <el-option label="马冈镇" value="马冈镇" />
            <el-option label="塘口镇" value="塘口镇" />
            <el-option label="百合镇" value="百合镇" />
            <el-option label="蚬冈镇" value="蚬冈镇" />
            <el-option label="金鸡镇" value="金鸡镇" />
            <el-option label="赤坎镇" value="赤坎镇" />
            <el-option label="雅瑶镇" value="雅瑶镇" />
            <el-option label="沙塘镇" value="沙塘镇" />
          </el-select>
        </el-form-item>
        <el-form-item label="分色等级">
          <el-select v-model="queryParams.overallLevel" placeholder="请选择等级" clearable style="width: 160px">
            <el-option label="绿色" value="green" />
            <el-option label="黄色" value="yellow" />
            <el-option label="红色" value="red" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 160px">
            <el-option label="正常" value="1" />
            <el-option label="停用" value="2" />
            <el-option label="未启用" value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
          <el-button icon="Refresh" @click="resetQuery">重置</el-button>
          <el-button type="primary" icon="Refresh" @click="loadMapData">刷新地图</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <div class="map-wrapper">
      <div v-if="!amapKey" class="no-key-tip">
        <el-empty description="请配置高德地图 Key">
          <template #image>
            <svg class="icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="64" height="64">
              <path d="M512 0C228.7 0 0 228.7 0 512s228.7 512 512 512 512-228.7 512-512S795.3 0 512 0zm-1 830.6c-7.4 0-14.7-0.5-22-1.4C333.2 807.1 192 629.8 192 421.2 192 230.4 346.4 76 537.2 76c50.7 0 99.2 10.8 143.6 30.7C730.5 133 768 184.8 768 244.5c0 74.6-60.6 135.2-135.2 135.2-57.6 0-106.9-35.8-127.6-86.5-26.9 65.6-98.9 111.6-179.5 111.6-100.8 0-184.3-77.6-195.1-176.5 67.1 0 132.3 25.8 181.1 72.2 47.5 45 73.7 105 73.7 169.2 0 160.3-130.3 290.6-290.6 290.6z" fill="#4285F4"/>
            </svg>
          </template>
          <el-button type="primary" @click="openSettings">配置地图 Key</el-button>
        </el-empty>
      </div>

      <div id="amap-container" class="map-container" v-show="amapKey"></div>

      <div class="layer-control" v-show="amapKey && mapLoaded">
        <div class="layer-title">图层控制</div>
        <el-checkbox-group v-model="activeLayers">
          <el-checkbox label="house">出租屋</el-checkbox>
          <el-checkbox label="device">设备</el-checkbox>
          <el-checkbox label="alert">告警</el-checkbox>
          <el-checkbox label="heatmap">热力图</el-checkbox>
        </el-checkbox-group>
      </div>

      <div class="map-legend" v-show="amapKey && mapLoaded">
        <div class="legend-title">图例</div>
        <div class="legend-item">
          <span class="legend-dot" style="background: #67C23A;"></span>绿色等级
        </div>
        <div class="legend-item">
          <span class="legend-dot" style="background: #E6A23C;"></span>黄色等级
        </div>
        <div class="legend-item">
          <span class="legend-dot" style="background: #F56C6C;"></span>红色等级
        </div>
        <div class="legend-item">
          <span class="legend-dot" style="background: #409EFF;"></span>设备在线
        </div>
        <div class="legend-item">
          <span class="legend-dot" style="background: #909399;"></span>设备离线
        </div>
      </div>
    </div>

    <el-dialog title="出租屋详情" v-model="houseDialogVisible" width="650px" append-to-body>
      <el-descriptions :column="2" border v-if="selectedHouse">
        <el-descriptions-item label="编号">{{ selectedHouse.id }}</el-descriptions-item>
        <el-descriptions-item label="镇街">{{ selectedHouse.townStreet }}</el-descriptions-item>
        <el-descriptions-item label="详细地址" :span="2">{{ selectedHouse.address }}</el-descriptions-item>
        <el-descriptions-item label="总楼层">{{ selectedHouse.totalFloors }}</el-descriptions-item>
        <el-descriptions-item label="总房间数">{{ selectedHouse.totalRooms }}</el-descriptions-item>
        <el-descriptions-item label="管理者">{{ selectedHouse.managerName || '-' }}</el-descriptions-item>
        <el-descriptions-item label="联系电话">{{ selectedHouse.managerPhone || '-' }}</el-descriptions-item>
        <el-descriptions-item label="网格">{{ selectedHouse.gridName || '-' }}</el-descriptions-item>
        <el-descriptions-item label="分色等级">
          <el-tag v-if="selectedHouse.overallLevel === 'green'" type="success">绿色</el-tag>
          <el-tag v-else-if="selectedHouse.overallLevel === 'yellow'" type="warning">黄色</el-tag>
          <el-tag v-else-if="selectedHouse.overallLevel === 'red'" type="danger">红色</el-tag>
          <el-tag v-else type="info">未评级</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="状态">
          <el-tag v-if="selectedHouse.status === '0'" type="info">未启用</el-tag>
          <el-tag v-else-if="selectedHouse.status === '1'" type="success">正常</el-tag>
          <el-tag v-else type="danger">停用</el-tag>
        </el-descriptions-item>
      </el-descriptions>

      <el-divider />
      <div class="house-stats">
        <div class="stat-item">
          <span class="stat-label">总房间</span>
          <span class="stat-value">{{ selectedHouse.totalRooms || 0 }}</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">已入住</span>
          <span class="stat-value" style="color: #67C23A;">{{ selectedHouse.occupiedRooms || 0 }}</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">已退房</span>
          <span class="stat-value" style="color: #E6A23C;">{{ selectedHouse.leftCount || 0 }}</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">空置</span>
          <span class="stat-value" style="color: #909399;">{{ selectedHouse.vacantRooms || 0 }}</span>
        </div>
      </div>
      <template #footer>
        <el-button @click="houseDialogVisible = false">关闭</el-button>
        <el-button type="primary" @click="viewHouseDetail">查看详情</el-button>
      </template>
    </el-dialog>

    <el-dialog title="设备详情" v-model="deviceDialogVisible" width="550px" append-to-body>
      <el-descriptions :column="2" border v-if="selectedDevice">
        <el-descriptions-item label="设备编号">{{ selectedDevice.id }}</el-descriptions-item>
        <el-descriptions-item label="设备名称">{{ selectedDevice.deviceName }}</el-descriptions-item>
        <el-descriptions-item label="设备编码">{{ selectedDevice.deviceCode }}</el-descriptions-item>
        <el-descriptions-item label="设备类型">
          <el-tag v-if="selectedDevice.deviceType === 'camera'" type="primary">摄像头</el-tag>
          <el-tag v-else type="info">对讲机</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="关联出租屋">{{ selectedDevice.houseAddress || '-' }}</el-descriptions-item>
        <el-descriptions-item label="安装位置">{{ selectedDevice.location || '-' }}</el-descriptions-item>
        <el-descriptions-item label="IP地址">{{ selectedDevice.ipAddress || '-' }}</el-descriptions-item>
        <el-descriptions-item label="在线状态">
          <el-tag v-if="selectedDevice.status === '1'" type="success">在线</el-tag>
          <el-tag v-else type="danger">离线</el-tag>
        </el-descriptions-item>
      </el-descriptions>
      <template #footer>
        <el-button @click="deviceDialogVisible = false">关闭</el-button>
      </template>
    </el-dialog>

    <el-dialog title="告警详情" v-model="alertDialogVisible" width="600px" append-to-body>
      <el-descriptions :column="2" border v-if="selectedAlert">
        <el-descriptions-item label="告警编号">{{ selectedAlert.id }}</el-descriptions-item>
        <el-descriptions-item label="告警类型">
          <el-tag v-if="selectedAlert.alertType === '1'" type="danger">人脸识别失败</el-tag>
          <el-tag v-else-if="selectedAlert.alertType === '2'" type="warning">陌生人闯入</el-tag>
          <el-tag v-else-if="selectedAlert.alertType === '3'" type="warning">设备离线</el-tag>
          <el-tag v-else type="info">其他</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="告警级别">
          <el-tag v-if="selectedAlert.level === '1'" type="danger">严重</el-tag>
          <el-tag v-else-if="selectedAlert.level === '2'" type="warning">中等</el-tag>
          <el-tag v-else type="info">轻微</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="处理状态">
          <el-tag v-if="selectedAlert.status === 'pending'" type="info">待处理</el-tag>
          <el-tag v-else-if="selectedAlert.status === 'processing'" type="warning">处理中</el-tag>
          <el-tag v-else-if="selectedAlert.status === 'resolved'" type="success">已解决</el-tag>
          <el-tag v-else type="info">已忽略</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="关联出租屋">{{ selectedAlert.houseAddress || '-' }}</el-descriptions-item>
        <el-descriptions-item label="设备ID">{{ selectedAlert.deviceId || '-' }}</el-descriptions-item>
        <el-descriptions-item label="告警时间" :span="2">{{ parseTime(selectedAlert.alertTime) }}</el-descriptions-item>
        <el-descriptions-item label="告警描述" :span="2">{{ selectedAlert.description || '-' }}</el-descriptions-item>
      </el-descriptions>
      <template #footer>
        <el-button @click="alertDialogVisible = false">关闭</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalMap">
import { listHouseMap, listDeviceMap, listAlertMap } from '@/api/rental/map'
import AMapLoader from '@amap/amap-jsapi-loader'
import { useRouter } from 'vue-router'

const router = useRouter()
const { proxy } = getCurrentInstance()

const amapKey = import.meta.env.VITE_AMAP_KEY || ''
const amapSecurityCode = import.meta.env.VITE_AMAP_SECURITY_CONFIG || ''

const mapContainer = ref(null)
const mapLoaded = ref(false)
const map = ref(null)
const markers = ref([])
const heatmap = ref(null)
const infoWindow = ref(null)

const houseMarkers = ref([])
const deviceMarkers = ref([])
const alertMarkers = ref([])
const heatmapData = ref([])

const houseDialogVisible = ref(false)
const deviceDialogVisible = ref(false)
const alertDialogVisible = ref(false)
const selectedHouse = ref(null)
const selectedDevice = ref(null)
const selectedAlert = ref(null)

const queryParams = reactive({
  townStreet: '',
  overallLevel: '',
  status: ''
})

const activeLayers = ref(['house', 'device', 'alert'])

function handleQuery() {
  loadMapData()
}

function resetQuery() {
  queryParams.townStreet = ''
  queryParams.overallLevel = ''
  queryParams.status = ''
  loadMapData()
}

function openSettings() {
  proxy.$message.info('请在 .env 文件中配置 VITE_AMAP_KEY')
}

async function loadMapData() {
  if (!amapKey || !map.value) return

  try {
    clearMarkers()

    if (activeLayers.value.includes('house')) {
      await loadHouseMarkers()
    }
    if (activeLayers.value.includes('device')) {
      await loadDeviceMarkers()
    }
    if (activeLayers.value.includes('alert')) {
      await loadAlertMarkers()
    }
    if (activeLayers.value.includes('heatmap')) {
      await loadHeatmapData()
    }
  } catch (error) {
    console.error('加载地图数据失败:', error)
    proxy.$message.error('加载地图数据失败')
  }
}

async function loadHouseMarkers() {
  try {
    const res = await listHouseMap(queryParams)
    const data = res.rows || res.data || []

    data.forEach(item => {
      if (item.latitude && item.longitude) {
        const marker = createHouseMarker(item)
        houseMarkers.value.push(marker)
        marker.setMap(map.value)
      }
    })
  } catch (error) {
    console.error('加载房源标注失败:', error)
  }
}

async function loadDeviceMarkers() {
  try {
    const res = await listDeviceMap(queryParams)
    const data = res.rows || res.data || []

    data.forEach(item => {
      if (item.latitude && item.longitude) {
        const marker = createDeviceMarker(item)
        deviceMarkers.value.push(marker)
        marker.setMap(map.value)
      }
    })
  } catch (error) {
    console.error('加载设备标注失败:', error)
  }
}

async function loadAlertMarkers() {
  try {
    const res = await listAlertMap({ ...queryParams, recentHours: 24 })
    const data = res.rows || res.data || []

    data.forEach(item => {
      if (item.latitude && item.longitude) {
        const marker = createAlertMarker(item)
        alertMarkers.value.push(marker)
        marker.setMap(map.value)
      }
    })
  } catch (error) {
    console.error('加载告警标注失败:', error)
  }
}

async function loadHeatmapData() {
  try {
    const res = await proxy.$http.get('/rental/access-log/heatmap', { params: queryParams })
    heatmapData.value = res.data || []

    if (heatmapData.value.length > 0 && map.value) {
      if (map.value.getHeatmap) {
        renderHeatmap()
      } else {
        setTimeout(() => {
          if (map.value && map.value.getHeatmap) {
            renderHeatmap()
          }
        }, 500)
      }
    }
  } catch (error) {
    console.error('加载热力图数据失败:', error)
  }
}

function renderHeatmap() {
  if (!map.value || !heatmapData.value.length) return

  try {
    if (heatmap.value) {
      heatmap.value.setMap(null)
      heatmap.value = null
    }

    const heatmapPlugin = new AMap.Heatmap(map.value, {
      radius: 25,
      opacity: [0.4, 0.8],
      gradient: {
        0.2: '#00f0ff',
        0.4: '#0f0',
        0.6: '#f00',
        0.8: '#f00',
        1.0: '#f00'
      }
    })

    heatmapPlugin.setDataSet({
      data: heatmapData.value.map(item => ({
        lng: item.longitude,
        lat: item.latitude,
        count: item.count || 1
      }))
    })

    heatmap.value = heatmapPlugin
  } catch (error) {
    console.error('渲染热力图失败:', error)
  }
}

function getMarkerColor(overallLevel) {
  const colorMap = { 'green': '#67C23A', 'yellow': '#E6A23C', 'red': '#F56C6C' }
  return colorMap[overallLevel] || '#67C23A'
}

function createHouseMarker(item) {
  const color = getMarkerColor(item.overallLevel)

  const markerContent = `
    <div class="custom-marker house-marker">
      <div class="marker-icon" style="background: ${color}; border-color: ${color}">
        <svg viewBox="0 0 1024 1024" width="28" height="28">
          <path fill="white" d="M896 490.667L512 128 128 490.667V896h256v-128h128v128h128v-128h128V490.667z"/>
        </svg>
      </div>
      <div class="marker-label" style="background: ${color}">房源</div>
    </div>
  `

  const marker = new AMap.Marker({
    position: new AMap.LngLat(item.longitude, item.latitude),
    content: markerContent,
    offset: new AMap.Pixel(-20, -48)
  })

  marker.on('click', () => {
    selectedHouse.value = item
    houseDialogVisible.value = true
  })

  return marker
}

function createDeviceMarker(item) {
  const isOnline = item.status === '1'
  const bgColor = isOnline ? '#409EFF' : '#909399'

  const markerContent = `
    <div class="custom-marker device-marker" style="filter: ${isOnline ? 'drop-shadow(0 0 6px #409EFF)' : ''}">
      <div class="marker-icon" style="background: ${bgColor}">
        <svg viewBox="0 0 1024 1024" width="24" height="24">
          <path fill="white" d="M896 192H128c-35.2 0-64 28.8-64 64v448c0 35.2 28.8 64 64 64h288v64c0 35.2 28.8 64 64 64h128c35.2 0 64-28.8 64-64v-64h288c35.2 0 64-28.8 64-64V256c0-35.2-28.8-64-64-64zM512 768c-35.2 0-64-28.8-64-64s28.8-64 64-64 64 28.8 64 64-28.8 64-64 64z"/>
        </svg>
      </div>
      <div class="marker-label" style="background: ${bgColor}">${isOnline ? '在线' : '离线'}</div>
    </div>
  `

  const marker = new AMap.Marker({
    position: new AMap.LngLat(item.longitude, item.latitude),
    content: markerContent,
    offset: new AMap.Pixel(-20, -48)
  })

  marker.on('click', () => {
    selectedDevice.value = item
    deviceDialogVisible.value = true
  })

  return marker
}

function createAlertMarker(item) {
  const level = item.level || '3'
  const colorMap = { '1': '#F56C6C', '2': '#E6A23C', '3': '#909399' }
  const color = colorMap[level] || '#909399'

  const markerContent = `
    <div class="custom-marker alert-marker alert-pulse">
      <div class="marker-icon" style="background: ${color}; border-color: ${color}">
        <svg viewBox="0 0 1024 1024" width="26" height="26">
          <path fill="white" d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm-8 732c-20.4 0-36-16.4-36-36.4s15.6-36.4 36-36.4 36 16.4 36 36.4-15.6 36.4-36 36.4zm30.9-238.8c-4.4 5.6-7.9 13.6-8.9 21.6 0 0 0 1.6-0.2 1.6-0.6 5.4-1 11.2-1 16.6 0 4.4-3.6 8-8 8h-48c-4.4 0-8-3.6-8-8v-4.5c0.4-35 6.8-68.5 20.9-92.9 12.8-22.5 30.1-42.3 52.9-56.8 13.5-8.9 26.3-20.1 35.9-32.4 9.6-12.3 14.9-26.1 14.9-42.3 0-31.1-25.1-56.6-56.6-56.6s-56.6 25.5-56.6 56.6c0 4.4-3.6 8-8 8h-48c-4.4 0-8-3.6-8-8 0-79.5 64.5-144 144-144s144 64.5 144 144c0 42.8-20.3 83.8-54.1 109.7z"/>
        </svg>
      </div>
      <div class="marker-label" style="background: ${color}">告警</div>
    </div>
  `

  const marker = new AMap.Marker({
    position: new AMap.LngLat(item.longitude, item.latitude),
    content: markerContent,
    title: item.description,
    offset: new AMap.Pixel(-20, -56)
  })

  marker.on('click', () => {
    selectedAlert.value = item
    alertDialogVisible.value = true
  })

  return marker
}

function clearMarkers() {
  houseMarkers.value.forEach(m => m.setMap(null))
  deviceMarkers.value.forEach(m => m.setMap(null))
  alertMarkers.value.forEach(m => m.setMap(null))
  if (heatmap.value) {
    heatmap.value.setMap(null)
    heatmap.value = null
  }
  houseMarkers.value = []
  deviceMarkers.value = []
  alertMarkers.value = []
}

function viewHouseDetail() {
  if (selectedHouse.value && selectedHouse.value.id) {
    houseDialogVisible.value = false
    router.push({ path: '/rental/house', query: { id: selectedHouse.value.id } })
  }
}

async function initMap() {
  if (!amapKey) return

  try {
    if (amapSecurityCode) {
      window._AMapSecurityConfig = {
        securityJsCode: amapSecurityCode
      }
    }

    const AMap = await AMapLoader.load({
      key: amapKey,
      version: '2.0',
      plugins: ['AMap.Heatmap', 'AMap.MarkerClusterer']
    })

    map.value = new AMap.Map('amap-container', {
      zoom: 12,
      center: [112.6949, 22.3765],
      isHotspot: false,
      showLabel: true
    })

    mapLoaded.value = true

    map.value.on('complete', () => {
      loadMapData()
    })
  } catch (error) {
    console.error('初始化高德地图失败:', error)
    proxy.$message.error('初始化地图失败，请检查 Key 配置')
  }
}

watch(activeLayers, () => {
  loadMapData()
}, { deep: true })

onMounted(() => {
  if (amapKey) {
    initMap()
  }
})

onUnmounted(() => {
  if (map.value) {
    map.value.destroy()
  }
})
</script>

<style scoped>
.map-wrapper {
  position: relative;
  width: 100%;
}

.map-container {
  width: 100%;
  height: calc(100vh - 240px);
  border-radius: 4px;
  overflow: hidden;
}

.filter-card {
  margin-bottom: 10px;
}

.filter-card :deep(.el-card__body) {
  padding: 15px 20px;
}

.no-key-tip {
  display: flex;
  align-items: center;
  justify-content: center;
  height: calc(100vh - 240px);
  background: #f5f7fa;
  border-radius: 4px;
}

.layer-control {
  position: absolute;
  top: 10px;
  right: 10px;
  background: white;
  padding: 12px;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  z-index: 100;
}

.layer-title {
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 8px;
  color: #303133;
}

.map-legend {
  position: absolute;
  bottom: 30px;
  right: 10px;
  background: white;
  padding: 12px;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  z-index: 100;
}

.legend-title {
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 8px;
  color: #303133;
}

.legend-item {
  display: flex;
  align-items: center;
  margin-bottom: 6px;
  font-size: 12px;
  color: #606266;
}

.legend-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  margin-right: 8px;
  display: inline-block;
}

.house-stats {
  display: flex;
  justify-content: space-around;
  padding: 15px 0;
  background: #f5f7fa;
  border-radius: 4px;
}

.stat-item {
  text-align: center;
}

.stat-label {
  display: block;
  font-size: 12px;
  color: #909399;
  margin-bottom: 5px;
}

.stat-value {
  font-size: 24px;
  font-weight: 600;
  color: #303133;
}

:deep(.custom-marker) {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.house-marker .marker-icon {
  width: 48px;
  height: 48px;
  border: 4px solid;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 24px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.35), 0 0 0 4px rgba(255, 255, 255, 0.8);
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  background-attachment: fixed;
}

.house-marker .marker-icon:hover {
  transform: scale(1.25);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.45), 0 0 0 4px rgba(255, 255, 255, 0.9);
}

.house-marker .marker-label {
  font-size: 12px;
  color: white;
  padding: 2px 8px;
  border-radius: 12px;
  margin-top: 4px;
  white-space: nowrap;
  font-weight: 600;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
}

.device-marker .marker-icon {
  width: 44px;
  height: 44px;
  border: 3px solid white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  color: white;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.35), inset 0 0 0 2px rgba(255, 255, 255, 0.6);
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.device-marker .marker-label {
  font-size: 11px;
  color: white;
  padding: 2px 8px;
  border-radius: 12px;
  margin-top: 4px;
  white-space: nowrap;
  font-weight: 600;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
}

.device-marker .marker-icon:hover {
  transform: scale(1.2);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4), inset 0 0 0 2px rgba(255, 255, 255, 0.8);
}

.alert-marker .marker-icon {
  width: 50px;
  height: 50px;
  border: 4px solid;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: white;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4), 0 0 0 4px rgba(255, 255, 255, 0.9);
}

.alert-marker .marker-label {
  font-size: 12px;
  color: white;
  padding: 3px 10px;
  border-radius: 12px;
  margin-top: 4px;
  white-space: nowrap;
  font-weight: 700;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
}

.alert-pulse .marker-icon {
  animation: alertPulse 1.5s ease-in-out infinite;
}

@keyframes alertPulse {
  0% {
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4), 0 0 0 0 rgba(245, 108, 108, 0.7);
  }
  50% {
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4), 0 0 0 12px rgba(245, 108, 108, 0);
  }
  100% {
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4), 0 0 0 0 rgba(245, 108, 108, 0);
  }
}
</style>
