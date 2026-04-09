<template>
  <view class="detail-container">
    <NavBar title="出租屋详情" :showBack="true" />
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
      <view v-show="activeTab === 'basic'" class="info-section">
        <view class="info-card">
          <view class="info-row">
            <text class="label">镇街</text>
            <text class="value">{{ houseInfo.townStreet || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">详细地址</text>
            <text class="value">{{ houseInfo.address || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">总楼层</text>
            <text class="value">{{ houseInfo.totalFloors || '-' }}层</text>
          </view>
          <view class="info-row">
            <text class="label">总房间</text>
            <text class="value">{{ houseInfo.totalRooms || '-' }}间</text>
          </view>
          <view class="info-row">
            <text class="label">租金</text>
            <text class="value price">¥{{ houseInfo.rent || '0' }}/月</text>
          </view>
          <view class="info-row">
            <text class="label">房间面积</text>
            <text class="value">{{ houseInfo.roomArea || '-' }}㎡</text>
          </view>
          <view class="info-row">
            <text class="label">房屋类型</text>
            <text class="value">{{ getHouseTypeText(houseInfo.houseType) }}</text>
          </view>
          <view class="info-row">
            <text class="label">状态</text>
            <text class="value status-tag" :class="getStatusClass(houseInfo.status)">{{ getStatusText(houseInfo.status) }}</text>
          </view>
        </view>
      </view>

      <!-- 管理信息 -->
      <view v-show="activeTab === 'manager'" class="info-section">
        <view class="info-card">
          <view class="info-row">
            <text class="label">管理者</text>
            <text class="value">{{ houseInfo.managerName || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">联系电话</text>
            <text class="value phone">{{ houseInfo.managerPhone || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">所属网格</text>
            <text class="value">{{ houseInfo.gridName || '-' }}</text>
          </view>
        </view>
      </view>

      <!-- 位置 -->
      <view v-show="activeTab === 'location'" class="location-section">
        <view class="location-card" v-if="houseInfo.latitude && houseInfo.longitude">
          <web-view :src="mapViewUrl" />
        </view>
        <view class="location-empty" v-else>
          <text class="empty-icon">📍</text>
          <text class="empty-text">暂无位置信息</text>
        </view>
        <view class="location-info" v-if="houseInfo.latitude && houseInfo.longitude">
          <view class="info-item">
            <text class="label">纬度</text>
            <text class="value">{{ houseInfo.latitude }}</text>
          </view>
          <view class="info-item">
            <text class="label">经度</text>
            <text class="value">{{ houseInfo.longitude }}</text>
          </view>
        </view>
      </view>

      <!-- 房间管理 -->
      <view v-show="activeTab === 'room'" class="room-section">
        <view class="room-header">
          <button class="add-room-btn" @click="goToAddRoom">+ 新增房间</button>
        </view>
        <view class="room-list">
          <view
            class="room-item-wrap"
            v-for="(room, index) in roomList"
            :key="index"
            :class="{ 'swiped': room.swiped }"
            @touchstart="onTouchStart($event, index)"
            @touchmove="onTouchMove($event, index)"
            @touchend="onTouchEnd(index)"
          >
            <view class="room-actions" @click.stop="closeSwipe(index)">
              <view class="action-btn edit" @click.stop="goToEditRoom(room)">编辑</view>
              <view class="action-btn delete" @click.stop="confirmDeleteRoom(room.id)">删除</view>
            </view>
            <view class="room-content" @click="goToRoomDetail(room)">
              <view class="room-left">
                <view class="room-number">{{ room.roomNo }}</view>
                <view class="room-floor">楼层: {{ room.floor }}</view>
              </view>
              <view class="room-right">
                <text class="room-status" :class="getStatusClass(room.status)">{{ getRoomStatusText(room.status) }}</text>
                <text class="swipe-hint">‹</text>
              </view>
            </view>
          </view>
          <view class="empty-tip" v-if="roomList.length === 0">
            <view class="empty-icon">🚪</view>
            <text class="empty-text">暂无房间数据</text>
          </view>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getHouseDetail } from '@/api/rental/house'
import { getRoomList, deleteRoom } from '@/api/rental/room'

const houseInfo = ref<any>({})
const roomList = ref<any[]>([])
const activeTab = ref('basic')
const tabs = ref([
  { label: '基本信息', key: 'basic' },
  { label: '管理信息', key: 'manager' },
  { label: '位置', key: 'location' },
  { label: '房间管理', key: 'room' }
])

const mapViewUrl = computed(() => {
  if (houseInfo.value.latitude && houseInfo.value.longitude) {
    return `https://restapi.amap.com/v3/staticmap?location=${houseInfo.value.longitude},${houseInfo.value.latitude}&zoom=16&size=600*300&markers=mid,,A:${houseInfo.value.longitude},${houseInfo.value.latitude}&key=e05c016ac681982f570079e39e981e32`
  }
  return ''
})

let currentHouseId = ''

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  const id = params?.id
  if (id) {
    currentHouseId = id
    loadData(id)
  }
})

const loadData = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  Promise.all([
    getHouseDetail(id),
    getRoomList(id)
  ]).then(([detailRes, roomRes]: any) => {
    console.log('房屋详情数据:', detailRes)
    console.log('房间列表数据:', roomRes)
    houseInfo.value = detailRes.data || {}
    roomList.value = (roomRes.rows || roomRes.data || []).map((room: any) => ({ ...room, swiped: false }))
    Taro.hideLoading()
  }).catch((error) => {
    console.error('加载数据失败:', error)
    Taro.hideLoading()
  })
}

const getStatusText = (status: string) => {
  const statusMap: any = {
    '0': '未启用',
    '1': '正常',
    '2': '停用'
  }
  return statusMap[status] || '未知'
}

const getStatusClass = (status: string) => {
  const classMap: any = {
    '0': 'status-info',
    '1': 'status-success',
    '2': 'status-danger'
  }
  return classMap[status] || ''
}

const getRoomStatusText = (status: string) => {
  const statusMap: any = {
    '0': '空置',
    '1': '已入住',
    '2': '停用'
  }
  return statusMap[status] || '未知'
}

const getHouseTypeText = (houseType: string) => {
  const typeMap: any = {
    'commercial': '商品房',
    'self_built': '自建房',
    'resettlement': '安置房',
    'public': '公租房'
  }
  return typeMap[houseType] || (houseType || '-')
}

const goToAddRoom = () => {
  Taro.navigateTo({
    url: `/pages/rental/room/form?houseId=${currentHouseId}`
  })
}

const goToEditRoom = (room: any) => {
  closeSwipeAll()
  Taro.navigateTo({
    url: `/pages/rental/room/form?roomId=${room.id}&houseId=${room.houseId}`
  })
}

const confirmDeleteRoom = (roomId: string) => {
  closeSwipeAll()
  Taro.showModal({
    title: '确认删除',
    content: '确定要删除这个房间吗？',
    success: (res) => {
      if (res.confirm) {
        handleDeleteRoom(roomId)
      }
    }
  })
}

const handleDeleteRoom = (roomId: string) => {
  Taro.showLoading({ title: '删除中...' })
  deleteRoom(roomId).then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      Taro.showToast({ title: '删除成功', icon: 'success' })
      loadData(currentHouseId)
    } else {
      Taro.showToast({ title: res.msg || '删除失败', icon: 'none' })
    }
  }).catch(() => {
    Taro.hideLoading()
    Taro.showToast({ title: '删除失败', icon: 'none' })
  })
}

const goToRoomDetail = (room: any) => {
  closeSwipeAll()
  Taro.navigateTo({
    url: `/pages/rental/room/detail?roomId=${room.id}&houseId=${room.houseId}`
  })
}

let touchStartX = 0
let touchStartY = 0

const onTouchStart = (e: any, index: number) => {
  touchStartX = e.touches[0].clientX
  touchStartY = e.touches[0].clientY
}

const onTouchMove = (e: any, index: number) => {
  const touchX = e.touches[0].clientX
  const touchY = e.touches[0].clientY
  const diffX = touchX - touchStartX
  const diffY = touchY - touchStartY

  if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 10) {
    if (diffX < 0) {
      roomList.value[index].swiped = true
    } else {
      roomList.value[index].swiped = false
    }
  }
}

