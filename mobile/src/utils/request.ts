import Taro from '@tarojs/taro'
import config from '@/config'
import { getToken } from '@/utils/auth'
import errorCode from '@/utils/errorCode'
import { toast, showConfirm, tansParams } from '@/utils/common'
import { useUserStore } from '@/store/user'

let timeout = 30000
const baseUrl = config.baseUrl
console.log('Base URL:', baseUrl)

interface RequestConfig {
  url?: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
  params?: any
  headers?: any
  isToken?: boolean
  timeout?: number
}

const request = (config: RequestConfig) => {
  // 是否需要设置 token
  const isToken = (config.headers || {}).isToken === false
  config.headers = config.headers || {}
  if (getToken() && !isToken) {
    config.headers['Authorization'] = 'Bearer ' + getToken()
  }
  // get请求映射params参数
  if (config.params) {
    let url = config.url + '?' + tansParams(config.params)
    url = url.slice(0, -1)
    config.url = url
  }
  return new Promise((resolve, reject) => {
    const fullUrl = baseUrl + config.url
    console.log('Request URL:', fullUrl)
    console.log('Request Method:', config.method || 'GET')
    console.log('Request Data:', config.data)
    console.log('Request Headers:', config.headers)
    
    Taro.request({
        method: config.method || 'GET',
        timeout: config.timeout || timeout,
        url: fullUrl,
        data: config.data,
        header: config.headers,
        dataType: 'json'
      }).then(response => {
        const res = response as any
        const code = (res.data && res.data.code) || 200
        const msg = (errorCode as any)[code] || (res.data && res.data.msg) || (errorCode as any)['default']
        if (code === 401) {
          showConfirm('登录状态已过期，您可以继续留在该页面，或者重新登录?').then((res: any) => {
            if (res.confirm) {
              const userStore = useUserStore()
              userStore.LogOut().then(() => {
                Taro.reLaunch({ url: '/pages/login/index' })
              })
            }
          })
          reject('无效的会话，或者会话已过期，请重新登录。')
        } else if (code === 500) {
          toast(msg)
          reject('500')
        } else if (code !== 200) {
          toast(msg)
          reject(code)
        }
        resolve(res.data)
      })
      .catch(error => {
        let { message } = error
        if (message === 'Network Error') {
          message = '后端接口连接异常'
        } else if (message.includes('timeout')) {
          message = '系统接口请求超时'
        } else if (message.includes('Request failed with status code')) {
          message = '系统接口' + message.slice(-3) + '异常'
        }
        toast(message)
        reject(error)
      })
  })
}

export default request
