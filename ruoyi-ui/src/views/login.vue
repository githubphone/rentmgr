<template>
  <div class="login-container">
    <div class="login-left">
      <div class="left-content">
        <div class="logo-section">
          <div class="logo-icon">
            <svg-icon icon-class="user" class="logo-svg" />
          </div>
          <h1 class="brand-name">{{ title }}</h1>
        </div>
        <p class="slogan">智慧社会治理管理系统</p>
        <p class="description">高效、便捷、专业的综合治理解决方案</p>
        <div class="features">
          <div class="feature-item">
            <svg-icon icon-class="system" class="feature-icon" />
            <span>智能管理</span>
          </div>
          <div class="feature-item">
            <svg-icon icon-class="chart" class="feature-icon" />
            <span>数据可视化</span>
          </div>
          <div class="feature-item">
            <svg-icon icon-class="peoples" class="feature-icon" />
            <span>便捷操作</span>
          </div>
        </div>
      </div>
      <div class="left-decoration">
        <div class="circle circle-1"></div>
        <div class="circle circle-2"></div>
        <div class="circle circle-3"></div>
      </div>
      <div class="el-login-footer">
        <span>{{ footerContent }}</span>
      </div>
    </div>
    <div class="login-right">
      <div class="login-card">
        <div class="card-header">
          <h2 class="card-title">欢迎登录</h2>
          <p class="card-subtitle">请输入您的账号信息</p>
        </div>
        <el-form ref="loginRef" :model="loginForm" :rules="loginRules" class="login-form" size="large">
          <el-form-item prop="username" class="form-item">
            <el-input
              v-model="loginForm.username"
              type="text"
              auto-complete="off"
              placeholder="请输入账号"
              clearable
            >
              <template #prefix><svg-icon icon-class="user" class="input-icon" /></template>
            </el-input>
          </el-form-item>
          <el-form-item prop="password" class="form-item">
            <el-input
              v-model="loginForm.password"
              type="password"
              auto-complete="off"
              placeholder="请输入密码"
              show-password
              clearable
              @keyup.enter="handleLogin"
            >
              <template #prefix><svg-icon icon-class="password" class="input-icon" /></template>
            </el-input>
          </el-form-item>
          <el-form-item prop="code" v-if="captchaEnabled" class="form-item">
            <div class="captcha-wrapper">
              <el-input
                v-model="loginForm.code"
                auto-complete="off"
                placeholder="请输入验证码"
                @keyup.enter="handleLogin"
              >
                <template #prefix><svg-icon icon-class="validCode" class="input-icon" /></template>
              </el-input>
              <div class="captcha-container" @click="getCode">
                <el-tooltip content="点击刷新验证码" placement="top">
                  <img :src="codeUrl" class="captcha-img" />
                </el-tooltip>
              </div>
            </div>
          </el-form-item>
          <div class="form-options">
            <el-checkbox v-model="loginForm.rememberMe" class="remember-checkbox">
              记住密码
            </el-checkbox>
            <div class="link-group" v-if="register">
              <router-link class="link-type" :to="'/register'">立即注册</router-link>
            </div>
          </div>
          <el-form-item class="form-item button-item">
            <el-button
              :loading="loading"
              type="primary"
              class="login-button"
              @click.prevent="handleLogin"
            >
              <span v-if="!loading">登 录</span>
              <span v-else>登 录 中...</span>
            </el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { getCodeImg } from "@/api/login"
import Cookies from "js-cookie"
import { encrypt, decrypt } from "@/utils/jsencrypt"
import useUserStore from '@/store/modules/user'
import defaultSettings from '@/settings'

const title = import.meta.env.VITE_APP_TITLE
const footerContent = defaultSettings.footerContent
const userStore = useUserStore()
const route = useRoute()
const router = useRouter()
const { proxy } = getCurrentInstance()

const loginForm = ref({
  username: "",
  password: "",
  rememberMe: false,
  code: "",
  uuid: ""
})

const loginRules = {
  username: [{ required: true, trigger: "blur", message: "请输入您的账号" }],
  password: [{ required: true, trigger: "blur", message: "请输入您的密码" }],
  code: [{ required: true, trigger: "change", message: "请输入验证码" }]
}

const codeUrl = ref("")
const loading = ref(false)
const captchaEnabled = ref(true)
const register = ref(false)
const redirect = ref(undefined)

watch(route, (newRoute) => {
    redirect.value = newRoute.query && newRoute.query.redirect
}, { immediate: true })

function handleLogin() {
  proxy.$refs.loginRef.validate(valid => {
    if (valid) {
      loading.value = true
      if (loginForm.value.rememberMe) {
        Cookies.set("username", loginForm.value.username, { expires: 30 })
        Cookies.set("password", encrypt(loginForm.value.password), { expires: 30 })
        Cookies.set("rememberMe", loginForm.value.rememberMe, { expires: 30 })
      } else {
        Cookies.remove("username")
        Cookies.remove("password")
        Cookies.remove("rememberMe")
      }
      userStore.login(loginForm.value).then(() => {
        const query = route.query
        const otherQueryParams = Object.keys(query).reduce((acc, cur) => {
          if (cur !== "redirect") {
            acc[cur] = query[cur]
          }
          return acc
        }, {})
        router.push({ path: redirect.value || "/", query: otherQueryParams })
      }).catch(() => {
        loading.value = false
        if (captchaEnabled.value) {
          getCode()
        }
      })
    }
  })
}

