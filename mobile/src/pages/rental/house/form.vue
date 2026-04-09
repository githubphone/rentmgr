<template>
  <view class="form-container">
    <NavBar title="添加出租屋" :showBack="true" />
    <view class="tabs">
      <view 
        v-for="(tab, index) in tabs" 
        :key="index"
        class="tab-item"
        :class="{ active: activeTab === tab.key }"
        @click="activeTab = tab.key"
      >
        <text>{{ tab.label }}</text>
      </view>
    </view>
    <scroll-view scroll-y class="tab-content">
      <!-- 基本信息 -->
      <view v-show="activeTab === 'basic'" class="form-section">
        <view class="section-title">基本信息</view>
        <view class="form-card">
          <view class="form-item">
            <text class="form-label">镇街</text>
            <view class="form-value disabled">水口镇</view>
          </view>
          <view class="form-item">
            <text class="form-label">详细地址</text>
            <input class="form-input" v-model="form.address" placeholder="请输入详细地址" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">租金(元/月)</text>
            <input class="form-input" v-model="form.rent" type="digit" placeholder="请输入租金" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">房间面积(㎡)</text>
            <input class="form-input" v-model="form.roomArea" type="digit" placeholder="请输入房间面积" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">总楼层</text>
            <input class="form-input" v-model="form.totalFloors" type="number" placeholder="请输入总楼层" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">总房间数</text>
            <input class="form-input" v-model="form.totalRooms" type="number" placeholder="请输入总房间数" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">房屋类型</text>
            <picker :value="houseTypeIndex" :range="houseTypeOptions" range-key="label" @change="onHouseTypeChange">
              <view class="picker-value">
                {{ form.houseType ? houseTypeOptions[houseTypeIndex].label : '请选择' }}
              </view>
            </picker>
          </view>
          <view class="form-item">
            <text class="form-label">状态</text>
            <radio-group @change="onStatusChange">
              <label class="radio-item" v-for="item in statusOptions" :key="item.value">
                <radio :value="item.value" :checked="form.status === item.value" color="#0F766E"/>{{ item.label }}
              </label>
            </radio-group>
          </view>
        </view>
      </view>

      <!-- 管理信息 -->
      <view v-show="activeTab === 'manager'" class="form-section">
        <view class="section-title">管理信息</view>
        <view class="form-card">
          <view class="form-item">
            <text class="form-label">管理者身份</text>
            <picker :value="managerTypeIndex" :range="managerTypeOptions" range-key="label" @change="onManagerTypeChange">
              <view class="picker-value">
                {{ form.managerType ? managerTypeOptions[managerTypeIndex].label : '请选择' }}
              </view>
            </picker>
          </view>
          <view class="form-item">
            <text class="form-label">所属网格</text>
            <picker :value="gridIndex" :range="gridOptions" range-key="gridName" @change="onGridChange">
              <view class="picker-value">
                {{ form.gridId ? gridOptions[gridIndex]?.gridName : '请选择' }}
              </view>
            </picker>
          </view>
          <view class="form-item">
            <text class="form-label">房东姓名</text>
            <input class="form-input" v-model="form.ownerName" placeholder="请输入房东姓名" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">房东电话</text>
            <input class="form-input" v-model="form.ownerPhone" type="number" placeholder="请输入房东电话" placeholder-class="placeholder" />
          </view>
        </view>
      </view>

      <!-- 位置信息 -->
      <view v-show="activeTab === 'location'" class="form-section">
        <view class="section-title">位置信息</view>
        <view class="form-card">
          <view class="location-btn-row">
            <button class="location-btn" @click="getCurrentLocation">
              <text class="location-icon">📍</text>
              <text>获取当前位置</text>
            </button>
            <button class="location-btn secondary" @click="goToMapPicker">
              <text class="location-icon">🗺️</text>
              <text>地图选点</text>
            </button>
          </view>

          <view class="form-item">
            <text class="form-label">纬度</text>
            <input class="form-input" v-model="form.latitude" type="digit" placeholder="点击按钮获取或手动输入" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">经度</text>
            <input class="form-input" v-model="form.longitude" type="digit" placeholder="点击按钮获取或手动输入" placeholder-class="placeholder" />
          </view>
          <view class="form-item" v-if="form.latitude && form.longitude">
            <text class="form-label">位置</text>
            <text class="location-text">已获取位置坐标</text>
          </view>
        </view>
      </view>

      <!-- 房间管理 -->
      <view v-show="activeTab === 'room'" class="form-section">
        <view class="room-header">
          <text class="section-title">房间管理</text>
          <view class="room-actions">
            <button class="action-btn" @click="showBatchAddModal">+ 批量添加</button>
            <button class="action-btn danger" @click="clearAllRooms" v-if="roomList.length > 0">清空</button>
          </view>
        </view>
        <view class="room-list">
          <view class="room-item" v-for="(room, index) in roomList" :key="index">
            <view class="room-info">
              <view class="room-row">
                <text class="room-label">房间号</text>
                <input class="room-input" v-model="room.roomNo" placeholder="如:101" placeholder-class="placeholder" />
              </view>
              <view class="room-row">
                <text class="room-label">楼层</text>
                <input class="room-input" v-model="room.floor" type="number" placeholder="楼层" placeholder-class="placeholder" />
              </view>
              <view class="room-row">
                <text class="room-label">状态</text>
                <picker :value="room.statusIndex" :range="roomStatusOptions" @change="(e) => onRoomStatusChange(e, index)">
                  <view class="picker-value small">
                    {{ roomStatusOptions[room.statusIndex] || '空置' }}
                  </view>
                </picker>
              </view>
            </view>
            <view class="room-delete" @click="deleteRoom(index)">
              <text>×</text>
            </view>
          </view>
          <view class="empty-rooms" v-if="roomList.length === 0">
            <view class="empty-icon">🚪</view>
            <text class="empty-text">暂无房间</text>
            <text class="empty-hint">点击上方"批量添加"按钮添加</text>
          </view>
        </view>
      </view>
    </scroll-view>

    <view class="submit-area">
      <button class="submit-btn" @click="submitForm">提交</button>
    </view>

    <!-- 批量添加模态框 -->
    <view class="modal" v-if="batchAddVisible" @click="batchAddVisible = false">
      <view class="modal-content" @click.stop>
        <view class="modal-header">批量添加房间</view>
        <view class="modal-body">
          <view class="form-item">
            <text class="form-label">起始房间号</text>
            <input class="form-input" v-model="batchForm.startNo" type="number" placeholder="如:101" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">房间数量</text>
            <input class="form-input" v-model="batchForm.count" type="number" placeholder="如:10" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">楼层数</text>
            <input class="form-input" v-model="batchForm.floors" type="number" placeholder="如:6" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">每层房间数</text>
            <input class="form-input" v-model="batchForm.roomsPerFloor" type="number" placeholder="如:4" placeholder-class="placeholder" />
          </view>
          <view class="form-item">
            <text class="form-label">房间状态</text>
            <picker :value="batchForm.statusIndex" :range="roomStatusOptions" @change="onBatchStatusChange">
              <view class="picker-value">
                {{ roomStatusOptions[batchForm.statusIndex] || '空置' }}
              </view>
            </picker>
          </view>
        </view>
        <view class="modal-footer">
          <button class="btn btn-default" @click="batchAddVisible = false">取消</button>
          <button class="btn btn-primary" @click="confirmBatchAdd">确定</button>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { addHouse } from '@/api/rental/house'
