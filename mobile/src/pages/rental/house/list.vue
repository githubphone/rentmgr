<template>
  <view class="list-container">
    <NavBar title="出租屋管理" :showBack="true" />
    <view class="search-bar">
      <input
        v-model="keyword"
        class="search-input"
        type="text"
        placeholder="搜索出租屋"
        placeholder-class="search-placeholder"
      />
      <button class="search-btn" @click="loadData">搜索</button>
    </view>
    <scroll-view scroll-y class="list-content">
      <view class="house-card" v-for="(item, index) in houseList" :key="index" @click="goToDetail(item.id)">
        <view class="card-header">
          <view class="address-section">
            <text class="house-name">{{ item.address || '未知地址' }}</text>
            <text class="status-tag" :class="getStatusClass(item.status)">{{ getStatusText(item.status) }}</text>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="card-body">
          <view class="info-row">
            <view class="info-item">
              <text class="info-icon">📍</text>
              <text class="info-text">{{ item.townStreet || '-' }}</text>
            </view>
            <view class="info-item">
              <text class="info-icon">🏢</text>
              <text class="info-text">{{ item.totalFloors || 0 }}层</text>
            </view>
            <view class="info-item">
              <text class="info-icon">🚪</text>
              <text class="info-text">{{ item.totalRooms || 0 }}房间</text>
            </view>
          </view>
          <view class="manager-row" v-if="item.managerName">
            <text class="manager-icon">👤</text>
            <text class="manager-text">管理者: {{ item.managerName }}</text>
          </view>
        </view>
      </view>
      
      <view class="empty-tip" v-if="houseList.length === 0">
        <view class="empty-icon">🏠</view>
        <text class="empty-text">暂无出租屋数据</text>
        <text class="empty-hint">点击底部按钮添加第一间出租屋</text>
      </view>
    </scroll-view>
    <view class="add-btn" @click="goToForm">
      <text class="add-icon">+</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getHouseList } from '@/api/rental/house'

const keyword = ref('')
const houseList = ref<any[]>([])

onMounted(() => {
  loadData()
})

const loadData = () => {
  Taro.showLoading({ title: '加载中...' })
  getHouseList({ keyword: keyword.value })
    .then((res: any) => {
      houseList.value = res.rows || []
      Taro.hideLoading()
    })
    .catch(() => {
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

const goToDetail = (id: string) => {
  Taro.navigateTo({ url: `/pages/rental/house/detail?id=${id}` })
}

const goToForm = () => {
  Taro.navigateTo({ url: '/pages/rental/house/form' })
}
</script>

<style lang="scss">
.list-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .search-bar {
    background-color: #fff;
    padding: 12px 16px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #f0f0f0;

    .search-input {
      flex: 1;
      height: 34px;
      background-color: #F0FDFA;
      border-radius: 17px;
      padding: 0 16px;
      font-size: 14px;
      color: #134E4A;
    }

    .search-placeholder {
      color: #94A3B8;
    }

    .search-btn {
      flex-shrink: 0;
      margin-left: 12px;
      height: 34px;
      width: 80px;
      padding: 0 16px;
      background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
      color: #fff;
      border: none;
      border-radius: 17px;
      font-size: 13px;
      font-weight: 500;
      display: flex;
      align-items: center;
      justify-content: center;
      
      &:active {
        opacity: 0.9;
        transform: scale(0.98);
      }
    }
  }

  .list-content {
    height: calc(100vh - 110px);
    padding: 16px;
    
    .house-card {
      background-color: #fff;
      border-radius: 16px;
      padding: 16px;
      margin-bottom: 12px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      
      &:active {
        transform: scale(0.98);
        box-shadow: 0 1px 6px rgba(0, 0, 0, 0.03);
      }

      .card-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 12px;

        .address-section {
          flex: 1;
          display: flex;
          align-items: center;
          flex-wrap: wrap;
          gap: 8px;

          .house-name {
            font-size: 16px;
            font-weight: 600;
            color: #134E4A;
          }

          .status-tag {
            font-size: 11px;
            padding: 3px 10px;
            border-radius: 10px;
            font-weight: 500;

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

        .arrow {
          font-size: 20px;
          color: #CBD5E1;
          font-weight: 300;
          margin-left: 8px;
        }
      }

      .card-body {
        .info-row {
          display: flex;
          flex-wrap: wrap;
          gap: 16px;
          margin-bottom: 8px;

          .info-item {
            display: flex;
            align-items: center;

            .info-icon {
              font-size: 13px;
              margin-right: 4px;
            }

            .info-text {
              font-size: 13px;
              color: #64748B;
            }
          }
        }

        .manager-row {
          display: flex;
          align-items: center;
          padding-top: 8px;
          border-top: 1px solid #f0f9f8;

          .manager-icon {
            font-size: 13px;
            margin-right: 4px;
          }

          .manager-text {
            font-size: 13px;
            color: #94A3B8;
          }
        }
      }
    }

    .empty-tip {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 60px 20px;
      
      .empty-icon {
        font-size: 48px;
        margin-bottom: 16px;
        opacity: 0.5;
      }
      
      .empty-text {
        font-size: 16px;
        color: #64748B;
        font-weight: 500;
        margin-bottom: 8px;
      }
      
      .empty-hint {
        font-size: 13px;
        color: #94A3B8;
      }
    }
  }

  .add-btn {
    position: fixed;
    right: 20px;
    bottom: 30px;
    width: 56px;
    height: 56px;
    border-radius: 28px;
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 16px rgba(15, 118, 110, 0.35);
    
    &:active {
      transform: scale(0.95);
    }

    .add-icon {
      font-size: 28px;
      color: #fff;
      font-weight: 300;
      margin-top: -2px;
    }
  }
}
</style>