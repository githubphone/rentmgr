<template>
  <view class="list-container">
    <NavBar title="设备管理" :showBack="true" />
    <view class="search-bar">
      <view class="search-wrapper">
        <text class="search-icon">🔍</text>
        <input
          v-model="keyword"
          class="search-input"
          type="text"
          placeholder="搜索设备名称或编码"
          placeholder-class="placeholder"
        />
      </view>
    </view>
    <scroll-view
      scroll-y
      class="list-content"
      :refresher-enabled="true"
      :refresher-triggered="isRefreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <view class="device-list">
        <view class="device-item" v-for="(item, index) in deviceList" :key="index" @click="goToDetail(item.id)">
          <view class="device-main">
            <view class="device-icon" :class="item.deviceType">
              <text>{{ item.deviceType === 'camera' ? '📷' : '📞' }}</text>
            </view>
            <view class="device-info">
              <view class="device-header">
                <text class="device-name">{{ item.deviceName }}</text>
                <view class="status-tag" :class="item.status === '1' ? 'status-online' : 'status-offline'">
                  {{ item.status === '1' ? '在线' : '离线' }}
                </view>
              </view>
              <text class="device-code">{{ item.deviceCode }}</text>
              <text class="device-location">{{ item.location || '-' }}</text>
            </view>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="empty-tip" v-if="deviceList.length === 0 && !isLoading">
          <text class="empty-icon">📱</text>
          <text class="empty-text">暂无设备数据</text>
        </view>
        <view class="loading-tip" v-if="isLoadingMore">
          <text>加载中...</text>
        </view>
        <view class="no-more-tip" v-if="noMore && deviceList.length > 0">
          <text>没有更多了</text>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getDeviceList } from '@/api/rental/device'

const keyword = ref('')
const deviceList = ref<any[]>([])
const isRefreshing = ref(false)
const isLoading = ref(false)
const isLoadingMore = ref(false)
const noMore = ref(false)
const pageNum = ref(1)
const pageSize = ref(10)

onMounted(() => {
  loadData()
})

const loadData = (refresh = false) => {
  if (refresh) {
    pageNum.value = 1
    noMore.value = false
  }

  if (isLoading.value || isLoadingMore.value) return

  if (refresh) {
    isRefreshing.value = true
  } else if (pageNum.value === 1) {
    isLoading.value = true
  } else {
    isLoadingMore.value = true
  }

  getDeviceList({
    pageNum: pageNum.value,
    pageSize: pageSize.value,
    keyword: keyword.value
  })
    .then((res: any) => {
      const rows = res.rows || []
      if (refresh) {
        deviceList.value = rows
      } else {
        deviceList.value = [...deviceList.value, ...rows]
      }

      if (rows.length < pageSize.value) {
        noMore.value = true
      }

      pageNum.value++
    })
    .catch(() => {
    })
    .finally(() => {
      isRefreshing.value = false
      isLoading.value = false
      isLoadingMore.value = false
    })
}

const onRefresh = () => {
  loadData(true)
}

const onLoadMore = () => {
  if (!noMore.value) {
    loadData()
  }
}

const goToDetail = (id: string) => {
  Taro.navigateTo({ url: `/pages/rental/device/detail?id=${id}` })
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

    .device-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .device-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        .device-main {
          display: flex;
          align-items: center;
          flex: 1;

          .device-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            font-size: 24px;

            &.camera {
              background-color: #E0F2FE;
            }

            &.intercom {
              background-color: #FEF3C7;
            }
          }

          .device-info {
            display: flex;
            flex-direction: column;
            flex: 1;

            .device-header {
              display: flex;
              align-items: center;
              margin-bottom: 4px;

              .device-name {
                font-size: 15px;
                font-weight: 600;
                color: #134E4A;
                margin-right: 8px;
              }

              .status-tag {
                font-size: 11px;
                padding: 2px 8px;
                border-radius: 8px;

                &.status-online {
                  background-color: #D1FAE5;
                  color: #047857;
                }

                &.status-offline {
                  background-color: #F1F5F9;
                  color: #94A3B8;
                }
              }
            }

            .device-code {
              font-size: 13px;
              color: #64748B;
              margin-bottom: 4px;
            }

            .device-location {
              font-size: 12px;
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
          margin-bottom: 12px;
          opacity: 0.5;
        }

        .empty-text {
          font-size: 15px;
          color: #64748B;
          font-weight: 500;
        }
      }

      .loading-tip {
        text-align: center;
        padding: 16px;
        color: #94A3B8;
        font-size: 14px;
      }

      .no-more-tip {
        text-align: center;
        padding: 16px;
        color: #94A3B8;
        font-size: 14px;
      }
    }
  }
}
</style>