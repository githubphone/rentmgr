<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="镇街" prop="townStreet">
        <el-input v-model="queryParams.townStreet" placeholder="请输入镇街" clearable style="width: 200px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="详细地址" prop="address">
        <el-input v-model="queryParams.address" placeholder="请输入详细地址" clearable style="width: 240px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="网格" prop="gridId">
        <el-select v-model="queryParams.gridId" placeholder="请选择网格" clearable style="width: 200px">
          <el-option v-for="grid in gridOptions" :key="grid.id" :label="grid.gridName" :value="grid.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="分色等级" prop="overallLevel">
        <el-select v-model="queryParams.overallLevel" placeholder="请选择等级" clearable style="width: 160px">
          <el-option label="绿色" value="green" />
          <el-option label="黄色" value="yellow" />
          <el-option label="红色" value="red" />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 160px">
          <el-option label="未启用" value="0" />
          <el-option label="正常" value="1" />
          <el-option label="停用" value="2" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['rental:house:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['rental:house:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['rental:house:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="houseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="操作" align="center" width="250" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="详情" placement="top">
            <el-button link type="primary" icon="View" @click="handleDetail(scope.row)" v-hasPermi="['rental:house:list']">详情</el-button>
          </el-tooltip>
          <el-tooltip content="检查记录" placement="top">
            <el-button link type="primary" icon="Document" @click="handleInspection(scope.row)" v-hasPermi="['rental:inspection:list']">检查</el-button>
          </el-tooltip>
          <el-tooltip content="二维码" placement="top">
            <el-button link type="primary" icon="Tickets" @click="handleQRCode(scope.row)" v-hasPermi="['rental:house:list']">二维码</el-button>
          </el-tooltip>
          <el-tooltip content="删除" placement="top">
            <el-button link type="danger" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['rental:house:remove']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
      <el-table-column label="镇街" align="center" key="townStreet" prop="townStreet" width="120" />
      <el-table-column label="详细地址" align="center" key="address" prop="address" :show-overflow-tooltip="true" />
      <el-table-column label="总楼层" align="center" key="totalFloors" prop="totalFloors" width="90" />
      <el-table-column label="总房间" align="center" key="totalRooms" prop="totalRooms" width="90" />
      <el-table-column label="管理者" align="center" key="managerName" prop="managerName" width="120" />
      <el-table-column label="联系电话" align="center" key="managerPhone" prop="managerPhone" width="130" />
      <el-table-column label="网格" align="center" key="gridName" prop="gridName" width="120" />
      <el-table-column label="分色等级" align="center" key="overallLevel" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.overallLevel === 'green'" type="success">绿色</el-tag>
          <el-tag v-else-if="scope.row.overallLevel === 'yellow'" type="warning">黄色</el-tag>
          <el-tag v-else-if="scope.row.overallLevel === 'red'" type="danger">红色</el-tag>
          <el-tag v-else type="info">未评级</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" key="status" width="90">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '0'" type="info">未启用</el-tag>
          <el-tag v-else-if="scope.row.status === '1'" type="success">正常</el-tag>
          <el-tag v-else type="danger">停用</el-tag>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <el-dialog :title="dialog.title" v-model="dialog.visible" width="1000px" append-to-body draggable>
      <el-tabs v-model="activeTab">
        <el-tab-pane label="基本信息" name="basic">
          <el-form :model="form" :rules="rules" ref="houseRef" label-width="100px">
            <el-row>
              <el-col :span="12">
                <el-form-item label="镇街" prop="townStreet">
                  <el-select v-model="form.townStreet" placeholder="请选择镇街" style="width: 100%" disabled>
                    <el-option label="水口镇" value="水口镇" />
                    <el-option label="长沙镇" value="长沙镇" />
                    <el-option label="月山镇" value="月山镇" />
                    <el-option label="苍城镇" value="苍城镇" />
                    <el-option label="龙胜镇" value="龙胜镇" />
                    <el-option label="大沙镇" value="大沙镇" />
                    <el-option label="塘口镇" value="塘口镇" />
                    <el-option label="马冈镇" value="马冈镇" />
                    <el-option label="百合镇" value="百合镇" />
                    <el-option label="蚬冈镇" value="蚬冈镇" />
                    <el-option label="金鸡镇" value="金鸡镇" />
                    <el-option label="赤水镇" value="赤水镇" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="详细地址" prop="address">
                  <el-input v-model="form.address" placeholder="请输入详细地址" maxlength="500" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="租金" prop="rent">
                  <el-input v-model="form.rent" placeholder="请输入租金" type="number" style="width: 100%">
                    <template #append>元/月</template>
                  </el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="房间面积" prop="roomArea">
                  <el-input v-model="form.roomArea" placeholder="请输入房间面积" type="number" style="width: 100%">
                    <template #append>平方米</template>
                  </el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="8">
                <el-form-item label="总楼层" prop="totalFloors">
                  <el-input-number v-model="form.totalFloors" :min="1" :max="99" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="总房间数" prop="totalRooms">
                  <el-input-number v-model="form.totalRooms" :min="1" :max="999" />
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="每层房间" prop="roomsPerFloor">
                  <el-input-number v-model="form.roomsPerFloor" :min="1" :max="50" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="房屋类型" prop="houseType">
                  <el-select v-model="form.houseType" placeholder="请选择" style="width: 100%">
                    <el-option label="商品房" value="commercial" />
                    <el-option label="自建房" value="self_built" />
                    <el-option label="安置房" value="resettlement" />
                    <el-option label="公租房" value="public" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="住所类型" prop="residenceType">
                  <el-select v-model="form.residenceType" placeholder="请选择" style="width: 100%">
                    <el-option label="宿舍" value="dormitory" />
                    <el-option label="公寓" value="apartment" />
                    <el-option label="住宅" value="residential" />
                    <el-option label="商铺" value="shop" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="产权性质" prop="propertyType">
                  <el-select v-model="form.propertyType" placeholder="请选择" style="width: 100%">
                    <el-option label="商品房" value="commercial" />
                    <el-option label="集体土地" value="collective" />
                    <el-option label="国有土地" value="state" />
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="环境类型" prop="environmentType">
                  <el-select v-model="form.environmentType" placeholder="请选择" style="width: 100%">
                    <el-option label="封闭式" value="closed" />
                    <el-option label="半封闭式" value="semi_closed" />
                    <el-option label="开放式" value="open" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="8">
                <el-form-item label="网约房" prop="isOnlineRental">
                  <el-radio-group v-model="form.isOnlineRental">
                    <el-radio label="1">是</el-radio>
                    <el-radio label="0">否</el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="安装门禁" prop="hasAccessControl">
                  <el-radio-group v-model="form.hasAccessControl">
                    <el-radio label="1">是</el-radio>
                    <el-radio label="0">否</el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
              <el-col :span="8">
                <el-form-item label="状态" prop="status">
                  <el-radio-group v-model="form.status">
                    <el-radio label="0">未启用</el-radio>
                    <el-radio label="1">正常</el-radio>
                    <el-radio label="2">停用</el-radio>
                  </el-radio-group>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="管理信息" name="binding">
          <el-form :model="form" ref="bindingRef" label-width="100px">
            <el-row>
              <el-col :span="12">
                <el-form-item label="管理者" prop="managerId">
                  <el-input v-model="form.managerName" placeholder="请选择管理者" readonly>
                    <template #append>
                      <el-button icon="Search" @click="openManagerDialog" />
                    </template>
                  </el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="所属网格" prop="gridId">
                  <el-select v-model="form.gridId" placeholder="请选择网格" filterable clearable style="width: 100%">
                    <el-option v-for="g in gridOptions" :key="g.id" :label="g.gridName" :value="g.id" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="所属派出所" prop="policeStationId">
                  <el-select v-model="form.policeStationId" placeholder="请选择派出所" style="width: 100%">
                    <el-option label="水口派出所" :value="1" />
                    <el-option label="长沙派出所" :value="2" />
                    <el-option label="月山派出所" :value="3" />
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>

          <el-card v-if="form.managerId" class="mt-4" shadow="hover">
            <template #header>
              <span>管理者信息</span>
            </template>
            <el-descriptions :column="3" border>
              <el-descriptions-item label="姓名">{{ form.managerName }}</el-descriptions-item>
              <el-descriptions-item label="联系电话">{{ form.managerPhone || '-' }}</el-descriptions-item>
              <el-descriptions-item label="身份证号">{{ form.managerIdCard || '-' }}</el-descriptions-item>
              <el-descriptions-item label="身份证地址">{{ form.managerIdCardAddress || '-' }}</el-descriptions-item>
              <el-descriptions-item label="身份">{{ getIdentityText(form.managerIdentity) }}</el-descriptions-item>
              <el-descriptions-item label="微信号">{{ form.managerWechat || '-' }}</el-descriptions-item>
            </el-descriptions>
          </el-card>
        </el-tab-pane>

        <el-tab-pane label="位置信息" name="location">
          <el-form :model="form" ref="locationRef" label-width="100px">
            <el-row>
              <el-col :span="12">
                <el-form-item label="纬度" prop="latitude">
                  <el-input v-model="form.latitude" placeholder="通过地图点选获取" readonly />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="经度" prop="longitude">
                  <el-input v-model="form.longitude" placeholder="通过地图点选获取" readonly />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <MapPicker v-model="locationData" :address="form.address" :embedded="true" />
              </el-col>
            </el-row>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="照片管理" name="photo">
          <el-form :model="form" ref="photoRef" label-width="100px">
            <el-row>
              <el-col :span="24">
                <el-form-item label="正面照片" prop="frontPhoto">
                  <ImageUpload v-model="form.frontPhoto" :limit="1" :fileSize="10" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item label="侧面照片" prop="sidePhoto">
                  <ImageUpload v-model="form.sidePhoto" :limit="1" :fileSize="10" />
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item label="周边环境" prop="surroundingPhoto">
                  <ImageUpload v-model="form.surroundingPhoto" :limit="1" :fileSize="10" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="房间管理" name="room">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button type="primary" plain icon="Plus" @click="handleRoomAdd" v-hasPermi="['rental:room:add']">新增房间</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button type="danger" plain icon="Delete" :disabled="roomSingle" @click="handleRoomDelete" v-hasPermi="['rental:room:remove']">删除</el-button>
            </el-col>
          </el-row>
          <el-table v-loading="roomLoading" :data="roomList" @selection-change="handleRoomSelectionChange">
            <el-table-column type="selection" width="50" align="center" />
            <el-table-column label="房间编号" align="center" key="roomNo" prop="roomNo" width="120" />
            <el-table-column label="楼层" align="center" key="floor" prop="floor" width="100" />
            <el-table-column label="状态" align="center" key="status" width="100">
              <template #default="scope">
                <el-tag v-if="scope.row.status === '0'" type="info">空置</el-tag>
                <el-tag v-else-if="scope.row.status === '1'" type="success">已入住</el-tag>
                <el-tag v-else type="danger">停用</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="备注" align="center" key="remark" prop="remark" :show-overflow-tooltip="true" />
            <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
              <template #default="scope">
                <el-tooltip content="编辑" placement="top">
                  <el-button link type="primary" icon="Edit" @click="handleRoomUpdate(scope.row)" v-hasPermi="['rental:room:edit']">编辑</el-button>
                </el-tooltip>
                <el-tooltip content="住户管理" placement="top">
                  <el-button link type="primary" icon="User" @click="handleRoomResidents(scope.row)" v-hasPermi="['rental:resident:list']">住户</el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>

      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog title="房间表单" v-model="roomFormDialog.visible" width="500px" append-to-body draggable>
      <el-form :model="roomForm" :rules="roomRules" ref="roomRef" label-width="100px">
        <el-form-item label="房间编号" prop="roomNo">
          <el-input v-model="roomForm.roomNo" placeholder="如：101" maxlength="50" />
        </el-form-item>
        <el-form-item label="楼层" prop="floor">
          <el-input v-model="roomForm.floor" placeholder="请输入楼层" maxlength="20" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="roomForm.status">
            <el-radio label="0">空置</el-radio>
            <el-radio label="1">已入住</el-radio>
            <el-radio label="2">停用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="roomForm.remark" type="textarea" maxlength="200" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitRoomForm">确 定</el-button>
          <el-button @click="cancelRoomForm">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog :title="'住户管理 - ' + currentRoom.roomNo" v-model="residentDialog.visible" width="900px" append-to-body draggable>
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button type="primary" plain icon="Plus" @click="handleResidentAdd">新增住户</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button type="danger" plain icon="Delete" :disabled="residentSingle" @click="handleResidentDelete">删除</el-button>
        </el-col>
      </el-row>
      <el-table v-loading="residentLoading" :data="residentList" @selection-change="handleResidentSelectionChange">
        <el-table-column type="selection" width="50" align="center" />
        <el-table-column label="姓名" align="center" key="name" prop="name" width="100" />
        <el-table-column label="身份证号" align="center" key="idCard" prop="idCard" width="180" />
        <el-table-column label="手机号" align="center" key="phone" prop="phone" width="130" />
        <el-table-column label="住户类型" align="center" key="residentType" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.residentType === 'owner'">房东</el-tag>
            <el-tag v-else-if="scope.row.residentType === 'tenant'" type="success">租客</el-tag>
            <el-tag v-else type="info">家属</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="入住日期" align="center" key="checkInDate" prop="checkInDate" width="120" />
        <el-table-column label="人脸状态" align="center" key="faceId" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.faceId" type="success">已录入</el-tag>
            <el-tag v-else type="danger">未录入</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
          <template #default="scope">
            <el-tooltip content="编辑" placement="top">
              <el-button link type="primary" icon="Edit" @click="handleResidentUpdate(scope.row)">编辑</el-button>
            </el-tooltip>
            <el-tooltip content="人脸录入" placement="top">
              <el-button link type="primary" icon="Camera" @click="handleFaceInput(scope.row)">人脸</el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :title="residentFormDialog.title" v-model="residentFormDialog.visible" width="600px" append-to-body>
      <el-form :model="residentForm" :rules="residentRules" ref="residentFormRef" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名" prop="name">
              <el-input v-model="residentForm.name" placeholder="请输入姓名" maxlength="100" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCard">
              <el-input v-model="residentForm.idCard" placeholder="请输入身份证号" maxlength="20" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="手机号" prop="phone">
              <el-input v-model="residentForm.phone" placeholder="请输入手机号" maxlength="20" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="住户类型" prop="residentType">
              <el-select v-model="residentForm.residentType" placeholder="请选择" style="width: 100%">
                <el-option label="房东" value="owner" />
                <el-option label="租客" value="tenant" />
                <el-option label="家属" value="family" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="residentForm.status">
                <el-radio label="0">未登记</el-radio>
                <el-radio label="1">正常</el-radio>
                <el-radio label="2">已搬离</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="入住日期" prop="checkInDate">
              <el-date-picker v-model="residentForm.checkInDate" type="date" value-format="YYYY-MM-DD" placeholder="请选择入住日期" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitResidentForm">确 定</el-button>
          <el-button @click="residentFormDialog.visible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog title="检查记录" v-model="inspectionDialog.visible" width="800px" append-to-body draggable>
      <el-table v-loading="inspectionLoading" :data="inspectionList">
        <el-table-column label="检查时间" align="center" key="inspectionTime" prop="inspectionTime" width="160" />
        <el-table-column label="消防等级" align="center" key="fireLevel" prop="fireLevel" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.fireLevel === '1'" type="success">一级</el-tag>
            <el-tag v-else-if="scope.row.fireLevel === '2'" type="warning">二级</el-tag>
            <el-tag v-else type="danger">三级</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="数据等级" align="center" key="dataLevel" prop="dataLevel" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.dataLevel === '1'" type="success">一级</el-tag>
            <el-tag v-else-if="scope.row.dataLevel === '2'" type="warning">二级</el-tag>
            <el-tag v-else type="danger">三级</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="治安等级" align="center" key="securityLevel" prop="securityLevel" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.securityLevel === '1'" type="success">一级</el-tag>
            <el-tag v-else-if="scope.row.securityLevel === '2'" type="warning">二级</el-tag>
            <el-tag v-else type="danger">三级</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="综合等级" align="center" key="overallLevel" prop="overallLevel" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.overallLevel === 'green'" type="success">绿色</el-tag>
            <el-tag v-else-if="scope.row.overallLevel === 'yellow'" type="warning">黄色</el-tag>
            <el-tag v-else type="danger">红色</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" key="remark" prop="remark" :show-overflow-tooltip="true" />
        <el-table-column label="操作" align="center" width="80">
          <template #default="scope">
            <el-button link type="danger" icon="Delete" @click="handleInspectionDelete(scope.row)" v-hasPermi="['rental:inspection:remove']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-divider />
      <el-form :model="inspectionForm" :rules="inspectionRules" ref="inspectionFormRef" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="检查时间" prop="inspectionTime">
              <el-date-picker v-model="inspectionForm.inspectionTime" type="datetime" placeholder="选择检查时间" value-format="YYYY-MM-DD HH:mm:ss" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="消防等级" prop="fireLevel">
              <el-select v-model="inspectionForm.fireLevel" placeholder="请选择" style="width: 100%">
                <el-option label="一级" value="1" />
                <el-option label="二级" value="2" />
                <el-option label="三级" value="3" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="数据等级" prop="dataLevel">
              <el-select v-model="inspectionForm.dataLevel" placeholder="请选择" style="width: 100%">
                <el-option label="一级" value="1" />
                <el-option label="二级" value="2" />
                <el-option label="三级" value="3" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="治安等级" prop="securityLevel">
              <el-select v-model="inspectionForm.securityLevel" placeholder="请选择" style="width: 100%">
                <el-option label="一级" value="1" />
                <el-option label="二级" value="2" />
                <el-option label="三级" value="3" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="inspectionForm.remark" type="textarea" maxlength="500" placeholder="请输入检查备注" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-button type="primary" @click="submitInspection">提交检查记录</el-button>
          </el-col>
        </el-row>
      </el-form>
    </el-dialog>

    <el-dialog title="二维码" v-model="qrDialog.visible" width="400px" append-to-body>
      <div style="text-align: center;">
        <img v-if="qrDialog.qrUrl" :src="qrDialog.qrUrl" alt="二维码" style="width: 250px; height: 250px;" />
        <el-empty v-else description="二维码加载中..." />
        <p style="margin-top: 15px; color: #606266;">{{ qrDialog.houseAddress }}</p>
        <el-button type="primary" size="small" @click="printQRCode" style="margin-top: 10px;">打印二维码</el-button>
      </div>
    </el-dialog>

    <el-dialog title="人脸录入" v-model="faceDialog.visible" width="400px" append-to-body draggable>
      <div style="text-align: center;">
        <el-empty v-if="!currentResident.faceId" description="暂无人脸数据，请上传" />
        <div v-else>
          <el-tag type="success" size="large">人脸已录入</el-tag>
          <p style="margin-top: 10px;">人脸ID: {{ currentResident.faceId }}</p>
        </div>
        <el-divider />
        <el-form :model="faceForm" ref="faceRef" label-width="80px">
          <el-form-item label="人脸ID" prop="faceId">
            <el-input v-model="faceForm.faceId" placeholder="请输入人脸ID" />
          </el-form-item>
        </el-form>
        <el-button type="primary" @click="submitFaceInput">确认录入</el-button>
      </div>
    </el-dialog>

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
          <el-button icon="Refresh" @click="managerDialog.queryParams = { pageNum: 1, pageSize: 10, managerName: undefined, phone: undefined }; loadManagers()">重置</el-button>
        </el-form-item>
      </el-form>
      <div class="mb-2">
        <el-button type="primary" plain icon="Plus" @click="openManagerForm()">新增管理者</el-button>
      </div>
      <el-table v-loading="managerDialog.loading" :data="managerDialog.managerList" height="300">
        <el-table-column label="编号" align="center" key="id" prop="id" width="80" />
        <el-table-column label="姓名" align="center" key="managerName" prop="managerName" width="120" />
        <el-table-column label="联系电话" align="center" key="phone" prop="phone" width="130" />
        <el-table-column label="身份证号" align="center" key="idCard" prop="idCard" width="180" />
        <el-table-column label="操作" align="center" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="Edit" @click="openManagerForm(scope.row)">编辑</el-button>
            <el-button link type="primary" icon="Select" @click="selectManager(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination v-show="managerDialog.total > 0" :total="managerDialog.total" v-model:page="managerDialog.queryParams.pageNum" v-model:limit="managerDialog.queryParams.pageSize" @pagination="loadManagers" />

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
          <el-form-item label="微信号" prop="wechat">
            <el-input v-model="managerFormDialog.form.wechat" placeholder="请输入微信号" maxlength="100" />
          </el-form-item>
          <el-form-item label="身份" prop="identity">
            <el-select v-model="managerFormDialog.form.identity" placeholder="请选择身份" style="width: 100%">
              <el-option label="业主" value="owner" />
              <el-option label="二房东" value="subowner" />
              <el-option label="管理员" value="admin" />
            </el-select>
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

<style scoped>
.mt-4 {
  margin-top: 16px;
}
</style>

<script setup name="RentalHouse">
import { listHouse, getHouse, addHouse, updateHouse, delHouse } from "@/api/rental/houses"
import { listManager, getManager, addManager, updateManager } from "@/api/rental/manager"
import { listGrid } from "@/api/rental/grid"
import { listRoom, getRoom, addRoom, updateRoom, delRoom } from "@/api/rental/rooms"
import { listResident, getResident, addResident, updateResident, delResident } from "@/api/rental/residents"
import { listInspection, addInspection, getLatestInspection, delInspection } from "@/api/rental/inspection"
import ImageUpload from "@/components/ImageUpload/index.vue"
import MapPicker from "@/components/MapPicker/index.vue"

const { proxy } = getCurrentInstance()

const houseList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const multiple = ref(true)
const total = ref(0)
const gridOptions = ref([])
const managerOptions = ref([])

const columns = ref([
  { label: '编号', visible: true, key: 'id' },
  { label: '镇街', visible: true, key: 'townStreet' },
  { label: '详细地址', visible: true, key: 'address' },
  { label: '总楼层', visible: true, key: 'totalFloors' },
  { label: '总房间', visible: true, key: 'totalRooms' },
  { label: '管理者', visible: true, key: 'managerName' },
  { label: '网格', visible: true, key: 'gridName' },
  { label: '分色等级', visible: true, key: 'overallLevel' },
  { label: '状态', visible: true, key: 'status' }
])

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    townStreet: undefined,
    address: undefined,
    gridId: undefined,
    overallLevel: undefined,
    status: undefined
  }
})

