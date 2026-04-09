<template>
  <div class="app-container">
    <el-card class="filter-card" shadow="hover">
      <el-form :model="queryParams" :inline="true">
        <el-form-item label="区域">
          <el-select v-model="queryParams.district" placeholder="请选择区域" clearable style="width: 200px">
            <el-option label="全部" value="" />
            <el-option label="水口镇" value="水口镇" />
            <el-option label="长沙街道" value="长沙街道" />
            <el-option label="三埠街道" value="三埠街道" />
            <el-option label="月山镇" value="月山镇" />
            <el-option label="苍城镇" value="苍城镇" />
            <el-option label="龙胜镇" value="龙胜镇" />
            <el-option label="大沙镇" value="大沙镇" />
            <el-option label="马冈镇" value="马冈镇" />
            <el-option label="塘口镇" value="塘口镇" />
            <el-option label="百合镇" value="百合镇" />
            <el-option label="蚬冈镇" value="蚬冈镇" />
            <el-option label="金鸡镇" value="金鸡镇" />
            <el-option label="赤坎镇" value="赤坎镇" />
            <el-option label="雅瑶镇" value="雅瑶镇" />
            <el-option label="沙塘镇" value="沙塘镇" />
          </el-select>
        </el-form-item>
        <el-form-item label="时间范围">
          <el-date-picker
            v-model="dateRange"
            type="datetimerange"
            value-format="YYYY-MM-DD HH:mm:ss"
            range-separator="-"
            start-placeholder="开始时间"
            end-placeholder="结束时间"
            :default-time="[new Date('1 00:00:00', 0, 0), new Date('1 23:59:59', 0, 0)]"
            style="width: 380px"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
          <el-button icon="Refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <!-- 统计卡片 -->
    <el-row :gutter="20" class="stats-row">
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon" style="background: #409EFF;">
            <i class="el-icon-user"></i>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.totalCount }}</div>
            <div class="stat-label">总通行人次</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon" style="background: #67C23A;">
            <i class="el-icon-user-solid"></i>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.residentCount }}</div>
            <div class="stat-label">住户通行</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon" style="background: #E6A23C;">
            <i class="el-icon-question"></i>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.strangerCount }}</div>
            <div class="stat-label">陌生人</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-icon" style="background: #F56C6C;">
            <i class="el-icon-warning"></i>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.alertCount }}</div>
            <div class="stat-label">触发告警</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 图表区域 -->
    <el-row :gutter="20" class="chart-row">
      <!-- 按小时统计柱状图 -->
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div class="card-header">
              <span>通行记录 - 按小时分布</span>
              <el-radio-group v-model="hourType" size="small">
                <el-radio-button label="today">今日</el-radio-button>
                <el-radio-button label="week">本周</el-radio-button>
                <el-radio-button label="month">本月</el-radio-button>
              </el-radio-group>
            </div>
          </template>
          <div ref="hourChartRef" class="chart-container"></div>
        </el-card>
      </el-col>

      <!-- 按区域统计柱状图 -->
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div class="card-header">
              <span>通行记录 - 按区域分布</span>
              <el-select v-model="districtChartType" size="small" style="width: 120px">
                <el-option label="今日" value="today" />
                <el-option label="本周" value="week" />
                <el-option label="本月" value="month" />
              </el-select>
            </div>
          </template>
          <div ref="districtChartRef" class="chart-container"></div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 热力图叠加地图 -->
    <el-row :gutter="20" class="chart-row">
      <el-col :span="24">
        <el-card shadow="hover">
          <template #header>
            <div class="card-header">
              <span>通行热力图</span>
              <div class="header-actions">
                <el-switch
                  v-model="showHeatmapOverlay"
                  active-text="显示热力图"
                  inactive-text="隐藏热力图"
                />
                <el-button type="primary" size="small" icon="Refresh" @click="refreshMap">刷新</el-button>
              </div>
            </div>
          </template>
          <div id="heatmap-container" class="map-container"></div>
          <div class="map-legend">
            <span class="legend-title">热度等级</span>
            <div class="legend-gradient"></div>
            <div class="legend-labels">
              <span>低</span>
              <span>高</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 详细数据列表 -->
    <el-row :gutter="20" class="chart-row">
      <el-col :span="24">
        <el-card shadow="hover">
          <template #header>
            <div class="card-header">
              <span>热门出租屋 TOP10</span>
            </div>
          </template>
          <el-table :data="topHouseList" v-loading="loading" stripe>
            <el-table-column label="排名" align="center" width="70">
              <template #default="scope">
                <el-tag :type="scope.$index < 3 ? 'danger' : 'info'" effect="plain">
                  {{ scope.$index + 1 }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="出租屋" align="center" key="address" prop="address" :show-overflow-tooltip="true" />
            <el-table-column label="所属区域" align="center" key="district" prop="district" width="120" />
            <el-table-column label="今日通行" align="center" key="todayCount" prop="todayCount" width="120">
              <template #default="scope">
                <el-tag type="success">{{ scope.row.todayCount || 0 }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="本周通行" align="center" key="weekCount" prop="weekCount" width="120">
              <template #default="scope">
                <el-tag type="primary">{{ scope.row.weekCount || 0 }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="本月通行" align="center" key="monthCount" prop="monthCount" width="120">
              <template #default="scope">
                <el-tag>{{ scope.row.monthCount || 0 }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="趋势" align="center" width="150">
              <template #default="scope">
                <el-tag v-if="scope.row.trend > 0" type="success">
                  <i class="el-icon-top"></i> +{{ scope.row.trend }}%
                </el-tag>
                <el-tag v-else-if="scope.row.trend < 0" type="danger">
                  <i class="el-icon-bottom"></i> {{ scope.row.trend }}%
                </el-tag>
                <el-tag v-else type="info">持平</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="RentalAccessHeatmap">
import { getHeatMapData } from '@/api/rental/accessLogs'
import * as echarts from 'echarts'
import AMapLoader from '@amap/amap-jsapi-loader'

const { proxy } = getCurrentInstance()

const amapKey = import.meta.env.VITE_AMAP_KEY || ''
const amapSecurityCode = import.meta.env.VITE_AMAP_SECURITY_CONFIG || ''

const loading = ref(false)
const dateRange = ref([])
const hourType = ref('today')
const districtChartType = ref('today')
const showHeatmapOverlay = ref(true)

const hourChartRef = ref(null)
const districtChartRef = ref(null)
const mapContainer = ref(null)
let hourChart = null
let districtChart = null
let amapMap = null
let heatmapOverlay = null

const queryParams = reactive({
  district: ''
})

const statistics = reactive({
  totalCount: 0,
  residentCount: 0,
  strangerCount: 0,
  alertCount: 0
})

const topHouseList = ref([])
const heatmapData = ref([])

/** 搜索 */
function handleQuery() {
  loadAllData()
}

/** 重置 */
function resetQuery() {
  queryParams.district = ''
  dateRange.value = []
  loadAllData()
}

/** 刷新地图 */
function refreshMap() {
  loadHeatmapData()
}

/** 加载所有数据 */
async function loadAllData() {
  await Promise.all([
    loadStatistics(),
    loadHourChart(),
    loadDistrictChart(),
    loadTopHouses(),
    loadHeatmapData()
  ])
}

/** 加载统计数据 */
async function loadStatistics() {
  try {
    const params = buildParams()
    const res = await getHeatMapData(params)

    if (res.data?.statistics) {
      const stats = res.data.statistics
      statistics.totalCount = stats.totalCount || 0
      statistics.residentCount = stats.residentCount || 0
      statistics.strangerCount = stats.strangerCount || 0
      statistics.alertCount = stats.alertCount || 0
    }
  } catch (error) {
    console.error('加载统计数据失败:', error)
  }
}

/** 加载按小时统计 */
async function loadHourChart() {
  if (!hourChart) {
    hourChart = echarts.init(hourChartRef.value)
  }

  try {
    const params = buildParams()
    params.type = hourType.value
    const res = await getHeatMapData(params)

    const hourData = res.data?.hourly || generateMockHourlyData()

    const hours = []
    const counts = []
    for (let i = 0; i < 24; i++) {
      hours.push(`${i.toString().padStart(2, '0')}:00`)
      counts.push(hourData[i] || 0)
    }

    hourChart.setOption({
      tooltip: {
        trigger: 'axis',
        axisPointer: { type: 'shadow' }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        top: '10%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: hours,
        axisLabel: { interval: 2, rotate: 0 }
      },
      yAxis: {
        type: 'value',
        name: '通行人次'
      },
      series: [{
        name: '通行人次',
        type: 'bar',
        data: counts,
        itemStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: '#409EFF' },
            { offset: 1, color: '#66b1ff' }
          ])
        },
        barWidth: '60%',
        markPoint: {
          data: [
            { type: 'max', name: '最大值' }
          ]
        }
      }]
    })
  } catch (error) {
    console.error('加载小时统计失败:', error)
  }
}

