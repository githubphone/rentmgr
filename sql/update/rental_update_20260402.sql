-- 出租屋管理系统数据库更新脚本
-- 日期：2026-04-02
-- 版本：1.1.0
-- 此脚本不包含PL/pgSQL DO块，可直接通过JDBC执行

-- ================================================
-- 1. 向系统字典表添加出租屋管理相关的字典数据
-- ================================================

-- 管理者身份类别
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '管理者身份类别', 'manager_type', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'manager_type');

-- 房屋类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '房屋类型', 'house_type', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'house_type');

-- 住所类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '住所类型', 'residence_type', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'residence_type');

-- 综合等级
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '综合等级', 'overall_level', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'overall_level');

-- 环境类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '环境类型', 'environment_type', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'environment_type');

-- 消防等级
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '消防等级', 'fire_level', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'fire_level');

-- 数据维护等级
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '数据维护等级', 'data_level', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'data_level');

-- 治安等级
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '治安等级', 'security_level', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'security_level');

-- 镇街
INSERT INTO sys_dict_type (dict_name, dict_type, status, create_by, create_time)
SELECT '镇街', 'town_street', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'town_street');

-- 字典数据 - 管理者身份类别
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '业主', 'owner', 'manager_type', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'manager_type' AND dict_value = 'owner');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '托管人', 'trustee', 'manager_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'manager_type' AND dict_value = 'trustee');

-- 字典数据 - 房屋类型
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '住宅', 'residential', 'house_type', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'house_type' AND dict_value = 'residential');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '商业', 'commercial', 'house_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'house_type' AND dict_value = 'commercial');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '工业', 'industrial', 'house_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'house_type' AND dict_value = 'industrial');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 4, '城中村', 'village', 'house_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'house_type' AND dict_value = 'village');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 5, '其他', 'other', 'house_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'house_type' AND dict_value = 'other');

-- 字典数据 - 住所类型
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '自有', 'own', 'residence_type', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'residence_type' AND dict_value = 'own');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '租用', 'rented', 'residence_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'residence_type' AND dict_value = 'rented');

-- 字典数据 - 综合等级
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '绿色', 'green', 'overall_level', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'overall_level' AND dict_value = 'green');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '黄色', 'yellow', 'overall_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'overall_level' AND dict_value = 'yellow');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '红色', 'red', 'overall_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'overall_level' AND dict_value = 'red');

-- 字典数据 - 环境类型
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '城中村', 'village', 'environment_type', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'environment_type' AND dict_value = 'village');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '住宅小区', 'residential', 'environment_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'environment_type' AND dict_value = 'residential');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '其他', 'other', 'environment_type', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'environment_type' AND dict_value = 'other');

-- 字典数据 - 消防等级
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '一级', '1', 'fire_level', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'fire_level' AND dict_value = '1');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '二级', '2', 'fire_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'fire_level' AND dict_value = '2');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '三级', '3', 'fire_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'fire_level' AND dict_value = '3');

-- 字典数据 - 数据维护等级
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '一级', '1', 'data_level', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'data_level' AND dict_value = '1');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '二级', '2', 'data_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'data_level' AND dict_value = '2');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '三级', '3', 'data_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'data_level' AND dict_value = '3');

-- 字典数据 - 治安等级
INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 1, '一级', '1', 'security_level', 'Y', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'security_level' AND dict_value = '1');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 2, '二级', '2', 'security_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'security_level' AND dict_value = '2');

INSERT INTO sys_dict_data (dict_sort, dict_label, dict_value, dict_type, is_default, status, create_by, create_time)
SELECT 3, '三级', '3', 'security_level', 'N', '0', 'admin', CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'security_level' AND dict_value = '3');

