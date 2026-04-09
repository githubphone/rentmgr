-- ================================================
-- 出租屋管理系统 - 设备表经纬度字段扩展
-- 数据库：PostgreSQL
-- 更新日期：2026-04-06
-- ================================================

-- ----------------------------
-- 1. 给 rental_devices 表添加经纬度字段
-- ----------------------------
ALTER TABLE rental_devices ADD COLUMN IF NOT EXISTS latitude DECIMAL(10,6);
ALTER TABLE rental_devices ADD COLUMN IF NOT EXISTS longitude DECIMAL(10,6);

COMMENT ON COLUMN rental_devices.latitude IS '纬度';
COMMENT ON COLUMN rental_devices.longitude IS '经度';

-- ----------------------------
-- 2. 更新现有设备数据的经纬度（根据房屋坐标）
-- ----------------------------
UPDATE rental_devices d
SET latitude = h.latitude, longitude = h.longitude
FROM rental_house_devices hd
JOIN rental_houses h ON hd.house_id = h.id
WHERE d.id = hd.device_id
  AND (d.latitude IS NULL OR d.longitude IS NULL);

-- ----------------------------
-- 3. 更新 test 服务器上的测试设备经纬度数据
-- ----------------------------
-- 以下是测试服务器的设备经纬度数据示例（开平市水口镇坐标）
-- 设备1
UPDATE rental_devices SET latitude = 22.663456, longitude = 112.698523 WHERE device_code = 'DEVICE001';
-- 设备2
UPDATE rental_devices SET latitude = 22.665123, longitude = 112.701234 WHERE device_code = 'DEVICE002';
-- 设备3
UPDATE rental_devices SET latitude = 22.668789, longitude = 112.705678 WHERE device_code = 'DEVICE003';
-- 设备4
UPDATE rental_devices SET latitude = 22.671234, longitude = 112.708901 WHERE device_code = 'DEVICE004';
-- 设备5
UPDATE rental_devices SET latitude = 22.674567, longitude = 112.712345 WHERE device_code = 'DEVICE005';

-- 如果设备编码不是上述格式，可以根据设备名称更新
-- UPDATE rental_devices SET latitude = 22.663456, longitude = 112.698523 WHERE device_name LIKE '%测试设备1%';

COMMIT;
