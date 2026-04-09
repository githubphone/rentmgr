<template>
  <view class="form-container">
    <NavBar :title="isEdit ? '编辑设备' : '新增设备'" :showBack="true" />
    <view class="form-content">
      <view class="form-card">
        <view class="form-item">
          <text class="form-label">设备名称</text>
          <input class="form-input" v-model="form.deviceName" placeholder="请输入设备名称" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">设备编码</text>
          <input class="form-input" v-model="form.deviceCode" placeholder="请输入设备编码" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">设备类型</text>
          <picker :value="typeIndex" :range="typeOptions" @change="onTypeChange">
            <view class="picker-value">
              {{ typeOptions[typeIndex] }}
            </view>
          </picker>
        </view>
        <view class="form-item">
          <text class="form-label">安装位置</text>
          <input class="form-input" v-model="form.location" placeholder="请输入安装位置" placeholder-class="placeholder" />
        </view>
      </view>
    </view>

    <view class="submit-area">
      <view class="btn btn-default" @click="goBack">返回</view>
      <view class="btn btn-primary" @click="submitForm">确定</view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { addDevice, updateDevice, getDeviceDetail } from '@/api/rental/device'

const isEdit = ref(false)
const deviceId = ref('')
const typeIndex = ref(0)
const typeOptions = ['摄像头', '对讲机']

const form = ref({
  deviceName: '',
  deviceCode: '',
  deviceType: 'camera',
  location: ''
})

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  deviceId.value = params?.id || ''

  if (deviceId.value) {
    isEdit.value = true
    loadDeviceDetail(deviceId.value)
  }
})

const loadDeviceDetail = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getDevice(id).then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      form.value = {
        deviceName: res.data.deviceName || '',
        deviceCode: res.data.deviceCode || '',
        deviceType: res.data.deviceType || 'camera',
        location: res.data.location || ''
      }
      typeIndex.value = form.value.deviceType === 'camera' ? 0 : 1
    }
  }).catch(() => {
    Taro.hideLoading()
  })
}

const onTypeChange = (e: any) => {
  typeIndex.value = e.detail.value
  form.value.deviceType = e.detail.value === 0 ? 'camera' : 'intercom'
}

const goBack = () => {
  Taro.navigateBack()
}

const submitForm = () => {
  if (!form.value.deviceName) {
    Taro.showToast({ title: '请输入设备名称', icon: 'none' })
    return
  }
  if (!form.value.deviceCode) {
    Taro.showToast({ title: '请输入设备编码', icon: 'none' })
    return
  }

  Taro.showLoading({ title: '提交中...' })

  const request = isEdit.value
    ? updateDevice({ ...form.value, id: deviceId.value })
    : addDevice(form.value)

  request.then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      Taro.showToast({ title: isEdit.value ? '编辑成功' : '添加成功', icon: 'success' })
      setTimeout(() => {
        Taro.navigateBack()
      }, 1500)
    } else {
      Taro.showToast({ title: res.msg || '操作失败', icon: 'none' })
    }
  }).catch(() => {
    Taro.hideLoading()
    Taro.showToast({ title: '操作失败', icon: 'none' })
  })
}
</script>

<style lang="scss">
.form-container {
  min-height: 100vh;
  background-color: #F0FDFA;
  display: flex;
  flex-direction: column;
}

.form-content {
  flex: 1;
  padding: 16px;
}

.form-card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

  .form-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 20px;
    border-bottom: 1px solid #f0f9f8;

    &:last-child {
      border-bottom: none;
    }

    .form-label {
      font-size: 15px;
      color: #134E4A;
      font-weight: 500;
    }

    .form-input {
      flex: 1;
      font-size: 15px;
      color: #134E4A;
      text-align: right;
    }

    .picker-value {
      flex: 1;
      font-size: 15px;
      color: #134E4A;
      text-align: right;
    }

    .placeholder {
      color: #CBD5E1;
    }
  }
}

.submit-area {
  display: flex;
  gap: 12px;
  padding: 16px 20px;
  padding-bottom: calc(16px + env(safe-area-inset-bottom));
  background-color: #fff;
  box-shadow: 0 -2px 12px rgba(0, 0, 0, 0.05);

  .btn {
    flex: 1;
    height: 48px;
    border-radius: 24px;
    font-size: 16px;
    font-weight: 500;
    display: flex;
    align-items: center;
    justify-content: center;

    &.btn-primary {
      background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
      color: #fff;
      border: none;
      box-shadow: 0 4px 16px rgba(15, 118, 110, 0.3);

      &:active {
        opacity: 0.9;
        transform: scale(0.98);
      }
    }

    &.btn-default {
      background-color: #F0FDFA;
      color: #64748B;
      border: none;

      &:active {
        background-color: #E0E5E4;
      }
    }
  }
}

.placeholder {
  color: #CBD5E1;
}
</style>