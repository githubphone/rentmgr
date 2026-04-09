<template>
  <view class="avatar-container">
    <NavBar title="修改头像" :showBack="true" />
    <view class="avatar-content">
      <view class="avatar-preview">
        <image :src="avatar" mode="aspectFill" class="avatar-img" />
      </view>
      <view class="tips">
        <text>点击下方按钮选择图片</text>
      </view>
      <view class="upload-btn">
        <button @click="chooseImage" class="btn">选择头像</button>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'
import NavBar from '@/components/NavBar.vue'

const userStore = useUserStore()
const avatar = ref(userStore.avatar || '/assets/images/profile.jpg')

const chooseImage = () => {
  Taro.chooseImage({
    count: 1,
    sizeType: ['compressed'],
    sourceType: ['album', 'camera'],
    success: (res) => {
      avatar.value = res.tempFilePaths[0]
      Taro.showToast({ title: '头像已更新', icon: 'success' })
    }
  })
}
</script>

<style lang="scss">
.avatar-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.avatar-content {
  padding: 24px 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.avatar-preview {
  margin-top: 24px;

  .avatar-img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    border: 4px solid #fff;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  }
}

.tips {
  margin-top: 20px;
  color: #64748B;
  font-size: 14px;
}

.upload-btn {
  margin-top: 30px;
  width: 100%;

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