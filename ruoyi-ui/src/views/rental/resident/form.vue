<template>
  <div class="app-container">
    <el-form :model="form" :rules="rules" ref="residentRef" label-width="100px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="姓名" prop="name">
            <el-input v-model="form.name" placeholder="请输入姓名" maxlength="100" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="身份证号" prop="idCard">
            <el-input v-model="form.idCard" placeholder="请输入身份证号" maxlength="20" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="手机号" prop="phone">
            <el-input v-model="form.phone" placeholder="请输入手机号" maxlength="20" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="住户类型" prop="residentType">
            <el-select v-model="form.residentType" placeholder="请选择">
              <el-option label="房东" value="owner" />
              <el-option label="租客" value="tenant" />
              <el-option label="家属" value="family" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="关联出租屋" prop="houseId">
            <el-input
              v-model="form.houseAddress"
              placeholder="请点击选择出租屋"
              readonly
              @click="openHouseDialog"
            >
              <template #suffix>
                <el-icon class="el-input__icon"><Search /></el-icon>
              </template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态" prop="status">
            <el-radio-group v-model="form.status">
              <el-radio label="0">未登记</el-radio>
              <el-radio label="1">正常</el-radio>
              <el-radio label="2">已搬离</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="入住日期" prop="checkInDate">
            <el-date-picker v-model="form.checkInDate" type="date" value-format="YYYY-MM-DD" placeholder="请选择入住日期" style="width: 100%" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="退房日期" prop="checkOutDate">
            <el-date-picker v-model="form.checkOutDate" type="date" value-format="YYYY-MM-DD" placeholder="请选择退房日期" style="width: 100%" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-divider content-position="left">人脸照片</el-divider>
      <el-row>
        <el-col :span="24">
          <el-form-item label="人脸照片" prop="facePhoto">
            <el-upload
              ref="faceUploadRef"
              :limit="1"
              accept="image/jpeg,image/png"
              :headers="uploadHeaders"
              :action="faceUploadUrl"
              :before-upload="beforeFaceUpload"
              :on-success="handleFaceUploadSuccess"
              :on-error="handleFaceUploadError"
              :auto-upload="false"
              :file-list="faceFileList"
              list-type="picture"
            >
              <el-button type="primary" icon="Upload">点击上传</el-button>
              <template #tip>
                <div class="el-upload__tip">仅允许上传 jpg、png 格式照片，请确保照片清晰正面，人脸占比适中</div>
              </template>
            </el-upload>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <div class="dialog-footer">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>

    <el-dialog title="选择出租屋" v-model="houseDialogVisible" width="800px" append-to-body>
      <div class="house-dialog-search">
        <el-form :inline="true" :model="houseQueryParams" class="search-form">
          <el-form-item label="镇街">
            <el-select v-model="houseQueryParams.townStreet" placeholder="请选择镇街" clearable style="width: 150px">
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
          <el-form-item label="地址">
            <el-input v-model="houseQueryParams.address" placeholder="请输入地址关键字" clearable style="width: 180px" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="Search" @click="handleHouseQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetHouseQuery">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <el-table
        v-loading="houseLoading"
        :data="houseList"
        @row-click="handleHouseSelect"
        highlight-current-row
        stripe
        border
      >
        <el-table-column label="选择" width="60" align="center">
          <template #default="scope">
            <el-radio v-model="selectedHouseId" :label="scope.row.id" @change="handleHouseSelect(scope.row)">&nbsp;</el-radio>
          </template>
        </el-table-column>
        <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
        <el-table-column label="镇街" align="center" key="townStreet" prop="townStreet" width="100" :show-overflow-tooltip="true" />
        <el-table-column label="地址" align="left" key="address" prop="address" :show-overflow-tooltip="true" />
        <el-table-column label="状态" align="center" key="status" prop="status" width="80">
          <template #default="scope">
            <el-tag v-if="scope.row.status === '0'" type="info">未启用</el-tag>
            <el-tag v-else-if="scope.row.status === '1'" type="success">正常</el-tag>
            <el-tag v-else type="danger">停用</el-tag>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="houseTotal > 0"
        :total="houseTotal"
        v-model:page="houseQueryParams.pageNum"
        v-model:limit="houseQueryParams.pageSize"
        @pagination="loadHouseList"
      />
      <template #footer>
        <el-button @click="houseDialogVisible = false">关 闭</el-button>
        <el-button type="primary" @click="confirmHouseSelect">确 定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalResidentForm">
