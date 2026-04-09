<template>
  <view class="map-page">
    <NavBar title="地图选点" :showBack="true" @back="goBack" />
    <web-view :src="mapUrl" @message="onMessage" />
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'

const mapUrl = ref('')

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  const lat = params?.lat || ''
  const lng = params?.lng || ''
  const returnUrl = encodeURIComponent(`/pages/rental/house/form`)

  const baseUrl = 'http://120.238.132.242:43886/map-picker.html'
  const queryParams = []
  if (lat) queryParams.push(`lat=${lat}`)
  if (lng) queryParams.push(`lng=${lng}`)
  queryParams.push(`returnUrl=${returnUrl}`)

  mapUrl.value = baseUrl + '?' + queryParams.join('&')
  console.log('Map URL:', mapUrl.value)
})

const onMessage = (e: any) => {
  console.log('Received message from webview:', e)
  const dataStr = e.detail?.data?.[0]
  if (dataStr) {
    try {
      const data = JSON.parse(dataStr)
      if (data.action === 'cancel') {
        goBack()
      } else if (data.lng && data.lat) {
        const eventChannel = Taro.getCurrentInstance().page?.getOpenerEventChannel()
        if (eventChannel) {
          eventChannel.emit('onLocationSelected', {
            latitude: data.lat,
            longitude: data.lng
          })
        }
        goBack()
      }
    } catch (err) {
      console.error('Parse message error:', err)
    }
  }
}

const goBack = () => {
  Taro.navigateBack()
}
</script>

<style lang="scss">
.map-page {
  width: 100vh;
  height: 100vh;
  display: flex;
  flex-direction: column;
}
</style>