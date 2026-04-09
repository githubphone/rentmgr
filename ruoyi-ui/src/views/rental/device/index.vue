<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="deviceName">
        <el-input v-model="queryParams.deviceName" placeholder="请输入设备名称" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="设备编码" prop="deviceCode">
        <el-input v-model="queryParams.deviceCode" placeholder="请输入设备编码" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="设备类型" prop="deviceType">
        <el-select v-model="queryParams.deviceType" placeholder="请选择" clearable style="width: 160px">
          <el-option label="摄像头" value="camera" />
          <el-option label="对讲机" value="intercom" />
        </el-select>
      </el-form-item>
      <el-form-item label="在线状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择" clearable style="width: 160px">
          <el-option label="在线" value="1" />
          <el-option label="离线" value="0" />
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
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['system:rental:device:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate" v-hasPermi="['system:rental:device:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:rental:device:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Refresh" :loading="syncing" @click="handleSync" v-hasPermi="['system:rental:device:sync']">同步摄像头</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="设备编号" align="center" key="id" prop="id" width="100" />
      <el-table-column label="设备名称" align="center" key="deviceName" prop="deviceName" :show-overflow-tooltip="true" />
      <el-table-column label="设备编码" align="center" key="deviceCode" prop="deviceCode" width="150" />
      <el-table-column label="设备类型" align="center" key="deviceType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.deviceType === 'camera'" type="primary">摄像头</el-tag>
          <el-tag v-else type="info">对讲机</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="安装位置" align="center" key="location" prop="location" :show-overflow-tooltip="true" />
      <el-table-column label="在线状态" align="center" key="status" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">在线</el-tag>
          <el-tag v-else type="danger">离线</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="订阅人脸" align="center" key="metadataSubscribed" width="120">
        <template #default="scope">
          <el-tag v-if="scope.row.metadataSubscribed === '1'" type="success">已订阅</el-tag>
          <el-tag v-else type="info">未订阅</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="最后心跳" align="center" key="lastHeartbeat" prop="lastHeartbeat" width="160">
        <template #default="scope">
          <span>{{ scope.row.lastHeartbeat ? parseTime(scope.row.lastHeartbeat) : '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" key="createTime" prop="createTime" width="160">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="280" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="修改" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:rental:device:edit']"></el-button>
          </el-tooltip>
          <el-tooltip content="删除" placement="top">
            <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:rental:device:remove']"></el-button>
          </el-tooltip>
          <el-tooltip v-if="scope.row.deviceType === 'camera'" :content="scope.row.metadataSubscribed === '1' ? '取消订阅人脸' : '订阅人脸'" placement="top">
            <el-button link type="warning" :icon="scope.row.metadataSubscribed === '1' ? 'Close' : 'DataAnalysis'" @click="handleMetadataSubscribe(scope.row)" v-hasPermi="['system:rental:device:subscribe']"></el-button>
          </el-tooltip>
          <el-tooltip content="查看推送记录" placement="top">
            <el-button link type="primary" icon="View" @click="handleViewMetadata(scope.row)" v-hasPermi="['system:rental:device:view']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 设备表单对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form :model="form" :rules="rules" ref="deviceRef" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备名称" prop="deviceName">
              <el-input v-model="form.deviceName" placeholder="请输入设备名称" maxlength="100" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备编码" prop="deviceCode">
              <el-input v-model="form.deviceCode" placeholder="请输入设备编码" maxlength="100" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备类型" prop="deviceType">
              <el-select v-model="form.deviceType" placeholder="请选择">
                <el-option label="摄像头" value="camera" />
                <el-option label="对讲机" value="intercom" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="安装位置" prop="location">
              <el-input v-model="form.location" placeholder="请输入安装位置" maxlength="200" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 推送记录对话框 -->
    <el-dialog title="推送记录" v-model="metadataDialogVisible" width="700px" append-to-body>
      <div class="metadata-info">
        <el-descriptions :column="3" border size="small">
          <el-descriptions-item label="设备名称">{{ currentDevice.deviceName }}</el-descriptions-item>
          <el-descriptions-item label="设备编码">{{ currentDevice.deviceCode }}</el-descriptions-item>
          <el-descriptions-item label="设备类型">
            <el-tag v-if="currentDevice.deviceType === 'camera'" type="primary" size="small">摄像头</el-tag>
            <el-tag v-else type="info" size="small">对讲机</el-tag>
          </el-descriptions-item>
        </el-descriptions>
      </div>
      <el-divider />
      <el-row :gutter="20">
        <el-col :xs="24" :sm="12" :md="8" :lg="8" v-for="item in metadataList" :key="item.id" class="metadata-item">
          <el-card :body-style="{ padding: '8px' }" shadow="hover">
            <div class="metadata-image">
              <el-image
                v-if="item.detectUrl"
                :src="item.detectUrl"
                :preview-src-list="[item.detectUrl]"
                fit="cover"
                style="width: 100%; height: 100px;"
              >
                <template #error>
                  <div class="image-error">
                    <el-icon><Picture /></el-icon>
                    <span>加载失败</span>
                  </div>
                </template>
              </el-image>
              <div v-else class="image-error">
                <el-icon><Picture /></el-icon>
                <span>无图片</span>
              </div>
            </div>
            <div class="metadata-time">
              <el-icon><Clock /></el-icon>
              <span>{{ item.createTime ? parseTime(item.createTime) : '-' }}</span>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <el-empty v-if="!metadataLoading && metadataList.length === 0" description="暂无推送记录" />
      <pagination
        v-show="metadataTotal > 0"
        :total="metadataTotal"
        v-model:page="metadataQueryParams.pageNum"
        v-model:limit="metadataQueryParams.pageSize"
        @pagination="loadMetadataList"
        :small="true"
        style="margin-top: 15px;"
      />
      <template #footer>
        <el-button @click="metadataDialogVisible = false">关 闭</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalDevice">
import { listDevice, getDevice, addDevice, updateDevice, delDevice, syncCameras, subscribeAlarm, unsubscribeAlarm, subscribeMetadata, unsubscribeMetadata } from "@/api/rental/devices"
import { listMetadata } from "@/api/rental/metadata"
import { listHouse } from "@/api/rental/houses"

const { proxy } = getCurrentInstance()

const deviceList = ref([])
const houseOptions = ref([])
const loading = ref(true)
const syncing = ref(false)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const open = ref(false)

const metadataDialogVisible = ref(false)
const metadataLoading = ref(false)
const metadataList = ref([])
const metadataTotal = ref(0)
const currentDevice = ref({})
const metadataQueryParams = ref({
  pageNum: 1,
  pageSize: 10,
  deviceId: ''
})

const columns = ref([
  { label: '设备编号', visible: true, key: 'id' },
  { label: '设备名称', visible: true, key: 'deviceName' },
  { label: '设备编码', visible: true, key: 'deviceCode' },
  { label: '设备类型', visible: true, key: 'deviceType' },
  { label: '安装位置', visible: true, key: 'location' },
  { label: '在线状态', visible: true, key: 'status' },
  { label: '最后心跳', visible: true, key: 'lastHeartbeat' },
  { label: '创建时间', visible: true, key: 'createTime' }
])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    deviceName: undefined,
    deviceCode: undefined,
    deviceType: undefined,
    status: undefined
  },
  rules: {
    deviceName: [{ required: true, message: "设备名称不能为空", trigger: "blur" }],
    deviceCode: [{ required: true, message: "设备编码不能为空", trigger: "blur" }],
    deviceType: [{ required: true, message: "设备类型不能为空", trigger: "change" }]
  }
})

