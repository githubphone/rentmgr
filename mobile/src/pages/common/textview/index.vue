<template>
  <view class="textview-container">
    <view class="content">
      <text>{{ content }}</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'

const content = ref('')

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  if (params?.content) {
    content.value = decodeURIComponent(params.content)
  }
})
</script>

<style lang="scss">
.textview-container {
  min-height: 100vh;
  background-color: #fff;
  padding: 20px;

  .content {
    font-size: 15px;
    color: #333;
    line-height: 1.8;
  }
}
</style>
