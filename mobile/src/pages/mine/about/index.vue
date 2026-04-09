<template>
  <view class="about-container">
    <NavBar title="关于我们" :showBack="true" />
    <view class="about-content">
      <view class="logo-section">
        <view class="logo-wrapper">
          <text class="logo-icon">🏠</text>
        </view>
        <text class="app-name">租赁管理系统</text>
        <text class="version">V1.0.0</text>
      </view>

      <view class="info-card">
        <view class="info-item">
          <text class="label">开发商</text>
          <text class="value">水口镇政府</text>
        </view>
        <view class="info-item">
          <text class="label">联系电话</text>
          <text class="value">0752-1234567</text>
        </view>
      </view>

      <view class="desc-card">
        <text class="desc-text">
          租赁管理系统是一款专为房东打造的移动端管理工具，支持出租屋管理、住户管理、设备管理和告警等功能。
        </text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import NavBar from '@/components/NavBar.vue'
</script>

<style lang="scss">
.about-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.about-content {
  padding: 16px;
}

.logo-section {
  background-color: #fff;
  border-radius: 16px;
  padding: 40px 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

  .logo-wrapper {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 16px;

    .logo-icon {
      font-size: 40px;
    }
  }

  .app-name {
    font-size: 20px;
    font-weight: 600;
    color: #134E4A;
    margin-bottom: 8px;
  }

  .version {
    font-size: 14px;
    color: #94A3B8;
  }
}

.info-card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
  margin-top: 16px;

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

.desc-card {
  background-color: #fff;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
  margin-top: 16px;

  .desc-text {
    font-size: 14px;
    color: #64748B;
    line-height: 1.8;
  }
}
</style>