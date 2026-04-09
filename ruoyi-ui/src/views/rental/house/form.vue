<template>
  <div class="app-container">
    <el-form :model="form" :rules="rules" ref="houseRef" label-width="100px">
      <el-divider content-position="left">基本信息</el-divider>
      <el-row>
        <el-col :span="12">
          <el-form-item label="管理者" prop="managerId">
            <el-input v-model="form.managerName" placeholder="请选择管理者" readonly @click="openManagerDialog">
              <template #append>
                <el-button icon="Search" @click="openManagerDialog" />
              </template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="管理者身份" prop="managerType">
            <el-select v-model="form.managerType" placeholder="请选择管理者身份" clearable style="width: 100%">
              <el-option label="业主" value="owner" />
              <el-option label="二房东" value="subowner" />
              <el-option label="管理员" value="admin" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="所属网格" prop="gridId">
            <el-select v-model="form.gridId" placeholder="请选择所属网格" clearable style="width: 100%" @focus="loadGrids">
              <el-option v-for="grid in gridOptions" :key="grid.id" :label="grid.gridName" :value="grid.id" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="所属派出所" prop="policeStationId">
            <el-select v-model="form.policeStationId" placeholder="请选择派出所" clearable style="width: 100%">
              <el-option label="水口派出所" :value="1" />
              <el-option label="长沙派出所" :value="2" />
              <el-option label="月山派出所" :value="3" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="租金" prop="rent">
            <el-input v-model="form.rent" placeholder="请输入租金" type="number">
              <template #append>元/月</template>
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="房间面积" prop="roomArea">
            <el-input v-model="form.roomArea" placeholder="请输入房间面积" type="number">
              <template #append>平方米</template>
            </el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="总楼层数" prop="totalFloors">
            <el-input v-model="form.totalFloors" placeholder="请输入总楼层数" type="number" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="总房间数" prop="totalRooms">
            <el-input v-model="form.totalRooms" placeholder="请输入总房间数" type="number" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="房屋类型" prop="houseType">
            <el-select v-model="form.houseType" placeholder="请选择房屋类型" clearable style="width: 100%">
              <el-option label="住宅" value="residential" />
              <el-option label="商业" value="commercial" />
              <el-option label="工业" value="industrial" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态" prop="status">
            <el-radio-group v-model="form.status">
              <el-radio label="0">未启用</el-radio>
              <el-radio label="1">正常</el-radio>
              <el-radio label="2">停用</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="详细地址" prop="address">
            <el-input v-model="form.address" placeholder="请输入详细地址" type="textarea" maxlength="500" show-word-limit />
          </el-form-item>
        </el-col>
      </el-row>
      <el-divider content-position="left">位置信息</el-divider>
      <el-row>
        <el-col :span="12">
          <el-form-item label="纬度" prop="latitude">
            <el-input v-model.number="form.latitude" type="number" step="0.000001" placeholder="如：22.3765" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="经度" prop="longitude">
            <el-input v-model.number="form.longitude" type="number" step="0.000001" placeholder="如：112.6949" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row v-if="!form.latitude || !form.longitude">
        <el-col :span="24">
          <el-alert 
            title="位置提示" 
            type="warning" 
            description="请填写经纬度坐标，房源才会显示在地图上。可通过高德地图(https://lbs.amap.com/tools/picker)、Google地图等工具获取。"
            :closable="false"
          />
        </el-col>
      </el-row>
      <el-divider content-position="left">房东信息</el-divider>
      <el-row>
        <el-col :span="12">
          <el-form-item label="房东姓名" prop="ownerName">
            <el-input v-model="form.ownerName" placeholder="请输入房东姓名" maxlength="100" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="房东电话" prop="ownerPhone">
            <el-input v-model="form.ownerPhone" placeholder="请输入房东电话" maxlength="20" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-divider content-position="left">设备信息</el-divider>
      <el-row>
        <el-col :span="12">
          <el-form-item label="关联设备ID" prop="deviceId">
            <el-input v-model="form.deviceId" placeholder="请输入关联设备ID" maxlength="100" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="设备位置" prop="deviceLocation">
            <el-input v-model="form.deviceLocation" placeholder="请输入设备安装位置" maxlength="200" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <div class="dialog-footer">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>

    <el-dialog title="选择管理者" v-model="managerDialog.visible" width="900px" append-to-body draggable>
      <el-form :model="managerDialog.queryParams" :inline="true" class="mb-2">
        <el-form-item label="姓名">
          <el-input v-model="managerDialog.queryParams.managerName" placeholder="请输入姓名" clearable style="width: 150px" />
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="managerDialog.queryParams.phone" placeholder="请输入电话" clearable style="width: 150px" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="loadManagers">搜索</el-button>
          <el-button icon="Refresh" @click="resetManagerQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <div class="mb-2">
        <el-button type="primary" plain icon="Plus" @click="openManagerForm">新增管理者</el-button>
      </div>

      <el-table v-loading="managerDialog.loading" :data="managerDialog.managerList" height="300">
        <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
        <el-table-column label="姓名" align="center" key="managerName" prop="managerName" width="120" />
        <el-table-column label="联系电话" align="center" key="phone" prop="phone" width="130" />
        <el-table-column label="身份证号" align="center" key="idCard" prop="idCard" width="180" />
        <el-table-column label="管辖区域" align="center" key="managedArea" prop="managedArea" :show-overflow-tooltip="true" />
        <el-table-column label="所属派出所" align="center" key="policeStation" prop="policeStation" width="150" />
        <el-table-column label="操作" align="center" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="Edit" @click="openManagerForm(scope.row)">编辑</el-button>
            <el-button link type="primary" icon="Select" @click="selectManager(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="managerDialog.total > 0"
        :total="managerDialog.total"
        v-model:page="managerDialog.queryParams.pageNum"
        v-model:limit="managerDialog.queryParams.pageSize"
        @pagination="loadManagers"
      />

      <el-dialog title="管理者信息" v-model="managerFormDialog.visible" width="500px" append-to-body draggable :close-on-click-modal="false">
        <el-form :model="managerFormDialog.form" :rules="managerFormDialog.rules" ref="managerFormRef" label-width="100px">
          <el-form-item label="姓名" prop="managerName">
            <el-input v-model="managerFormDialog.form.managerName" placeholder="请输入姓名" maxlength="100" />
          </el-form-item>
          <el-form-item label="联系电话" prop="phone">
            <el-input v-model="managerFormDialog.form.phone" placeholder="请输入电话" maxlength="20" />
          </el-form-item>
          <el-form-item label="身份证号" prop="idCard">
            <el-input v-model="managerFormDialog.form.idCard" placeholder="请输入身份证号" maxlength="20" />
          </el-form-item>
          <el-form-item label="身份证地址" prop="idCardAddress">
            <el-input v-model="managerFormDialog.form.idCardAddress" placeholder="请输入身份证登记地址" maxlength="500" />
          </el-form-item>
          <el-form-item label="管辖区域" prop="managedArea">
            <el-input v-model="managerFormDialog.form.managedArea" placeholder="请输入管辖区域" maxlength="200" />
          </el-form-item>
          <el-form-item label="所属派出所" prop="policeStation">
            <el-input v-model="managerFormDialog.form.policeStation" placeholder="请输入所属派出所" maxlength="200" />
          </el-form-item>
          <el-form-item label="微信号" prop="wechat">
            <el-input v-model="managerFormDialog.form.wechat" placeholder="请输入微信号" maxlength="100" />
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-radio-group v-model="managerFormDialog.form.status">
              <el-radio label="1">启用</el-radio>
              <el-radio label="0">禁用</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button type="primary" @click="submitManagerForm">确 定</el-button>
            <el-button @click="managerFormDialog.visible = false">取 消</el-button>
          </div>
        </template>
      </el-dialog>
    </el-dialog>
  </div>