/** 加载按区域统计 */
async function loadDistrictChart() {
  if (!districtChart) {
    districtChart = echarts.init(districtChartRef.value)
  }

  try {
    const params = buildParams()
    params.type = districtChartType.value
    const res = await getHeatMapData(params)

    const districtData = res.data?.byDistrict || generateMockDistrictData()

    const districts = districtData.map(item => item.district)
    const counts = districtData.map(item => item.count)

    districtChart.setOption({
      tooltip: {
        trigger: 'axis',
        axisPointer: { type: 'shadow' }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        top: '10%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: districts,
        axisLabel: { rotate: 30, interval: 0 }
      },
      yAxis: {
        type: 'value',
        name: '通行人次'
      },
      series: [{
        name: '通行人次',
        type: 'bar',
        data: counts,
        itemStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: '#67C23A' },
            { offset: 1, color: '#95d475' }
          ])
        },
        barWidth: '50%'
      }]
    })
  } catch (error) {
    console.error('加载区域统计失败:', error)
  }
}

/** 加载 TOP 出租屋 */
async function loadTopHouses() {
  loading.value = true
  try {
    const params = buildParams()
    const res = await getHeatMapData(params)

    topHouseList.value = res.data?.topHouses || generateMockTopHouses()
  } catch (error) {
    console.error('加载热门出租屋失败:', error)
    topHouseList.value = generateMockTopHouses()
  } finally {
    loading.value = false
  }
}