import { addRoom } from '@/api/rental/room'
import { listGrid } from '@/api/rental/grid'

const activeTab = ref('basic')
const tabs = ref([
  { label: '基本信息', key: 'basic' },
  { label: '管理信息', key: 'manager' },
  { label: '位置信息', key: 'location' },
  { label: '房间管理', key: 'room' }
])

const gridOptions = ref<any[]>([])
const gridIndex = ref(-1)
const managerTypeIndex = ref(-1)
const houseTypeIndex = ref(-1)

const managerTypeOptions = [
  { value: 'owner', label: '业主' },
  { value: 'subowner', label: '二房东' },
  { value: 'admin', label: '管理员' }
]

const houseTypeOptions = [
  { value: 'commercial', label: '商品房' },
  { value: 'self_built', label: '自建房' },
  { value: 'resettlement', label: '安置房' },
  { value: 'public', label: '公租房' }
]

const statusOptions = [
  { value: '0', label: '未启用' },
  { value: '1', label: '正常' },
  { value: '2', label: '停用' }
]

const roomStatusOptions = ['空置', '已入住', '停用']

const form = ref<any>({
  gridId: '',
  managerType: '',
  townStreet: '水口镇',
  address: '',
  houseType: '',
  totalFloors: '',
  totalRooms: '',
  rent: '',
  roomArea: '',
  status: '1',
  latitude: '',
  longitude: '',
  ownerName: '',
  ownerPhone: '',
  deviceId: '',
  deviceLocation: ''
})