const onTouchEnd = (index: number) => {
}

const closeSwipe = (index: number) => {
  roomList.value[index].swiped = false
}

const closeSwipeAll = () => {
  roomList.value.forEach((room: any) => {
    room.swiped = false
  })
}
</script>

<style lang="scss">
.detail-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .tabs {
    display: flex;
    background-color: #fff;
    border-bottom: 1px solid #f0f0f0;

    .tab-item {
      flex: 1;
      text-align: center;
      padding: 16px 0;
      font-size: 15px;
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
    min-height: calc(100vh - 100px);
  }

  .info-section {
    padding: 16px;

    .info-card {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        .label {
          font-size: 14px;
          color: #64748B;
        }

        .value {
          font-size: 14px;
          color: #134E4A;
          font-weight: 500;

          &.price {
            color: #DC2626;
            font-weight: 600;
          }

          &.phone {
            color: #0369A1;
          }

          &.status-tag {
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;

            &.status-info {
              background-color: #E0F2FE;
              color: #0369A1;
            }

            &.status-success {
              background-color: #D1FAE5;
              color: #047857;
            }

            &.status-danger {
              background-color: #FFE4E6;
              color: #BE123C;
            }
          }
        }
      }
    }
  }

  .location-section {
    padding: 16px;

    .location-card {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
      height: 250px;
      margin-bottom: 16px;

      web-view {
        width: 100%;
        height: 100%;
      }
    }

    .location-empty {
      background-color: #fff;
      border-radius: 16px;
      padding: 50px 20px;
      text-align: center;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
      margin-bottom: 16px;

      .empty-icon {
        font-size: 48px;
        opacity: 0.5;
        margin-bottom: 12px;
        display: block;
      }

      .empty-text {
        font-size: 15px;
        color: #64748B;
        font-weight: 500;
      }
    }

    .location-info {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .info-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        .label {
          font-size: 14px;
          color: #64748B;
        }

        .value {
          font-size: 14px;
          color: #134E4A;
          font-weight: 500;
        }
      }
    }
  }

  .room-section {
    padding: 16px;

    .room-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 16px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }

      .add-room-btn {
        height: 32px;
        padding: 0 16px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        color: #fff;
        border: none;
        border-radius: 16px;
        font-size: 13px;
        font-weight: 500;
        display: flex;
        align-items: center;
        justify-content: center;
        
        &:active {
          opacity: 0.9;
        }
      }
    }

    .room-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .room-item-wrap {
        position: relative;
        overflow: hidden;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        &.swiped .room-content {
          transform: translateX(-160px);
        }

        .room-actions {
          position: absolute;
          right: 0;
          top: 0;
          bottom: 0;
          display: flex;
          align-items: center;
          transform: translateX(100%);
          transition: transform 0.2s ease;

          .action-btn {
            height: 100%;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 500;
            color: #fff;

            &.edit {
              background-color: #14B8A6;
            }

            &.delete {
              background-color: #EF4444;
            }
          }
        }

        .room-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 16px 20px;
          background-color: #fff;
          transform: translateX(0);
          transition: transform 0.2s ease;

          &:active {
            background-color: #F0FDFA;
          }

          .room-left {
            .room-number {
              font-size: 15px;
              font-weight: 600;
              color: #134E4A;
              margin-bottom: 4px;
            }

            .room-floor {
              font-size: 13px;
              color: #94A3B8;
            }
          }

          .room-right {
            display: flex;
            align-items: center;
            gap: 12px;

            .room-status {
              font-size: 12px;
              padding: 4px 10px;
              border-radius: 10px;

              &.status-info {
                background-color: #E0F2FE;
                color: #0369A1;
              }

              &.status-success {
                background-color: #D1FAE5;
                color: #047857;
              }

              &.status-danger {
                background-color: #FFE4E6;
                color: #BE123C;
              }
            }

            .swipe-hint {
              font-size: 16px;
              color: #94A3B8;
              transition: transform 0.2s ease;
            }
          }
        }

        &.swiped .swipe-hint {
          transform: rotate(180deg);
        }
      }

      .empty-tip {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 50px 20px;
        
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
}

.placeholder {
  color: #CBD5E1;
}
</style>