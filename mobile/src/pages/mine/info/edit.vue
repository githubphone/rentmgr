<template>
  <view class="edit-container">
    <view class="form-item">
      <text class="label">用户名称</text>
      <input
        v-model="formData.userName"
        class="input"
        type="text"
        placeholder="请输入用户名称"
      />
    </view>
    <view class="form-item">
      <text class="label">手机号码</text>
      <input
        v-model="formData.phonenumber"
        class="input"
        type="text"
        placeholder="请输入手机号码"
      />
    </view>
    <view class="form-item">
      <text class="label">邮箱</text>
      <input
        v-model="formData.email"
        class="input"
        type="text"
        placeholder="请输入邮箱"
      />
    </view>
    <view class="save-btn">
      <button @click="handleSave" class="btn">保存</button>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'

const userStore = useUserStore()
const formData = ref({
  userName: userStore.name || '',
  phonenumber: '',
  email: ''
})

const handleSave = () => {
  Taro.showToast({ title: '保存成功', icon: 'success' })
  setTimeout(() => {
    Taro.navigateBack()
  }, 1500)
}
</script>

<style lang="scss">
.edit-container {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;

  .form-item {
    background-color: #fff;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 5px;

    .label {
      display: block;
      font-size: 14px;
      color: #666;
      margin-bottom: 10px;
    }

    .input {
      font-size: 15px;
      color: #333;
    }
  }

  .save-btn {
    margin-top: 30px;

    .btn {
      background-color: #1890ff;
      color: #fff;
      font-size: 15px;
      border-radius: 5px;

      &::after {
        border: none;
      }
    }
  }
}
</style>
