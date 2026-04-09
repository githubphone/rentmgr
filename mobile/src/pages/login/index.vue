<template>
  <view class="login-container">
    <view class="login-header">
      <view class="logo-area">
        <view class="logo-icon">
          <text class="logo-text">租</text>
        </view>
        <text class="app-title">出租屋管理系统</text>
        <text class="app-subtitle">智慧管理，便捷生活</text>
      </view>
    </view>
    
    <view class="login-form">
      <view class="form-card">
        <view class="form-title">用户登录</view>
        
        <view class="input-group">
          <view class="input-item">
            <view class="input-label">
              <text class="label-icon">👤</text>
              <text class="label-text">账号</text>
            </view>
            <input
              v-model="loginForm.username"
              class="input-field"
              type="text"
              placeholder="请输入账号"
              placeholder-class="placeholder"
              maxlength="30"
            />
          </view>
          
          <view class="input-item">
            <view class="input-label">
              <text class="label-icon">🔒</text>
              <text class="label-text">密码</text>
            </view>
            <input
              v-model="loginForm.password"
              type="password"
              class="input-field"
              placeholder="请输入密码"
              placeholder-class="placeholder"
              maxlength="20"
            />
          </view>
          
          <view class="input-item captcha-item" v-if="captchaEnabled">
            <view class="input-label">
              <text class="label-icon">🔢</text>
              <text class="label-text">验证码</text>
            </view>
            <view class="captcha-row">
              <input
                v-model="loginForm.code"
                type="text"
                class="input-field captcha-input"
                placeholder="请输入验证码"
                placeholder-class="placeholder"
                maxlength="4"
              />
              <view class="captcha-image" @click="getCode">
                <image v-if="codeUrl" :src="codeUrl" class="captcha-img" />
              </view>
            </view>
          </view>
        </view>
        
        <button class="login-button" @click="handleLogin">
          <text class="button-text">登 录</text>
        </button>
        
        <view class="agreement-row">
          <text class="agreement-text">登录即代表同意</text>
          <text class="agreement-link" @click="handleUserAgrement">《用户协议》</text>
          <text class="agreement-link" @click="handlePrivacy">《隐私协议》</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import { getCodeImg } from '@/api/login'
import { useUserStore } from '@/store/user'
import config from '@/config'

const userStore = useUserStore()
const codeUrl = ref('')
const captchaEnabled = ref(true)
const loginForm = ref({
  username: '',
  password: '',
  code: '',
  uuid: ''
})

onMounted(() => {
  getCode()
})

const getCode = () => {
  getCodeImg().then((res: any) => {
    captchaEnabled.value = res && res.captchaEnabled === undefined ? true : res?.captchaEnabled
    if (captchaEnabled.value && res) {
      codeUrl.value = 'data:image/gif;base64,' + res.img
      loginForm.value.uuid = res.uuid
    }
  }).catch(() => {
    captchaEnabled.value = false
  })
}

const handleLogin = async () => {
  if (loginForm.value.username === '') {
    Taro.showToast({ title: '请输入账号', icon: 'none' })
  } else if (loginForm.value.password === '') {
    Taro.showToast({ title: '请输入密码', icon: 'none' })
  } else if (loginForm.value.code === '' && captchaEnabled.value) {
    Taro.showToast({ title: '请输入验证码', icon: 'none' })
  } else {
    Taro.showLoading({ title: '登录中...' })
    pwdLogin()
  }
}

const pwdLogin = async () => {
  try {
    await userStore.Login(loginForm.value)
    Taro.hideLoading()
    await userStore.GetInfo()
    Taro.reLaunch({ url: '/pages/index/index' })
  } catch (error) {
    Taro.hideLoading()
    if (captchaEnabled.value) {
      getCode()
    }
  }
}

const handlePrivacy = () => {
  const site = config.appInfo.agreements[0]
  Taro.navigateTo({ url: `/pages/common/webview/index?title=${site.title}&url=${site.url}` })
}

const handleUserAgrement = () => {
  const site = config.appInfo.agreements[1]
  Taro.navigateTo({ url: `/pages/common/webview/index?title=${site.title}&url=${site.url}` })
}
</script>

<style lang="scss">
page {
  background-color: #F0FDFA;
  min-height: 100vh;
}

.login-container {
  min-height: 100vh;
  display: flex;
  flex-direction: column;

  .login-header {
    padding: 40px 40px 30px;
    text-align: center;
    
    .logo-area {
      display: flex;
      flex-direction: column;
      align-items: center;
      
      .logo-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
        box-shadow: 0 8px 24px rgba(15, 118, 110, 0.25);
        
        .logo-text {
          font-size: 36px;
          font-weight: 700;
          color: #fff;
        }
      }
      
      .app-title {
        font-size: 24px;
        font-weight: 600;
        color: #134E4A;
        margin-bottom: 8px;
      }
      
      .app-subtitle {
        font-size: 14px;
        color: #5EEAD4;
        letter-spacing: 2px;
      }
    }
  }
  
  .login-form {
    padding: 20px 24px 40px;
    
    .form-card {
      background-color: #fff;
      border-radius: 24px;
      padding: 32px 24px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
      
      .form-title {
        font-size: 20px;
        font-weight: 600;
        color: #134E4A;
        text-align: center;
        margin-bottom: 28px;
      }
      
      .input-group {
        .input-item {
          margin-bottom: 20px;
          
          .input-label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            
            .label-icon {
              font-size: 16px;
              margin-right: 8px;
            }
            
            .label-text {
              font-size: 14px;
              color: #64748B;
              font-weight: 500;
            }
          }
          
          .input-field {
            width: 100%;
            height: 52px;
            background-color: #F0FDFA;
            border-radius: 12px;
            padding: 0 16px;
            font-size: 15px;
            color: #134E4A;
            border: 1px solid transparent;
            transition: all 0.2s ease;
            box-sizing: border-box;
            display: flex;
            align-items: center;

            &:focus {
              border-color: #0F766E;
              background-color: #fff;
            }

            &.captcha-input {
              flex: 1;
              height: 52px;
            }

            ::v-deep .taro-input {
              height: 52px !important;
              line-height: 52px !important;
            }
            ::v-deep input {
              height: 52px !important;
              line-height: 52px !important;
            }
          }
          
          .captcha-row {
            display: flex;
            align-items: center;
            gap: 12px;

            .captcha-image {
              flex-shrink: 0;
              height: 52px;

              .captcha-img {
                width: 100px;
                height: 52px;
                border-radius: 12px;
                background-color: #F0FDFA;
              }
            }
          }
        }
      }
      
      .login-button {
        width: 100%;
        height: 52px;
        background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
        border-radius: 12px;
        border: none;
        margin-top: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 16px rgba(15, 118, 110, 0.3);
        
        .button-text {
          font-size: 16px;
          font-weight: 600;
          color: #fff;
          letter-spacing: 4px;
        }
        
        &:active {
          opacity: 0.9;
          transform: scale(0.98);
        }
      }
      
      .agreement-row {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
        flex-wrap: wrap;
        gap: 4px;
        
        .agreement-text {
          font-size: 12px;
          color: #94A3B8;
        }
        
        .agreement-link {
          font-size: 12px;
          color: #0F766E;
          font-weight: 500;
        }
      }
    }
  }
}

.placeholder {
  color: #CBD5E1;
}
</style>