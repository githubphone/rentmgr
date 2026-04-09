<template>
  <view class="form-container">
    <NavBar :title="isEdit ? '编辑房间' : '新增房间'" :showBack="true" />
    <view class="form-content">
      <view class="form-card">
        <view class="form-item">
          <text class="form-label">房间号</text>
          <input class="form-input" v-model="form.roomNo" placeholder="如:101" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">楼层</text>
          <input class="form-input" v-model="form.floor" type="number" placeholder="请输入楼层" placeholder-class="placeholder" />
        </view>
        <view class="form-item">
          <text class="form-label">状态</text>
          <picker :value="statusIndex" :range="statusOptions" @change="onStatusChange">
            <view class="picker-value">
              {{ statusOptions[statusIndex] }}
            </view>
          </picker>
        </view>
      </view>
    </view>

    <view class="submit-area">
      <view class="btn btn-default" @click="goBack">取消</view>
      <view class="btn btn-primary" @click="submitForm">确定</view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { addRoom, updateRoom, getRoomDetail } from '@/api/rental/room'

const isEdit = ref(false)
const roomId = ref('')
const houseId = ref('')
const statusIndex = ref(0)
const statusOptions = ['空置', '已入住', '停用']

const form = ref({
  roomNo: '',
  floor: '',
  status: '0'
})

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  roomId.value = params?.roomId || ''
  houseId.value = params?.houseId || ''

  if (roomId.value) {
    isEdit.value = true
    loadRoomDetail(roomId.value)
  }
})

const loadRoomDetail = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getRoomDetail(id).then((res: any) => {
    Taro.hideLoading()
    if (res.code === 200) {
      form.value = {
        roomNo: res.data.roomNo || '',
        floor: res.data.floor || '',
        status: res.data.status || '0'
      }
      statusIndex.value = res.data.status === '0' ? 0 : res.data.status === '1' ? 1 : 2
    }
  }).catch(() => {
    Taro.hideLoading()
  })
}

const onStatusChange = (e: any) => {
  statusIndex.value = e.detail.value
  form.value.status = e.detail.value === 0 ? '0' : e.detail.value === 1 ? '1' : '2'
}

const goBack = () => {
  Taro.navigateBack()
}

const submitForm = () => {
  if (!form.value.roomNo) {
    Taro.showToast({ title: '请输入房间号', icon: 'none' })
    return
  }
  if (!form.value.floor) {
    Taro.showToast({ title: '请输入楼层', icon: 'none' })
    return
  }

  Taro.showLoading({ title: '提交中...' })

  const request = isEdit.value
    ? updateRoom({ ...form.value, id: roomId.value, houseId: houseId.value })
    : addRoom({ ...form.value, houseId: houseId.value })

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