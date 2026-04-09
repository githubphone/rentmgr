<template>
  <view class="mine-container">
    <view class="user-header">
      <image class="avatar" :src="userStore.avatar || defaultAvatar" mode="aspectFill" />
      <view class="info">
        <text class="username">{{ userStore.name || '未登录' }}</text>
        <text class="role">房东</text>
      </view>
    </view>

    <view class="menu-section">
      <view class="menu-list">
        <view class="menu-item" @click="goToPage('/pages/mine/info/index')">
          <view class="menu-left">
            <text class="menu-icon">👤</text>
            <text class="menu-text">个人信息</text>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="menu-item" @click="goToPage('/pages/mine/avatar/index')">
          <view class="menu-left">
            <text class="menu-icon">🖼️</text>
            <text class="menu-text">修改头像</text>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="menu-item" @click="goToPage('/pages/mine/pwd/index')">
          <view class="menu-left">
            <text class="menu-icon">🔐</text>
            <text class="menu-text">修改密码</text>
          </view>
          <text class="arrow">›</text>
        </view>
      </view>

      <view class="menu-list">
        <view class="menu-item" @click="goToPage('/pages/mine/setting/index')">
          <view class="menu-left">
            <text class="menu-icon">⚙️</text>
            <text class="menu-text">应用设置</text>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="menu-item" @click="goToPage('/pages/mine/help/index')">
          <view class="menu-left">
            <text class="menu-icon">❓</text>
            <text class="menu-text">常见问题</text>
          </view>
          <text class="arrow">›</text>
        </view>
        <view class="menu-item" @click="goToPage('/pages/mine/about/index')">
          <view class="menu-left">
            <text class="menu-icon">ℹ️</text>
            <text class="menu-text">关于我们</text>
          </view>
          <text class="arrow">›</text>
        </view>
      </view>
    </view>

    <view class="logout-btn" v-if="userStore.token">
      <button @click="handleLogout" class="btn">退出登录</button>
    </view>
  </view>
</template>

<script setup lang="ts">
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'
import defAva from '@/assets/images/profile.jpg'

const userStore = useUserStore()
const defaultAvatar = defAva

const goToPage = (url: string) => {
  Taro.navigateTo({ url })
}

const handleLogout = async () => {
  try {
    await userStore.LogOut()
    Taro.reLaunch({ url: '/pages/login/index' })
  } catch (error) {
    Taro.showToast({ title: '退出失败', icon: 'none' })
  }
}
</script>

<style lang="scss">
.mine-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .user-header {
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    padding: 40px 24px;
    display: flex;
    align-items: center;

    .avatar {
      width: 70px;
      height: 70px;
      border-radius: 50%;
      margin-right: 16px;
      border: 3px solid rgba(255, 255, 255, 0.3);
    }

    .info {
      display: flex;
      flex-direction: column;

      .username {
        font-size: 20px;
        font-weight: 600;
        color: #fff;
        margin-bottom: 6px;
      }

      .role {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
        background-color: rgba(255, 255, 255, 0.2);
        padding: 2px 10px;
        border-radius: 10px;
        align-self: flex-start;
      }
    }
  }

  .menu-section {
    padding: 16px;

    .menu-list {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
      margin-bottom: 16px;

      &:last-child {
        margin-bottom: 0;
      }

      .menu-item {
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

        .menu-left {
          display: flex;
          align-items: center;

          .menu-icon {
            font-size: 18px;
            margin-right: 12px;
          }

          .menu-text {
            font-size: 15px;
            color: #134E4A;
            font-weight: 500;
          }
        }

        .arrow {
          font-size: 18px;
          color: #CBD5E1;
        }
      }
    }
  }

  .logout-btn {
    padding: 16px 20px;
    padding-bottom: calc(16px + env(safe-area-inset-bottom));

    .btn {
      width: 100%;
      height: 48px;
      background-color: #fff;
      color: #EF4444;
      font-size: 16px;
      font-weight: 500;
      border-radius: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      &::after {
        border: none;
      }

      &:active {
        opacity: 0.9;
      }
    }
  }
}
</style>