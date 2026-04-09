import Taro from '@tarojs/taro'

export default {
  // 关闭所有页面，打开到应用内的某个页面
  reLaunch(url: string): Promise<any> {
    return new Promise((resolve, reject) => {
      Taro.reLaunch({
        url: url,
        success: resolve,
        fail: reject
      })
    })
  },
  // 跳转到tabBar页面，并关闭其他所有非tabBar页面
  switchTab(url: string): Promise<any> {
    return new Promise((resolve, reject) => {
      Taro.switchTab({
        url: url,
        success: resolve,
        fail: reject
      })
    })
  },
  // 关闭当前页面，跳转到应用内的某个页面
  redirectTo(url: string): Promise<any> {
    return new Promise((resolve, reject) => {
      Taro.redirectTo({
        url: url,
        success: resolve,
        fail: reject
      })
    })
  },
  // 保留当前页面，跳转到应用内的某个页面
  navigateTo(url: string): Promise<any> {
    return new Promise((resolve, reject) => {
      Taro.navigateTo({
        url: url,
        success: resolve,
        fail: reject
      })
    })
  },
  // 关闭当前页面，返回上一页面或多级页面
  navigateBack(delta?: number): Promise<any> {
    return new Promise((resolve, reject) => {
      Taro.navigateBack({
        delta: delta,
        success: resolve,
        fail: reject
      })
    })
  }
}
