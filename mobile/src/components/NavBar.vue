<template>
  <view class="navbar">
    <view class="navbar-left" @click="handleBack">
      <view class="back-btn" v-if="showBack">
        <text class="back-icon">‹</text>
        <text class="back-text">返回</text>
      </view>
    </view>
    <view class="navbar-center">
      <text class="navbar-title">{{ title }}</text>
    </view>
    <view class="navbar-right"></view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'

const props = defineProps({
  title: {
    type: String,
    default: ''
  },
  showBack: {
    type: Boolean,
    default: true
  }
})

onMounted(() => {
  console.log('NavBar mounted, props:', props)
})

const handleBack = () => {
  console.log('Back button clicked')
  const pages = Taro.getCurrentPages()
  console.log('Current pages length:', pages.length)
  
  if (pages.length > 1) {
    try {
      Taro.navigateBack({ delta: 1 })
    } catch (e) {
      console.log('navigateBack error:', e)
      history.back()
    }
  } else {
    console.log('No pages to go back, switching to home')
    Taro.switchTab({ url: '/pages/index/index' })
  }
}
</script>

<style lang="scss">
.navbar {
  height: 48px;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 16px;
  padding-top: env(safe-area-inset-top);
  border-bottom: 1px solid #f0f0f0;
  position: relative;
  z-index: 100;

  .navbar-left {
    min-width: 70px;
    height: 100%;
    display: flex;
    align-items: center;
    
    .back-btn {
      display: flex;
      align-items: center;
      padding: 8px 0;
      
      .back-icon {
        font-size: 24px;
        color: #0F766E;
        font-weight: 300;
        margin-right: 2px;
        transition: color 0.2s ease;
      }
      
      .back-text {
        font-size: 15px;
        color: #0F766E;
        font-weight: 500;
        transition: color 0.2s ease;
      }
      
      &:active {
        opacity: 0.7;
      }
    }
  }

  .navbar-center {
    flex: 1;
    display: flex;
    justify-content: center;
    .navbar-title {
      font-size: 17px;
      font-weight: 600;
      color: #134E4A;
      letter-spacing: 0.3px;
    }
  }

  .navbar-right {
    min-width: 70px;
  }
}
</style>