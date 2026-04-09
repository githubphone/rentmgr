<template>
  <view class="help-container">
    <NavBar title="常见问题" :showBack="true" />
    <view class="help-content">
      <view class="help-card">
        <view class="help-item" v-for="(item, index) in helpList" :key="index">
          <view class="question" @click="toggle(index)">
            <text class="question-text">{{ item.question }}</text>
            <text class="arrow">{{ item.expanded ? '∧' : '∨' }}</text>
          </view>
          <view class="answer" v-if="item.expanded">
            <text>{{ item.answer }}</text>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import NavBar from '@/components/NavBar.vue'

const helpList = ref([
  {
    question: '如何添加出租屋？',
    answer: '在工作台页面，点击"出租屋管理"，然后点击右下角的"+"按钮即可添加新出租屋。',
    expanded: false
  },
  {
    question: '如何添加住户？',
    answer: '在工作台页面，点击"住户管理"，然后点击右下角的"添加"按钮即可添加新住户。',
    expanded: false
  },
  {
    question: '如何查看告警记录？',
    answer: '在工作台页面，点击"告警管理"，可以查看所有的告警记录，包括陌生人告警等。',
    expanded: false
  },
  {
    question: '如何绑定设备？',
    answer: '在工作台页面，点击"设备管理"，然后点击"添加设备"按钮，扫描设备二维码即可绑定。',
    expanded: false
  }
])

const toggle = (index: number) => {
  helpList.value[index].expanded = !helpList.value[index].expanded
}
</script>

<style lang="scss">
.help-container {
  min-height: 100vh;
  background-color: #F0FDFA;
}

.help-content {
  padding: 16px;
}

.help-card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);

  .help-item {
    border-bottom: 1px solid #f0f9f8;

    &:last-child {
      border-bottom: none;
    }

    .question {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 20px;

      &:active {
        background-color: #F0FDFA;
      }

      .question-text {
        flex: 1;
        font-size: 15px;
        color: #134E4A;
        font-weight: 500;
      }

      .arrow {
        font-size: 14px;
        color: #94A3B8;
        margin-left: 12px;
      }
    }

    .answer {
      padding: 0 20px 16px;
      font-size: 14px;
      color: #64748B;
      line-height: 1.6;
      background-color: #F0FDFA;
    }
  }
}
</style>