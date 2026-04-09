<template>
  <div class="app-container home">
    <el-row :gutter="20" class="mb20">
      <el-col :xs="12" :sm="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon access"><i class="el-icon-user"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayAccess }}</div>
            <div class="stat-label">今日通行人次</div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="12" :sm="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon stranger"><i class="el-icon-warning"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayStranger }}</div>
            <div class="stat-label">今日陌生人</div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="12" :sm="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon alert"><i class="el-icon-bell"></i></div>
          <div class="stat-info">
            <div class="stat-value">{{ dashboard.todayAlert }}</div>
            <div class="stat-label">今日告警数</div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="12" :sm="6">
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
      <el-col :xs="24" :lg="16">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">通行趋势（近7天）</span>
            </div>
          </template>
          <div ref="accessTrendChartRef" style="height: 280px"></div>
        </el-card>
      </el-col>
      <el-col :xs="24" :lg="8">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">告警级别分布</span>
            </div>
          </template>
          <div ref="alertLevelChartRef" style="height: 280px"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :lg="12">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">陌生人高频区域 TOP10</span>
            </div>
          </template>
          <el-table :data="strangerTopList" max-height="250" size="small">
            <el-table-column label="排名" align="center" width="60" type="index" />
            <el-table-column label="区域" align="center" key="district" prop="district" />
            <el-table-column label="出租屋" align="center" key="houseAddress" prop="houseAddress" :show-overflow-tooltip="true" />
            <el-table-column label="次数" align="center" key="count" prop="count" width="80" />
          </el-table>
          <empty v-if="strangerTopList.length === 0" description="暂无数据" />
        </el-card>
      </el-col>
      <el-col :xs="24" :lg="12">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">房源/设备/告警统计</span>
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
          <div class="info-item">
            <span class="info-label">设备总数</span>
            <span class="info-value">{{ dashboard.deviceTotal || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">在线设备</span>
            <span class="info-value success">{{ dashboard.deviceOnline || 0 }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">本月告警</span>
            <span class="info-value">{{ dashboard.monthAlertTotal || 0 }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :span="24">
        <el-card shadow="never">
          <template #header>
            <div class="card-header">
              <span class="card-title">告警处理时效统计</span>
            </div>
          </template>
          <el-table :data="alertStatsList" max-height="200" size="small">
            <el-table-column label="处理状态" align="center" key="status" prop="status" width="120">
              <template #default="scope">
                <el-tag v-if="scope.row.status === '0'" type="warning" size="small">待处理</el-tag>
                <el-tag v-else-if="scope.row.status === '1'" type="primary" size="small">处理中</el-tag>
                <el-tag v-else type="success" size="small">已处理</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="数量" align="center" key="count" prop="count" width="100" />
            <el-table-column label="平均处理时长" align="center" key="avgTime" prop="avgTime" width="140">
              <template #default="scope">
                <span v-if="scope.row.avgTime">{{ scope.row.avgTime }}</span>
                <span v-else>-</span>
              </template>
            </el-table-column>
            <el-table-column label="占比" align="center" key="rate" prop="rate" width="100" />
          </el-table>
          <empty v-if="alertStatsList.length === 0" description="暂无数据" />
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :span="24">
        <el-card shadow="never" class="map-card">
          <template #header>
            <div class="card-header">
              <span class="card-title">📍 地图可视化</span>
              <el-button type="primary" @click="goToMap" :icon="router.currentRoute.value.path === '/rental/map' ? '' : 'VideoPlay'">
                {{ amapKey ? '打开地图' : '配置地图' }}
              </el-button>
            </div>
          </template>
          <div class="map-preview">
            <div class="map-preview-content" v-if="amapKey">
              <svg viewBox="0 0 400 300" class="map-icon">
                <rect width="400" height="300" fill="#e1f5fe"/>
                <circle cx="100" cy="100" r="8" fill="#f44336"/>
                <circle cx="150" cy="120" r="8" fill="#2196f3"/>
                <circle cx="200" cy="80" r="8" fill="#4caf50"/>
                <circle cx="250" cy="150" r="8" fill="#ff9800"/>
                <circle cx="300" cy="100" r="8" fill="#f44336"/>
                <path d="M 50 200 Q 150 180 250 200 T 350 200" stroke="#2196f3" stroke-width="3" fill="none"/>
                <text x="200" y="280" text-anchor="middle" font-size="16" fill="#666">
                  点击按钮查看完整交互地图
                </text>
              </svg>
              <p class="map-content-text">
                <el-icon><MapLocation /></el-icon>
                实时监控房源、设备和告警分布<br/>
                支持多图层切换、热力图展示
              </p>
            </div>
            <div class="map-preview-content" v-else>
              <el-empty description="未配置高德地图 Key"></el-empty>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
import { getDashboardStatistics, getAccessTrend, getAlertStats } from "@/api/rental/statistics"
import { useRouter } from "vue-router"
import * as echarts from "echarts"

const router = useRouter()
const { proxy } = getCurrentInstance()

const amapKey = import.meta.env.VITE_AMAP_KEY || ''

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
      boundaryGap: false
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
        symbolSize: 6,
        itemStyle: { color: '#409EFF' },
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
        symbolSize: 6,
        itemStyle: { color: '#E6A23C' },
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
      right: '5%',
      top: 'center',
      itemWidth: 12,
      itemHeight: 12,
      textStyle: { fontSize: 12 }
    },
    series: [
      {
        name: '告警级别',
        type: 'pie',
        radius: ['40%', '65%'],
        center: ['35%', '50%'],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 4,
          borderColor: '#fff',
          borderWidth: 2
        },
        label: { show: false },
        emphasis: {
          label: { show: true, fontSize: 12, fontWeight: 'bold' }
        },
        labelLine: { show: false },
        data: chartData
      }
    ]
  })
}

