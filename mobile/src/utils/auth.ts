import Taro from '@tarojs/taro'

const TokenKey = 'App-Token'

export function getToken() {
  return Taro.getStorageSync(TokenKey)
}

export function setToken(token: string) {
  return Taro.setStorageSync(TokenKey, token)
}

export function removeToken() {
  return Taro.removeStorageSync(TokenKey)
}