/** 加载热力图数据 */
async function loadHeatmapData() {
  try {
    const params = buildParams()
    const res = await getHeatMapData(params)

    heatmapData.value = res.data?.heatmap || []

    if (amapMap && showHeatmapOverlay.value) {
      renderHeatmap()
    }
  } catch (error) {
    console.error('加载热力图数据失败:', error)
    heatmapData.value = generateMockHeatmapData()
    if (amapMap && showHeatmapOverlay.value) {
      renderHeatmap()
    }
  }
}

/** 渲染热力图 */
function renderHeatmap() {
  if (!amapMap || !heatmapData.value.length) return

  try {
    if (heatmapOverlay) {
      heatmapOverlay.setMap(null)
    }

    // 使用 AMap.Heatmap
    heatmapOverlay = new AMap.Heatmap(amapMap, {
      radius: 30,
      opacity: [0.3, 0.8],
      gradient: {
        0.2: '#00f0ff',
        0.4: '#0f0',
        0.6: '#ff0',
        0.8: '#f00',
        1.0: '#f00'
      }
    })

    heatmapOverlay.setDataSet({
      data: heatmapData.value.map(item => ({
        lng: item.longitude,
        lat: item.latitude,
        count: item.count || 1
      }))
    })

    heatmapOverlay.setMap(amapMap)
  } catch (error) {
    console.error('渲染热力图失败:', error)
  }
}

/** 初始化地图 */
async function initMap() {
  if (!amapKey) return

  try {
    const AMap = await AMapLoader.load({
      key: amapKey,
      version: '2.0',
      plugins: ['AMap.Heatmap'],
      securityJsCode: amapSecurityCode
    })

    amapMap = new AMap.Map('heatmap-container', {
      zoom: 11,
      center: [112.6949, 22.3765],
      isHotspot: false
    })

    amapMap.on('complete', () => {
      if (showHeatmapOverlay.value && heatmapData.value.length > 0) {
        renderHeatmap()
      }
    })
  } catch (error) {
    console.error('初始化地图失败:', error)
  }
}

/** 构建查询参数 */
function buildParams() {
  const params = { ...queryParams }
  if (dateRange.value && dateRange.value.length === 2) {
    params.startDate = dateRange.value[0]
    params.endDate = dateRange.value[1]
  }
  return params
}

