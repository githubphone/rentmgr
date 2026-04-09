<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="告警类型" prop="alertType">
        <el-select v-model="queryParams.alertType" placeholder="请选择" clearable style="width: 180px">
          <el-option label="陌生人告警" value="stranger" />
          <el-option label="未授权告警" value="unauthorized" />
          <el-option label="设备离线" value="offline" />
        </el-select>
      </el-form-item>
      <el-form-item label="告警级别" prop="alertLevel">
        <el-select v-model="queryParams.alertLevel" placeholder="请选择" clearable style="width: 160px">
          <el-option label="轻微" value="3" />
          <el-option label="中等" value="2" />
          <el-option label="严重" value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="处理状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择" clearable style="width: 180px">
          <el-option label="待处理" value="pending" />
          <el-option label="处理中" value="processing" />
          <el-option label="已解决" value="resolved" />
          <el-option label="已忽略" value="ignored" />
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

    <el-row :gutter="20" class="mb8">
      <el-col :span="6">
        <el-card shadow="hover" class="alert-stat-card">
          <div class="stat-item">
            <div class="stat-label">待处理</div>
            <div class="stat-value warning">{{ alertStats.pending }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="alert-stat-card">
          <div class="stat-item">
            <div class="stat-label">处理中</div>
            <div class="stat-value info">{{ alertStats.processing }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="alert-stat-card">
          <div class="stat-item">
            <div class="stat-label">已解决</div>
            <div class="stat-value success">{{ alertStats.resolved }}</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" class="alert-stat-card">
          <div class="stat-item">
            <div class="stat-label">今日新增</div>
            <div class="stat-value">{{ alertStats.today }}</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="10" class="mb8">
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="alertList">
      <el-table-column label="告警编号" align="center" key="id" prop="id" width="100" />
      <el-table-column label="告警照片" align="center" key="photoUrl" prop="photoUrl" width="100">
        <template #default="scope">
          <el-image
            v-if="scope.row.photoUrl"
            :src="scope.row.photoUrl"
            :preview-src-list="[scope.row.photoUrl]"
            fit="cover"
            style="width: 60px; height: 60px"
          />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="告警类型" align="center" key="alertType" width="110">
        <template #default="scope">
          <el-tag v-if="scope.row.alertType === 'stranger'" type="danger">陌生人</el-tag>
          <el-tag v-else-if="scope.row.alertType === 'unauthorized'" type="warning">未授权</el-tag>
          <el-tag v-else type="info">其他</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="告警级别" align="center" key="alertLevel" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.alertLevel === '1'" type="danger">严重</el-tag>
          <el-tag v-else-if="scope.row.alertLevel === '2'" type="warning">中等</el-tag>
          <el-tag v-else type="info">轻微</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="出租屋" align="center" key="houseAddress" prop="houseAddress" :show-overflow-tooltip="true" />
      <el-table-column label="抓拍时间" align="center" key="captureTime" prop="captureTime" width="160">
        <template #default="scope">
          <span>{{ parseTime(scope.row.captureTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" key="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === 'pending'" type="warning">待处理</el-tag>
          <el-tag v-else-if="scope.row.status === 'processing'" type="primary">处理中</el-tag>
          <el-tag v-else-if="scope.row.status === 'resolved'" type="success">已解决</el-tag>
          <el-tag v-else type="info">已忽略</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="处理人" align="center" key="handlerId" prop="handlerId" width="100">
        <template #default="scope">
          <span>{{ scope.row.handlerId || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="处理时间" align="center" key="handleTime" prop="handleTime" width="160">
        <template #default="scope">
          <span>{{ scope.row.handleTime ? parseTime(scope.row.handleTime) : '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="180" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="查看详情" placement="top">
            <el-button link type="primary" icon="View" @click="handleDetail(scope.row)">详情</el-button>
          </el-tooltip>
          <el-tooltip content="闭环处理" placement="top" v-if="scope.row.status !== 'resolved' && scope.row.status !== 'ignored'">
            <el-button link type="success" icon="CircleCheck" @click="handleClose(scope.row)">闭环</el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <el-dialog title="告警详情" v-model="detailDialogVisible" width="700px" append-to-body>
      <div v-loading="detailLoading">
        <el-descriptions :column="2" border size="small">
          <el-descriptions-item label="告警编号">{{ alertDetailData.id }}</el-descriptions-item>
          <el-descriptions-item label="告警类型">
            <el-tag v-if="alertDetailData.alertType === 'stranger'" type="danger" size="small">陌生人</el-tag>
            <el-tag v-else-if="alertDetailData.alertType === 'unauthorized'" type="warning" size="small">未授权</el-tag>
            <el-tag v-else type="info" size="small">其他</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="告警级别">
            <el-tag v-if="alertDetailData.alertLevel === '1'" type="danger" size="small">严重</el-tag>
            <el-tag v-else-if="alertDetailData.alertLevel === '2'" type="warning" size="small">中等</el-tag>
            <el-tag v-else type="info" size="small">轻微</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="处理状态">
            <el-tag v-if="alertDetailData.status === 'pending'" type="warning" size="small">待处理</el-tag>
            <el-tag v-else-if="alertDetailData.status === 'processing'" type="primary" size="small">处理中</el-tag>
            <el-tag v-else-if="alertDetailData.status === 'resolved'" type="success" size="small">已解决</el-tag>
            <el-tag v-else type="info" size="small">已忽略</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="出租屋" :span="2">{{ alertDetailData.house ? alertDetailData.house.address : '-' }}</el-descriptions-item>
          <el-descriptions-item label="抓拍时间">{{ parseTime(alertDetailData.captureTime) }}</el-descriptions-item>
          <el-descriptions-item label="处理时间">{{ alertDetailData.handleTime ? parseTime(alertDetailData.handleTime) : '-' }}</el-descriptions-item>
          <el-descriptions-item label="闭环时间" :span="2">{{ alertDetailData.closeTime ? parseTime(alertDetailData.closeTime) : '-' }}</el-descriptions-item>
          <el-descriptions-item label="闭环说明" :span="2">{{ alertDetailData.closeRemark || '-' }}</el-descriptions-item>
          <el-descriptions-item label="处理凭证" :span="2">
            <el-image v-if="alertDetailData.closeVoucher" :src="alertDetailData.closeVoucher" fit="cover" style="width: 100px; height: 100px;" />
            <span v-else>-</span>
          </el-descriptions-item>
        </el-descriptions>

        <el-divider />

        <el-row :gutter="20">
          <el-col :span="10">
            <div class="photo-section">
              <div class="photo-label">告警抓拍照片</div>
              <el-image
                v-if="alertDetailData.photoUrl"
                :src="alertDetailData.photoUrl"
                :preview-src-list="[alertDetailData.photoUrl]"
                fit="cover"
                style="width: 100%; height: 200px; border-radius: 8px"
              />
              <div v-else class="photo-empty">暂无照片</div>
            </div>
          </el-col>
          <el-col :span="14">
            <div class="photo-section">
              <div class="photo-label">关联出租屋信息</div>
              <el-descriptions :column="1" border size="small" v-if="alertDetailData.house">
                <el-descriptions-item label="地址">{{ alertDetailData.house.address || '-' }}</el-descriptions-item>
                <el-descriptions-item label="镇街">{{ alertDetailData.house.townStreet || '-' }}</el-descriptions-item>
                <el-descriptions-item label="总房间">{{ alertDetailData.house.totalRooms || '-' }}</el-descriptions-item>
                <el-descriptions-item label="分色等级">
                  <el-tag v-if="alertDetailData.house.overallLevel === 'green'" type="success" size="small">绿色</el-tag>
                  <el-tag v-else-if="alertDetailData.house.overallLevel === 'yellow'" type="warning" size="small">黄色</el-tag>
                  <el-tag v-else-if="alertDetailData.house.overallLevel === 'red'" type="danger" size="small">红色</el-tag>
                  <el-tag v-else type="info" size="small">未评级</el-tag>
                </el-descriptions-item>
              </el-descriptions>
              <el-empty v-else description="暂无关联信息" />
            </div>
          </el-col>
        </el-row>
      </div>
      <template #footer>
        <el-button @click="detailDialogVisible = false">关 闭</el-button>
        <el-button type="success" @click="handleClose(alertDetailData)" v-if="alertDetailData.status !== 'resolved' && alertDetailData.status !== 'ignored'">闭环处理</el-button>
      </template>
    </el-dialog>

    <el-dialog title="闭环处理" v-model="closeDialogVisible" width="600px" append-to-body>
      <el-form :model="closeForm" :rules="closeRules" ref="closeRef" label-width="100px">
        <el-form-item label="处理状态" prop="status">
          <el-radio-group v-model="closeForm.status">
            <el-radio label="resolved">已解决</el-radio>
            <el-radio label="ignored">已忽略</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="闭环说明" prop="closeRemark">
          <el-input v-model="closeForm.closeRemark" type="textarea" placeholder="请输入闭环说明" :rows="4" maxlength="500" show-word-limit />
        </el-form-item>
        <el-form-item label="处理凭证" prop="closeVoucher">
          <ImageUpload v-model="closeForm.closeVoucher" :limit="1" :fileSize="10" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitClose">确 定</el-button>
          <el-button @click="closeDialogVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalAlert">
import { listAlert, getAlert, updateAlert } from "@/api/rental/alerts"
import ImageUpload from "@/components/ImageUpload/index.vue"

const { proxy } = getCurrentInstance()

const alertList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const total = ref(0)
const dateRange = ref([])
const detailDialogVisible = ref(false)
const detailLoading = ref(false)
const closeDialogVisible = ref(false)
const alertStats = ref({ pending: 0, processing: 0, resolved: 0, today: 0 })
const alertDetailData = ref({})

const columns = ref([
  { label: '告警编号', visible: true, key: 'id' },
  { label: '告警照片', visible: true, key: 'photoUrl' },
  { label: '告警类型', visible: true, key: 'alertType' },
  { label: '告警级别', visible: true, key: 'alertLevel' },
  { label: '出租屋', visible: true, key: 'houseAddress' },
  { label: '抓拍时间', visible: true, key: 'captureTime' },
  { label: '状态', visible: true, key: 'status' },
  { label: '处理人', visible: true, key: 'handlerId' },
  { label: '处理时间', visible: true, key: 'handleTime' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    alertType: undefined,
    alertLevel: undefined,
    status: undefined
  }
})

const { queryParams } = toRefs(data)

const closeForm = ref({
  id: undefined,
  status: 'resolved',
  closeRemark: undefined,
  closeVoucher: undefined
})

const closeRules = ref({
  status: [{ required: true, message: "处理状态不能为空", trigger: "change" }],
  closeRemark: [{ required: true, message: "闭环说明不能为空", trigger: "blur" }]
})

function getList() {
  loading.value = true
  const params = { ...queryParams.value }
  if (dateRange.value && dateRange.value.length === 2) {
    params.beginTime = dateRange.value[0]
    params.endTime = dateRange.value[1]
  }
  listAlert(params).then(res => {
    loading.value = false
    alertList.value = res.rows
    total.value = res.total
  }).catch(() => {
    loading.value = false
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

function handleDetail(row) {
  detailDialogVisible.value = true
  detailLoading.value = true
  alertDetailData.value = {}
  getAlert(row.id).then(res => {
    alertDetailData.value = res.data || {}
    detailLoading.value = false
  }).catch(() => {
    detailLoading.value = false
  })
}

function handleClose(row) {
  closeForm.value.id = row.id
  closeForm.value.status = 'resolved'
  closeForm.value.closeRemark = undefined
  closeForm.value.closeVoucher = undefined
  closeDialogVisible.value = true
}

function submitClose() {
  proxy.$refs["closeRef"].validate(valid => {
    if (valid) {
      const params = {
        id: closeForm.value.id,
        status: closeForm.value.status,
        handlerId: parseInt(proxy.$store.state.user.id) || 1,
        closeRemark: closeForm.value.closeRemark,
        closeVoucher: closeForm.value.closeVoucher
      }
      updateAlert(params).then(() => {
        proxy.$modal.msgSuccess("闭环成功")
        closeDialogVisible.value = false
        detailDialogVisible.value = false
        getList()
      }).catch((err) => {
        proxy.$modal.msgError("操作失败，请重试")
      })
    }
  })
}

onMounted(() => {
  getList()
})
</script>

<style scoped>
.alert-stat-card {
  text-align: center;
}
.stat-item {
  padding: 10px 0;
}
.stat-label {
  font-size: 14px;
  color: #909399;
  margin-bottom: 8px;
}
.stat-value {
  font-size: 28px;
  font-weight: bold;
}
.stat-value.warning { color: #e6a23c; }
.stat-value.info { color: #409eff; }
.stat-value.success { color: #67c23a; }
.photo-section {
  margin-top: 10px;
}
.photo-label {
  font-weight: bold;
  margin-bottom: 10px;
  color: #303133;
}
.photo-empty {
  width: 100%;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  color: #909399;
  border-radius: 8px;
}
</style>