</template>

<script setup name="RentalHouseForm">
import { getHouse, addHouse, updateHouse } from "@/api/rental/houses"
import { listManager, addManager, updateManager, delManager } from "@/api/rental/manager"
import { listGrid } from "@/api/rental/grid"

const { proxy } = getCurrentInstance()

const form = ref({})
const gridOptions = ref([])
const rules = ref({
  address: [{ required: true, message: "详细地址不能为空", trigger: "blur" }],
  managerType: [{ required: true, message: "管理者身份不能为空", trigger: "change" }],
  gridId: [{ required: true, message: "所属网格不能为空", trigger: "change" }],
  rent: [
    { pattern: /^\d+\.?\d{0,2}$/, message: "请输入正确的租金", trigger: "blur" }
  ],
  roomArea: [
    { pattern: /^\d+\.?\d{0,2}$/, message: "请输入正确的面积", trigger: "blur" }
  ],
  ownerPhone: [
    { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
  ],
  latitude: [
    { 
      validator: (rule, value, callback) => {
        if (!value) {
          callback(new Error("纬度不能为空"))
        } else if (isNaN(value)) {
          callback(new Error("纬度必须是数值"))
        } else if (value < -90 || value > 90) {
          callback(new Error("纬度范围应在-90到90之间"))
        } else {
          callback()
        }
      }, 
      trigger: "blur" 
    }
  ],
  longitude: [
    { 
      validator: (rule, value, callback) => {
        if (!value) {
          callback(new Error("经度不能为空"))
        } else if (isNaN(value)) {
          callback(new Error("经度必须是数值"))
        } else if (value < -180 || value > 180) {
          callback(new Error("经度范围应在-180到180之间"))
        } else {
          callback()
        }
      }, 
      trigger: "blur" 
    }
  ]
})

const managerDialog = reactive({
  visible: false,
  loading: false,
  total: 0,
  managerList: [],
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    managerName: undefined,
    phone: undefined
  }
})

