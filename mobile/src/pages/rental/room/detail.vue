<template>
  <view class="room-detail-container">
    <NavBar title="房间详情" :showBack="true" />
    <scroll-view scroll-y class="detail-content">
      <!-- 房间基本信息 -->
      <view class="info-section">
        <view class="info-card">
          <view class="info-row">
            <text class="label">房间号</text>
            <text class="value">{{ roomInfo.roomNo || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">楼层</text>
            <text class="value">{{ roomInfo.floor || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">状态</text>
            <text class="value status-tag" :class="getStatusClass(roomInfo.status)">{{ getStatusText(roomInfo.status) }}</text>
          </view>
        </view>
      </view>

      <!-- 人员信息 -->
      <view class="resident-section">
        <view class="section-header">
          <button class="add-resident-btn" @click="goToAddResident">添加人员</button>
        </view>
        <view class="resident-list">
          <view
            class="resident-item-wrap"
            v-for="(resident, index) in residentList"
            :key="index"
            :class="{ 'swiped': resident.swiped }"
            @touchstart="onResidentTouchStart($event, index)"
            @touchmove="onResidentTouchMove($event, index)"
            @touchend="onResidentTouchEnd(index)"
          >
            <view class="resident-actions" @click.stop="closeResidentSwipe(index)">
              <view class="action-btn edit" @click.stop="goToEditResident(resident)">编辑</view>
              <view class="action-btn delete" @click.stop="confirmDeleteResident(resident.id)">删除</view>
            </view>
            <view class="resident-content">
              <view class="resident-info">
                <text class="resident-name">{{ resident.name }}</text>
                <text class="resident-idcard">{{ resident.idCard }}</text>
                <text class="resident-phone">{{ resident.phone }}</text>
                <text class="resident-type">{{ getResidentTypeText(resident.residentType) }}</text>
              </view>
              <view class="resident-arrow">
                <text class="arrow-hint">‹</text>
              </view>
            </view>
          </view>
          <view class="empty-tip" v-if="residentList.length === 0">
            <view class="empty-icon">👤</view>
            <text class="empty-text">暂无人员</text>
          </view>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getRoom } from '@/api/rental/room'
import { getResidentList, deleteResident } from '@/api/rental/resident'

const roomInfo = ref<any>({})
const residentList = ref<any[]>([])
let currentRoomId = ''
let currentHouseId = ''

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  currentRoomId = params?.roomId || ''
  currentHouseId = params?.houseId || ''
  if (currentRoomId) {
    loadData(currentRoomId, currentHouseId)
  }
})

const loadData = (roomId: string, houseId: string) => {
  Taro.showLoading({ title: '加载中...' })
  Promise.all([
    getRoom(roomId),
    getResidentList({ roomId })
  ]).then(([roomRes, residentRes]: any) => {
    console.log('房间详情数据:', roomRes)
    console.log('入住人员数据:', residentRes)
    roomInfo.value = roomRes.data || {}
    residentList.value = (residentRes.rows || residentRes.data || []).map((r: any) => ({ ...r, swiped: false }))
    Taro.hideLoading()
  }).catch((error) => {
    console.error('加载数据失败:', error)
    Taro.hideLoading()
  })
}

const getStatusText = (status: string) => {
  const statusMap: any = {
    '0': '空置',
    '1': '已入住',
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

const getResidentTypeText = (type: string) => {
  const typeMap: any = {
    'tenant': '租客',
    'family': '家属',
    'owner': '房东'
  }
  return typeMap[type] || (type || '-')
}

const goToAddResident = () => {
  closeAllResidentSwipes()
  Taro.navigateTo({
    url: `/pages/rental/resident/form?roomId=${currentRoomId}&houseId=${currentHouseId}`
  })
}

const goToEditResident = (resident: any) => {
  closeAllResidentSwipes()
  Taro.navigateTo({
    url: `/pages/rental/resident/form?residentId=${resident.id}&roomId=${resident.roomId}&houseId=${resident.houseId}`
  })
}

const confirmDeleteResident = (residentId: string) => {
  closeAllResidentSwipes()
  Taro.showModal({
    title: '确认删除',
    content: '确定要删除这个人吗？',
    success: (res) => {
      if (res.confirm) {
        handleDeleteResident(residentId)
      }
    }
  })
}

const handleDeleteResident = (residentId: string) => {
  Taro.showLoading({ title: '删除中...' })
  deleteResident(residentId).then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      Taro.showToast({ title: '删除成功', icon: 'success' })
      loadData(currentRoomId, currentHouseId)
    } else {
      Taro.showToast({ title: res.msg || '删除失败', icon: 'none' })
    }
  }).catch(() => {
    Taro.hideLoading()
    Taro.showToast({ title: '删除失败', icon: 'none' })
  })
}

let residentTouchStartX = 0
let residentTouchStartY = 0

const onResidentTouchStart = (e: any, index: number) => {
  residentTouchStartX = e.touches[0].clientX
  residentTouchStartY = e.touches[0].clientY
}

const onResidentTouchMove = (e: any, index: number) => {
  const touchX = e.touches[0].clientX
  const touchY = e.touches[0].clientY
  const diffX = touchX - residentTouchStartX
  const diffY = touchY - residentTouchStartY

  if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 10) {
    if (diffX < 0) {
      residentList.value[index].swiped = true
    } else {
      residentList.value[index].swiped = false
    }
  }
}

const onResidentTouchEnd = (index: number) => {
}

const closeResidentSwipe = (index: number) => {
  residentList.value[index].swiped = false
}

const closeAllResidentSwipes = () => {
  residentList.value.forEach((r: any) => {
    r.swiped = false
  })
}
</script>

<style lang="scss">
.room-detail-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .detail-content {
    min-height: calc(100vh - 60px);
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

  .resident-section {
    padding: 16px;

    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 16px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }

      .add-resident-btn {
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

    .resident-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .resident-item-wrap {
        position: relative;
        overflow: hidden;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        &.swiped .resident-content {
          transform: translateX(-160px);
        }

        .resident-actions {
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

        .resident-content {
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

          .resident-info {
            flex: 1;
            display: flex;
            flex-direction: column;

            .resident-name {
              font-size: 15px;
              font-weight: 600;
              color: #134E4A;
              margin-bottom: 6px;
            }

            .resident-idcard {
              font-size: 13px;
              color: #64748B;
              margin-bottom: 4px;
            }

            .resident-phone {
              font-size: 13px;
              color: #64748B;
              margin-bottom: 4px;
            }

            .resident-type {
              font-size: 12px;
              color: #94A3B8;
              margin-top: 4px;
            }
          }

          .resident-arrow {
            .arrow-hint {
              font-size: 16px;
              color: #94A3B8;
              transition: transform 0.2s ease;
            }

            .swiped & {
              transform: rotate(180deg);
            }
          }
        }

        &.swiped .arrow-hint {
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
        }
      }
    }
  }
}
</style>