const roomList = ref<any[]>([])

const batchAddVisible = ref(false)
const batchForm = reactive({
  startNo: '',
  count: '',
  floors: '',
  roomsPerFloor: '',
  statusIndex: 0
})

const onGridChange = (e: any) => {
  const index = e.detail.value
  gridIndex.value = index
  form.value.gridId = gridOptions.value[index].id
}

const onManagerTypeChange = (e: any) => {
  managerTypeIndex.value = e.detail.value
  form.value.managerType = managerTypeOptions[e.detail.value].value
}

const onHouseTypeChange = (e: any) => {
  houseTypeIndex.value = e.detail.value
  form.value.houseType = houseTypeOptions[e.detail.value].value
}

const onStatusChange = (e: any) => {
  form.value.status = e.detail.value
}

const onRoomStatusChange = (e: any, index: number) => {
  roomList.value[index].statusIndex = e.detail.value
  roomList.value[index].status = e.detail.value === 0 ? '0' : e.detail.value === 1 ? '1' : '2'
}

const onBatchStatusChange = (e: any) => {
  batchForm.statusIndex = e.detail.value
}

const showBatchAddModal = () => {
  batchForm.startNo = ''
  batchForm.count = ''
  batchForm.floors = form.value.totalFloors || ''
  batchForm.roomsPerFloor = ''
  batchForm.statusIndex = 0
  batchAddVisible.value = true
}

const confirmBatchAdd = () => {
  const startNo = parseInt(batchForm.startNo) || 0
  const count = parseInt(batchForm.count) || 0
  const floors = parseInt(batchForm.floors) || 1
  const roomsPerFloor = parseInt(batchForm.roomsPerFloor) || 1
  const status = batchForm.statusIndex === 0 ? '0' : batchForm.statusIndex === 1 ? '1' : '2'

  if (count <= 0) {
    Taro.showToast({ title: '请输入正确的房间数量', icon: 'none' })
    return
  }

  const roomsToAdd: any[] = []
  for (let i = 0; i < count; i++) {
    const floor = Math.floor(i / roomsPerFloor) + 1
    const roomNum = startNo + i
    const roomNo = roomNum.toString()
    roomsToAdd.push({
      roomNo,
      floor: floor.toString(),
      status,
      statusIndex: batchForm.statusIndex
    })
  }

  roomList.value = [...roomList.value, ...roomsToAdd]
  batchAddVisible.value = false
  Taro.showToast({ title: `已添加${count}个房间`, icon: 'success' })
}

const deleteRoom = (index: number) => {
  roomList.value.splice(index, 1)
}

const clearAllRooms = () => {
  if (roomList.value.length === 0) return
  Taro.showModal({
    title: '确认清空',
    content: '确定要清空所有房间吗？',
    success: (res) => {
      if (res.confirm) {
        roomList.value = []
      }
    }
  })
}

const loadGrids = () => {
  listGrid({ pageNum: 1, pageSize: 999 }).then((res: any) => {
    gridOptions.value = res.rows || []
  })
}

const getCurrentLocation = () => {
  Taro.showLoading({ title: '正在获取位置...' })
  Taro.getLocation({
    type: 'gcj02',
    success: (res) => {
      Taro.hideLoading()
      form.value.latitude = res.latitude.toString()
      form.value.longitude = res.longitude.toString()
      Taro.showToast({ title: '定位成功', icon: 'success' })
    },
    fail: (err) => {
      Taro.hideLoading()
      console.error('获取位置失败:', err)
      Taro.showToast({ title: '获取位置失败，请检查权限', icon: 'none' })
    }
  })
}

const openMapPicker = () => {
  Taro.chooseLocation({
    success: (res) => {
      if (res.latitude && res.longitude) {
        form.value.latitude = res.latitude.toString()
        form.value.longitude = res.longitude.toString()
        Taro.showToast({ title: '已选择位置', icon: 'success' })
      }
    },
    fail: (err) => {
      console.error('选择位置失败:', err)
      Taro.showToast({ title: '请检查定位权限', icon: 'none' })
    }
  })
}

const goToMapPicker = () => {
  const url = `/pages/rental/house/map?lat=${form.value.latitude || ''}&lng=${form.value.longitude || ''}`
  Taro.navigateTo({ url })
}