const { queryParams } = toRefs(data)

const dialog = reactive({ title: '', visible: false })
const activeTab = ref('basic')
const locationData = ref(null)
const form = ref({})
const houseRef = ref(null)
const bindingRef = ref(null)
const locationRef = ref(null)

watch(locationData, (val) => {
  if (val) {
    form.value.latitude = val.latitude
    form.value.longitude = val.longitude
  }
}, { immediate: false })

const rules = ref({
  townStreet: [{ required: true, message: "镇街不能为空", trigger: "blur" }],
  address: [{ required: true, message: "详细地址不能为空", trigger: "blur" }]
})

const roomList = ref([])
const roomLoading = ref(false)
const roomIds = ref([])
const roomSingle = ref(true)
const roomFormDialog = reactive({ title: '', visible: false })
const roomForm = ref({})
const roomRef = ref(null)
const roomRules = ref({ roomNo: [{ required: true, message: "房间编号不能为空", trigger: "blur" }] })

const residentDialog = reactive({ visible: false })
const currentRoom = ref({})
const residentList = ref([])
const residentLoading = ref(false)
const residentIds = ref([])
const residentSingle = ref(true)
const residentForm = ref({})
const residentFormDialog = reactive({ title: '', visible: false })
const residentFormRef = ref(null)
const residentRules = ref({
  name: [{ required: true, message: "姓名不能为空", trigger: "blur" }],
  residentType: [{ required: true, message: "请选择住户类型", trigger: "change" }],
  idCard: [
    { pattern: /(^\d{15}$)|(^\d{17}(\d|X|x)$)/, message: "请输入正确的身份证号", trigger: "blur" }
  ],
  phone: [
    { pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }
  ]
})
const faceDialog = reactive({ visible: false })
const currentResident = ref({})
const faceForm = ref({ faceId: '' })

