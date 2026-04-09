<template>
  <view class="home-container">
    <view class="header">
      <view class="header-content">
        <view class="greeting">
          <text class="greeting-text">您好</text>
          <text class="user-name">{{ userStore.name || '用户' }}</text>
        </view>
        <text class="date">{{ currentDate }}</text>
      </view>
    </view>

    <scroll-view scroll-y class="content">
      <!-- 统计卡片区域 -->
      <view class="stats-section">
        <view class="stats-grid">
          <view class="stat-card" @click="goToHouse">
            <view class="stat-icon house">
              <text>🏠</text>
            </view>
            <view class="stat-info">
              <text class="stat-value">{{ stats.houseCount || 0 }}</text>
              <text class="stat-label">出租屋</text>
            </view>
          </view>
          <view class="stat-card" @click="goToRoom">
            <view class="stat-icon room">
              <text>🚪</text>
            </view>
            <view class="stat-info">
              <text class="stat-value">{{ stats.roomCount || 0 }}</text>
              <text class="stat-label">房间数</text>
            </view>
          </view>
          <view class="stat-card" @click="goToResident">
            <view class="stat-icon resident">
              <text>👥</text>
            </view>
            <view class="stat-info">
              <text class="stat-value">{{ stats.residentCount || 0 }}</text>
              <text class="stat-label">住户数</text>
            </view>
          </view>
          <view class="stat-card" @click="goToDevice">
            <view class="stat-icon device">
              <text>📱</text>
            </view>
            <view class="stat-info">
              <text class="stat-value">{{ stats.deviceCount || 0 }}</text>
              <text class="stat-label">设备数</text>
            </view>
          </view>
        </view>
      </view>

      <!-- 在线状态 -->
      <view class="status-section">
        <view class="section-card">
          <view class="card-header">
            <text class="card-title">实时状态</text>
          </view>
          <view class="status-grid">
            <view class="status-item">
              <view class="status-dot online"></view>
              <text class="status-label">设备在线</text>
              <text class="status-value">{{ stats.deviceOnline || 0 }}</text>
            </view>
            <view class="status-item">
              <view class="status-dot offline"></view>
              <text class="status-label">设备离线</text>
              <text class="status-value">{{ stats.deviceOffline || 0 }}</text>
            </view>
            <view class="status-item">
              <view class="status-dot alert"></view>
              <text class="status-label">待处理告警</text>
              <text class="status-value">{{ stats.pendingAlert || 0 }}</text>
            </view>
            <view class="status-item">
              <view class="status-dot registered"></view>
              <text class="status-label">已登记住户</text>
              <text class="status-value">{{ stats.registeredResident || 0 }}</text>
            </view>
          </view>
        </view>
      </view>

      <!-- 今日概览 -->
      <view class="today-section">
        <view class="section-card">
          <view class="card-header">
            <text class="card-title">今日概览</text>
          </view>
          <view class="today-grid">
            <view class="today-item">
              <view class="today-icon access">
                <text>🚶</text>
              </view>
              <view class="today-info">
                <text class="today-value">{{ dashboard.todayAccess || 0 }}</text>
                <text class="today-label">今日通行</text>
              </view>
            </view>
            <view class="today-item">
              <view class="today-icon stranger">
                <text>👤</text>
              </view>
              <view class="today-info">
                <text class="today-value">{{ dashboard.todayStranger || 0 }}</text>
                <text class="today-label">今日陌生人</text>
              </view>
            </view>
            <view class="today-item">
              <view class="today-icon alert">
                <text>🔔</text>
              </view>
              <view class="today-info">
                <text class="today-value">{{ dashboard.todayAlert || 0 }}</text>
                <text class="today-label">今日告警</text>
              </view>
            </view>
            <view class="today-item">
              <view class="today-icon rate">
                <text>📊</text>
              </view>
              <view class="today-info">
                <text class="today-value">{{ dashboard.deviceOnlineRate || 0 }}%</text>
                <text class="today-label">设备在线率</text>
              </view>
            </view>
          </view>
        </view>
      </view>

      <!-- 最新告警 -->
      <view class="alert-section" v-if="recentAlerts.length > 0">
        <view class="section-card">
          <view class="card-header">
            <text class="card-title">最新告警</text>
            <text class="card-more" @click="goToAlert">查看更多 ›</text>
          </view>
          <view class="alert-list">
            <view class="alert-item" v-for="(item, index) in recentAlerts" :key="index" @click="goToAlertDetail(item.id)">
              <view class="alert-icon">
                <text>🚨</text>
              </view>
              <view class="alert-info">
                <text class="alert-type">{{ getAlertType(item.type) }}</text>
                <text class="alert-content">{{ item.content }}</text>
                <text class="alert-time">{{ item.createTime }}</text>
              </view>
              <view class="alert-status" :class="item.status === '0' ? 'pending' : 'done'">
                {{ item.status === '0' ? '待处理' : '已处理' }}
              </view>
            </view>
          </view>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'