async function loadAccessTrendData() {
  try {
    const days = getDaysArray(7)
    const dates = days.map(d => formatDate(d))
    const res = await getAccessTrend({})
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
      dashboard.value.todayAccess = res.data.todayAccessCount || 0
      dashboard.value.todayStranger = res.data.todayStrangerCount || 0
      dashboard.value.todayAlert = res.data.todayAlertCount || 0
      dashboard.value.deviceOnlineRate = res.data.deviceOnlineRate || 0
      dashboard.value.houseTotal = res.data.houseTotal || 0
      dashboard.value.residentTotal = res.data.residentTotal || 0
      dashboard.value.residentRate = res.data.residentRate || '0%'
      dashboard.value.deviceTotal = res.data.deviceTotal || 0
      dashboard.value.deviceOnline = res.data.deviceOnline || 0
      dashboard.value.deviceOffline = res.data.deviceOffline || 0
      dashboard.value.monthAlertTotal = res.data.monthAlertTotal || 0
      dashboard.value.monthAlertResolved = res.data.monthAlertResolved || 0
      dashboard.value.monthAlertRate = res.data.monthAlertResolveRate ? res.data.monthAlertResolveRate + '%' : '0%'
      strangerTopList.value = res.data.strangerTop || []
      alertStatsList.value = res.data.alertStats || []
    }
  })
}

function handleResize() {
  accessTrendChart?.resize()
  alertLevelChart?.resize()
}

function goToMap() {
  router.push('/rental/map')
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

<style scoped lang="scss">
.home {
  padding: 20px;
}

.mb20 {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-title {
  font-weight: bold;
  font-size: 15px;
}

.stat-card {
  display: flex;
  align-items: center;
  padding: 15px;
  gap: 15px;
}

.stat-icon {
  width: 50px;
  height: 50px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: #fff;
}

.stat-icon.access { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.stat-icon.stranger { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
.stat-icon.alert { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); }
.stat-icon.device { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }

.info-item {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #ebeef5;
}

.info-item:last-child {
  border-bottom: none;
}

.info-label {
  color: #909399;
  font-size: 13px;
}

.info-value {
  color: #303133;
  font-weight: 600;
  font-size: 15px;
}

.info-value.success {
  color: #67c23a;
}

.map-card :deep(.el-card__header) {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.map-card :deep(.card-header) {
  color: white;
}

.map-card :deep(.card-title) {
  color: white;
  font-size: 18px;
}

.map-preview {
  width: 100%;
  min-height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.05) 100%);
  border-radius: 8px;
  padding: 20px;
}

.map-preview-content {
  text-align: center;
  width: 100%;
}

.map-icon {
  max-width: 300px;
  height: auto;
  margin-bottom: 20px;
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
}

.map-content-text {
  color: #666;
  font-size: 14px;
  margin-top: 15px;
  line-height: 1.8;
}

.map-content-text .el-icon {
  margin-right: 5px;
  color: #667eea;
}

.stat-info { flex: 1; }

.stat-value {
  font-size: 24px;
  font-weight: bold;
  color: #303133;
  line-height: 1.2;
}

.stat-label {
  font-size: 13px;
  color: #909399;
  margin-top: 4px;
}

.info-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  border-bottom: 1px solid #f0f0f0;
}

.info-item:last-child { border-bottom: none; }

.info-label {
  color: #606266;
  font-size: 13px;
}

.info-value {
  font-size: 15px;
  font-weight: bold;
  color: #303133;
}

.info-value.success { color: #67c23a; }
</style>