const { form, queryParams, rules } = toRefs(data)

function getList() {
  loading.value = true
  listDevice(queryParams.value).then(res => {
    loading.value = false
    deviceList.value = res.rows
    total.value = res.total
  })
}

function getHouseOptions() {
  listHouse({ pageNum: 1, pageSize: 1000, status: '1' }).then(res => {
    houseOptions.value = res.rows
  })
}

function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length !== 1
  multiple.value = !selection.length
}

function reset() {
  form.value = {}
  proxy.resetForm("deviceRef")
}

function cancel() {
  open.value = false
  reset()
}

function handleAdd() {
  reset()
  open.value = true
  title.value = "添加设备"
}

function handleUpdate(row) {
  const id = row.id || ids.value[0]
  getDevice(id).then(res => {
    form.value = res.data
    open.value = true
    title.value = "修改设备"
  })
}

function handleDelete(row) {
  const deviceIds = row.id || ids.value
  proxy.$modal.confirm('是否确认删除设备编号为"' + deviceIds + '"的数据项？').then(() => {
    return delDevice(deviceIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch((err) => {
    proxy.$modal.msgError("操作失败，请重试")
  })
}

function submitForm() {
  proxy.$refs["deviceRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateDevice(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addDevice(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

function handleSync() {
  syncing.value = true
  proxy.$modal.confirm('是否确认从统一监控平台同步摄像头？').then(() => {
    return syncCameras()
  }).then(res => {
    syncing.value = false
    proxy.$modal.msgSuccess(res.msg)
    getList()
  }).catch((err) => {
    syncing.value = false
    proxy.$modal.msgError("同步失败，请检查监控平台配置")
  })
}

function handleAlarmSubscribe(row) {
  if (row.alarmSubscribed === '1') {
    proxy.$modal.confirm('是否确认取消该设备的告警订阅？').then(() => {
      return unsubscribeAlarm(row.id)
    }).then(res => {
      proxy.$modal.msgSuccess("取消告警订阅成功")
      getList()
    }).catch(() => {})
  } else {
    proxy.$modal.confirm('是否确认订阅该设备的告警？').then(() => {
      return subscribeAlarm(row.id)
    }).then(res => {
      proxy.$modal.msgSuccess("告警订阅成功")
      getList()
    }).catch(() => {})
  }
}

function handleMetadataSubscribe(row) {
  if (row.metadataSubscribed === '1') {
    proxy.$modal.confirm('是否确认取消该设备的订阅人脸？').then(() => {
      return unsubscribeMetadata(row.id)
    }).then(res => {
      proxy.$modal.msgSuccess("取消订阅人脸成功")
      getList()
    }).catch(() => {})
  } else {
    proxy.$modal.confirm('是否确认订阅该设备的订阅人脸？').then(() => {
      return subscribeMetadata(row.id)
    }).then(res => {
      proxy.$modal.msgSuccess("订阅人脸成功")
      getList()
    }).catch(() => {})
  }
}

function handleViewMetadata(row) {
  currentDevice.value = row
  metadataQueryParams.value.deviceId = row.deviceCode
  metadataQueryParams.value.pageNum = 1
  metadataDialogVisible.value = true
  loadMetadataList()
}

function loadMetadataList() {
  metadataLoading.value = true
  listMetadata(metadataQueryParams.value).then(res => {
    metadataList.value = res.rows || []
    metadataTotal.value = res.total || 0
    metadataLoading.value = false
  }).catch(() => {
    metadataList.value = []
    metadataTotal.value = 0
    metadataLoading.value = false
  })
}

onMounted(() => {
  getList()
  getHouseOptions()
})
</script>

<style scoped>
.metadata-info {
  margin-bottom: 10px;
}
.metadata-item {
  margin-bottom: 15px;
}
.metadata-image {
  width: 100%;
  height: 150px;
  background-color: #f5f7fa;
  border-radius: 4px;
  overflow: hidden;
}
.metadata-time {
  margin-top: 8px;
  text-align: center;
  font-size: 12px;
  color: #909399;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
}
.image-error {
  width: 100%;
  height: 100px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #909399;
  font-size: 12px;
  gap: 5px;
}
</style>