import { getDashboardStatistics } from '@/api/rental/statistics'

const userStore = useUserStore()

const stats = ref<any>({
  houseCount: 0,
  roomCount: 0,
  residentCount: 0,
  deviceCount: 0,
  deviceOnline: 0,
  deviceOffline: 0,
  pendingAlert: 0,
  registeredResident: 0
})

const dashboard = ref<any>({
  todayAccess: 0,
  todayStranger: 0,
  todayAlert: 0,
  deviceOnlineRate: 0,
  houseTotal: 0,
  residentTotal: 0,
  deviceTotal: 0,
  deviceOnline: 0,
  deviceOffline: 0,
  monthAlertTotal: 0,
  monthAlertResolved: 0,
  monthAlertRate: '0%'
})

const recentAlerts = ref<any[]>([])

const currentDate = computed(() => {
  const now = new Date()
  const month = now.getMonth() + 1
  const day = now.getDate()
  const weekDay = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'][now.getDay()]
  return `${month}月${day}日 ${weekDay}`
})

onMounted(() => {
  loadData()
})

const loadData = () => {
  getDashboardStatistics().then((res: any) => {
    if (res.code === 200) {
      const data = res.data || {}

      dashboard.value = {
        todayAccess: data.todayAccessCount || 0,
        todayStranger: data.todayStrangerCount || 0,
        todayAlert: data.todayAlertCount || 0,
        deviceOnlineRate: data.deviceOnlineRate || 0,
        houseTotal: data.houseTotal || 0,
        residentTotal: data.residentTotal || 0,
        deviceTotal: data.deviceTotal || 0,
        deviceOnline: data.deviceOnline || 0,
        deviceOffline: data.deviceOffline || 0,
        monthAlertTotal: data.monthAlertTotal || 0,
        monthAlertResolved: data.monthAlertResolved || 0,
        monthAlertRate: data.monthAlertResolveRate ? `${data.monthAlertResolveRate}%` : '0%'
      }

      stats.value = {
        houseCount: data.houseTotal || 0,
        roomCount: 0,
        residentCount: data.residentTotal || 0,
        deviceCount: data.deviceTotal || 0,
        deviceOnline: data.deviceOnline || 0,
        deviceOffline: data.deviceOffline || 0,
        pendingAlert: data.monthAlertTotal ? data.monthAlertTotal - data.monthAlertResolved : 0,
        registeredResident: data.residentTotal || 0
      }

      const alertStats = data.alertStats || []
      recentAlerts.value = alertStats.slice(0, 5).map((item: any, idx: number) => ({
        id: item.alertId || idx,
        type: item.alertType || '3',
        content: item.alertContent || '',
        status: item.status || '0',
        createTime: item.createTime || ''
      }))
    }
  }).catch((err) => {
    console.error('加载数据失败:', err)
  })
}

const getAlertType = (type: string) => {
  const map: Record<string, string> = {
    '1': '陌生人告警',
    '2': '设备异常',
    '3': '其他告警'
  }
  return map[type] || '未知告警'
}

const goToHouse = () => {
  Taro.switchTab({ url: '/pages/work/index' })
}

const goToRoom = () => {
  Taro.switchTab({ url: '/pages/work/index' })
}

const goToResident = () => {
  Taro.navigateTo({ url: '/pages/rental/resident/list' })
}

const goToDevice = () => {
  Taro.navigateTo({ url: '/pages/rental/device/list' })
}

const goToAlert = () => {
  Taro.navigateTo({ url: '/pages/rental/alert/list' })
}