const inspectionDialog = reactive({ visible: false, houseId: null })
const inspectionList = ref([])
const inspectionLoading = ref(false)
const inspectionForm = ref({})
const inspectionFormRef = ref(null)
const inspectionRules = ref({
  inspectionTime: [{ required: true, message: "请选择检查时间", trigger: "change" }],
  fireLevel: [{ required: true, message: "请选择消防等级", trigger: "change" }],
  dataLevel: [{ required: true, message: "请选择数据等级", trigger: "change" }],
  securityLevel: [{ required: true, message: "请选择治安等级", trigger: "change" }]
})

const qrDialog = reactive({ visible: false, qrUrl: '', houseAddress: '' })

const managerDialog = reactive({ visible: false, loading: false, total: 0, managerList: [], queryParams: { pageNum: 1, pageSize: 10, managerName: undefined, phone: undefined } })
const managerFormDialog = reactive({ visible: false, form: {}, rules: { managerName: [{ required: true, message: "姓名不能为空", trigger: "blur" }], phone: [{ pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/, message: "请输入正确的手机号码", trigger: "blur" }] } })
const managerFormRef = ref(null)

function openManagerDialog() {
  managerDialog.visible = true
  managerDialog.queryParams = { pageNum: 1, pageSize: 10, managerName: undefined, phone: undefined }
  loadManagers()
}

