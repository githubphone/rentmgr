<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="managerName">
        <el-input v-model="queryParams.managerName" placeholder="请输入管理者姓名" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="电话" prop="phone">
        <el-input v-model="queryParams.phone" placeholder="请输入联系电话" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 200px">
          <el-option label="启用" value="1" />
          <el-option label="禁用" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['rental:manager:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['rental:manager:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['rental:manager:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="managerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
      <el-table-column label="姓名" align="center" key="managerName" prop="managerName" width="120" />
      <el-table-column label="联系电话" align="center" key="phone" prop="phone" width="130" />
      <el-table-column label="身份证号" align="center" key="idCard" prop="idCard" width="180" />
      <el-table-column label="身份证登记地址" align="center" key="idCardAddress" prop="idCardAddress" :show-overflow-tooltip="true" />
      <el-table-column label="管辖区域" align="center" key="managedArea" prop="managedArea" :show-overflow-tooltip="true" />
      <el-table-column label="所属派出所" align="center" key="policeStation" prop="policeStation" width="150" />
      <el-table-column label="状态" align="center" key="status" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="编辑" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['rental:manager:edit']">编辑</el-button>
          </el-tooltip>
          <el-tooltip content="关联出租屋" placement="top">
            <el-button link type="primary" icon="House" @click="handleBindHouse(scope.row)" v-hasPermi="['rental:manager:edit']">关联</el-button>
          </el-tooltip>
          <el-tooltip content="删除" placement="top">
            <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['rental:manager:remove']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <el-dialog :title="dialog.title" v-model="dialog.visible" width="600px" append-to-body draggable>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名" prop="managerName">
              <el-input v-model="form.managerName" placeholder="请输入姓名" maxlength="100" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入电话" maxlength="20" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCard">
              <el-input v-model="form.idCard" placeholder="请输入身份证号" maxlength="20" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="1">启用</el-radio>
                <el-radio label="0">禁用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="身份证登记地址" prop="idCardAddress">
              <el-input v-model="form.idCardAddress" placeholder="请输入身份证登记地址" maxlength="500" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="管辖区域" prop="managedArea">
              <el-input v-model="form.managedArea" placeholder="请输入管辖区域" maxlength="200" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属派出所" prop="policeStation">
              <el-input v-model="form.policeStation" placeholder="请输入所属派出所" maxlength="200" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="微信号" prop="wechat">
              <el-input v-model="form.wechat" placeholder="请输入微信号" maxlength="100" />
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

    <el-dialog title="关联出租屋" v-model="bindHouseDialog.visible" width="800px" append-to-body draggable>
      <el-form :model="bindHouseDialog" :inline="true">
        <el-form-item label="出租屋地址">
          <el-input v-model="bindHouseDialog.searchText" placeholder="请输入地址搜索" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="loadBindableHouses">搜索</el-button>
        </el-form-item>
      </el-form>
      <el-table v-loading="bindHouseDialog.loading" :data="bindHouseDialog.houseList" @selection-change="handleBindHouseSelection">
        <el-table-column type="selection" width="50" />
        <el-table-column label="地址" key="address" prop="address" :show-overflow-tooltip="true" />
        <el-table-column label="镇街" key="townStreet" prop="townStreet" width="120" />
        <el-table-column label="总房间数" key="totalRooms" prop="totalRooms" width="100" />
      </el-table>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitBindHouse">确认关联</el-button>
          <el-button @click="bindHouseDialog.visible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="RentalManager">
import { listManager, addManager, updateManager, delManager, getHousesByManagerId, addManagerHouse } from "@/api/rental/manager"
import { listHouseSimple } from "@/api/rental/houses"

const { proxy } = getCurrentInstance()

const managerList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const multiple = ref(true)
const total = ref(0)

const columns = ref([
  { label: '编号', visible: true, key: 'id' },
  { label: '姓名', visible: true, key: 'managerName' },
  { label: '电话', visible: true, key: 'phone' },
  { label: '身份证号', visible: true, key: 'idCard' },
  { label: '管辖区域', visible: true, key: 'managedArea' },
  { label: '所属派出所', visible: true, key: 'policeStation' },
  { label: '状态', visible: true, key: 'status' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    managerName: undefined,
    phone: undefined,
    status: undefined
  }
})

const { queryParams } = toRefs(data)

const dialog = reactive({ title: '', visible: false })
const form = ref({})
const formRef = ref(null)
const rules = ref({
  managerName: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
  phone: [{ pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }],
  idCard: [{ pattern: /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$/, message: "请输入正确的身份证号", trigger: "blur" }]
})

const bindHouseDialog = reactive({
  visible: false,
  loading: false,
  searchText: '',
  managerId: null,
  houseList: [],
  selectedHouses: []
})

function getList() {
  loading.value = true
  listManager(queryParams.value).then(res => {
    loading.value = false
    managerList.value = res.rows
    total.value = res.total
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
  multiple.value = !selection.length
}

function handleAdd() {
  reset()
  dialog.title = "添加管理者"
  dialog.visible = true
}

function handleUpdate(row) {
  reset()
  dialog.title = "修改管理者"
  dialog.visible = true
  getManager(row.id).then(res => {
    form.value = res.data
  })
}

function reset() {
  form.value = {
    id: undefined,
    managerName: undefined,
    phone: undefined,
    idCard: undefined,
    idCardAddress: undefined,
    managedArea: undefined,
    policeStation: undefined,
    wechat: undefined,
    status: '1'
  }
  if (formRef.value) {
    formRef.value.resetFields()
  }
}

function submitForm() {
  proxy.$refs["formRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateManager(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          dialog.visible = false
          getList()
        })
      } else {
        addManager(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          dialog.visible = false
          getList()
        })
      }
    }
  })
}

