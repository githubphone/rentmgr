<template>
  <view class="normal-login-container">
    <view class="logo-content align-center justify-center flex">
      <image style="width: 100px;height: 100px;" :src="config.appInfo.logo" mode="widthFix" />
      <text class="title">租赁管理系统注册</text>
    </view>
    <view class="login-form-content">
      <view class="input-item flex align-center">
        <text class="iconfont icon-user icon">👤</text>
        <input
          v-model="registerForm.username"
          class="input"
          type="text"
          placeholder="请输入账号"
          maxlength="30"
        />
      </view>
      <view class="input-item flex align-center">
        <text class="iconfont icon-password icon">🔒</text>
        <input
          v-model="registerForm.password"
          type="password"
          class="input"
          placeholder="请输入密码"
          maxlength="20"
        />
      </view>
      <view class="input-item flex align-center">
        <text class="iconfont icon-password icon">🔒</text>
        <input
          v-model="registerForm.confirmPassword"
          type="password"
          class="input"
          placeholder="请确认密码"
          maxlength="20"
        />
      </view>
      <view class="input-item flex align-center">
        <text class="iconfont icon-user icon">📧</text>
        <input
          v-model="registerForm.email"
          class="input"
          type="text"
          placeholder="请输入邮箱"
          maxlength="50"
        />
      </view>
      <view class="action-btn">
        <button @click="handleRegister" class="login-btn cu-btn block bg-blue lg round">注册</button>
      </view>
      <view class="reg text-center">
        <text class="text-grey1">已有账号？</text>
        <text @click="handleBackLogin" class="text-blue">返回登录</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import { register } from '@/api/login'
import config from '@/config'

const registerForm = ref({
  username: '',
  password: '',
  confirmPassword: '',
  email: ''
})

const handleRegister = async () => {
  if (registerForm.value.username === '') {
    Taro.showToast({ title: '请输入账号', icon: 'none' })
  } else if (registerForm.value.password === '') {
    Taro.showToast({ title: '请输入密码', icon: 'none' })
  } else if (registerForm.value.confirmPassword === '') {
    Taro.showToast({ title: '请确认密码', icon: 'none' })
  } else if (registerForm.value.password !== registerForm.value.confirmPassword) {
    Taro.showToast({ title: '两次密码输入不一致', icon: 'none' })
  } else {
    Taro.showLoading({ title: '注册中...' })
    try {
      await register(registerForm.value)
      Taro.hideLoading()
      Taro.showToast({ title: '注册成功', icon: 'success' })
      setTimeout(() => {
        Taro.redirectTo({ url: '/pages/login/index' })
      }, 1500)
    } catch (error) {
      Taro.hideLoading()
    }
  }
}

const handleBackLogin = () => {
  Taro.redirectTo({ url: '/pages/login/index' })
}
</script>

<style lang="scss">
page {
  background-color: #ffffff;
}

.normal-login-container {
  width: 100%;

  .logo-content {
    width: 100%;
    font-size: 21px;
    text-align: center;
    padding-top: 15%;

    image {
      border-radius: 4px;
    }

    .title {
      margin-left: 10px;
    }
  }

  .login-form-content {
    text-align: center;
    margin: 20px auto;
    margin-top: 15%;
    width: 80%;

    .input-item {
      margin: 20px auto;
      background-color: #f5f6f7;
      height: 45px;
      border-radius: 20px;
      display: flex;
      align-items: center;

      .icon {
        font-size: 19px;
        margin-left: 10px;
        color: #999;
      }

      .input {
        width: 100%;
        font-size: 14px;
        line-height: 20px;
        text-align: left;
        padding-left: 15px;
      }
    }

    .login-btn {
      margin-top: 40px;
      height: 45px;
    }

    .reg {
      margin-top: 15px;
    }
  }
}
</style>