const managerFormDialog = reactive({
  visible: false,
  form: {},
  rules: {
    managerName: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
    phone: [{ pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }]
  }
})
const managerFormRef = ref(null)

function loadGrids() {
  if (gridOptions.value.length > 0) return
  listGrid({ pageNum: 1, pageSize: 999 }).then(res => {
    gridOptions.value = res.rows || []
  })
}

function openManagerDialog() {
  managerDialog.visible = true
  managerDialog.queryParams = {
    pageNum: 1,
    pageSize: 10,
    managerName: undefined,
    phone: undefined
  }
  loadManagers()
}

function loadManagers() {
  managerDialog.loading = true
  listManager(managerDialog.queryParams).then(res => {
    managerDialog.loading = false
    managerDialog.managerList = res.rows || []
    managerDialog.total = res.total || 0
  }).catch(() => {
    managerDialog.loading = false
  })
}

function resetManagerQuery() {
  managerDialog.queryParams.managerName = undefined
  managerDialog.queryParams.phone = undefined
  loadManagers()
}

function selectManager(row) {
  form.value.managerId = row.id
  form.value.managerName = row.managerName
  managerDialog.visible = false
}

function openManagerForm(row) {
  managerFormDialog.visible = true
  if (row) {
    managerFormDialog.form = { ...row }
  } else {
    managerFormDialog.form = {
      status: '1'
    }
  }
  if (managerFormRef.value) {
    managerFormRef.value.resetFields()
  }
}

function submitManagerForm() {
  managerFormRef.value.validate(valid => {
    if (valid) {
      if (managerFormDialog.form.id) {
        updateManager(managerFormDialog.form).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          managerFormDialog.visible = false
          loadManagers()
        })
      } else {
        addManager(managerFormDialog.form).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          managerFormDialog.visible = false
          loadManagers()
        })
      }
    }
  })
}

function getDetail(id) {
  getHouse(id).then(res => {
    form.value = res.data
  })
}

function submitForm() {
  proxy.$refs["houseRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateHouse(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          cancel()
        })
      } else {
        addHouse(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          cancel()
        })
      }
    }
  })
}

function cancel() {
  proxy.$router.go(-1)
}

onMounted(() => {
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
.mb-2 {
  margin-bottom: 12px;
}
</style>