import { getToken } from "@/utils/auth"
import { getResident, addResident, updateResident } from "@/api/rental/residents"
import { listHouse } from "@/api/rental/houses"

const { proxy } = getCurrentInstance()

const form = ref({})
const houseOptions = ref([])
const faceFileList = ref([])
const uploadHeaders = ref({ Authorization: "Bearer " + getToken() })
const faceUploadUrl = import.meta.env.VITE_APP_BASE_API + "/rental/resident/face"

const houseDialogVisible = ref(false)
const houseLoading = ref(false)
const houseList = ref([])
const houseTotal = ref(0)
const selectedHouseId = ref(null)
const houseQueryParams = ref({
  pageNum: 1,
  pageSize: 10,
  townStreet: '',
  address: '',
  status: '1'
})

const rules = ref({
  name: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
  houseId: [{ required: true, message: "请选择关联出租屋", trigger: "change" }],
  residentType: [{ required: true, message: "请选择住户类型", trigger: "change" }],
  idCard: [
    { pattern: /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$/, message: "请输入正确的身份证号", trigger: "blur" }
  ],
  phone: [
    { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
  ]
})

/** 打开出租屋选择对话框 */
function openHouseDialog() {
  houseDialogVisible.value = true
  selectedHouseId.value = form.value.houseId
  loadHouseList()
}

/** 加载出租屋列表 */
function loadHouseList() {
  houseLoading.value = true
  listHouse(houseQueryParams.value).then(res => {
    houseList.value = res.rows
    houseTotal.value = res.total
    houseLoading.value = false
  })
}

/** 搜索出租屋 */
function handleHouseQuery() {
  houseQueryParams.value.pageNum = 1
  loadHouseList()
}

/** 重置出租屋搜索 */
function resetHouseQuery() {
  houseQueryParams.value = {
    pageNum: 1,
    pageSize: 10,
    townStreet: '',
    address: '',
    status: '1'
  }
  loadHouseList()
}

/** 选择出租屋行 */
function handleHouseSelect(row) {
  selectedHouseId.value = row.id
}

/** 确认选择出租屋 */
function confirmHouseSelect() {
  if (!selectedHouseId.value) {
    proxy.$modal.msgWarning("请选择一个出租屋")
    return
  }
  const selectedHouse = houseList.value.find(h => h.id === selectedHouseId.value)
  if (selectedHouse) {
    form.value.houseId = selectedHouse.id
    form.value.houseAddress = selectedHouse.address
  }
  houseDialogVisible.value = false
}

/** 获取详情 */
function getDetail(id) {
  getResident(id).then(res => {
    form.value = res.data
    if (res.data.facePhoto) {
      faceFileList.value = [{ url: res.data.facePhoto }]
    }
  })
}

/** 查询出租屋下拉 */
function getHouseOptions() {
  listHouse({ pageNum: 1, pageSize: 1000, status: '1' }).then(res => {
    houseOptions.value = res.rows
  })
}

/** 上传前校验 */
function beforeFaceUpload(file) {
  const isImage = file.type === 'image/jpeg' || file.type === 'image/png'
  const isLt5M = file.size / 1024 / 1024 < 5
  if (!isImage) {
    proxy.$modal.msgError("仅支持 jpg、png 格式照片")
    return false
  }
  if (!isLt5M) {
    proxy.$modal.msgError("照片大小不能超过 5MB")
    return false
  }
  return true
}

/** 上传成功 */
function handleFaceUploadSuccess(res) {
  if (res.code === 200) {
    proxy.$modal.msgSuccess("上传成功")
  } else {
    proxy.$modal.msgError(res.msg || "上传失败")
  }
}

/** 上传失败 */
function handleFaceUploadError() {
  proxy.$modal.msgError("上传失败，请重试")
}

/** 提交表单 */
function submitForm() {
  proxy.$refs["residentRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateResident(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          cancel()
        })
      } else {
        addResident(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          cancel()
        })
      }
    }
  })
}

/** 取消返回 */
function cancel() {
  proxy.$router.go(-1)
}

onMounted(() => {
  getHouseOptions()
  const id = proxy.$route.query.id
  if (id) {
    getDetail(id)
  } else {
    form.value = {
      status: '1'
    }
  }
})
</script>

<style scoped>
.dialog-footer {
  text-align: center;
  padding: 20px;
}

.house-dialog-search {
  margin-bottom: 15px;
}

.search-form :deep(.el-form-item) {
  margin-bottom: 0;
}
</style>
