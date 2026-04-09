import Taro from '@tarojs/taro'

interface ShowToastOptions {
  title: string
  icon?: 'success' | 'error' | 'loading' | 'none'
  duration?: number
  mask?: boolean
  image?: string
  success?: () => void
  fail?: () => void
  complete?: () => void
}

export default {
  // 消息提示
  msg(content: string): void {
    Taro.showToast({
      title: content,
      icon: 'none'
    })
  },
  // 错误消息
  msgError(content: string): void {
    Taro.showToast({
      title: content,
      icon: 'error'
    })
  },
  // 成功消息
  msgSuccess(content: string): void {
    Taro.showToast({
      title: content,
      icon: 'success'
    })
  },
  // 隐藏消息
  hideMsg(): void {
    Taro.hideToast()
  },
  // 弹出提示
  alert(content: string, title?: string): void {
    Taro.showModal({
      title: title || '系统提示',
      content: content,
      showCancel: false
    })
  },
  // 确认窗体
  confirm(content: string, title?: string): Promise<boolean> {
    return new Promise((resolve) => {
      Taro.showModal({
        title: title || '系统提示',
        content: content,
        cancelText: '取消',
        confirmText: '确定',
        success: function(res) {
          if (res.confirm) {
            resolve(true)
          } else {
            resolve(false)
          }
        }
      })
    })
  },
  // 提示信息
  showToast(option: string | ShowToastOptions): void {
    if (typeof option === "object") {
      Taro.showToast(option)
    } else {
      Taro.showToast({
        title: option,
        icon: "none",
        duration: 2500
      })
    }
  },
  // 打开遮罩层
  loading(content: string): void {
    Taro.showLoading({
      title: content
    })
  },
  // 关闭遮罩层
  closeLoading(): void {
    try {
        Taro.hideLoading()
    } catch (e) {
        console.log(e)
    }
  }
}
