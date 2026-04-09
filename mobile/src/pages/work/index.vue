<template>
  <view class="work-container">
    <view class="work-header">
      <view class="header-content">
        <text class="greeting">您好</text>
        <text class="subtitle">欢迎使用出租屋管理系统</text>
      </view>
    </view>
    
    <view class="work-content">
      <view class="section-title">快捷功能</view>
      <view class="grid-box">
        <view class="grid-item" @click="goToPage('/pages/rental/house/list')">
          <view class="icon-wrapper bg-teal">
            <text class="icon-text">🏠</text>
          </view>
          <view class="item-info">
            <text class="item-title">出租屋管理</text>
            <text class="item-desc">管理房屋信息</text>
          </view>
          <text class="arrow">›</text>
        </view>
        
        <view class="grid-item" @click="goToPage('/pages/rental/resident/list')">
          <view class="icon-wrapper bg-emerald">
            <text class="icon-text">👥</text>
          </view>
          <view class="item-info">
            <text class="item-title">住户管理</text>
            <text class="item-desc">管理住户信息</text>
          </view>
          <text class="arrow">›</text>
        </view>
        
        <view class="grid-item" @click="goToPage('/pages/rental/alert/list')">
          <view class="icon-wrapper bg-rose">
            <text class="icon-text">⚠️</text>
          </view>
          <view class="item-info">
            <text class="item-title">告警管理</text>
            <text class="item-desc">查看系统告警</text>
          </view>
          <text class="arrow">›</text>
        </view>
        
        <view class="grid-item" @click="goToPage('/pages/rental/device/list')">
          <view class="icon-wrapper bg-amber">
            <text class="icon-text">📱</text>
          </view>
          <view class="item-info">
            <text class="item-title">设备管理</text>
            <text class="item-desc">管理设备信息</text>
          </view>
          <text class="arrow">›</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import Taro from '@tarojs/taro'

const goToPage = (url: string) => {
  Taro.navigateTo({ url })
}
</script>

<style lang="scss">
.work-container {
  min-height: 100vh;
  background-color: #F0FDFA;
  
  .work-header {
    background: linear-gradient(135deg, #0F766E 0%, #14B8A6 100%);
    padding: 48px 24px 60px;
    border-radius: 0 0 32px 32px;
    
    .header-content {
      display: flex;
      flex-direction: column;
      
      .greeting {
        font-size: 28px;
        font-weight: 700;
        color: #fff;
        margin-bottom: 8px;
      }
      
      .subtitle {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
        letter-spacing: 1px;
      }
    }
  }
  
  .work-content {
    padding: 24px;
    margin-top: -32px;
    
    .section-title {
      font-size: 16px;
      font-weight: 600;
      color: #134E4A;
      margin-bottom: 16px;
      padding-left: 4px;
    }
    
    .grid-box {
      background-color: #fff;
      border-radius: 20px;
      padding: 8px 0;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
      
      .grid-item {
        display: flex;
        align-items: center;
        padding: 20px 20px;
        border-bottom: 1px solid #f0f9f8;
        transition: background-color 0.2s ease;
        
        &:last-child {
          border-bottom: none;
        }
        
        &:active {
          background-color: #F0FDFA;
        }
        
        .icon-wrapper {
          width: 52px;
          height: 52px;
          border-radius: 14px;
          display: flex;
          align-items: center;
          justify-content: center;
          margin-right: 16px;
          flex-shrink: 0;
          
          .icon-text {
            font-size: 24px;
          }
        }
        
        .bg-teal {
          background: linear-gradient(135deg, #CCFBF1 0%, #99F6E4 100%);
        }
        
        .bg-emerald {
          background: linear-gradient(135deg, #D1FAE5 0%, #A7F3D0 100%);
        }
        
        .bg-rose {
          background: linear-gradient(135deg, #FFE4E6 0%, #FECDD3 100%);
        }
        
        .bg-amber {
          background: linear-gradient(135deg, #FEF3C7 0%, #FDE68A 100%);
        }
        
        .item-info {
          flex: 1;
          display: flex;
          flex-direction: column;
          
          .item-title {
            font-size: 16px;
            font-weight: 600;
            color: #134E4A;
            margin-bottom: 4px;
          }
          
          .item-desc {
            font-size: 13px;
            color: #94A3B8;
          }
        }
        
        .arrow {
          font-size: 22px;
          color: #CBD5E1;
          font-weight: 300;
        }
      }
    }
  }
}
</style>