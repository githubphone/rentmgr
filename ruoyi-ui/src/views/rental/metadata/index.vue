<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="设备ID" prop="deviceId">
        <el-input v-model="queryParams.deviceId" placeholder="请输入设备ID" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="元数据类型" prop="metadataType">
        <el-select v-model="queryParams.metadataType" placeholder="请选择" clearable style="width: 160px">
          <el-option label="抓拍" value="capture" />
          <el-option label="检测" value="detect" />
          <el-option label="识别" value="recognize" />
        </el-select>
      </el-form-item>
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
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['system:rental:metadata:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="metadataList">
      <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
      <el-table-column label="抓拍图片" align="center" key="captureUrl" prop="captureUrl" width="100">
        <template #default="scope">
          <el-image
            v-if="scope.row.captureUrl"
            :src="scope.row.captureUrl"
            :preview-src-list="[scope.row.captureUrl]"
            fit="cover"
            preview-teleported
            style="width: 60px; height: 60px"
            :initial-index="0"
          />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="小图URL" align="center" key="detectUrl" prop="detectUrl" width="100">
        <template #default="scope">
          <el-image
            v-if="scope.row.detectUrl"
            :src="scope.row.detectUrl"
            :preview-src-list="[scope.row.detectUrl]"
            fit="cover"
            preview-teleported
            style="width: 60px; height: 60px"
            :initial-index="0"
          />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="设备ID" align="center" key="deviceId" prop="deviceId" width="150" :show-overflow-tooltip="true" />
      <el-table-column label="元数据类型" align="center" key="metadataType" prop="metadataType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.metadataType === 'capture'" type="primary">抓拍</el-tag>
          <el-tag v-else-if="scope.row.metadataType === 'detect'" type="success">检测</el-tag>
          <el-tag v-else-if="scope.row.metadataType === 'recognize'" type="warning">识别</el-tag>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="描述" align="center" key="description" prop="description" :show-overflow-tooltip="true" />
      <el-table-column label="创建时间" align="center" key="createTime" prop="createTime" width="160">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
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

    <detail-dialog v-model:visible="detailVisible" :row="currentRow" />
  </div>
</template>

<script setup name="RentalMetadata">
import { listMetadata, exportMetadata } from "@/api/rental/metadata"
import DetailDialog from "./detail.vue"

const { proxy } = getCurrentInstance()

const metadataList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const total = ref(0)
const dateRange = ref([])
const detailVisible = ref(false)
const currentRow = ref({})

const columns = ref([
  { label: '编号', visible: true, key: 'id' },
  { label: '抓拍图片', visible: true, key: 'captureUrl' },
  { label: '小图URL', visible: true, key: 'detectUrl' },
  { label: '设备ID', visible: true, key: 'deviceId' },
  { label: '元数据类型', visible: true, key: 'metadataType' },
  { label: '描述', visible: true, key: 'description' },
  { label: '创建时间', visible: true, key: 'createTime' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    deviceId: undefined,
    metadataType: undefined
  }
})

const { queryParams } = toRefs(data)

function getList() {
  loading.value = true
  const params = { ...queryParams.value }
  if (dateRange.value && dateRange.value.length === 2) {
    params.params = {
      beginTime: dateRange.value[0],
      endTime: dateRange.value[1]
    }
  }
  listMetadata(params).then(res => {
    loading.value = false
    metadataList.value = res.rows
    total.value = res.total
  })
}

function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

function resetQuery() {
  dateRange.value = []
  proxy.resetForm("queryRef")
  handleQuery()
}

function handleView(row) {
  currentRow.value = row
  detailVisible.value = true
}

function handleExport() {
  const params = { ...queryParams.value }
  if (dateRange.value && dateRange.value.length === 2) {
    params.params = {
      beginTime: dateRange.value[0],
      endTime: dateRange.value[1]
    }
  }
  proxy.download("/rental/metadata/export", params, `metadata_${new Date().getTime()}.xlsx`)
}

onMounted(() => {
  getList()
})
</script>
