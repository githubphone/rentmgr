<template>
  <view class="detail-container">
    <NavBar title="设备详情" :showBack="true" />
    <scroll-view scroll-y class="detail-content">
      <!-- 设备头部 -->
      <view class="device-header-card">
        <view class="device-icon" :class="deviceInfo.deviceType">
          <text>{{ deviceInfo.deviceType === 'camera' ? '📷' : '📞' }}</text>
        </view>
        <view class="device-title">
          <text class="device-name">{{ deviceInfo.deviceName }}</text>
          <view class="status-tag" :class="deviceInfo.status === '1' ? 'status-online' : 'status-offline'">
            {{ deviceInfo.status === '1' ? '在线' : '离线' }}
          </view>
        </view>
      </view>

      <!-- 基本信息 -->
      <view class="info-section">
        <view class="section-header">
          <text class="section-title">基本信息</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">设备编码</text>
            <text class="value">{{ deviceInfo.deviceCode || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">设备类型</text>
            <text class="value">{{ deviceInfo.deviceType === 'camera' ? '摄像头' : '对讲机' }}</text>
          </view>
          <view class="info-row">
            <text class="label">安装位置</text>
            <text class="value">{{ deviceInfo.location || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">订阅人脸</text>
            <text class="value">
              <text class="status-tag-sm" :class="deviceInfo.metadataSubscribed === '1' ? 'subscribed' : 'unsubscribed'">
                {{ deviceInfo.metadataSubscribed === '1' ? '已订阅' : '未订阅' }}
              </text>
            </text>
          </view>
        </view>
      </view>

      <!-- 状态信息 -->
      <view class="info-section">
        <view class="section-header">
          <text class="section-title">状态信息</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">在线状态</text>
            <text class="value">
              <text class="status-tag-sm" :class="deviceInfo.status === '1' ? 'status-online' : 'status-offline'">
                {{ deviceInfo.status === '1' ? '在线' : '离线' }}
              </text>
            </text>
          </view>
          <view class="info-row">
            <text class="label">最后心跳</text>
            <text class="value">{{ deviceInfo.lastHeartbeat || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">创建时间</text>
            <text class="value">{{ deviceInfo.createTime || '-' }}</text>
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
import { getDevice } from '@/api/rental/device'

const deviceInfo = ref<any>({})

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  const id = params?.id
  if (id) {
    loadData(id)
  }
})

const loadData = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getDevice(id).then((res: any) => {
    console.log('设备详情数据:', res)
    deviceInfo.value = res.data || {}
    Taro.hideLoading()
  }).catch((error) => {
    console.error('加载数据失败:', error)
    Taro.hideLoading()
  })
}
</script>

<style lang="scss">
.detail-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .detail-content {
    min-height: calc(100vh - 60px);
  }

  .device-header-card {
    background-color: #fff;
    margin: 16px;
    border-radius: 16px;
    padding: 24px 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

    .device-icon {
      width: 72px;
      height: 72px;
      border-radius: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 36px;
      margin-bottom: 16px;

      &.camera {
        background-color: #E0F2FE;
      }

      &.intercom {
        background-color: #FEF3C7;
      }
    }

    .device-title {
      display: flex;
      flex-direction: column;
      align-items: center;

      .device-name {
        font-size: 18px;
        font-weight: 600;
        color: #134E4A;
        margin-bottom: 8px;
      }

      .status-tag {
        font-size: 12px;
        padding: 4px 12px;
        border-radius: 12px;

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
  }

  .info-section {
    padding: 0 16px 16px;

    .section-header {
      margin-bottom: 12px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }
    }

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
          display: flex;
          align-items: center;

          .status-tag-sm {
            font-size: 12px;
            padding: 3px 10px;
            border-radius: 10px;

            &.status-online {
              background-color: #D1FAE5;
              color: #047857;
            }

            &.status-offline {
              background-color: #F1F5F9;
              color: #94A3B8;
            }

            &.subscribed {
              background-color: #D1FAE5;
              color: #047857;
            }

            &.unsubscribed {
              background-color: #F1F5F9;
              color: #94A3B8;
            }
          }
        }
      }
    }
  }
}
</style>