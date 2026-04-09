<template>
  <el-dialog title="元数据详情" v-model="dialogVisible" width="800px" append-to-body @close="handleClose">
    <div class="detail-wrap">
      <el-card shadow="never" class="mb20">
        <template #header>
          <div class="card-header">
            <span class="card-title">元数据信息</span>
          </div>
        </template>
        <el-descriptions :column="3" border>
          <el-descriptions-item label="编号">{{ metadataData.id }}</el-descriptions-item>
          <el-descriptions-item label="设备ID">{{ metadataData.deviceId || '-' }}</el-descriptions-item>
          <el-descriptions-item label="元数据类型">
            <el-tag v-if="metadataData.metadataType === 'capture'" type="primary">抓拍</el-tag>
            <el-tag v-else-if="metadataData.metadataType === 'detect'" type="success">检测</el-tag>
            <el-tag v-else-if="metadataData.metadataType === 'recognize'" type="warning">识别</el-tag>
            <span v-else>-</span>
          </el-descriptions-item>
          <el-descriptions-item label="创建时间">{{ metadataData.createTime ? parseTime(metadataData.createTime) : '-' }}</el-descriptions-item>
          <el-descriptions-item label="描述" :span="2">{{ metadataData.description || '-' }}</el-descriptions-item>
        </el-descriptions>

        <el-divider />

        <el-row :gutter="20">
          <el-col :span="12">
            <div class="photo-section">
              <div class="photo-label">抓拍图片</div>
              <el-image
                v-if="metadataData.captureUrl"
                :src="metadataData.captureUrl"
                :preview-src-list="[metadataData.captureUrl]"
                fit="cover"
                preview-teleported
                style="width: 100%; height: 280px; border-radius: 8px"
              />
              <div v-else class="photo-empty">暂无抓拍图片</div>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="photo-section">
              <div class="photo-label">小图（检测图）</div>
              <el-image
                v-if="metadataData.detectUrl"
                :src="metadataData.detectUrl"
                :preview-src-list="[metadataData.detectUrl]"
                fit="cover"
                preview-teleported
                style="width: 100%; height: 280px; border-radius: 8px"
              />
              <div v-else class="photo-empty">暂无小图</div>
            </div>
          </el-col>
        </el-row>
      </el-card>

      <el-card v-if="metadataData.attributes" shadow="never">
        <template #header>
          <div class="card-header">
            <span class="card-title">附加属性</span>
          </div>
        </template>
        <el-descriptions :column="2" border>
          <el-descriptions-item label="属性信息" :span="2">
            <pre style="margin: 0; white-space: pre-wrap; word-break: break-all;">{{ formatAttributes(metadataData.attributes) }}</pre>
          </el-descriptions-item>
        </el-descriptions>
      </el-card>
    </div>
  </el-dialog>
</template>

<script setup name="RentalMetadataDetail">
import { getMetadata } from "@/api/rental/metadata"

const props = defineProps({
  visible: { type: Boolean, default: false },
  row: { type: Object, default: () => ({}) }
})

const emit = defineEmits(['update:visible'])

const dialogVisible = computed({
  get: () => props.visible,
  set: (val) => emit('update:visible', val)
})

const metadataData = ref({})
const currentRow = ref({})

function getDetail(id) {
  getMetadata(id).then(res => {
    metadataData.value = res.data
  })
}

function formatAttributes(attr) {
  if (!attr) return '-'
  if (typeof attr === 'string') {
    try {
      return JSON.stringify(JSON.parse(attr), null, 2)
    } catch (e) {
      return attr
    }
  }
  return JSON.stringify(attr, null, 2)
}

function handleClose() {
  metadataData.value = {}
  currentRow.value = {}
}

watch(() => props.visible, (val) => {
  if (val && props.row && props.row.id) {
    currentRow.value = props.row
    getDetail(props.row.id)
  }
}, { immediate: true })

defineExpose({
  dialogVisible,
  row: currentRow
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
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  color: #909399;
  border-radius: 8px;
}
</style>