const goToAlertDetail = (id: string) => {
  Taro.navigateTo({ url: `/pages/rental/alert/detail?id=${id}` })
}
</script>

<style lang="scss">
.home-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .header {
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    padding: 20px 20px;
    padding-top: calc(20px + env(safe-area-inset-top));

    .header-content {
      display: flex;
      justify-content: space-between;
      align-items: center;

      .greeting {
        display: flex;
        flex-direction: column;

        .greeting-text {
          font-size: 14px;
          color: rgba(255, 255, 255, 0.8);
          margin-bottom: 4px;
        }

        .user-name {
          font-size: 22px;
          font-weight: 600;
          color: #fff;
        }
      }

      .date {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
      }
    }
  }

  .content {
    padding: 16px;
  }

  .stats-section {
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 12px;

      .stat-card {
        background-color: #fff;
        border-radius: 16px;
        padding: 16px;
        display: flex;
        align-items: center;
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

        .stat-icon {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 24px;
          margin-right: 12px;

          &.house {
            background-color: #E0F2FE;
          }

          &.room {
            background-color: #D1FAE5;
          }

          &.resident {
            background-color: #FEF3C7;
          }

          &.device {
            background-color: #F3E8FF;
          }
        }

        .stat-info {
          display: flex;
          flex-direction: column;

          .stat-value {
            font-size: 24px;
            font-weight: 700;
            color: #134E4A;
          }

          .stat-label {
            font-size: 13px;
            color: #64748B;
          }
        }
      }
    }
  }

  .section-card {
    background-color: #fff;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
    margin-bottom: 16px;

    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 20px;
      border-bottom: 1px solid #f0f9f8;

      .card-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }

      .card-more {
        font-size: 13px;
        color: #94A3B8;
      }
    }
  }

  .status-section {
    .status-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      padding: 16px;

      .status-item {
        display: flex;
        align-items: center;
        padding: 12px 0;

        .status-dot {
          width: 8px;
          height: 8px;
          border-radius: 50%;
          margin-right: 8px;

          &.online {
            background-color: #047857;
          }

          &.offline {
            background-color: #94A3B8;
          }

          &.alert {
            background-color: #BE123C;
          }

          &.registered {
            background-color: #0369A1;
          }
        }

        .status-label {
          font-size: 13px;
          color: #64748B;
          flex: 1;
        }

        .status-value {
          font-size: 15px;
          font-weight: 600;
          color: #134E4A;
        }
      }
    }
  }

  .today-section {
    .today-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 1px;
      background-color: #f0f9f8;

      .today-item {
        background-color: #fff;
        display: flex;
        align-items: center;
        padding: 16px;

        .today-icon {
          width: 40px;
          height: 40px;
          border-radius: 10px;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 20px;
          margin-right: 12px;

          &.access {
            background-color: #E0F2FE;
          }

          &.stranger {
            background-color: #FEF3C7;
          }

          &.alert {
            background-color: #FFE4E6;
          }

          &.rate {
            background-color: #D1FAE5;
          }
        }

        .today-info {
          display: flex;
          flex-direction: column;

          .today-value {
            font-size: 20px;
            font-weight: 700;
            color: #134E4A;
          }

          .today-label {
            font-size: 12px;
            color: #64748B;
          }
        }
      }
    }
  }

  .alert-section {
    .alert-list {
      .alert-item {
        display: flex;
        align-items: flex-start;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        &:active {
          background-color: #F0FDFA;
        }

        .alert-icon {
          width: 36px;
          height: 36px;
          border-radius: 50%;
          background-color: #FFE4E6;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 16px;
          margin-right: 12px;
        }

        .alert-info {
          flex: 1;
          display: flex;
          flex-direction: column;

          .alert-type {
            font-size: 14px;
            font-weight: 600;
            color: #134E4A;
            margin-bottom: 4px;
          }

          .alert-content {
            font-size: 13px;
            color: #64748B;
            margin-bottom: 4px;
          }

          .alert-time {
            font-size: 12px;
            color: #94A3B8;
          }
        }

        .alert-status {
          font-size: 12px;
          padding: 4px 10px;
          border-radius: 10px;

          &.pending {
            background-color: #FFE4E6;
            color: #BE123C;
          }

          &.done {
            background-color: #D1FAE5;
            color: #047857;
          }
        }
      }
    }
  }
}
</style>