import Taro from '@tarojs/taro'
import constant from './constant'

// 存储变量名
let storageKey = 'storage_data'

// 存储节点变量名
let storageNodeKeys = [constant.avatar, constant.id, constant.name, constant.roles, constant.permissions]

const storage = {
  set: function(key: string, value: any) {
    if (storageNodeKeys.indexOf(key) != -1) {
      let tmp = Taro.getStorageSync(storageKey)
      tmp = tmp ? tmp : {}
      tmp[key] = value
      Taro.setStorageSync(storageKey, tmp)
    }
  },
  get: function(key: string) {
    let storageData = Taro.getStorageSync(storageKey) || {}
    return storageData[key] || ""
  },
  remove: function(key: string) {
    let storageData = Taro.getStorageSync(storageKey) || {}
    delete storageData[key]
    Taro.setStorageSync(storageKey, storageData)
  },
  clean: function() {
    Taro.removeStorageSync(storageKey)
  }
}

export default storage