function getCode() {
  getCodeImg().then(res => {
    captchaEnabled.value = res.captchaEnabled === undefined ? true : res.captchaEnabled
    if (captchaEnabled.value) {
      codeUrl.value = "data:image/gif;base64," + res.img
      loginForm.value.uuid = res.uuid
    }
  })
}

function getCookie() {
  const username = Cookies.get("username")
  const password = Cookies.get("password")
  const rememberMe = Cookies.get("rememberMe")
  loginForm.value = {
    username: username === undefined ? loginForm.value.username : username,
    password: password === undefined ? loginForm.value.password : decrypt(password),
    rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
  }
}

getCode()
getCookie()
</script>

<style lang="scss" scoped>
.login-container {
  display: flex;
  width: 100%;
  height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.login-left {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  position: relative;
  overflow: hidden;

  .left-content {
    position: relative;
    z-index: 2;
    text-align: center;
    color: #fff;
    padding: 40px;
  }

  .logo-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 32px;
  }

  .logo-icon {
    width: 80px;
    height: 80px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
    backdrop-filter: blur(10px);
  }

  .logo-svg {
    width: 48px;
    height: 48px;
    color: #fff;
  }

  .brand-name {
    font-size: 36px;
    font-weight: 700;
    margin: 0;
    letter-spacing: 2px;
  }

  .slogan {
    font-size: 24px;
    font-weight: 500;
    margin: 0 0 12px 0;
    opacity: 0.95;
  }

  .description {
    font-size: 16px;
    margin: 0 0 48px 0;
    opacity: 0.8;
  }

  .features {
    display: flex;
    gap: 32px;
    justify-content: center;
  }

  .feature-item {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 14px;
    opacity: 0.9;
  }

  .feature-icon {
    width: 20px;
    height: 20px;
  }
}

.left-decoration {
  position: absolute;
  inset: 0;
  pointer-events: none;

  .circle {
    position: absolute;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.1);
  }

  .circle-1 {
    width: 400px;
    height: 400px;
    top: -100px;
    right: -100px;
  }

  .circle-2 {
    width: 300px;
    height: 300px;
    bottom: -50px;
    left: -50px;
  }

  .circle-3 {
    width: 200px;
    height: 200px;
    bottom: 20%;
    right: 10%;
  }
}

.login-right {
  width: 500px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f8f9fc;
  padding: 40px;
}

.login-card {
  width: 100%;
  max-width: 380px;
  background: #fff;
  border-radius: 16px;
  padding: 40px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);

  .card-header {
    text-align: center;
    margin-bottom: 32px;
  }

  .card-title {
    font-size: 28px;
    font-weight: 600;
    color: #1a1f2e;
    margin: 0 0 8px 0;
  }

  .card-subtitle {
    font-size: 14px;
    color: #6b7280;
    margin: 0;
  }
}

.login-form {
  .form-item {
    margin-bottom: 20px;
  }

  :deep(.el-input) {
    height: 48px;

    .el-input__wrapper {
      padding: 0 16px;
      border-radius: 10px;
      box-shadow: 0 0 0 1px #e5e7eb;
      transition: all 0.2s;

      &:hover {
        box-shadow: 0 0 0 1px #d1d5db;
      }

      &.is-focus {
        box-shadow: 0 0 0 2px #667eea;
      }
    }

    .el-input__inner {
      height: 48px;
      font-size: 15px;

      &::placeholder {
        color: #9ca3af;
      }
    }

    .el-input__prefix {
      color: #9ca3af;
    }
  }

  .input-icon {
    width: 16px;
    height: 16px;
    margin-left: 2px;
  }

  .captcha-wrapper {
    display: flex;
    align-items: center;
    width: 100%;

    :deep(.el-input) {
      flex: 1;
    }
  }

  .captcha-container {
    display: inline-block;
    margin-left: 12px;
    cursor: pointer;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.2s;
    vertical-align: middle;

    &:hover {
      transform: scale(1.02);
    }
  }

  .captcha-img {
    height: 48px;
    border-radius: 8px;
    display: block;
  }

  .form-options {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 24px;
  }

  .remember-checkbox {
    .el-checkbox__label {
      color: #6b7280;
      font-size: 14px;
    }

    :deep(.el-checkbox__input.is-checked .el-checkbox__inner) {
      background-color: #667eea;
      border-color: #667eea;
    }

    :deep(.el-checkbox__input.is-checked + .el-checkbox__label) {
      color: #667eea;
    }
  }

  .link-group {
    font-size: 14px;
  }

  .link-type {
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.2s;

    &:hover {
      color: #764ba2;
    }
  }

  .button-item {
    margin-bottom: 0;
  }

  .login-button {
    width: 100%;
    height: 48px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 10px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
    }

    &:active {
      transform: translateY(0);
    }

    &:disabled {
      background: #d1d5db;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }
  }
}

.el-login-footer {
  position: absolute;
  bottom: 24px;
  left: 50%;
  transform: translateX(-50%);
  height: 40px;
  line-height: 40px;
  text-align: center;
  color: rgba(255, 255, 255, 0.7);
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
  background: transparent;
  pointer-events: none;
}

@media (max-width: 1024px) {
  .login-left {
    display: none;
  }

  .login-right {
    width: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 20px;
  }

  .login-card {
    max-width: 420px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(20px);
  }

  .el-login-footer {
    color: rgba(255, 255, 255, 0.5);
  }
}

@media (max-width: 480px) {
  .login-card {
    padding: 30px 24px;
    border-radius: 12px;
  }

  .card-title {
    font-size: 24px;
  }

  .login-form :deep(.el-input) {
    height: 44px;

    .el-input__inner {
      height: 44px;
    }
  }

  .login-button {
    height: 44px;
  }
}
</style>
