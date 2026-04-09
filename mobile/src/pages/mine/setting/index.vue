<template>
  <view class="setting-container">
    <NavBar title="应用设置" :showBack="true" />
    <view class="setting-content">
      <view class="setting-card">
        <view class="setting-item">
          <view class="setting-left">
            <text class="setting-icon">🔔</text>
            <text class="setting-text">消息通知</text>
          </view>
          <switch :checked="notifyEnabled" @change="onNotifyChange" color="#14B8A6" />
        </view>
        <view class="setting-item">
          <view class="setting-left">
            <text class="setting-icon">🔊</text>
            <text class="setting-text">声音</text>
          </view>
          <switch :checked="soundEnabled" @change="onSoundChange" color="#14B8A6" />
        </view>
        <view class="setting-item">
          <view class="setting-left">
            <text class="setting-icon">📳</text>
            <text class="setting-text">震动</text>
          </view>
          <switch :checked="vibrateEnabled" @change="onVibrateChange" color="#14B8A6" />
        </view>
      </view>
      <view class="version-info">
        <text>当前版本: v1.0.0</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import NavBar from '@/components/NavBar.vue'

const notifyEnabled = ref(true)
const soundEnabled = ref(true)
const vibrateEnabled = ref(true)

const onNotifyChange = (e: any) => {
  notifyEnabled.value = e.detail.value
}

const onSoundChange = (e: any) => {
  soundEnabled.value = e.detail.value
}

const onVibrateChange = (e: any) => {
  vibrateEnabled.value = e.detail.value
}
</script>

<style lang="scss">
.setting-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.setting-content {
  padding: 16px;
}

.setting-card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

  .setting-item {
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

    .setting-left {
      display: flex;
      align-items: center;

      .setting-icon {
        font-size: 18px;
        margin-right: 12px;
      }

      .setting-text {
        font-size: 15px;
        color: #134E4A;
        font-weight: 500;
      }
    }
  }
}

.version-info {
  margin-top: 30px;
  text-align: center;
  color: #94A3B8;
  font-size: 13px;
}
</style>