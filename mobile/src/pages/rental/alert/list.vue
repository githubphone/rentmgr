<template>
  <view class="list-container">
    <NavBar title="告警管理" :showBack="true" />
    <view class="search-bar">
      <view class="search-wrapper">
        <text class="search-icon">🔍</text>
        <input
          v-model="keyword"
          class="search-input"
          type="text"
          placeholder="搜索告警内容"
          placeholder-class="placeholder"
        />
      </view>
    </view>
    <scroll-view scroll-y class="list-content">
      <view class="alert-list">
        <view class="alert-item" v-for="(item, index) in alertList" :key="index" @click="goToDetail(item.id)">
          <view class="alert-main">
            <view class="alert-header">
              <view class="alert-type-row">
                <text class="alert-icon">🚨</text>
                <text class="alert-type">{{ getAlertTypeText(item.type) }}</text>
              </view>
              <text class="alert-status" :class="getStatusClass(item.status)">{{ getStatusText(item.status) }}</text>
            </view>
            <view class="alert-content">
              <text>{{ item.content }}</text>
            </view>
            <view class="alert-footer">
              <text class="alert-time">{{ item.createTime }}</text>
            </view>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="empty-tip" v-if="alertList.length === 0">
          <text class="empty-icon">🔔</text>
          <text class="empty-text">暂无告警数据</text>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getAlertList } from '@/api/rental/alert'

const keyword = ref('')
const alertList = ref<any[]>([])

onMounted(() => {
  loadData()
})

const loadData = () => {
  Taro.showLoading({ title: '加载中...' })
  getAlertList({ keyword: keyword.value })
    .then((res: any) => {
      alertList.value = res.rows || []
      Taro.hideLoading()
    })
    .catch(() => {
      Taro.hideLoading()
    })
}

const getAlertTypeText = (type: string) => {
  const map: Record<string, string> = {
    '1': '陌生人告警',
    '2': '设备异常',
    '3': '其他告警'
  }
  return map[type] || '未知'
}

const getStatusText = (status: string) => {
  const map: Record<string, string> = {
    '0': '待处理',
    '1': '已处理'
  }
  return map[status] || '未知'
}

const getStatusClass = (status: string) => {
  return status === '0' ? 'status-pending' : 'status-done'
}

const goToDetail = (id: string) => {
  Taro.navigateTo({ url: `/pages/rental/alert/detail?id=${id}` })
}
</script>

<style lang="scss">
.list-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .search-bar {
    padding: 12px 16px;
    background-color: #fff;

    .search-wrapper {
      display: flex;
      align-items: center;
      background-color: #F0FDFA;
      border-radius: 20px;
      padding: 8px 16px;

      .search-icon {
        font-size: 16px;
        margin-right: 8px;
      }

      .search-input {
        flex: 1;
        font-size: 14px;
        color: #134E4A;
      }

      .placeholder {
        color: #94A3B8;
      }
    }
  }

  .list-content {
    padding: 16px;

    .alert-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .alert-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        &:active {
          background-color: #F0FDFA;
        }

        .alert-main {
          flex: 1;

          .alert-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;

            .alert-type-row {
              display: flex;
              align-items: center;

              .alert-icon {
                font-size: 16px;
                margin-right: 6px;
              }

              .alert-type {
                font-size: 15px;
                font-weight: 600;
                color: #134E4A;
              }
            }

            .alert-status {
              font-size: 12px;
              padding: 3px 10px;
              border-radius: 10px;

              &.status-pending {
                background-color: #FFE4E6;
                color: #BE123C;
              }

              &.status-done {
                background-color: #D1FAE5;
                color: #047857;
              }
            }
          }

          .alert-content {
            font-size: 14px;
            color: #64748B;
            margin-bottom: 8px;
            line-height: 1.5;
          }

          .alert-footer {
            .alert-time {
              font-size: 12px;
              color: #94A3B8;
            }
          }
        }

        .arrow {
          font-size: 18px;
          color: #CBD5E1;
          margin-left: 12px;
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