const submitForm = () => {
  if (!form.value.address) {
    Taro.showToast({ title: '请输入详细地址', icon: 'none' })
    return
  }
  if (!form.value.managerType) {
    Taro.showToast({ title: '请选择管理者身份', icon: 'none' })
    return
  }

  Taro.showLoading({ title: '提交中...' })

  addHouse(form.value).then((res: any) => {
    if (res.code === 200) {
      const houseId = res.data?.id || res.data
      if (roomList.value.length > 0 && houseId) {
        const roomPromises = roomList.value.map((room: any) => {
          return addRoom({
            houseId,
            roomNo: room.roomNo,
            floor: room.floor,
            status: room.status || '0'
          })
        })
        Promise.all(roomPromises).then(() => {
          Taro.hideLoading()
          Taro.showToast({ title: '提交成功', icon: 'success' })
          setTimeout(() => {
            Taro.navigateBack()
          }, 1500)
        }).catch(() => {
          Taro.hideLoading()
          Taro.showToast({ title: '房间添加失败', icon: 'none' })
        })
      } else {
        Taro.hideLoading()
        Taro.showToast({ title: '提交成功', icon: 'success' })
        setTimeout(() => {
          Taro.navigateBack()
        }, 1500)
      }
    } else {
      Taro.hideLoading()
      Taro.showToast({ title: res.msg || '提交失败', icon: 'none' })
    }
  }).catch(() => {
    Taro.hideLoading()
  })
}

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  if (params?.latitude && params?.longitude) {
    form.value.latitude = params.latitude
    form.value.longitude = params.longitude
  }

  const eventChannel = Taro.getCurrentInstance().page?.getOpenerEventChannel()
  if (eventChannel) {
    eventChannel.on('onLocationSelected', (data: any) => {
      if (data.latitude) form.value.latitude = data.latitude.toString()
      if (data.longitude) form.value.longitude = data.longitude.toString()
    })
  }

  loadGrids()
  form.value = {
    gridId: '',
    managerType: '',
    townStreet: '水口镇',
    address: '',
    houseType: '',
    totalFloors: '',
    totalRooms: '',
    rent: '',
    roomArea: '',
    status: '1',
    latitude: '',
    longitude: '',
    ownerName: '',
    ownerPhone: '',
    deviceId: '',
    deviceLocation: ''
  }
})
</script>

<style lang="scss">
.form-container {
  min-height: 100vh;
  background-color: #F0FDFA;
  padding-bottom: 100px;
}

.tabs {
  display: flex;
  background-color: #fff;
  border-bottom: 1px solid #f0f0f0;

  .tab-item {
    flex: 1;
    text-align: center;
    padding: 16px 0;
    font-size: 14px;
    color: #64748B;
    position: relative;
    transition: color 0.2s ease;

    &.active {
      color: #0F766E;
      font-weight: 600;

      &::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 40px;
        height: 3px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        border-radius: 2px;
      }
    }
  }
}

.tab-content {
  min-height: calc(100vh - 140px);
}

