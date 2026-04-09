<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="网格名称" prop="gridName">
        <el-input v-model="queryParams.gridName" placeholder="请输入网格名称" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="镇街" prop="townStreet">
        <el-input v-model="queryParams.townStreet" placeholder="请输入镇街" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 200px">
          <el-option label="启用" value="1" />
          <el-option label="停用" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['rental:grid:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['rental:grid:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['rental:grid:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gridList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
      <el-table-column label="网格编码" align="center" key="gridCode" prop="gridCode" width="120" />
      <el-table-column label="网格名称" align="center" key="gridName" prop="gridName" width="180" />
      <el-table-column label="镇街" align="center" key="townStreet" prop="townStreet" width="120" />
      <el-table-column label="所属村委" align="center" key="villageCommittee" prop="villageCommittee" width="150" />
      <el-table-column label="纬度" align="center" key="latitude" prop="latitude" width="120" />
      <el-table-column label="经度" align="center" key="longitude" prop="longitude" width="120" />
      <el-table-column label="状态" align="center" key="status" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">停用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" key="remark" prop="remark" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="编辑" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['rental:grid:edit']">编辑</el-button>
          </el-tooltip>
          <el-tooltip content="删除" placement="top">
            <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['rental:grid:remove']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <el-dialog :title="dialog.title" v-model="dialog.visible" width="600px" append-to-body draggable>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="网格编码" prop="gridCode">
              <el-input v-model="form.gridCode" placeholder="请输入网格编码" maxlength="50" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="网格名称" prop="gridName">
              <el-input v-model="form.gridName" placeholder="请输入网格名称" maxlength="100" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="镇街" prop="townStreet">
              <el-input v-model="form.townStreet" placeholder="请输入镇街" maxlength="100" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属村委" prop="villageCommittee">
              <el-input v-model="form.villageCommittee" placeholder="请输入所属村委" maxlength="100" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="纬度" prop="latitude">
              <el-input v-model="form.latitude" placeholder="请输入纬度" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="经度" prop="longitude">
              <el-input v-model="form.longitude" placeholder="请输入经度" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="1">启用</el-radio>
                <el-radio label="0">停用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" type="textarea" maxlength="500" />
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
  </div>
</template>

<script setup name="RentalGrid">
import { listGrid, addGrid, updateGrid, delGrid } from "@/api/rental/grid"

const { proxy } = getCurrentInstance()

const gridList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const multiple = ref(true)
const total = ref(0)

const columns = ref([
  { label: '编号', visible: true, key: 'id' },
  { label: '网格编码', visible: true, key: 'gridCode' },
  { label: '网格名称', visible: true, key: 'gridName' },
  { label: '镇街', visible: true, key: 'townStreet' },
  { label: '所属村委', visible: true, key: 'villageCommittee' },
  { label: '状态', visible: true, key: 'status' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    gridName: undefined,
    townStreet: undefined,
    status: undefined
  }
})

const { queryParams } = toRefs(data)

const dialog = reactive({ title: '', visible: false })
const form = ref({})
const formRef = ref(null)
const rules = ref({
  gridCode: [{ required: true, message: "网格编码不能为空", trigger: "blur" }],
  gridName: [{ required: true, message: "网格名称不能为空", trigger: "blur" }],
  latitude: [{ pattern: /^-?\d+\.?\d{0,6}$/, message: "请输入正确的纬度", trigger: "blur" }],
  longitude: [{ pattern: /^-?\d+\.?\d{0,6}$/, message: "请输入正确的经度", trigger: "blur" }]
})

function getList() {
  loading.value = true
  listGrid(queryParams.value).then(res => {
    loading.value = false
    gridList.value = res.rows
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
  dialog.title = "添加网格"
  dialog.visible = true
}

function handleUpdate(row) {
  reset()
  dialog.title = "修改网格"
  dialog.visible = true
  listGrid({ id: row.id }).then(res => {
    if (res.rows && res.rows.length > 0) {
      form.value = res.rows[0]
    }
  })
}

function reset() {
  form.value = {
    id: undefined,
    gridCode: undefined,
    gridName: undefined,
    townStreet: undefined,
    villageCommittee: undefined,
    latitude: undefined,
    longitude: undefined,
    remark: undefined,
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
        updateGrid(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          dialog.visible = false
          getList()
        })
      } else {
        addGrid(form.value).then(() => {
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
  const gridIds = row.id || ids.value
  proxy.$modal.confirm('是否确认删除选中的网格数据项？').then(() => {
    return delGrid(gridIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleExport() {
  proxy.download("/rental/grid/export", { ...queryParams.value }, `rental_grid_${new Date().getTime()}.xlsx`)
}

onMounted(() => {
  getList()
})
</script>
