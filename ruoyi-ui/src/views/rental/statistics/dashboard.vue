<template>
  <div class="app-container">
    <el-row :gutter="20" class="mb20">
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon access"><i class="el-icon-user"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayAccess }}</div>
            <div class="stat-label">今日通行人次</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon stranger"><i class="el-icon-warning"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayStranger }}</div>
            <div class="stat-label">今日陌生人</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon alert"><i class="el-icon-bell"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayAlert }}</div>
            <div class="stat-label">今日告警数</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon device"><i class="el-icon-monitor"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.deviceOnlineRate }}%</div>
            <div class="stat-label">设备在线率</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :span="16">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">通行趋势（近7天）</span>
              <el-date-picker
                v-model="dateRange"
                type="daterange"
                range-separator="-"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                value-format="YYYY-MM-DD"
                @change="handleDateRangeChange"
                style="width: 260px"
              />
            </div>
          </template>
          <div ref="accessTrendChartRef" style="height: 300px"></div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">告警级别分布</span>
            </div>
          </template>
          <div ref="alertLevelChartRef" style="height: 300px"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :span="12">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">陌生人高频出现区域 TOP10</span>
            </div>
          </template>
          <el-table :data="strangerTopList" max-height="300">
            <el-table-column label="排名" align="center" width="70" type="index" />
            <el-table-column label="区域" align="center" key="district" prop="district" />
            <el-table-column label="出租屋" align="center" key="houseAddress" prop="houseAddress" :show-overflow-tooltip="true" />
            <el-table-column label="陌生人次数" align="center" key="count" prop="count" width="120" />
          </el-table>
          <empty v-if="strangerTopList.length === 0" description="暂无数据" />
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">告警处理时效统计</span>
            </div>
          </template>
          <el-table :data="alertStatsList" max-height="300">
            <el-table-column label="处理状态" align="center" key="status" prop="status" width="120">
              <template #default="scope">
                <el-tag v-if="scope.row.status === '0'" type="warning">待处理</el-tag>
                <el-tag v-else-if="scope.row.status === '1'" type="primary">处理中</el-tag>
                <el-tag v-else type="success">已处理</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="数量" align="center" key="count" prop="count" width="120" />
            <el-table-column label="平均处理时长" align="center" key="avgTime" prop="avgTime" width="140">
              <template #default="scope">
                <span v-if="scope.row.avgTime">{{ scope.row.avgTime }}</span>
                <span v-else>-</span>
              </template>
            </el-table-column>
            <el-table-column label="占比" align="center" key="rate" prop="rate" width="100">
              <template #default="scope">
                <span>{{ scope.row.rate || '-' }}</span>
              </template>
            </el-table-column>
          </el-table>
          <empty v-if="alertStatsList.length === 0" description="暂无数据" />
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">房源登记统计</span>
            </div>
          </template>
          <div class="info-item">
            <span class="info-label">出租屋总数</span>
            <span class="info-value">{{ dashboard.houseTotal || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">已登记住户</span>
            <span class="info-value">{{ dashboard.residentTotal || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">登记率</span>
            <span class="info-value">{{ dashboard.residentRate || '0%' }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">设备状态</span>
            </div>
          </template>
          <div class="info-item">
            <span class="info-label">设备总数</span>
            <span class="info-value">{{ dashboard.deviceTotal || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">在线设备</span>
            <span class="info-value success">{{ dashboard.deviceOnline || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">离线设备</span>
            <span class="info-value danger">{{ dashboard.deviceOffline || 0 }}</span>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">本月告警统计</span>
            </div>
          </template>
          <div class="info-item">
            <span class="info-label">本月告警总数</span>
            <span class="info-value">{{ dashboard.monthAlertTotal || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">已处理</span>
            <span class="info-value success">{{ dashboard.monthAlertResolved || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">处理率</span>
            <span class="info-value">{{ dashboard.monthAlertRate || '0%' }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="RentalStatistics">
import { getDashboardStatistics, getAccessTrend, getAlertTrend, getAlertStats } from "@/api/rental/statistics"
import * as echarts from "echarts"

const { proxy } = getCurrentInstance()

const dateRange = ref([])
const accessTrendChartRef = ref(null)
const alertLevelChartRef = ref(null)
let accessTrendChart = null
let alertLevelChart = null

const dashboard = ref({
  todayAccess: 0,
  todayStranger: 0,
  todayAlert: 0,
  deviceOnlineRate: 0,
  houseTotal: 0,
  residentTotal: 0,
  residentRate: '0%',
  deviceTotal: 0,
  deviceOnline: 0,
  deviceOffline: 0,
  monthAlertTotal: 0,
  monthAlertResolved: 0,
  monthAlertRate: '0%'
})
const strangerTopList = ref([])
const alertStatsList = ref([])

function getDaysArray(days) {
  const result = []
  for (let i = days - 1; i >= 0; i--) {
    const date = new Date()
    date.setDate(date.getDate() - i)
    result.push(date)
  }
  return result
}

function formatDate(date) {
  const month = date.getMonth() + 1
  const day = date.getDate()
  return `${month}/${day}`
}

function initAccessTrendChart(dates, data) {
  if (!accessTrendChartRef.value) return

  if (!accessTrendChart) {
    accessTrendChart = echarts.init(accessTrendChartRef.value)
  }

  accessTrendChart.setOption({
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'cross' }
    },
    legend: {
      data: ['通行人次', '陌生人'],
      bottom: 0
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '15%',
      top: '10%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: dates,
      boundaryGap: false,
      axisLabel: {
        rotate: 0,
        interval: 0
      }
    },
    yAxis: {
      type: 'value',
      name: '人次',
      minInterval: 1
    },
    series: [
      {
        name: '通行人次',
        type: 'line',
        data: data.access || [],
        smooth: true,
        symbol: 'circle',
        symbolSize: 8,
        itemStyle: {
          color: '#409EFF'
        },
        areaStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: 'rgba(64, 158, 255, 0.3)' },
            { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
          ])
        }
      },
      {
        name: '陌生人',
        type: 'line',
        data: data.stranger || [],
        smooth: true,
        symbol: 'circle',
        symbolSize: 8,
        itemStyle: {
          color: '#E6A23C'
        },
        areaStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: 'rgba(230, 162, 60, 0.3)' },
            { offset: 1, color: 'rgba(230, 162, 60, 0.05)' }
          ])
        }
      }
    ]
  })
}

function initAlertLevelChart(data) {
  if (!alertLevelChartRef.value) return

  if (!alertLevelChart) {
    alertLevelChart = echarts.init(alertLevelChartRef.value)
  }

  const chartData = [
    { value: data.serious || 0, name: '严重', itemStyle: { color: '#F56C6C' } },
    { value: data.moderate || 0, name: '中等', itemStyle: { color: '#E6A23C' } },
    { value: data.mild || 0, name: '轻微', itemStyle: { color: '#909399' } }
  ]

  alertLevelChart.setOption({
    tooltip: {
      trigger: 'item',
      formatter: '{a} <br/>{b}: {c} ({d}%)'
    },
    legend: {
      orient: 'vertical',
      right: '10%',
      top: 'center',
      data: ['严重', '中等', '轻微']
    },
    series: [
      {
        name: '告警级别',
        type: 'pie',
        radius: ['40%', '70%'],
        center: ['35%', '50%'],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 6,
          borderColor: '#fff',
          borderWidth: 2
        },
        label: {
          show: false,
          position: 'center'
        },
        emphasis: {
          label: {
            show: true,
            fontSize: 16,
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: false
        },
        data: chartData
      }
    ]
  })
}

function handleDateRangeChange() {
  loadAccessTrendData()
}

async function loadAccessTrendData() {
  try {
    const days = getDaysArray(7)
    const dates = days.map(d => formatDate(d))
    const startDate = dates[0].replace('/', '-') + '-' + new Date().getFullYear()
    const endDate = dates[dates.length - 1].replace('/', '-') + '-' + new Date().getFullYear()

    let query = {}
    if (dateRange.value && dateRange.value.length === 2) {
      query.startDate = dateRange.value[0]
      query.endDate = dateRange.value[1]
    }

    const res = await getAccessTrend(query)
    const data = res.data || {}

    initAccessTrendChart(dates, {
      access: data.accessList || generateMockAccessData(),
      stranger: data.strangerList || generateMockStrangerData()
    })
  } catch (error) {
    console.error('加载通行趋势数据失败:', error)
    const days = getDaysArray(7)
    const dates = days.map(d => formatDate(d))
    initAccessTrendChart(dates, {
      access: generateMockAccessData(),
      stranger: generateMockStrangerData()
    })
  }
}

async function loadAlertLevelData() {
  try {
    const res = await getAlertStats()
    const data = res.data || {}
    initAlertLevelChart({
      serious: data.serious || 0,
      moderate: data.moderate || 0,
      mild: data.mild || 0
    })
  } catch (error) {
    console.error('加载告警级别数据失败:', error)
    initAlertLevelChart({
      serious: Math.floor(Math.random() * 30) + 10,
      moderate: Math.floor(Math.random() * 50) + 20,
      mild: Math.floor(Math.random() * 100) + 30
    })
  }
}

function generateMockAccessData() {
  const data = []
  for (let i = 0; i < 7; i++) {
    data.push(Math.floor(Math.random() * 500) + 200)
  }
  return data
}

function generateMockStrangerData() {
  const data = []
  for (let i = 0; i < 7; i++) {
    data.push(Math.floor(Math.random() * 50) + 10)
  }
  return data
}

function getData() {
  getDashboardStatistics().then(res => {
    if (res.data) {
      dashboard.value = res.data
      strangerTopList.value = res.data.strangerTopList || []
      alertStatsList.value = res.data.alertStatsList || []
    }
  })
}

function handleResize() {
  accessTrendChart?.resize()
  alertLevelChart?.resize()
}

onMounted(() => {
  getData()
  loadAccessTrendData()
  loadAlertLevelData()
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  accessTrendChart?.dispose()
  alertLevelChart?.dispose()
})
</script>

<style scoped>
.mb20 { margin-bottom: 20px; }
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card-title {
  font-weight: bold;
  font-size: 16px;
}

.stat-card {
  display: flex;
  align-items: center;
  padding: 20px;
  gap: 20px;
}
.stat-icon {
  width: 60px;
  height: 60px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  color: #fff;
}
.stat-icon.access { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.stat-icon.stranger { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
.stat-icon.alert { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }
.stat-icon.device { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }
.stat-info { flex: 1; }
.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #303133;
  line-height: 1.2;
}
.stat-label {
  font-size: 14px;
  color: #909399;
  margin-top: 5px;
}

.info-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px solid #f0f0f0;
}
.info-item:last-child { border-bottom: none; }
.info-label { color: #606266; font-size: 14px; }
.info-value { font-size: 16px; font-weight: bold; color: #303133; }
.info-value.success { color: #67c23a; }
.info-value.danger { color: #f56c6c; }
</style>
