<template>
  <view class="info-container">
    <NavBar title="个人信息" :showBack="true" />
    <view class="info-content">
      <view class="info-card">
        <view class="info-item">
          <text class="label">用户名称</text>
          <text class="value">{{ userStore.name }}</text>
        </view>
        <view class="info-item">
          <text class="label">用户角色</text>
          <text class="value">{{ userStore.roles && userStore.roles.length > 0 ? userStore.roles.join(',') : '普通用户' }}</text>
        </view>
      </view>
      <view class="edit-btn">
        <button @click="goToEdit" class="btn">编辑资料</button>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'
import NavBar from '@/components/NavBar.vue'

const userStore = useUserStore()

const goToEdit = () => {
  Taro.navigateTo({ url: '/pages/mine/info/edit' })
}
</script>

<style lang="scss">
.info-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.info-content {
  padding: 16px;
}

.info-card {
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

.edit-btn {
  margin-top: 24px;

  .btn {
    width: 100%;
    height: 48px;
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
</style>