-- ================================================
-- 2. 创建管理者信息表 rental_managers（如不存在）
-- ================================================
CREATE TABLE IF NOT EXISTS rental_managers (
    id BIGSERIAL PRIMARY KEY,
    manager_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    id_card VARCHAR(18),
    address VARCHAR(255),
    police_station VARCHAR(100),
    id_card_address VARCHAR(255),
    wechat VARCHAR(100),
    id_card_front_photo VARCHAR(255),
    id_card_back_photo VARCHAR(255),
    face_photo VARCHAR(255),
    status CHAR(1) DEFAULT '0',
    create_by VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_by VARCHAR(64) DEFAULT '',
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE rental_managers IS '管理者信息表';
COMMENT ON COLUMN rental_managers.manager_name IS '管理者姓名';
COMMENT ON COLUMN rental_managers.id_card_address IS '身份证登记地址';
COMMENT ON COLUMN rental_managers.wechat IS '微信号';

-- ================================================
-- 3. 修改出租屋表 rental_houses
-- ================================================

-- 添加管理者ID字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS manager_id BIGINT;

-- 添加管理者身份类别字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS manager_type VARCHAR(20);

-- 添加机构绑定字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS police_station_id BIGINT;

-- 添加网格ID字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS grid_id BIGINT;

-- 添加综合等级字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS overall_level VARCHAR(10) DEFAULT 'red';

-- 添加总楼层数字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS total_floors INT;

-- 添加总房间数字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS total_rooms INT;

-- 添加房屋类型字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS house_type VARCHAR(20);

-- 添加住所类型字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS residence_type VARCHAR(20);

-- 添加产权性质字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS property_type VARCHAR(20);

-- 添加网约房字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS is_online_rental CHAR(1) DEFAULT '0';

-- 添加门禁字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS has_access_control CHAR(1) DEFAULT '0';

-- 添加环境类型字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS environment_type VARCHAR(20);

-- 添加房间面积字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS room_area DECIMAL(10,2);

-- 添加租金字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS rent DECIMAL(10,2);

-- 添加每层房间数字段
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS rooms_per_floor INT;

-- 修改district列为town_street
ALTER TABLE rental_houses RENAME COLUMN district TO town_street;

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_rental_houses_manager_id ON rental_houses(manager_id);

-- ================================================
-- 4. 修改住户表 rental_residents
-- ================================================

-- 添加房间号字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS room_no VARCHAR(50);

-- 添加性别字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS gender VARCHAR(10);

-- 添加与户主关系字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS relationship VARCHAR(50);

-- 添加户籍地址字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS hukou_address VARCHAR(255);

-- 添加工作单位字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS workplace VARCHAR(200);

-- 添加住户构成字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS resident_composition VARCHAR(20);

-- 添加备注字段
ALTER TABLE rental_residents ADD COLUMN IF NOT EXISTS remark VARCHAR(500);

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_rental_residents_room_no ON rental_residents(room_no);

-- ================================================
-- 5. 修改人脸照片表 rental_face_photos
-- ================================================

-- 添加实际存储地址字段
ALTER TABLE rental_face_photos ADD COLUMN IF NOT EXISTS storage_path VARCHAR(500);

-- 删除旧的feature_id字段
ALTER TABLE rental_face_photos DROP COLUMN IF EXISTS feature_id;

-- 添加512维度特征向量字段
ALTER TABLE rental_face_photos ADD COLUMN IF NOT EXISTS feature_vector DOUBLE PRECISION[512];

-- ================================================
-- 6. 修改设备表 rental_devices
-- ================================================

-- 删除house_id字段
ALTER TABLE rental_devices DROP COLUMN IF EXISTS house_id;

-- 删除旧索引
DROP INDEX IF EXISTS idx_rental_devices_house_id;

-- ================================================
-- 7. 创建出租屋设备关联表 rental_house_devices
-- ================================================
CREATE TABLE IF NOT EXISTS rental_house_devices (
    id BIGSERIAL PRIMARY KEY,
    house_id BIGINT NOT NULL,
    device_id BIGINT NOT NULL,
    create_by VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_rental_house_devices_house_id ON rental_house_devices(house_id);
CREATE INDEX IF NOT EXISTS idx_rental_house_devices_device_id ON rental_house_devices(device_id);

-- ================================================
-- 8. 创建出租屋检查表 rental_house_inspections
-- ================================================
CREATE TABLE IF NOT EXISTS rental_house_inspections (
    id BIGSERIAL PRIMARY KEY,
    house_id BIGINT NOT NULL,
    inspector_id BIGINT,
    inspection_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fire_level CHAR(1),
    data_level CHAR(1),
    security_level CHAR(1),
    overall_level VARCHAR(10),
    remark VARCHAR(500),
    create_by VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_by VARCHAR(64) DEFAULT '',
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_rental_house_inspections_house_id ON rental_house_inspections(house_id);
CREATE INDEX IF NOT EXISTS idx_rental_house_inspections_inspection_time ON rental_house_inspections(inspection_time);
CREATE INDEX IF NOT EXISTS idx_rental_house_inspections_inspector_id ON rental_house_inspections(inspector_id);

-- ================================================
-- 9. 更新字段注释
-- ================================================
COMMENT ON COLUMN rental_houses.manager_id IS '管理者ID，外键';
COMMENT ON COLUMN rental_houses.manager_type IS '管理者身份类别（使用字典：manager_type）：owner=业主/trustee=托管人';
COMMENT ON COLUMN rental_houses.police_station_id IS '所属派出所ID';
COMMENT ON COLUMN rental_houses.grid_id IS '网格ID，外键';
COMMENT ON COLUMN rental_houses.overall_level IS '综合等级（使用字典：overall_level）：green-绿色 yellow-黄色 red-红色';
COMMENT ON COLUMN rental_houses.total_floors IS '总楼层数';
COMMENT ON COLUMN rental_houses.total_rooms IS '总房间数';
COMMENT ON COLUMN rental_houses.house_type IS '房屋类型（使用字典：house_type）';
COMMENT ON COLUMN rental_houses.residence_type IS '住所类型（使用字典：residence_type）';
COMMENT ON COLUMN rental_houses.property_type IS '产权性质';
COMMENT ON COLUMN rental_houses.is_online_rental IS '网约房：0=否，1=是';
COMMENT ON COLUMN rental_houses.has_access_control IS '安装门禁：0=否，1=是';
COMMENT ON COLUMN rental_houses.environment_type IS '环境类型（使用字典：environment_type）：village=城中村/residential=住宅小区/other=其他';
COMMENT ON COLUMN rental_houses.room_area IS '房间面积（平方米）';
COMMENT ON COLUMN rental_houses.rent IS '租金（元/月）';
COMMENT ON COLUMN rental_houses.rooms_per_floor IS '每层房间（间）';
COMMENT ON COLUMN rental_houses.town_street IS '镇街（使用字典：town_street）';
COMMENT ON COLUMN rental_residents.room_no IS '房间号';
COMMENT ON COLUMN rental_residents.gender IS '性别';
COMMENT ON COLUMN rental_residents.relationship IS '与户主关系';
COMMENT ON COLUMN rental_residents.hukou_address IS '户籍所在地';
COMMENT ON COLUMN rental_residents.workplace IS '工作单位';
COMMENT ON COLUMN rental_residents.resident_composition IS '住户构成';
COMMENT ON COLUMN rental_residents.remark IS '备注';
COMMENT ON COLUMN rental_face_photos.storage_path IS '实际存储地址';
COMMENT ON COLUMN rental_face_photos.feature_vector IS '512维度特征向量';

-- ================================================
-- 10. 插入版本记录
-- ================================================
DELETE FROM db_version WHERE version = '1.1.0';
INSERT INTO db_version (version, description) VALUES ('1.1.0', '2026-04-01需求变更');