.form-section {
  padding: 16px;

  .section-title {
    font-size: 16px;
    font-weight: 600;
    color: #134E4A;
    margin-bottom: 12px;
    padding-left: 4px;
  }

  .form-card {
    background-color: #fff;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

    .location-btn-row {
      padding: 16px 20px;
      border-bottom: 1px solid #f0f9f8;
      display: flex;
      gap: 12px;

      .location-btn {
        flex: 1;
        height: 44px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        color: #fff;
        border: none;
        border-radius: 22px;
        font-size: 14px;
        font-weight: 500;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;

        &:active {
          opacity: 0.9;
        }

        .location-icon {
          font-size: 16px;
        }

        &.secondary {
          background: linear-gradient(135deg, #64748B 0%, #94A3B8 100%);
        }
      }
    }

    .form-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px 20px;
      border-bottom: 1px solid #f0f9f8;

      &:last-child {
        border-bottom: none;
      }

      .form-label {
        font-size: 14px;
        color: #64748B;
        flex-shrink: 0;
      }

      .form-input {
        flex: 1;
        font-size: 14px;
        color: #134E4A;
        text-align: right;
      }

      .form-value {
        font-size: 14px;
        color: #94A3B8;
        text-align: right;
        
        &.disabled {
          color: #CBD5E1;
        }
      }

      .picker-value {
        flex: 1;
        font-size: 14px;
        color: #134E4A;
        text-align: right;
      }

      .location-text {
        font-size: 13px;
        color: #14B8A6;
        font-weight: 500;
      }

      .placeholder {
        color: #CBD5E1;
      }
    }
  }

  .room-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;

    .section-title {
      margin-bottom: 0;
    }

    .room-actions {
      display: flex;
      gap: 8px;

      .action-btn {
        height: 32px;
        padding: 0 14px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        color: #fff;
        border: none;
        border-radius: 16px;
        font-size: 13px;
        font-weight: 500;
        display: flex;
        align-items: center;
        justify-content: center;
        
        &.danger {
          background: linear-gradient(135deg, #DC2626 0%, #EF4444 100%);
        }
        
        &:active {
          opacity: 0.9;
        }
      }
    }
  }

  .room-list {
    .room-item {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      background-color: #fff;
      border-radius: 12px;
      padding: 14px 16px;
      margin-bottom: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);

      .room-info {
        flex: 1;

        .room-row {
          display: flex;
          align-items: center;
          margin-bottom: 10px;

          &:last-child {
            margin-bottom: 0;
          }

          .room-label {
            width: 56px;
            font-size: 13px;
            color: #64748B;
            flex-shrink: 0;
          }

          .room-input {
            flex: 1;
            font-size: 13px;
            color: #134E4A;
            background-color: #F0FDFA;
            padding: 8px 12px;
            border-radius: 8px;
          }

          .picker-value {
            flex: 1;
            font-size: 13px;
            color: #134E4A;
            background-color: #F0FDFA;
            padding: 8px 12px;
            border-radius: 8px;
            text-align: center;
          }

          .placeholder {
            color: #CBD5E1;
          }
        }
      }

      .room-delete {
        width: 32px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #DC2626;
        font-size: 20px;
        margin-left: 8px;
        flex-shrink: 0;
        
        &:active {
          opacity: 0.7;
        }
      }
    }

    .empty-rooms {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 50px 20px;
      background-color: #fff;
      border-radius: 16px;
      
      .empty-icon {
        font-size: 40px;
        margin-bottom: 12px;
        opacity: 0.5;
      }
      
      .empty-text {
        font-size: 15px;
        color: #64748B;
        font-weight: 500;
        margin-bottom: 6px;
      }
      
      .empty-hint {
        font-size: 13px;
        color: #94A3B8;
      }
    }
  }
}

.radio-item {
  display: inline-flex;
  align-items: center;
  margin-right: 16px;
  font-size: 14px;
  color: #134E4A;
}

.submit-area {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px 20px;
  padding-bottom: calc(16px + env(safe-area-inset-bottom));
  background-color: #fff;
  box-shadow: 0 -2px 12px rgba(0, 0, 0, 0.05);

  .submit-btn {
    width: 100%;
    height: 48px;
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    color: #fff;
    border: none;
    border-radius: 24px;
    font-size: 16px;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 16px rgba(15, 118, 110, 0.3);
    
    &:active {
      opacity: 0.9;
      transform: scale(0.98);
    }
  }
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 20px;

  .modal-content {
    width: 100%;
    max-width: 340px;
    background-color: #fff;
    border-radius: 20px;
    overflow: hidden;
  }

  .modal-header {
    padding: 20px;
    font-size: 17px;
    font-weight: 600;
    color: #134E4A;
    text-align: center;
    border-bottom: 1px solid #f0f0f0;
  }

  .modal-body {
    padding: 20px;

    .form-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px 0;
      border-bottom: 1px solid #f0f9f8;

      &:last-child {
        border-bottom: none;
      }

      .form-label {
        font-size: 14px;
        color: #64748B;
        flex-shrink: 0;
      }

      .form-input {
        flex: 1;
        font-size: 14px;
        color: #134E4A;
        text-align: right;
        margin-left: 16px;
      }

      .picker-value {
        flex: 1;
        font-size: 14px;
        color: #134E4A;
        text-align: right;
        margin-left: 16px;
      }

      .placeholder {
        color: #CBD5E1;
      }
    }
  }

  .modal-footer {
    display: flex;
    gap: 12px;
    padding: 16px 20px;
    border-top: 1px solid #f0f0f0;

    .btn {
      flex: 1;
      height: 44px;
      border-radius: 12px;
      font-size: 15px;
      font-weight: 500;
      display: flex;
      align-items: center;
      justify-content: center;

      &.btn-primary {
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        color: #fff;
        border: none;
        
        &:active {
          opacity: 0.9;
        }
      }

      &.btn-default {
        background-color: #F0FDFA;
        color: #64748B;
        border: none;
        
        &:active {
          background-color: #E0F2FE;
        }
      }
    }
  }
}

.placeholder {
  color: #CBD5E1;
}
</style>