<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="时间范围" style="width: 420px">
        <el-date-picker
          v-model="dateRange"
          type="datetimerange"
          value-format="YYYY-MM-DD HH:mm:ss"
          range-separator="-"
          start-placeholder="开始时间"
          end-placeholder="结束时间"
          :default-time="[new Date('1 00:00:00', 0, 0), new Date('1 23:59:59', 0, 0)]"
        />
      </el-form-item>
      <el-form-item label="出租屋" prop="houseId">
        <el-select v-model="queryParams.houseId" placeholder="请选择出租屋" clearable style="width: 240px">
          <el-option v-for="item in houseOptions" :key="item.id" :label="item.address" :value="item.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="设备ID" prop="deviceId">
        <el-input v-model="queryParams.deviceId" placeholder="请输入设备ID" clearable style="width: 200px" />
      </el-form-item>
      <el-form-item label="是否陌生人" prop="isStranger">
        <el-select v-model="queryParams.isStranger" placeholder="请选择" clearable style="width: 160px">
          <el-option label="是" value="1" />
          <el-option label="否" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item label="是否核查" prop="isVerified">
        <el-select v-model="queryParams.isVerified" placeholder="请选择" clearable style="width: 160px">
          <el-option label="已核查" value="1" />
          <el-option label="未核查" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['system:rental:accessLog:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="accessLogList">
      <el-table-column label="记录编号" align="center" key="id" prop="id" width="100" />
      <el-table-column label="抓拍照片" align="center" key="photoUrl" prop="photoUrl" width="100">
        <template #default="scope">
          <el-image
            v-if="scope.row.photoUrl"
            :src="scope.row.photoUrl"
            :preview-src-list="[scope.row.photoUrl]"
            fit="cover"
            style="width: 60px; height: 60px"
            :initial-index="0"
          />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="通行时间" align="center" key="captureTime" prop="captureTime" width="160">
        <template #default="scope">
          <span>{{ parseTime(scope.row.captureTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="出租屋" align="center" key="houseAddress" prop="houseAddress" :show-overflow-tooltip="true" />
      <el-table-column label="设备ID" align="center" key="deviceId" prop="deviceId" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="人脸ID" align="center" key="faceId" prop="faceId" width="120" :show-overflow-tooltip="true" />
      <el-table-column label="比对置信度" align="center" key="confidence" prop="confidence" width="110">
        <template #default="scope">
          <span v-if="scope.row.confidence">{{ (scope.row.confidence * 100).toFixed(2) }}%</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="陌生人" align="center" key="isStranger" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.isStranger === '1'" type="danger">是</el-tag>
          <el-tag v-else type="success">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="是否核查" align="center" key="isVerified" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.isVerified === '1'" type="success">已核查</el-tag>
          <el-tag v-else type="warning">未核查</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="80" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="查看详情" placement="top">
            <el-button link type="primary" icon="View" @click="handleView(scope.row)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />
  </div>
</template>

<script setup name="RentalAccessLog">
import { listAccessLog, exportAccessLog } from "@/api/rental/accessLogs"
import { listHouse } from "@/api/rental/houses"

const { proxy } = getCurrentInstance()

const accessLogList = ref([])
const houseOptions = ref([])
const loading = ref(true)
const showSearch = ref(true)
const total = ref(0)
const dateRange = ref([])

const columns = ref([
  { label: '记录编号', visible: true, key: 'id' },
  { label: '抓拍照片', visible: true, key: 'photoUrl' },
  { label: '通行时间', visible: true, key: 'captureTime' },
  { label: '出租屋', visible: true, key: 'houseAddress' },
  { label: '设备ID', visible: true, key: 'deviceId' },
  { label: '人脸ID', visible: true, key: 'faceId' },
  { label: '比对置信度', visible: true, key: 'confidence' },
  { label: '陌生人', visible: true, key: 'isStranger' },
  { label: '是否核查', visible: true, key: 'isVerified' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    houseId: undefined,
    deviceId: undefined,
    isStranger: undefined,
    isVerified: undefined
  }
})

const { queryParams } = toRefs(data)

/** 查询列表 */
function getList() {
  loading.value = true
  const params = { ...queryParams.value }
  if (dateRange.value && dateRange.value.length === 2) {
    params.startDate = dateRange.value[0]
    params.endDate = dateRange.value[1]
  }
  listAccessLog(params).then(res => {
    loading.value = false
    accessLogList.value = res.rows
    total.value = res.total
  })
}

/** 查询出租屋下拉 */
function getHouseOptions() {
  listHouse({ pageNum: 1, pageSize: 1000, status: '1' }).then(res => {
    houseOptions.value = res.rows
  })
}

/** 搜索按钮 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮 */
function resetQuery() {
  dateRange.value = []
  proxy.resetForm("queryRef")
  handleQuery()
}

/** 查看详情 */
function handleView(row) {
  proxy.$modal.msg("详情功能开发中，记录ID：" + row.id)
}

/** 导出按钮 */
function handleExport() {
  const params = { ...queryParams.value }
  if (dateRange.value && dateRange.value.length === 2) {
    params.startDate = dateRange.value[0]
    params.endDate = dateRange.value[1]
  }
  proxy.download("/rental/access/export", params, `access_log_${new Date().getTime()}.xlsx`)
}

onMounted(() => {
  getList()
  getHouseOptions()
})
</script>
