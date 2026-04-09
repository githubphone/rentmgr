<template>
  <div class="app-container">
    <el-card shadow="never" class="mb20">
      <template #header>
        <div class="card-header">
          <span class="card-title">告警信息</span>
          <el-button icon="Back" @click="goBack">返回</el-button>
        </div>
      </template>
      <el-descriptions :column="3" border>
        <el-descriptions-item label="告警编号">{{ alertData.id }}</el-descriptions-item>
        <el-descriptions-item label="告警类型">
          <el-tag v-if="alertData.alertType === 'stranger'" type="danger">陌生人告警</el-tag>
          <el-tag v-else type="warning">未授权告警</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="告警级别">
          <el-tag v-if="alertData.alertLevel === 'high'" type="danger">高</el-tag>
          <el-tag v-else-if="alertData.alertLevel === 'medium'" type="warning">中</el-tag>
          <el-tag v-else type="info">低</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="出租屋">{{ alertData.houseAddress || '-' }}</el-descriptions-item>
        <el-descriptions-item label="设备ID">{{ alertData.deviceId || '-' }}</el-descriptions-item>
        <el-descriptions-item label="抓拍时间">{{ parseTime(alertData.captureTime) }}</el-descriptions-item>
        <el-descriptions-item label="处理状态">
          <el-tag v-if="alertData.status === '0'" type="warning">待处理</el-tag>
          <el-tag v-else-if="alertData.status === '1'" type="primary">处理中</el-tag>
          <el-tag v-else type="success">已处理</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="处理人">{{ alertData.handlerName || '-' }}</el-descriptions-item>
        <el-descriptions-item label="处理时间">{{ alertData.handleTime ? parseTime(alertData.handleTime) : '-' }}</el-descriptions-item>
      </el-descriptions>

      <el-divider />

      <el-row :gutter="20">
        <el-col :span="8">
          <div class="photo-section">
            <div class="photo-label">告警抓拍照片</div>
            <el-image
              v-if="alertData.photoUrl"
              :src="alertData.photoUrl"
              :preview-src-list="[alertData.photoUrl]"
              fit="cover"
              style="width: 100%; height: 300px; border-radius: 8px"
            />
            <div v-else class="photo-empty">暂无照片</div>
          </div>
        </el-col>
        <el-col :span="16">
          <div class="photo-section" v-if="alertData.accessLogId">
            <div class="photo-label">关联通行记录</div>
            <el-descriptions :column="2" border size="small">
              <el-descriptions-item label="通行时间">{{ parseTime(alertData.captureTime) }}</el-descriptions-item>
              <el-descriptions-item label="人脸ID">{{ alertData.faceId || '-' }}</el-descriptions-item>
              <el-descriptions-item label="比对置信度">
                <span v-if="alertData.confidence">{{ (alertData.confidence * 100).toFixed(2) }}%</span>
                <span v-else>-</span>
              </el-descriptions-item>
              <el-descriptions-item label="是否陌生人">
                <el-tag v-if="alertData.isStranger === '1'" type="danger">是</el-tag>
                <el-tag v-else type="success">否</el-tag>
              </el-descriptions-item>
            </el-descriptions>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <!-- 核查记录 -->
    <el-card shadow="never">
      <template #header>
        <div class="card-header">
          <span class="card-title">核查记录</span>
        </div>
      </template>
      <el-table v-loading="verifyLoading" :data="verifyList" max-height="400">
        <el-table-column label="核查人" align="center" key="verifierName" prop="verifierName" width="120" />
        <el-table-column label="核查方式" align="center" key="verifyType" width="120">
          <template #default="scope">
            <span v-if="scope.row.verifyType === 'phone_consult'">电话核实</span>
            <span v-else-if="scope.row.verifyType === 'on_site'">上门核查</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="核查结果" align="center" key="verifyResult" width="120">
          <template #default="scope">
            <el-tag v-if="scope.row.verifyResult === 'real_stranger'" type="danger">真正的陌生人</el-tag>
            <el-tag v-else-if="scope.row.verifyResult === 'resident'" type="success">住户误识别</el-tag>
            <el-tag v-else-if="scope.row.verifyResult === 'delivery'" type="info">快递员</el-tag>
            <el-tag v-else-if="scope.row.verifyResult === 'visitor'" type="info">访客</el-tag>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="备注说明" align="center" key="remark" prop="remark" :show-overflow-tooltip="true" />
        <el-table-column label="核查时间" align="center" key="verifiedAt" prop="verifiedAt" width="160">
          <template #default="scope">
            <span>{{ scope.row.verifiedAt ? parseTime(scope.row.verifiedAt) : '-' }}</span>
          </template>
        </el-table-column>
      </el-table>
      <empty v-if="!verifyLoading && verifyList.length === 0" description="暂无核查记录" />
    </el-card>

    <!-- 处理操作 -->
    <el-card shadow="never" class="mt20" v-if="alertData.status !== '2'">
      <template #header>
        <div class="card-header">
          <span class="card-title">处理告警</span>
        </div>
      </template>
      <el-form :model="processForm" :rules="processRules" ref="processRef" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="核查方式" prop="verifyType">
              <el-select v-model="processForm.verifyType" placeholder="请选择核查方式" style="width: 100%">
                <el-option label="电话核实" value="phone_consult" />
                <el-option label="上门核查" value="on_site" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="核查结果" prop="verifyResult">
              <el-select v-model="processForm.verifyResult" placeholder="请选择核查结果" style="width: 100%">
                <el-option label="真正的陌生人" value="real_stranger" />
                <el-option label="住户误识别" value="resident" />
                <el-option label="快递员" value="delivery" />
                <el-option label="访客" value="visitor" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注说明" prop="remark">
          <el-input v-model="processForm.remark" type="textarea" placeholder="请输入备注说明" :rows="3" maxlength="500" show-word-limit />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitProcess">提交核查</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup name="RentalAlertDetail">
import { getAlert, updateAlert } from "@/api/rental/alerts"

const { proxy } = getCurrentInstance()

const alertData = ref({})
const verifyList = ref([])
const verifyLoading = ref(true)

const data = reactive({
  processForm: {
    id: undefined,
    verifyType: undefined,
    verifyResult: undefined,
    remark: undefined
  },
  processRules: {
    verifyType: [{ required: true, message: "核查方式不能为空", trigger: "change" }],
    verifyResult: [{ required: true, message: "核查结果不能为空", trigger: "change" }]
  }
})

const { processForm, processRules } = toRefs(data)

/** 获取告警详情 */
function getDetail(id) {
  verifyLoading.value = true
  getAlert(id).then(res => {
    alertData.value = res.data.alert
    verifyList.value = res.data.verifyList || []
    processForm.value.id = id
    verifyLoading.value = false
  }).catch(() => {
    verifyLoading.value = false
  })
}

/** 提交处理 */
function submitProcess() {
  proxy.$refs["processRef"].validate(valid => {
    if (valid) {
      updateAlert({ id: processForm.value.id, status: '2' }).then(() => {
        proxy.$modal.msgSuccess("处理成功")
        getDetail(proxy.$route.params.id)
      }).catch(() => {})
    }
  })
}

/** 返回 */
function goBack() {
  proxy.$router.go(-1)
}

onMounted(() => {
  const id = proxy.$route.params.id
  if (id) {
    getDetail(id)
  }
})
</script>

<style scoped>
.mb20 { margin-bottom: 20px; }
.mt20 { margin-top: 20px; }
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card-title {
  font-weight: bold;
  font-size: 16px;
}
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
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  color: #909399;
  border-radius: 8px;
}
</style>
