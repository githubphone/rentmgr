<template>
  <view class="detail-container">
    <NavBar title="住户详情" :showBack="true" />
    <scroll-view scroll-y class="detail-content">
      <!-- 基本信息 -->
      <view class="info-section">
        <view class="section-header">
          <text class="section-title">基本信息</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">姓名</text>
            <text class="value">{{ residentInfo.name || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">身份证号</text>
            <text class="value">{{ residentInfo.idCard || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">手机号</text>
            <text class="value phone">{{ residentInfo.phone || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">住户类型</text>
            <text class="value">
              <text class="type-tag" :class="getTypeClass(residentInfo.residentType)">{{ getTypeText(residentInfo.residentType) }}</text>
            </text>
          </view>
          <view class="info-row">
            <text class="label">状态</text>
            <text class="value">
              <text class="status-tag" :class="getStatusClass(residentInfo.status)">{{ getStatusText(residentInfo.status) }}</text>
            </text>
          </view>
          <view class="info-row">
            <text class="label">入住日期</text>
            <text class="value">{{ residentInfo.checkInDate || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">退房日期</text>
            <text class="value">{{ residentInfo.checkOutDate || '-' }}</text>
          </view>
        </view>
      </view>

      <!-- 关联信息 -->
      <view class="info-section">
        <view class="section-header">
          <text class="section-title">关联信息</text>
        </view>
        <view class="info-card">
          <view class="info-row">
            <text class="label">出租屋</text>
            <text class="value">{{ residentInfo.houseName || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="label">房间</text>
            <text class="value">{{ residentInfo.roomName || '-' }}</text>
          </view>
        </view>
      </view>

      <!-- 人脸照片 -->
      <view class="info-section" v-if="residentInfo.facePhoto">
        <view class="section-header">
          <text class="section-title">人脸照片</text>
        </view>
        <view class="photo-card">
          <image :src="residentInfo.facePhoto" class="face-photo" mode="aspectFit" />
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import NavBar from '@/components/NavBar.vue'
import { getResident } from '@/api/rental/resident'

const residentInfo = ref<any>({})

onMounted(() => {
  const params = Taro.getCurrentInstance().router?.params
  const id = params?.id
  if (id) {
    loadData(id)
  }
})

const loadData = (id: string) => {
  Taro.showLoading({ title: '加载中...' })
  getResident(id).then((res: any) => {
    console.log('住户详情数据:', res)
    residentInfo.value = res.data || {}
    Taro.hideLoading()
  }).catch((error) => {
    console.error('加载数据失败:', error)
    Taro.hideLoading()
  })
}

const getTypeText = (type: string) => {
  const typeMap: any = { 'tenant': '租客', 'family': '家属', 'owner': '房东' }
  return typeMap[type] || (type || '-')
}

const getTypeClass = (type: string) => {
  const classMap: any = {
    'tenant': 'type-tenant',
    'family': 'type-family',
    'owner': 'type-owner'
  }
  return classMap[type] || 'type-tenant'
}

const getStatusText = (status: string) => {
  const statusMap: any = { '0': '未登记', '1': '正常', '2': '已搬离' }
  return statusMap[status] || '未知'
}

const getStatusClass = (status: string) => {
  const classMap: any = {
    '0': 'status-info',
    '1': 'status-success',
    '2': 'status-danger'
  }
  return classMap[status] || ''
}
</script>

<style lang="scss">
.detail-container {
  min-height: 100vh;
  background-color: #F0FDFA;

  .detail-content {
    min-height: calc(100vh - 60px);
  }

  .info-section {
    padding: 16px;
    padding-bottom: 0;

    .section-header {
      margin-bottom: 12px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }
    }

    .info-card {
      background-color: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 20px;
        border-bottom: 1px solid #f0f9f8;

        &:last-child {
          border-bottom: none;
        }

        .label {
          font-size: 14px;
          color: #64748B;
        }

        .value {
          font-size: 14px;
          color: #134E4A;
          font-weight: 500;

          &.phone {
            color: #0369A1;
          }

          .status-tag {
            padding: 4px 10px;
            border-radius: 10px;
            font-size: 12px;

            &.status-info {
              background-color: #E0F2FE;
              color: #0369A1;
            }

            &.status-success {
              background-color: #D1FAE5;
              color: #047857;
            }

            &.status-danger {
              background-color: #FFE4E6;
              color: #BE123C;
            }
          }

          .type-tag {
            padding: 4px 10px;
            border-radius: 10px;
            font-size: 12px;

            &.type-tenant {
              background-color: #E0F2FE;
              color: #0369A1;
            }

            &.type-family {
              background-color: #FEF3C7;
              color: #B45309;
            }

            &.type-owner {
              background-color: #D1FAE5;
              color: #047857;
            }
          }
        }
      }
    }
  }

  .photo-section {
    padding: 16px;
    padding-bottom: 0;

    .section-header {
      margin-bottom: 12px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #134E4A;
      }
    }

    .photo-card {
      background-color: #fff;
      border-radius: 16px;
      padding: 20px;
      display: flex;
      justify-content: center;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

      .face-photo {
        width: 100%;
        max-width: 300px;
        height: auto;
        border-radius: 12px;
      }
    }
  }
}
</style>