function cancel() {
  dialog.visible = false
  reset()
}

function handleDelete(row) {
  const managerIds = row.id || ids.value
  proxy.$modal.confirm('是否确认删除选中的管理者数据项？').then(() => {
    return delManager(managerIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleExport() {
  proxy.download("/rental/manager/export", { ...queryParams.value }, `rental_manager_${new Date().getTime()}.xlsx`)
}

function getManager(id) {
  return new Promise((resolve, reject) => {
    listManager({ pageNum: 1, pageSize: 9999 }).then(res => {
      const manager = res.rows.find(item => item.id === id)
      resolve({ data: manager })
    }).catch(err => reject(err))
  })
}

function handleBindHouse(row) {
  bindHouseDialog.managerId = row.id
  bindHouseDialog.visible = true
  bindHouseDialog.searchText = ''
  bindHouseDialog.houseList = []
  loadBindableHouses()
}

function loadBindableHouses() {
  bindHouseDialog.loading = true
  listHouseSimple().then(res => {
    bindHouseDialog.loading = false
    const data = res.data || res.rows || []
    if (bindHouseDialog.searchText) {
      bindHouseDialog.houseList = data.filter(h => h.address && h.address.includes(bindHouseDialog.searchText))
    } else {
      bindHouseDialog.houseList = data
    }
  }).catch(() => {
    bindHouseDialog.loading = false
  })
}

function handleBindHouseSelection(selection) {
  bindHouseDialog.selectedHouses = selection
}

function submitBindHouse() {
  if (bindHouseDialog.selectedHouses.length === 0) {
    proxy.$modal.msgWarning("请选择要关联的出租屋")
    return
  }
  const promises = bindHouseDialog.selectedHouses.map(house => {
    return addManagerHouse({
      managerId: bindHouseDialog.managerId,
      houseId: house.id,
      relationType: 'owner'
    })
  })
  Promise.all(promises).then(() => {
    proxy.$modal.msgSuccess("关联成功")
    bindHouseDialog.visible = false
  }).catch(() => {})
}

onMounted(() => {
  getList()
})
</script>
