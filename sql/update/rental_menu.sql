-- 出租屋管理模块菜单 SQL
-- 使用前请确保数据库中不存在这些菜单记录

-- 一级菜单：房东管理（挂系统管理下 parent_id=1）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2000, '房东管理', 1, 10, 'rental', null, '', '', 1, 0, 'M', '0', '0', '', 'house', 'admin', CURRENT_TIMESTAMP, '', null, '房东管理目录'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2000);

-- 二级菜单：房源管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2001, '房源管理', 2000, 1, 'house', 'rental/house/index', '', 'RentalHouse', 1, 0, 'C', '0', '0', 'system:rental:house:list', 'house', 'admin', CURRENT_TIMESTAMP, '', null, '房源管理菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2001);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2002, '房源新增', 2001, 1, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:add', '#', 'admin', CURRENT_TIMESTAMP, '', null, '房源新增按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2002);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2003, '房源编辑', 2001, 2, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:edit', '#', 'admin', CURRENT_TIMESTAMP, '', null, '房源编辑按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2003);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2004, '房源删除', 2001, 3, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:remove', '#', 'admin', CURRENT_TIMESTAMP, '', null, '房源删除按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2004);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2005, '房源导出', 2001, 4, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:export', '#', 'admin', CURRENT_TIMESTAMP, '', null, '房源导出按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2005);

-- 二级菜单：住户管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2010, '住户管理', 2000, 2, 'resident', 'rental/resident/index', '', 'RentalResident', 1, 0, 'C', '0', '0', 'system:rental:resident:list', 'peoples', 'admin', CURRENT_TIMESTAMP, '', null, '住户管理菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2010);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2011, '住户新增', 2010, 1, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:add', '#', 'admin', CURRENT_TIMESTAMP, '', null, '住户新增按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2011);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2012, '住户编辑', 2010, 2, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:edit', '#', 'admin', CURRENT_TIMESTAMP, '', null, '住户编辑按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2012);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2013, '住户删除', 2010, 3, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:remove', '#', 'admin', CURRENT_TIMESTAMP, '', null, '住户删除按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2013);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2014, '人脸采集', 2010, 4, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:face', '#', 'admin', CURRENT_TIMESTAMP, '', null, '人脸采集按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2014);

-- 二级菜单：通行记录
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2020, '通行记录', 2000, 3, 'accessLog', 'rental/accessLog/index', '', 'RentalAccessLog', 1, 0, 'C', '0', '0', 'system:rental:accessLog:list', 'log', 'admin', CURRENT_TIMESTAMP, '', null, '通行记录菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2020);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2021, '通行导出', 2020, 1, 'accessLog', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:accessLog:export', '#', 'admin', CURRENT_TIMESTAMP, '', null, '通行导出按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2021);

-- 二级菜单：告警管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2030, '告警管理', 2000, 4, 'alert', 'rental/alert/index', '', 'RentalAlert', 1, 0, 'C', '0', '0', 'system:rental:alert:list', 'message', 'admin', CURRENT_TIMESTAMP, '', null, '告警管理菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2030);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2031, '告警处理', 2030, 1, 'alert', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:alert:edit', '#', 'admin', CURRENT_TIMESTAMP, '', null, '告警处理按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2031);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2032, '告警核查', 2030, 2, 'alert', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:alert:verify', '#', 'admin', CURRENT_TIMESTAMP, '', null, '告警核查按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2032);

-- 二级菜单：设备管理
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2040, '设备管理', 2000, 5, 'device', 'rental/device/index', '', 'RentalDevice', 1, 0, 'C', '0', '0', 'system:rental:device:list', 'device', 'admin', CURRENT_TIMESTAMP, '', null, '设备管理菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2040);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2041, '设备新增', 2040, 1, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:add', '#', 'admin', CURRENT_TIMESTAMP, '', null, '设备新增按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2041);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2042, '设备编辑', 2040, 2, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:edit', '#', 'admin', CURRENT_TIMESTAMP, '', null, '设备编辑按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2042);

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2043, '设备删除', 2040, 3, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:remove', '#', 'admin', CURRENT_TIMESTAMP, '', null, '设备删除按钮'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2043);

-- 二级菜单：统计分析
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2050, '统计分析', 2000, 6, 'statistics', 'rental/statistics/dashboard', '', 'RentalStatistics', 1, 0, 'C', '0', '0', 'system:rental:statistics:view', 'chart', 'admin', CURRENT_TIMESTAMP, '', null, '统计分析菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2050);

-- 二级菜单：地图可视化
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT 2060, '地图可视化', 2000, 7, 'map', 'rental/map/index', '', 'RentalMap', 1, 0, 'C', '0', '0', 'system:rental:map:view', 'tree', 'admin', CURRENT_TIMESTAMP, '', null, '地图可视化菜单'
WHERE NOT EXISTS (SELECT 1 FROM sys_menu WHERE menu_id = 2060);