<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="出租屋" prop="houseId">
        <el-select v-model="queryParams.houseId" placeholder="请选择出租屋" clearable style="width: 240px">
          <el-option v-for="item in houseOptions" :key="item.id" :label="item.address" :value="item.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入姓名" clearable style="width: 240px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="queryParams.phone" placeholder="请输入手机号" clearable style="width: 240px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 240px">
          <el-option label="未登记" value="0" />
          <el-option label="正常" value="1" />
          <el-option label="已搬离" value="2" />
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
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['system:rental:resident:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate" v-hasPermi="['system:rental:resident:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:rental:resident:remove']">删除</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="residentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="住户编号" align="center" key="id" prop="id" width="100" />
      <el-table-column label="姓名" align="center" key="name" prop="name" width="120" />
      <el-table-column label="身份证号" align="center" key="idCard" prop="idCard" width="180" />
      <el-table-column label="手机号" align="center" key="phone" prop="phone" width="130" />
      <el-table-column label="出租屋" align="center" key="houseAddress" prop="houseAddress" :show-overflow-tooltip="true" />
      <el-table-column label="房间" align="center" key="roomNo" prop="roomNo" width="80" />
      <el-table-column label="住户类型" align="center" key="residentType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.residentType === 'owner'">房东</el-tag>
          <el-tag v-else-if="scope.row.residentType === 'tenant'" type="success">租客</el-tag>
          <el-tag v-else-if="scope.row.residentType === 'family'" type="info">家属</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="入住日期" align="center" key="checkInDate" prop="checkInDate" width="120" />
      <el-table-column label="人脸状态" align="center" key="hasFace" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.faceId" type="success">已采集</el-tag>
          <el-tag v-else type="danger">未采集</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" key="status" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '0'" type="info">未登记</el-tag>
          <el-tag v-else-if="scope.row.status === '1'" type="success">正常</el-tag>
          <el-tag v-else-if="scope.row.status === '2'" type="warning">已搬离</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="修改" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:rental:resident:edit']"></el-button>
          </el-tooltip>
          <el-tooltip content="删除" placement="top">
            <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:rental:resident:remove']"></el-button>
          </el-tooltip>
          <el-tooltip content="人脸采集" placement="top" v-if="!scope.row.faceId">
            <el-button link type="primary" icon="Camera" @click="handleFaceCollect(scope.row)" v-hasPermi="['system:rental:resident:edit']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 人脸采集对话框 -->
    <el-dialog title="人脸采集" v-model="faceDialogVisible" width="500px" append-to-body>
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
        drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将照片拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <span>仅允许上传 jpg、png 格式照片，请确保照片清晰正面</span>
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitFaceUpload">确 定</el-button>
          <el-button @click="faceDialogVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 新增/修改对话框 -->
    <el-dialog :title="dialogTitle" v-model="formDialogVisible" width="600px" append-to-body>
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
              <el-select v-model="form.residentType" placeholder="请选择" style="width: 100%">
                <el-option label="房东" value="owner" />
                <el-option label="租客" value="tenant" />
                <el-option label="家属" value="family" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="关联房间" prop="roomId">
              <el-input
                v-model="form.houseRoomNo"
                placeholder="请点击选择出租屋和房间"
                readonly
                @click="openHouseRoomDialog"
              >
                <template #suffix>
                  <el-icon class="el-input__icon"><Search /></el-icon>
                </template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
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
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="formDialogVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 出租屋和房间选择对话框 -->
    <el-dialog title="选择出租屋和房间" v-model="houseRoomDialogVisible" width="900px" append-to-body>
      <div class="house-room-dialog-search">
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
        highlight-current-row
        stripe
        border
        @row-click="handleHouseRowClick"
        :row-class-name="tableRowClassName"
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

      <template v-if="selectedHouseId">
        <el-divider content-position="left">房间列表（请点击选择具体房间）</el-divider>
        <el-table
          v-loading="roomLoading"
          :data="roomList"
          highlight-current-row
          stripe
          border
        >
          <el-table-column label="选择" width="60" align="center">
            <template #default="scope">
              <el-radio v-model="selectedRoomId" :label="scope.row.id" @change="handleRoomSelect(scope.row)">&nbsp;</el-radio>
            </template>
          </el-table-column>
          <el-table-column label="房间号" align="center" key="roomNo" prop="roomNo" width="100" />
          <el-table-column label="楼层" align="center" key="floor" prop="floor" width="100" />
          <el-table-column label="状态" align="center" key="status" prop="status" width="100">
            <template #default="scope">
              <el-tag v-if="scope.row.status === '0'" type="info">空置</el-tag>
              <el-tag v-else-if="scope.row.status === '1'" type="success">已入住</el-tag>
              <el-tag v-else type="danger">停用</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="备注" align="left" key="remark" prop="remark" :show-overflow-tooltip="true" />
        </el-table>
        <el-empty v-if="!roomLoading && (roomList || []).length === 0" description="该出租屋暂无房间数据" />
      </template>
      <template #footer>
        <el-button @click="houseRoomDialogVisible = false">关 闭</el-button>
        <el-button type="primary" :disabled="!selectedRoomId" @click="confirmHouseRoomSelect">确 定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalResident">
import { getToken } from "@/utils/auth"
import { listResident, getResident, addResident, updateResident, delResident } from "@/api/rental/residents"
import { listHouse } from "@/api/rental/houses"
import { listRoom } from "@/api/rental/rooms"

const { proxy } = getCurrentInstance()

const residentList = ref([])
const houseOptions = ref([])
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const faceDialogVisible = ref(false)
const currentResidentId = ref(null)
const formDialogVisible = ref(false)
const dialogTitle = ref("")
const form = ref({})
const residentRef = ref(null)

const uploadHeaders = ref({ Authorization: "Bearer " + getToken() })
const faceUploadUrl = import.meta.env.VITE_APP_BASE_API + "/rental/resident/face"

const houseRoomDialogVisible = ref(false)
const houseLoading = ref(false)
const roomLoading = ref(false)
const houseList = ref([])
const houseTotal = ref(0)
const roomList = ref([])
const selectedHouseId = ref(null)
const selectedRoomId = ref(null)
const selectedHouse = ref(null)
const selectedRoom = ref(null)
const houseQueryParams = ref({
  pageNum: 1,
  pageSize: 10,
  townStreet: '',
  address: '',
  status: '1'
})

const rules = ref({
  name: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
  roomId: [{ required: true, message: "请选择关联房间", trigger: "change" }],
  residentType: [{ required: true, message: "请选择住户类型", trigger: "change" }],
  idCard: [
    { pattern: /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$/, message: "请输入正确的身份证号", trigger: "blur" }
  ],
  phone: [
    { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
  ]
})

const columns = ref([
  { label: '住户编号', visible: true, key: 'id' },
  { label: '姓名', visible: true, key: 'name' },
  { label: '身份证号', visible: true, key: 'idCard' },
  { label: '手机号', visible: true, key: 'phone' },
  { label: '出租屋', visible: true, key: 'houseAddress' },
  { label: '房间', visible: true, key: 'roomNo' },
  { label: '住户类型', visible: true, key: 'residentType' },
  { label: '入住日期', visible: true, key: 'checkInDate' },
  { label: '人脸状态', visible: true, key: 'hasFace' },
  { label: '状态', visible: true, key: 'status' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    houseId: undefined,
    name: undefined,
    phone: undefined,
    status: undefined
  }
})

const { queryParams } = toRefs(data)

function getList() {
  loading.value = true
  listResident(queryParams.value).then(res => {
    loading.value = false
    residentList.value = res.rows
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

function handleAdd() {
  resetForm()
  dialogTitle.value = "添加住户"
  formDialogVisible.value = true
}

function handleUpdate(row) {
  resetForm()
  dialogTitle.value = "修改住户"
  const id = row.id || ids.value[0]
  getResident(id).then(res => {
    form.value = res.data
    if (res.data.houseAddress && res.data.roomNo) {
      form.value.houseRoomNo = res.data.houseAddress + ' - ' + res.data.roomNo
    }
    formDialogVisible.value = true
  })
}

function resetForm() {
  form.value = {
    id: undefined,
    name: undefined,
    idCard: undefined,
    phone: undefined,
    residentType: undefined,
    houseId: undefined,
    houseAddress: undefined,
    roomId: undefined,
    roomNo: undefined,
    houseRoomNo: undefined,
    checkInDate: undefined,
    checkOutDate: undefined,
    status: '1'
  }
  if (residentRef.value) {
    residentRef.value.resetFields()
  }
}

function submitForm() {
  proxy.$refs["residentRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateResident(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          formDialogVisible.value = false
          getList()
        })
      } else {
        addResident(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          formDialogVisible.value = false
          getList()
        })
      }
    }
  })
}

