<template>
  <view class="detail-container">
    <NavBar title="告警详情" :showBack="true" />
    <scroll-view scroll-y class="detail-content">
      <!-- 告警头部 -->
      <view class="alert-header-card">
        <view class="alert-header">
          <view class="alert-type-row">
            <text class="alert-icon">🚨</text>
            <text class="alert-type">{{ getAlertTypeText(alertInfo.type) }}</text>
          </view>
          <text class="alert-status" :class="getStatusClass(alertInfo.status)">{{ getStatusText(alertInfo.status) }}</text>
        </view>
        <view class="alert-time">
          <text>{{ alertInfo.createTime }}</text>
        </view>
      </view>

      <!-- 告警内容 -->
      <view class="info-section">
        <view class="section-header">
          <text class="section-title">告警内容</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">告警内容</text>
            <text class="value">{{ alertInfo.content || '-' }}</text>
          </view>
        </view>
      </view>

      <!-- 处理记录 -->
      <view class="info-section" v-if="alertInfo.handleTime">
        <view class="section-header">
          <text class="section-title">处理记录</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">处理时间</text>
            <text class="value">{{ alertInfo.handleTime }}</text>
          </view>
          <view class="info-row">
            <text class="label">处理说明</text>
            <text class="value">{{ alertInfo.remark || '-' }}</text>
          </view>
        </view>
      </view>

      <!-- 提交处理 -->
      <view class="handle-section" v-if="alertInfo.status === '0'">
        <view class="handle-card">
          <view class="handle-title">处理记录</view>
          <textarea
            v-model="handleRemark"
            class="remark-input"
            placeholder="请输入处理说明"
            placeholder-class="placeholder"
            maxlength="200"
          />
          <button @click="handleSubmit" class="submit-btn">提交处理</button>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getAlertDetail, handleAlert } from '@/api/rental/alert'

const alertInfo = ref<any>({})
const handleRemark = ref('')

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  const id = params?.id
  if (id) {
    loadData(id)
  }
})

const loadData = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getAlertDetail(id)
    .then((res: any) => {
      alertInfo.value = res.data || {}
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

const handleSubmit = () => {
  if (!handleRemark.value) {
    Taro.showToast({ title: '请输入处理说明', icon: 'none' })
    return
  }
  Taro.showLoading({ title: '提交中...' })
  handleAlert({
    id: alertInfo.value.id,
    remark: handleRemark.value
  }).then(() => {
    Taro.hideLoading()
    Taro.showToast({ title: '提交成功', icon: 'success' })
    setTimeout(() => {
      Taro.navigateBack()
    }, 1500)
  }).catch(() => {
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

  .alert-header-card {
    background-color: #fff;
    margin: 16px;
    border-radius: 16px;
    padding: 20px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

    .alert-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 12px;

      .alert-type-row {
        display: flex;
        align-items: center;

        .alert-icon {
          font-size: 18px;
          margin-right: 8px;
        }

        .alert-type {
          font-size: 17px;
          font-weight: 600;
          color: #134E4A;
        }
      }

      .alert-status {
        font-size: 12px;
        padding: 4px 12px;
        border-radius: 12px;

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

    .alert-time {
      font-size: 13px;
      color: #94A3B8;
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
          text-align: right;
          flex: 1;
          margin-left: 16px;
        }
      }
    }
  }

  .handle-section {
    padding: 0 16px 16px;

    .handle-card {
      background-color: #fff;
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .handle-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
        margin-bottom: 12px;
      }

      .remark-input {
        width: 100%;
        height: 100px;
        background-color: #F0FDFA;
        border-radius: 12px;
        padding: 12px;
        font-size: 14px;
        color: #134E4A;
        box-sizing: border-box;

        .placeholder {
          color: #94A3B8;
        }
      }

      .submit-btn {
        width: 100%;
        height: 48px;
        margin-top: 16px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        color: #fff;
        font-size: 16px;
        font-weight: 500;
        border-radius: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 16px rgba(15, 118, 110, 0.3);

        &::after {
          border: none;
        }

        &:active {
          opacity: 0.9;
        }
      }
    }
  }
}

.placeholder {
  color: #94A3B8;
}
</style>