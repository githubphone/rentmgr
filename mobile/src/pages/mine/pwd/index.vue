<template>
  <view class="pwd-container">
    <NavBar title="修改密码" :showBack="true" />
    <view class="pwd-content">
      <view class="form-card">
        <view class="form-item">
          <text class="label">原密码</text>
          <input
            v-model="formData.oldPassword"
            class="input"
            type="password"
            placeholder="请输入原密码"
            placeholder-class="placeholder"
          />
        </view>
        <view class="form-item">
          <text class="label">新密码</text>
          <input
            v-model="formData.newPassword"
            class="input"
            type="password"
            placeholder="请输入新密码"
            placeholder-class="placeholder"
          />
        </view>
        <view class="form-item">
          <text class="label">确认密码</text>
          <input
            v-model="formData.confirmPassword"
            class="input"
            type="password"
            placeholder="请确认新密码"
            placeholder-class="placeholder"
          />
        </view>
      </view>
      <view class="save-btn">
        <button @click="handleSave" class="btn">保存</button>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'

const formData = ref({
  oldPassword: '',
  newPassword: '',
  confirmPassword: ''
})

const handleSave = () => {
  if (formData.value.oldPassword === '') {
    Taro.showToast({ title: '请输入原密码', icon: 'none' })
    return
  }
  if (formData.value.newPassword === '') {
    Taro.showToast({ title: '请输入新密码', icon: 'none' })
    return
  }
  if (formData.value.newPassword !== formData.value.confirmPassword) {
    Taro.showToast({ title: '两次密码输入不一致', icon: 'none' })
    return
  }
  Taro.showToast({ title: '密码修改成功', icon: 'success' })
  setTimeout(() => {
    Taro.navigateBack()
  }, 1500)
}
</script>

<style lang="scss">
.pwd-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.pwd-content {
  padding: 16px;
}

.form-card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

  .form-item {
    display: flex;
    align-items: center;
    padding: 16px 20px;
    border-bottom: 1px solid #f0f9f8;

    &:last-child {
      border-bottom: none;
    }

    .label {
      font-size: 14px;
      color: #64748B;
      width: 80px;
      flex-shrink: 0;
    }

    .input {
      flex: 1;
      font-size: 14px;
      color: #134E4A;
      text-align: right;
    }

    .placeholder {
      color: #CBD5E1;
    }
  }
}

.save-btn {
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