function handleDelete(row) {
  const residentIds = row.id || ids.value
  proxy.$modal.confirm('是否确认删除住户编号为"' + residentIds + '"的数据项？').then(() => {
    return delResident(residentIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch((err) => {
    proxy.$modal.msgError("操作失败，请重试")
  })
}

function handleFaceCollect(row) {
  currentResidentId.value = row.id
  faceDialogVisible.value = true
}

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

function submitFaceUpload() {
  proxy.$refs["faceUploadRef"].submit()
}

function handleFaceUploadSuccess(res) {
  if (res.code === 200) {
    proxy.$modal.msgSuccess("人脸采集成功")
    faceDialogVisible.value = false
  } else {
    proxy.$modal.msgError(res.msg || "人脸采集失败")
  }
}

function handleFaceUploadError() {
  proxy.$modal.msgError("人脸采集失败，请重试")
}

function openHouseRoomDialog() {
  houseRoomDialogVisible.value = true
  selectedHouseId.value = form.value.houseId
  selectedRoomId.value = form.value.roomId
  selectedHouse.value = null
  selectedRoom.value = null
  roomList.value = []
  loadHouseList()
  if (form.value.houseId) {
    loadRoomList(form.value.houseId)
  }
}

function loadHouseList() {
  houseLoading.value = true
  listHouse(houseQueryParams.value).then(res => {
    houseList.value = res.rows
    houseTotal.value = res.total
    houseLoading.value = false
  })
}

function handleHouseQuery() {
  houseQueryParams.value.pageNum = 1
  loadHouseList()
}

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

function handleHouseRowClick(row) {
  handleHouseSelect(row)
}

function tableRowClassName({ row }) {
  return selectedHouseId.value === row.id ? 'selected-row' : ''
}

function handleHouseSelect(row) {
  selectedHouseId.value = row.id
  selectedHouse.value = row
  selectedRoomId.value = null
  selectedRoom.value = null
  loadRoomList(row.id)
}

function loadRoomList(houseId) {
  roomLoading.value = true
  roomList.value = []
  const query = {
    pageNum: 1,
    pageSize: 100,
    houseId: houseId ? Number(houseId) : null,
    status: ''
  }
  listRoom(query).then(res => {
    if (Array.isArray(res)) {
      roomList.value = res
    } else if (res && Array.isArray(res.rows)) {
      roomList.value = res.rows
    } else if (res && Array.isArray(res.data)) {
      roomList.value = res.data
    } else {
      roomList.value = []
    }
    roomLoading.value = false
    if (roomList.value.length === 0) {
      proxy.$modal.msgWarning("该出租屋暂未添加房间")
    }
  }).catch((err) => {
    console.error('加载房间失败:', err)
    roomList.value = []
    roomLoading.value = false
  })
}

function handleRoomSelect(row) {
  selectedRoomId.value = row.id
  selectedRoom.value = row
}

function confirmHouseRoomSelect() {
  if (!selectedRoomId.value) {
    proxy.$modal.msgWarning("请选择一个房间")
    return
  }
  if (selectedHouse.value && selectedRoom.value) {
    form.value.houseId = selectedHouse.value.id
    form.value.houseAddress = selectedHouse.value.address
    form.value.roomId = selectedRoom.value.id
    form.value.roomNo = selectedRoom.value.roomNo
    form.value.houseRoomNo = selectedHouse.value.address + ' - ' + selectedRoom.value.roomNo
  }
  houseRoomDialogVisible.value = false
}

onMounted(() => {
  getList()
  getHouseOptions()
})
</script>

<style scoped>
.dialog-footer {
  text-align: center;
  padding: 20px;
}

.house-room-dialog-search {
  margin-bottom: 15px;
}

.search-form :deep(.el-form-item) {
  margin-bottom: 0;
}

:deep(.selected-row) {
  background-color: #ecf5ff;
}
</style>
