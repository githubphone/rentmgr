import tab from './tab'
import auth from './auth'
import modal from './modal'

import { App } from 'vue'

export default {
  install(app: App) {
    // 页签操作
    app.config.globalProperties.$tab = tab
    // 认证对象
    app.config.globalProperties.$auth = auth
    // 模态框对象
    app.config.globalProperties.$modal = modal
  }
}

// 导出插件以便在组合式 API 中使用
export { tab, auth, modal }
