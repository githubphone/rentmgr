<template>
  <view class="form-container">
    <NavBar :title="isEdit ? '编辑人员' : '添加人员'" :showBack="true" />
    <view class="form-content">
      <view class="form-card">
        <view class="form-item">
          <text class="form-label">姓名</text>
          <input class="form-input" v-model="form.name" placeholder="请输入姓名" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">身份证号</text>
          <input class="form-input" v-model="form.idCard" placeholder="请输入身份证号" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">手机号</text>
          <input class="form-input" v-model="form.phone" type="number" placeholder="请输入手机号" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">人员类型</text>
          <picker :value="typeIndex" :range="typeOptions" @change="onTypeChange">
            <view class="picker-value">
              {{ typeOptions[typeIndex] }}
            </view>
          </picker>
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
import { addResident, updateResident, getResident } from '@/api/rental/resident'

const isEdit = ref(false)
const residentId = ref('')
const roomId = ref('')
const houseId = ref('')
const typeIndex = ref(0)
const typeOptions = ['租客', '家属', '房东']

const form = ref({
  name: '',
  idCard: '',
  phone: '',
  residentType: 'tenant'
})

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  residentId.value = params?.residentId || ''
  roomId.value = params?.roomId || ''
  houseId.value = params?.houseId || ''

  if (residentId.value) {
    isEdit.value = true
    loadResident(residentId.value)
  }
})

const loadResident = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getResident(id).then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      form.value = {
        name: res.data.name || '',
        idCard: res.data.idCard || '',
        phone: res.data.phone || '',
        residentType: res.data.residentType || 'tenant'
      }
      const typeMap: any = { 'tenant': 0, 'family': 1, 'owner': 2 }
      typeIndex.value = typeMap[form.value.residentType] ?? 0
    }
  }).catch(() => {
    Taro.hideLoading()
  })
}

const onTypeChange = (e: any) => {
  typeIndex.value = e.detail.value
  const typeMap: any = { 0: 'tenant', 1: 'family', 2: 'owner' }
  form.value.residentType = typeMap[e.detail.value]
}

const goBack = () => {
  Taro.navigateBack()
}

const submitForm = () => {
  if (!form.value.name) {
    Taro.showToast({ title: '请输入姓名', icon: 'none' })
    return
  }
  if (!form.value.idCard) {
    Taro.showToast({ title: '请输入身份证号', icon: 'none' })
    return
  }
  if (!form.value.phone) {
    Taro.showToast({ title: '请输入手机号', icon: 'none' })
    return
  }

  Taro.showLoading({ title: '提交中...' })

  const residentData = {
    roomId: roomId.value,
    houseId: houseId.value,
    name: form.value.name,
    idCard: form.value.idCard,
    phone: form.value.phone,
    residentType: form.value.residentType
  }

  const request = isEdit.value
    ? updateResident({ ...residentData, id: residentId.value })
    : addResident(residentData)

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