function loadManagers() {
  managerDialog.loading = true
  listManager(managerDialog.queryParams).then(res => {
    managerDialog.loading = false
    managerDialog.managerList = res.rows || []
    managerDialog.total = res.total || 0
  }).catch(() => { managerDialog.loading = false })
}

function selectManager(row) {
  form.value.managerId = row.id
  form.value.managerName = row.managerName
  form.value.managerPhone = row.phone
  form.value.managerIdCard = row.idCard
  form.value.managerIdCardAddress = row.idCardAddress
  form.value.managerIdentity = row.identity
  form.value.managerWechat = row.wechat
  managerDialog.visible = false
}

function getIdentityText(identity) {
  const map = { 'owner': '业主', 'subowner': '二房东', 'admin': '管理员' }
  return map[identity] || identity || '-'
}

function openManagerForm(row) {
  managerFormDialog.visible = true
  if (row) {
    managerFormDialog.form = { ...row }
  } else {
    managerFormDialog.form = { status: '1' }
  }
  if (managerFormRef.value) managerFormRef.value.resetFields()
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

function getList() {
  loading.value = true
  listHouse(queryParams.value).then(res => {
    loading.value = false
    houseList.value = res.rows
    total.value = res.total
  })
}

function loadGridOptions() {
  listGrid({ pageNum: 1, pageSize: 9999 }).then(res => {
    gridOptions.value = res.rows || []
  })
}

function loadManagerOptions() {
  listManager({ pageNum: 1, pageSize: 9999, status: '1' }).then(res => {
    managerOptions.value = res.rows || []
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
  dialog.title = "添加出租屋"
  dialog.visible = true
  activeTab.value = 'basic'
  loadManagerOptions()
  loadGridOptions()
}

function handleDetail(row) {
  reset()
  dialog.title = "出租屋详情"
  dialog.visible = true
  activeTab.value = 'basic'
  loadManagerOptions()
  loadGridOptions()
  getHouse(row.id).then(res => {
    form.value = res.data
    if (res.data.latitude && res.data.longitude) {
      locationData.value = { longitude: res.data.longitude, latitude: res.data.latitude }
    }
    if (res.data.managerId) {
      getManager(res.data.managerId).then(managerRes => {
        if (managerRes.data) {
          form.value.managerName = managerRes.data.managerName
          form.value.managerPhone = managerRes.data.phone
          form.value.managerIdCard = managerRes.data.idCard
          form.value.managerIdCardAddress = managerRes.data.idCardAddress
          form.value.managerIdentity = managerRes.data.identity
          form.value.managerWechat = managerRes.data.wechat
        }
      })
    }
  })
  loadRoomList(row.id)
}

function reset() {
  form.value = {
    id: undefined,
    townStreet: '水口镇',
    address: undefined,
    totalFloors: 1,
    totalRooms: 1,
    roomsPerFloor: 1,
    houseType: undefined,
    residenceType: undefined,
    propertyType: undefined,
    environmentType: undefined,
    isOnlineRental: '0',
    hasAccessControl: '0',
    managerId: undefined,
    managerType: undefined,
    gridId: undefined,
    policeStationId: undefined,
    rent: undefined,
    roomArea: undefined,
    latitude: undefined,
    longitude: undefined,
    frontPhoto: undefined,
    sidePhoto: undefined,
    surroundingPhoto: undefined,
    overallLevel: undefined,
    status: '1'
  }
  locationData.value = null
}

function submitForm() {
  proxy.$refs["houseRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateHouse(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          dialog.visible = false
          getList()
        })
      } else {
        addHouse(form.value).then(res => {
          proxy.$modal.msgSuccess("新增成功")
          form.value.id = res.data
          dialog.title = "出租屋详情"
          loadRoomList(res.data)
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
  const houseIds = row.id || ids.value
  proxy.$modal.confirm('是否确认删除？').then(() => {
    return delHouse(houseIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleExport() {
  proxy.download("/rental/house/export", { ...queryParams.value }, `rental_house_${new Date().getTime()}.xlsx`)
}

function loadRoomList(houseId) {
  roomLoading.value = true
  listRoom({ houseId: houseId }).then(res => {
    roomLoading.value = false
    roomList.value = res.data || res.rows || []
  })
}

function handleRoomSelectionChange(selection) {
  roomIds.value = selection.map(item => item.id)
  roomSingle.value = selection.length !== 1
}

function handleRoomAdd() {
  resetRoomForm()
  roomFormDialog.title = "添加房间"
  roomFormDialog.visible = true
}

function handleRoomUpdate(row) {
  resetRoomForm()
  roomFormDialog.title = "修改房间"
  roomFormDialog.visible = true
  getRoom(row.id).then(res => { roomForm.value = res.data })
}

function resetRoomForm() {
  roomForm.value = { id: undefined, houseId: form.value.id, roomNo: undefined, floor: undefined, status: '0', remark: undefined }
  if (roomRef.value) roomRef.value.resetFields()
}

function submitRoomForm() {
  proxy.$refs["roomRef"].validate(valid => {
    if (valid) {
      if (roomForm.value.id !== undefined) {
        updateRoom(roomForm.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          roomFormDialog.visible = false
          loadRoomList(form.value.id)
        })
      } else {
        addRoom(roomForm.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          roomFormDialog.visible = false
          loadRoomList(form.value.id)
        })
      }
    }
  })
}

function cancelRoomForm() {
  roomFormDialog.visible = false
  resetRoomForm()
}

function handleRoomDelete(row) {
  const idsToDelete = row.id || roomIds.value
  proxy.$modal.confirm('是否确认删除选中的房间？').then(() => delRoom(idsToDelete)).then(() => {
    loadRoomList(form.value.id)
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleRoomResidents(row) {
  currentRoom.value = row
  residentDialog.visible = true
  loadResidentList(row.id)
}

function loadResidentList(roomId) {
  residentLoading.value = true
  listResident({ roomId: roomId }).then(res => {
    residentLoading.value = false
    residentList.value = res.rows || []
  })
}

function handleResidentSelectionChange(selection) {
  residentIds.value = selection.map(item => item.id)
  residentSingle.value = selection.length !== 1
}

function handleResidentAdd() {
  residentForm.value = { id: undefined, roomId: currentRoom.value.id, houseId: form.value.id, name: undefined, idCard: undefined, phone: undefined, residentType: undefined, checkInDate: undefined, status: '1' }
  residentFormDialog.title = "新增住户"
  residentFormDialog.visible = true
}

function handleResidentUpdate(row) {
  getResident(row.id).then(res => {
    residentForm.value = res.data
    residentFormDialog.title = "修改住户"
    residentFormDialog.visible = true
  })
}

function submitResidentForm() {
  proxy.$refs["residentFormRef"].validate(valid => {
    if (valid) {
      if (residentForm.value.id !== undefined) {
        updateResident(residentForm.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          residentFormDialog.visible = false
          loadResidentList(currentRoom.value.id)
        })
      } else {
        addResident(residentForm.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          residentFormDialog.visible = false
          loadResidentList(currentRoom.value.id)
        })
      }
    }
  })
}

function handleResidentDelete(row) {
  const idsToDelete = row.id || residentIds.value
  proxy.$modal.confirm('是否确认删除？').then(() => delResident(idsToDelete)).then(() => {
    loadResidentList(currentRoom.value.id)
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

function handleFaceInput(row) {
  currentResident.value = { ...row }
  faceForm.value.faceId = row.faceId || ''
  faceDialog.visible = true
}

function submitFaceInput() {
  updateResident({ id: currentResident.value.id, faceId: faceForm.value.faceId }).then(() => {
    proxy.$modal.msgSuccess("人脸录入成功")
    faceDialog.visible = false
    loadResidentList(currentRoom.value.id)
  })
}

function handleInspection(row) {
  inspectionDialog.houseId = row.id
  inspectionDialog.visible = true
  loadInspectionList(row.id)
  const now = new Date()
  const formatted = now.getFullYear() + '-' + String(now.getMonth() + 1).padStart(2, '0') + '-' + String(now.getDate()).padStart(2, '0') + ' ' + String(now.getHours()).padStart(2, '0') + ':' + String(now.getMinutes()).padStart(2, '0') + ':' + String(now.getSeconds()).padStart(2, '0')
  inspectionForm.value = { houseId: row.id, inspectionTime: formatted, fireLevel: undefined, dataLevel: undefined, securityLevel: undefined, remark: undefined }
}

function loadInspectionList(houseId) {
  inspectionLoading.value = true
  listInspection({ houseId: houseId }).then(res => {
    inspectionLoading.value = false
    inspectionList.value = res.rows || []
  }).catch(() => { inspectionLoading.value = false })
}

function handleInspectionAdd() {
  if (roomRef.value) roomRef.value.resetFields()
}

function handleInspectionDelete(row) {
  proxy.$modal.confirm('是否确认删除该检查记录？').then(() => {
    delInspection(row.id).then(() => {
      proxy.$modal.msgSuccess("删除成功")
      loadInspectionList()
    })
  })
}

function submitInspection() {
  proxy.$refs["inspectionFormRef"].validate(valid => {
    if (valid) {
      addInspection(inspectionForm.value).then(() => {
        proxy.$modal.msgSuccess("提交成功")
        loadInspectionList(inspectionDialog.houseId)
        getHouse(inspectionDialog.houseId).then(res => {
          form.value = res.data
        })
      })
    }
  })
}

function handleQRCode(row) {
  qrDialog.houseAddress = row.address
  qrDialog.qrUrl = `/rental/house/qr/${row.id}/image?t=${new Date().getTime()}`
  qrDialog.visible = true
}

function printQRCode() {
  const printWindow = window.open('', '_blank')
  printWindow.document.write(`<html><head><title>打印二维码</title></head><body style="text-align:center;"><img src="${qrDialog.qrUrl}" style="width:250px;height:250px;"/><p>${qrDialog.houseAddress}</p></body></html>`)
  printWindow.document.close()
  printWindow.print()
}

onMounted(() => {
  getList()
  loadGridOptions()
  loadManagerOptions()
})
</script>