// 监听热力图开关
watch(showHeatmapOverlay, (val) => {
  if (amapMap) {
    if (val && heatmapData.value.length > 0) {
      renderHeatmap()
    } else if (!val && heatmapOverlay) {
      heatmapOverlay.setMap(null)
    }
  }
})

// 监听小时类型变化
watch(hourType, () => {
  loadHourChart()
})

// 监听区域类型变化
watch(districtChartType, () => {
  loadDistrictChart()
})

// 生成模拟小时数据
function generateMockHourlyData() {
  const data = []
  for (let i = 0; i < 24; i++) {
    // 模拟早晚高峰
    let count = Math.floor(Math.random() * 20) + 5
    if (i >= 7 && i <= 9) count = Math.floor(Math.random() * 80) + 40
    if (i >= 17 && i <= 19) count = Math.floor(Math.random() * 80) + 40
    if (i >= 0 && i <= 6) count = Math.floor(Math.random() * 10) + 2
    data.push(count)
  }
  return data
}

// 生成模拟区域数据
function generateMockDistrictData() {
  const districts = ['水口镇', '长沙街道', '三埠街道', '月山镇', '苍城镇', '龙胜镇', '大沙镇', '马冈镇']
  return districts.map(d => ({
    district: d,
    count: Math.floor(Math.random() * 500) + 100
  }))
}

// 生成模拟 TOP 出租屋
function generateMockTopHouses() {
  const houses = []
  for (let i = 1; i <= 10; i++) {
    houses.push({
      address: `水口镇XX路${i}号出租屋`,
      district: '水口镇',
      todayCount: Math.floor(Math.random() * 50) + 10,
      weekCount: Math.floor(Math.random() * 300) + 50,
      monthCount: Math.floor(Math.random() * 1000) + 200,
      trend: Math.floor(Math.random() * 30) - 10
    })
  }
  return houses
}

// 生成模拟热力图数据
function generateMockHeatmapData() {
  const data = []
  const baseLng = 112.6949
  const baseLat = 22.3765
  for (let i = 0; i < 50; i++) {
    data.push({
      longitude: baseLng + (Math.random() - 0.5) * 0.1,
      latitude: baseLat + (Math.random() - 0.5) * 0.08,
      count: Math.floor(Math.random() * 100) + 10
    })
  }
  return data
}

// 窗口大小变化时重绘图表
function handleResize() {
  hourChart?.resize()
  districtChart?.resize()
  amapMap?.resize()
}

onMounted(() => {
  loadAllData()
  if (amapKey) {
    initMap()
  }
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  hourChart?.dispose()
  districtChart?.dispose()
  if (amapMap) {
    amapMap.destroy()
  }
})
</script>

<style scoped>
.filter-card {
  margin-bottom: 15px;
}

.filter-card :deep(.el-card__body) {
  padding: 15px 20px;
}

.stats-row {
  margin-bottom: 15px;
}

.stat-card {
  display: flex;
  align-items: center;
  padding: 10px;
}

.stat-card :deep(.el-card__body) {
  display: flex;
  align-items: center;
  width: 100%;
  padding: 10px 15px;
}

.stat-icon {
  width: 50px;
  height: 50px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 24px;
  margin-right: 15px;
}

.stat-content {
  flex: 1;
}

.stat-value {
  font-size: 24px;
  font-weight: 600;
  color: #303133;
}

.stat-label {
  font-size: 13px;
  color: #909399;
  margin-top: 4px;
}

.chart-row {
  margin-bottom: 15px;
}

.chart-container {
  width: 100%;
  height: 300px;
}

.map-container {
  width: 100%;
  height: 450px;
  border-radius: 4px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 15px;
}

.map-legend {
  display: flex;
  align-items: center;
  margin-top: 10px;
  font-size: 12px;
}

.legend-title {
  margin-right: 10px;
  color: #606266;
}

.legend-gradient {
  width: 200px;
  height: 12px;
  background: linear-gradient(to right, #00f0ff, #0f0, #ff0, #f00);
  border-radius: 2px;
  margin-right: 10px;
}

.legend-labels {
  display: flex;
  justify-content: space-between;
  width: 200px;
  color: #909399;
}
</style>
