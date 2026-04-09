<template>
  <view class="list-container">
    <NavBar title="住户管理" :showBack="true" />
    <view class="search-bar">
      <view class="search-wrapper">
        <text class="search-icon">🔍</text>
        <input
          v-model="keyword"
          class="search-input"
          type="text"
          placeholder="搜索住户姓名或手机号"
          placeholder-class="placeholder"
        />
      </view>
    </view>
    <scroll-view scroll-y class="list-content">
      <view class="resident-list">
        <view class="resident-item" v-for="(item, index) in residentList" :key="index" @click="goToResidentDetail(item.id)">
          <view class="resident-main">
            <view class="resident-avatar">
              <text class="avatar-text">{{ item.name?.charAt(0) || '?' }}</text>
            </view>
            <view class="resident-info">
              <view class="resident-header">
                <text class="resident-name">{{ item.name }}</text>
                <text class="resident-type" :class="getTypeClass(item.residentType)">{{ getTypeText(item.residentType) }}</text>
              </view>
              <text class="resident-phone">{{ item.phone }}</text>
              <text class="resident-address">{{ item.houseName }} · {{ item.roomName }}</text>
            </view>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="empty-tip" v-if="residentList.length === 0">
          <text class="empty-icon">👤</text>
          <text class="empty-text">暂无住户数据</text>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getResidentList } from '@/api/rental/resident'

const keyword = ref('')
const residentList = ref<any[]>([])

onMounted(() => {
  loadData()
})

const loadData = () => {
  Taro.showLoading({ title: '加载中...' })
  getResidentList({ keyword: keyword.value })
    .then((res: any) => {
      residentList.value = res.rows || []
      Taro.hideLoading()
    })
    .catch(() => {
      Taro.hideLoading()
    })
}

const getTypeText = (type: string) => {
  const map: any = { 'tenant': '租客', 'family': '家属', 'owner': '房东' }
  return map[type] || '租客'
}

const getTypeClass = (type: string) => {
  const map: any = { 'tenant': 'type-tenant', 'family': 'type-family', 'owner': 'type-owner' }
  return map[type] || 'type-tenant'
}

const goToResidentDetail = (id: string) => {
  Taro.navigateTo({
    url: `/pages/rental/resident/detail?id=${id}`
  })
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

    .resident-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .resident-item {
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

        .resident-main {
          display: flex;
          align-items: center;
          flex: 1;

          .resident-avatar {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;

            .avatar-text {
              font-size: 18px;
              font-weight: 600;
              color: #fff;
            }
          }

          .resident-info {
            display: flex;
            flex-direction: column;

            .resident-header {
              display: flex;
              align-items: center;
              margin-bottom: 4px;

              .resident-name {
                font-size: 16px;
                font-weight: 600;
                color: #134E4A;
                margin-right: 8px;
              }

              .resident-type {
                font-size: 11px;
                padding: 2px 8px;
                border-radius: 8px;

                &.type-tenant {
                  background-color: #E0F2FE;
                  color: #0369A1;
                }

                &.type-family {
                  background-color: #FEF3C7;
                  color: #B45309;
                }

                &.type-owner {
                  background-color: #D1FAE5;
                  color: #047857;
                }
              }
            }

            .resident-phone {
              font-size: 13px;
              color: #64748B;
              margin-bottom: 4px;
            }

            .resident-address {
              font-size: 12px;
              color: #94A3B8;
            }
          }
        }

        .arrow {
          font-size: 18px;
          color: #CBD5E1;
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