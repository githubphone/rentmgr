import { createApp } from 'vue'
import { createPinia } from 'pinia'
import './app.scss'
import plugins from './plugins'

const App = createApp({
  onShow (options: any) {
    console.log('App onShow', options)
  },
  onHide () {
    console.log('App onHide')
  }
})

App.use(createPinia())
App.use(plugins)

export default App
