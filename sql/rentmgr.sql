/*
 Navicat Premium Dump SQL

 Source Server         : postgres@192.168.64.11
 Source Server Type    : PostgreSQL
 Source Server Version : 110009 (110009)
 Source Host           : 192.168.64.11:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110009 (110009)
 File Encoding         : 65001

 Date: 04/04/2026 21:43:08
*/


-- ----------------------------
-- Sequence structure for db_version_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."db_version_id_seq";
CREATE SEQUENCE "public"."db_version_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."db_version_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for gen_table_column_column_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_column_column_id_seq";
CREATE SEQUENCE "public"."gen_table_column_column_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."gen_table_column_column_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for gen_table_table_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_table_id_seq";
CREATE SEQUENCE "public"."gen_table_table_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."gen_table_table_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_access_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_access_logs_id_seq";
CREATE SEQUENCE "public"."rental_access_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_access_logs_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_alerts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_alerts_id_seq";
CREATE SEQUENCE "public"."rental_alerts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_alerts_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_devices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_devices_id_seq";
CREATE SEQUENCE "public"."rental_devices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_devices_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_face_photos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_face_photos_id_seq";
CREATE SEQUENCE "public"."rental_face_photos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_face_photos_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_grids_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_grids_id_seq";
CREATE SEQUENCE "public"."rental_grids_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_grids_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_house_devices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_house_devices_id_seq";
CREATE SEQUENCE "public"."rental_house_devices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_house_devices_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_house_inspections_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_house_inspections_id_seq";
CREATE SEQUENCE "public"."rental_house_inspections_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_house_inspections_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_houses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_houses_id_seq";
CREATE SEQUENCE "public"."rental_houses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_houses_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_managers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_managers_id_seq";
CREATE SEQUENCE "public"."rental_managers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_managers_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_metadata_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_metadata_id_seq";
CREATE SEQUENCE "public"."rental_metadata_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_metadata_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_residents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_residents_id_seq";
CREATE SEQUENCE "public"."rental_residents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_residents_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_room_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_room_id_seq";
CREATE SEQUENCE "public"."rental_room_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_room_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for rental_verifications_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rental_verifications_id_seq";
CREATE SEQUENCE "public"."rental_verifications_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rental_verifications_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_config_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_config_config_id_seq";
CREATE SEQUENCE "public"."sys_config_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_config_config_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_dept_dept_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dept_dept_id_seq";
CREATE SEQUENCE "public"."sys_dept_dept_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_dept_dept_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_dict_data_dict_code_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_data_dict_code_seq";
CREATE SEQUENCE "public"."sys_dict_data_dict_code_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_dict_data_dict_code_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_dict_type_dict_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_type_dict_id_seq";
CREATE SEQUENCE "public"."sys_dict_type_dict_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_dict_type_dict_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_job_job_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_job_job_id_seq";
CREATE SEQUENCE "public"."sys_job_job_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_job_job_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_job_log_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_job_log_job_log_id_seq";
CREATE SEQUENCE "public"."sys_job_log_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_job_log_job_log_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_logininfor_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_logininfor_info_id_seq";
CREATE SEQUENCE "public"."sys_logininfor_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_logininfor_info_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_menu_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_menu_menu_id_seq";
CREATE SEQUENCE "public"."sys_menu_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_menu_menu_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_notice_notice_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_notice_notice_id_seq";
CREATE SEQUENCE "public"."sys_notice_notice_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_notice_notice_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_oper_log_oper_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_oper_log_oper_id_seq";
CREATE SEQUENCE "public"."sys_oper_log_oper_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_oper_log_oper_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_post_post_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_post_post_id_seq";
CREATE SEQUENCE "public"."sys_post_post_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_post_post_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_role_id_seq";
CREATE SEQUENCE "public"."sys_role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_role_role_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for sys_user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_user_user_id_seq";
CREATE SEQUENCE "public"."sys_user_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."sys_user_user_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for db_version
-- ----------------------------
DROP TABLE IF EXISTS "public"."db_version";
CREATE TABLE "public"."db_version" (
  "id" int8 NOT NULL DEFAULT nextval('db_version_id_seq'::regclass),
  "version" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "applied_at" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."db_version" OWNER TO "postgres";
COMMENT ON COLUMN "public"."db_version"."id" IS '主键ID';
COMMENT ON COLUMN "public"."db_version"."version" IS '数据库版本号';
COMMENT ON COLUMN "public"."db_version"."applied_at" IS '应用时间';
COMMENT ON COLUMN "public"."db_version"."description" IS '版本描述';
COMMENT ON TABLE "public"."db_version" IS '数据库版本表';

-- ----------------------------
-- Records of db_version
-- ----------------------------
BEGIN;
INSERT INTO "public"."db_version" ("id", "version", "applied_at", "description") VALUES (1, '1.0.0', '2026-04-01 22:24:08.403954', '初始版本');
INSERT INTO "public"."db_version" ("id", "version", "applied_at", "description") VALUES (2, '1.0.0', '2026-04-02 11:47:57.904079', '初始版本');
INSERT INTO "public"."db_version" ("id", "version", "applied_at", "description") VALUES (6, '1.1.0', '2026-04-02 11:54:20.656944', '2026-04-01需求变更');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_table";
CREATE TABLE "public"."gen_table" (
  "table_id" int8 NOT NULL DEFAULT nextval('gen_table_table_id_seq'::regclass),
  "table_name" varchar(200) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "table_comment" varchar(500) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "sub_table_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sub_table_fk_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "class_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "tpl_category" varchar(200) COLLATE "pg_catalog"."default" DEFAULT 'crud'::character varying,
  "tpl_web_type" varchar(30) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "package_name" varchar(100) COLLATE "pg_catalog"."default",
  "module_name" varchar(30) COLLATE "pg_catalog"."default",
  "business_name" varchar(30) COLLATE "pg_catalog"."default",
  "function_name" varchar(50) COLLATE "pg_catalog"."default",
  "function_author" varchar(50) COLLATE "pg_catalog"."default",
  "gen_type" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "gen_path" varchar(200) COLLATE "pg_catalog"."default" DEFAULT '/'::character varying,
  "options" varchar(1000) COLLATE "pg_catalog"."default",
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."gen_table" OWNER TO "postgres";
COMMENT ON COLUMN "public"."gen_table"."table_id" IS '编号';
COMMENT ON COLUMN "public"."gen_table"."table_name" IS '表名称';
COMMENT ON COLUMN "public"."gen_table"."table_comment" IS '表描述';
COMMENT ON COLUMN "public"."gen_table"."sub_table_name" IS '关联子表的表名';
COMMENT ON COLUMN "public"."gen_table"."sub_table_fk_name" IS '子表关联的外键名';
COMMENT ON COLUMN "public"."gen_table"."class_name" IS '实体类名称';
COMMENT ON COLUMN "public"."gen_table"."tpl_category" IS '使用的模板（crud单表操作 tree树表操作）';
COMMENT ON COLUMN "public"."gen_table"."tpl_web_type" IS '前端模板类型（element-ui模版 element-plus模版）';
COMMENT ON COLUMN "public"."gen_table"."package_name" IS '生成包路径';
COMMENT ON COLUMN "public"."gen_table"."module_name" IS '生成模块名';
COMMENT ON COLUMN "public"."gen_table"."business_name" IS '生成业务名';
COMMENT ON COLUMN "public"."gen_table"."function_name" IS '生成功能名';
COMMENT ON COLUMN "public"."gen_table"."function_author" IS '生成功能作者';
COMMENT ON COLUMN "public"."gen_table"."gen_type" IS '生成代码方式（0zip压缩包 1自定义路径）';
COMMENT ON COLUMN "public"."gen_table"."gen_path" IS '生成路径（不填默认项目路径）';
COMMENT ON COLUMN "public"."gen_table"."options" IS '其它生成选项';
COMMENT ON COLUMN "public"."gen_table"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."gen_table"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_table"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."gen_table"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."gen_table"."remark" IS '备注';
COMMENT ON TABLE "public"."gen_table" IS '代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_table_column";
CREATE TABLE "public"."gen_table_column" (
  "column_id" int8 NOT NULL DEFAULT nextval('gen_table_column_column_id_seq'::regclass),
  "table_id" int8,
  "column_name" varchar(200) COLLATE "pg_catalog"."default",
  "column_comment" varchar(500) COLLATE "pg_catalog"."default",
  "column_type" varchar(100) COLLATE "pg_catalog"."default",
  "java_type" varchar(500) COLLATE "pg_catalog"."default",
  "java_field" varchar(200) COLLATE "pg_catalog"."default",
  "is_pk" char(1) COLLATE "pg_catalog"."default",
  "is_increment" char(1) COLLATE "pg_catalog"."default",
  "is_required" char(1) COLLATE "pg_catalog"."default",
  "is_insert" char(1) COLLATE "pg_catalog"."default",
  "is_edit" char(1) COLLATE "pg_catalog"."default",
  "is_list" char(1) COLLATE "pg_catalog"."default",
  "is_query" char(1) COLLATE "pg_catalog"."default",
  "query_type" varchar(200) COLLATE "pg_catalog"."default" DEFAULT 'EQ'::character varying,
  "html_type" varchar(200) COLLATE "pg_catalog"."default",
  "dict_type" varchar(200) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "sort" int4,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6)
)
;
ALTER TABLE "public"."gen_table_column" OWNER TO "postgres";
COMMENT ON COLUMN "public"."gen_table_column"."column_id" IS '编号';
COMMENT ON COLUMN "public"."gen_table_column"."table_id" IS '归属表编号';
COMMENT ON COLUMN "public"."gen_table_column"."column_name" IS '列名称';
COMMENT ON COLUMN "public"."gen_table_column"."column_comment" IS '列描述';
COMMENT ON COLUMN "public"."gen_table_column"."column_type" IS '列类型';
COMMENT ON COLUMN "public"."gen_table_column"."java_type" IS 'JAVA类型';
COMMENT ON COLUMN "public"."gen_table_column"."java_field" IS 'JAVA字段名';
COMMENT ON COLUMN "public"."gen_table_column"."is_pk" IS '是否主键（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_increment" IS '是否自增（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_required" IS '是否必填（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_insert" IS '是否为插入字段（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_edit" IS '是否编辑字段（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_list" IS '是否列表字段（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."is_query" IS '是否查询字段（1是）';
COMMENT ON COLUMN "public"."gen_table_column"."query_type" IS '查询方式（等于、不等于、大于、小于、范围）';
COMMENT ON COLUMN "public"."gen_table_column"."html_type" IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
COMMENT ON COLUMN "public"."gen_table_column"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."gen_table_column"."sort" IS '排序';
COMMENT ON COLUMN "public"."gen_table_column"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."gen_table_column"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_table_column"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."gen_table_column"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."gen_table_column" IS '代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_blob_triggers";
CREATE TABLE "public"."qrtz_blob_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "blob_data" bytea
)
;
ALTER TABLE "public"."qrtz_blob_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_blob_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_blob_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "public"."qrtz_blob_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "public"."qrtz_blob_triggers"."blob_data" IS '存放持久化Trigger对象';
COMMENT ON TABLE "public"."qrtz_blob_triggers" IS 'Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_calendars";
CREATE TABLE "public"."qrtz_calendars" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "calendar_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "calendar" bytea NOT NULL
)
;
ALTER TABLE "public"."qrtz_calendars" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_calendars"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_calendars"."calendar_name" IS '日历名称';
COMMENT ON COLUMN "public"."qrtz_calendars"."calendar" IS '存放持久化calendar对象';
COMMENT ON TABLE "public"."qrtz_calendars" IS '日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_cron_triggers";
CREATE TABLE "public"."qrtz_cron_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "time_zone_id" varchar(80) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."qrtz_cron_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_cron_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_cron_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "public"."qrtz_cron_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "public"."qrtz_cron_triggers"."cron_expression" IS 'cron表达式';
COMMENT ON COLUMN "public"."qrtz_cron_triggers"."time_zone_id" IS '时区';
COMMENT ON TABLE "public"."qrtz_cron_triggers" IS 'Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_fired_triggers";
CREATE TABLE "public"."qrtz_fired_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "entry_id" varchar(95) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "instance_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "fired_time" int8 NOT NULL,
  "sched_time" int8 NOT NULL,
  "priority" int4 NOT NULL,
  "state" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default",
  "job_group" varchar(200) COLLATE "pg_catalog"."default",
  "is_nonconcurrent" varchar(1) COLLATE "pg_catalog"."default",
  "requests_recovery" varchar(1) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."qrtz_fired_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."entry_id" IS '调度器实例id';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."instance_name" IS '调度器实例名';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."fired_time" IS '触发的时间';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."sched_time" IS '定时器制定的时间';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."priority" IS '优先级';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."state" IS '状态';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."is_nonconcurrent" IS '是否并发';
COMMENT ON COLUMN "public"."qrtz_fired_triggers"."requests_recovery" IS '是否接受恢复执行';
COMMENT ON TABLE "public"."qrtz_fired_triggers" IS '已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_job_details";
CREATE TABLE "public"."qrtz_job_details" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(250) COLLATE "pg_catalog"."default",
  "job_class_name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "is_durable" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "is_nonconcurrent" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "is_update_data" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "requests_recovery" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "job_data" bytea
)
;
ALTER TABLE "public"."qrtz_job_details" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_job_details"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_job_details"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."qrtz_job_details"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."qrtz_job_details"."description" IS '相关介绍';
COMMENT ON COLUMN "public"."qrtz_job_details"."job_class_name" IS '执行任务类名称';
COMMENT ON COLUMN "public"."qrtz_job_details"."is_durable" IS '是否持久化';
COMMENT ON COLUMN "public"."qrtz_job_details"."is_nonconcurrent" IS '是否并发';
COMMENT ON COLUMN "public"."qrtz_job_details"."is_update_data" IS '是否更新数据';
COMMENT ON COLUMN "public"."qrtz_job_details"."requests_recovery" IS '是否接受恢复执行';
COMMENT ON COLUMN "public"."qrtz_job_details"."job_data" IS '存放持久化job对象';
COMMENT ON TABLE "public"."qrtz_job_details" IS '任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_locks";
CREATE TABLE "public"."qrtz_locks" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "lock_name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."qrtz_locks" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_locks"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_locks"."lock_name" IS '悲观锁名称';
COMMENT ON TABLE "public"."qrtz_locks" IS '存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_paused_trigger_grps";
CREATE TABLE "public"."qrtz_paused_trigger_grps" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."qrtz_paused_trigger_grps" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_paused_trigger_grps"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_paused_trigger_grps"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON TABLE "public"."qrtz_paused_trigger_grps" IS '暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_scheduler_state";
CREATE TABLE "public"."qrtz_scheduler_state" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "instance_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "last_checkin_time" int8 NOT NULL,
  "checkin_interval" int8 NOT NULL
)
;
ALTER TABLE "public"."qrtz_scheduler_state" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_scheduler_state"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_scheduler_state"."instance_name" IS '实例名称';
COMMENT ON COLUMN "public"."qrtz_scheduler_state"."last_checkin_time" IS '上次检查时间';
COMMENT ON COLUMN "public"."qrtz_scheduler_state"."checkin_interval" IS '检查间隔时间';
COMMENT ON TABLE "public"."qrtz_scheduler_state" IS '调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_simple_triggers";
CREATE TABLE "public"."qrtz_simple_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "repeat_count" int8 NOT NULL,
  "repeat_interval" int8 NOT NULL,
  "times_triggered" int8 NOT NULL
)
;
ALTER TABLE "public"."qrtz_simple_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."repeat_count" IS '重复的次数统计';
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."repeat_interval" IS '重复的间隔时间';
COMMENT ON COLUMN "public"."qrtz_simple_triggers"."times_triggered" IS '已经触发的次数';
COMMENT ON TABLE "public"."qrtz_simple_triggers" IS '简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_simprop_triggers";
CREATE TABLE "public"."qrtz_simprop_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "str_prop_1" varchar(512) COLLATE "pg_catalog"."default",
  "str_prop_2" varchar(512) COLLATE "pg_catalog"."default",
  "str_prop_3" varchar(512) COLLATE "pg_catalog"."default",
  "int_prop_1" int4,
  "int_prop_2" int4,
  "long_prop_1" int8,
  "long_prop_2" int8,
  "dec_prop_1" numeric(13,4),
  "dec_prop_2" numeric(13,4),
  "bool_prop_1" varchar(1) COLLATE "pg_catalog"."default",
  "bool_prop_2" varchar(1) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."qrtz_simprop_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."trigger_name" IS 'qrtz_triggers表trigger_name的外键';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."trigger_group" IS 'qrtz_triggers表trigger_group的外键';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."str_prop_1" IS 'String类型的trigger的第一个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."str_prop_2" IS 'String类型的trigger的第二个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."str_prop_3" IS 'String类型的trigger的第三个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."int_prop_1" IS 'int类型的trigger的第一个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."int_prop_2" IS 'int类型的trigger的第二个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."long_prop_1" IS 'long类型的trigger的第一个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."long_prop_2" IS 'long类型的trigger的第二个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."dec_prop_1" IS 'decimal类型的trigger的第一个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."dec_prop_2" IS 'decimal类型的trigger的第二个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."bool_prop_1" IS 'Boolean类型的trigger的第一个参数';
COMMENT ON COLUMN "public"."qrtz_simprop_triggers"."bool_prop_2" IS 'Boolean类型的trigger的第二个参数';
COMMENT ON TABLE "public"."qrtz_simprop_triggers" IS '同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_triggers";
CREATE TABLE "public"."qrtz_triggers" (
  "sched_name" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(250) COLLATE "pg_catalog"."default",
  "next_fire_time" int8,
  "prev_fire_time" int8,
  "priority" int4,
  "trigger_state" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_type" varchar(8) COLLATE "pg_catalog"."default" NOT NULL,
  "start_time" int8 NOT NULL,
  "end_time" int8,
  "calendar_name" varchar(200) COLLATE "pg_catalog"."default",
  "misfire_instr" int2,
  "job_data" bytea
)
;
ALTER TABLE "public"."qrtz_triggers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."qrtz_triggers"."sched_name" IS '调度名称';
COMMENT ON COLUMN "public"."qrtz_triggers"."trigger_name" IS '触发器的名字';
COMMENT ON COLUMN "public"."qrtz_triggers"."trigger_group" IS '触发器所属组的名字';
COMMENT ON COLUMN "public"."qrtz_triggers"."job_name" IS 'qrtz_job_details表job_name的外键';
COMMENT ON COLUMN "public"."qrtz_triggers"."job_group" IS 'qrtz_job_details表job_group的外键';
COMMENT ON COLUMN "public"."qrtz_triggers"."description" IS '相关介绍';
COMMENT ON COLUMN "public"."qrtz_triggers"."next_fire_time" IS '上一次触发时间（毫秒）';
COMMENT ON COLUMN "public"."qrtz_triggers"."prev_fire_time" IS '下一次触发时间（默认为-1表示不触发）';
COMMENT ON COLUMN "public"."qrtz_triggers"."priority" IS '优先级';
COMMENT ON COLUMN "public"."qrtz_triggers"."trigger_state" IS '触发器状态';
COMMENT ON COLUMN "public"."qrtz_triggers"."trigger_type" IS '触发器的类型';
COMMENT ON COLUMN "public"."qrtz_triggers"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."qrtz_triggers"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."qrtz_triggers"."calendar_name" IS '日程表名称';
COMMENT ON COLUMN "public"."qrtz_triggers"."misfire_instr" IS '补偿执行的策略';
COMMENT ON COLUMN "public"."qrtz_triggers"."job_data" IS '存放持久化job对象';
COMMENT ON TABLE "public"."qrtz_triggers" IS '触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_access_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_access_logs";
CREATE TABLE "public"."rental_access_logs" (
  "id" int8 NOT NULL DEFAULT nextval('rental_access_logs_id_seq'::regclass),
  "house_id" int8,
  "device_id" varchar(100) COLLATE "pg_catalog"."default",
  "capture_time" timestamp(6),
  "photo_url" varchar(500) COLLATE "pg_catalog"."default",
  "face_id" varchar(100) COLLATE "pg_catalog"."default",
  "confidence" numeric(5,4),
  "is_stranger" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "is_verified" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_access_logs" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_access_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_access_logs"."house_id" IS '房屋ID';
COMMENT ON COLUMN "public"."rental_access_logs"."device_id" IS '设备ID';
COMMENT ON COLUMN "public"."rental_access_logs"."capture_time" IS '抓拍时间';
COMMENT ON COLUMN "public"."rental_access_logs"."photo_url" IS '抓拍照片URL';
COMMENT ON COLUMN "public"."rental_access_logs"."face_id" IS '人脸ID';
COMMENT ON COLUMN "public"."rental_access_logs"."confidence" IS '比对置信度';
COMMENT ON COLUMN "public"."rental_access_logs"."is_stranger" IS '是否陌生人（0否 1是）';
COMMENT ON COLUMN "public"."rental_access_logs"."is_verified" IS '是否已认证（0否 1是）';
COMMENT ON TABLE "public"."rental_access_logs" IS '通行记录表';

-- ----------------------------
-- Records of rental_access_logs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_alerts
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_alerts";
CREATE TABLE "public"."rental_alerts" (
  "id" int8 NOT NULL DEFAULT nextval('rental_alerts_id_seq'::regclass),
  "access_log_id" int8,
  "house_id" int8,
  "alert_type" varchar(20) COLLATE "pg_catalog"."default",
  "alert_level" varchar(10) COLLATE "pg_catalog"."default",
  "photo_url" varchar(500) COLLATE "pg_catalog"."default",
  "capture_time" timestamp(6),
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "handler_id" int8,
  "handle_time" timestamp(6),
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_alerts" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_alerts"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_alerts"."access_log_id" IS '通行记录ID';
COMMENT ON COLUMN "public"."rental_alerts"."house_id" IS '房屋ID';
COMMENT ON COLUMN "public"."rental_alerts"."alert_type" IS '告警类型（使用字典：alert_type）：stranger=陌生人告警/abnormal=异常行为告警/device_offline=设备离线告警';
COMMENT ON COLUMN "public"."rental_alerts"."alert_level" IS '告警级别';
COMMENT ON COLUMN "public"."rental_alerts"."photo_url" IS '告警照片URL';
COMMENT ON COLUMN "public"."rental_alerts"."capture_time" IS '抓拍时间';
COMMENT ON COLUMN "public"."rental_alerts"."status" IS '状态（使用字典：alert_status）：pending=待处理/processing=处理中/resolved=已解决/ignored=已忽略';
COMMENT ON COLUMN "public"."rental_alerts"."handler_id" IS '处理人ID';
COMMENT ON COLUMN "public"."rental_alerts"."handle_time" IS '处理时间';
COMMENT ON TABLE "public"."rental_alerts" IS '告警记录表';

-- ----------------------------
-- Records of rental_alerts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_devices
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_devices";
CREATE TABLE "public"."rental_devices" (
  "id" int8 NOT NULL DEFAULT nextval('rental_devices_id_seq'::regclass),
  "device_code" varchar(100) COLLATE "pg_catalog"."default",
  "device_name" varchar(100) COLLATE "pg_catalog"."default",
  "device_type" varchar(20) COLLATE "pg_catalog"."default",
  "location" varchar(200) COLLATE "pg_catalog"."default",
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "last_heartbeat" timestamp(6),
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "alarm_subscribed" varchar(1) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "metadata_subscribed" varchar(1) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "latitude" decimal(10,6) COLLATE "pg_catalog"."default",
  "longitude" decimal(10,6) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."rental_devices" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_devices"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_devices"."device_code" IS '设备编码';
COMMENT ON COLUMN "public"."rental_devices"."device_name" IS '设备名称';
COMMENT ON COLUMN "public"."rental_devices"."device_type" IS '设备类型';
COMMENT ON COLUMN "public"."rental_devices"."location" IS '安装位置';
COMMENT ON COLUMN "public"."rental_devices"."ip_address" IS 'IP地址';
COMMENT ON COLUMN "public"."rental_devices"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."rental_devices"."last_heartbeat" IS '最后心跳时间';
COMMENT ON COLUMN "public"."rental_devices"."latitude" IS '纬度';
COMMENT ON COLUMN "public"."rental_devices"."longitude" IS '经度';
COMMENT ON TABLE "public"."rental_devices" IS '设备信息表';

-- ----------------------------
-- Records of rental_devices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_face_photos
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_face_photos";
CREATE TABLE "public"."rental_face_photos" (
  "id" int8 NOT NULL DEFAULT nextval('rental_face_photos_id_seq'::regclass),
  "resident_id" int8,
  "photo_url" varchar(500) COLLATE "pg_catalog"."default",
  "is_verified" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "storage_path" varchar(500) COLLATE "pg_catalog"."default",
  "feature_vector" float8[]
)
;
ALTER TABLE "public"."rental_face_photos" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_face_photos"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_face_photos"."resident_id" IS '住户ID';
COMMENT ON COLUMN "public"."rental_face_photos"."photo_url" IS '照片URL';
COMMENT ON COLUMN "public"."rental_face_photos"."is_verified" IS '是否已验证（0否 1是）';
COMMENT ON COLUMN "public"."rental_face_photos"."storage_path" IS '实际存储地址';
COMMENT ON COLUMN "public"."rental_face_photos"."feature_vector" IS '512维度特征向量';
COMMENT ON TABLE "public"."rental_face_photos" IS '人脸照片表';

-- ----------------------------
-- Records of rental_face_photos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_grids
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_grids";
CREATE TABLE "public"."rental_grids" (
  "id" int8 NOT NULL DEFAULT nextval('rental_grids_id_seq'::regclass),
  "grid_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "grid_name" varchar(100) COLLATE "pg_catalog"."default",
  "town_street" varchar(100) COLLATE "pg_catalog"."default",
  "village_committee" varchar(100) COLLATE "pg_catalog"."default",
  "latitude" numeric(10,6),
  "longitude" numeric(10,6),
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_grids" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_grids"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_grids"."grid_code" IS '网格编码';
COMMENT ON COLUMN "public"."rental_grids"."grid_name" IS '网格名称';
COMMENT ON COLUMN "public"."rental_grids"."town_street" IS '镇街（使用字典：town_street）';
COMMENT ON COLUMN "public"."rental_grids"."village_committee" IS '所属村委';
COMMENT ON COLUMN "public"."rental_grids"."latitude" IS '纬度坐标';
COMMENT ON COLUMN "public"."rental_grids"."longitude" IS '经度坐标';
COMMENT ON COLUMN "public"."rental_grids"."remark" IS '备注';
COMMENT ON COLUMN "public"."rental_grids"."status" IS '状态：0=停用，1=启用';
COMMENT ON COLUMN "public"."rental_grids"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."rental_grids"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."rental_grids"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."rental_grids"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."rental_grids" IS '网格信息表';

-- ----------------------------
-- Records of rental_grids
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_house_devices
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_house_devices";
CREATE TABLE "public"."rental_house_devices" (
  "id" int8 NOT NULL DEFAULT nextval('rental_house_devices_id_seq'::regclass),
  "house_id" int8 NOT NULL,
  "device_id" int8 NOT NULL,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_house_devices" OWNER TO "postgres";

-- ----------------------------
-- Records of rental_house_devices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_house_inspections
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_house_inspections";
CREATE TABLE "public"."rental_house_inspections" (
  "id" int8 NOT NULL DEFAULT nextval('rental_house_inspections_id_seq'::regclass),
  "house_id" int8 NOT NULL,
  "inspector_id" int8,
  "inspection_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "fire_level" char(1) COLLATE "pg_catalog"."default",
  "data_level" char(1) COLLATE "pg_catalog"."default",
  "security_level" char(1) COLLATE "pg_catalog"."default",
  "overall_level" varchar(10) COLLATE "pg_catalog"."default",
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_house_inspections" OWNER TO "postgres";

-- ----------------------------
-- Records of rental_house_inspections
-- ----------------------------
BEGIN;
INSERT INTO "public"."rental_house_inspections" ("id", "house_id", "inspector_id", "inspection_time", "fire_level", "data_level", "security_level", "overall_level", "remark", "create_by", "create_time", "update_by", "update_time") VALUES (7, 1, NULL, '2026-04-04 21:41:01', '1', '2', '2', 'red', NULL, '', '2026-04-02 15:54:52.488695', '', '2026-04-02 15:54:52.488695');
COMMIT;

-- ----------------------------
-- Table structure for rental_houses
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_houses";
CREATE TABLE "public"."rental_houses" (
  "id" int8 NOT NULL DEFAULT nextval('rental_houses_id_seq'::regclass),
  "address" varchar(500) COLLATE "pg_catalog"."default",
  "latitude" numeric(10,6),
  "longitude" numeric(10,6),
  "town_street" varchar(100) COLLATE "pg_catalog"."default",
  "building" varchar(50) COLLATE "pg_catalog"."default",
  "unit" varchar(50) COLLATE "pg_catalog"."default",
  "floor" varchar(20) COLLATE "pg_catalog"."default",
  "room_no" varchar(50) COLLATE "pg_catalog"."default",
  "owner_name" varchar(100) COLLATE "pg_catalog"."default",
  "owner_phone" varchar(20) COLLATE "pg_catalog"."default",
  "device_id" varchar(100) COLLATE "pg_catalog"."default",
  "device_location" varchar(200) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(64) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "front_photo" varchar(500) COLLATE "pg_catalog"."default",
  "side_photo" varchar(500) COLLATE "pg_catalog"."default",
  "surrounding_photo" varchar(500) COLLATE "pg_catalog"."default",
  "manager_id" int8,
  "manager_type" varchar(20) COLLATE "pg_catalog"."default",
  "police_station_id" int8,
  "grid_id" int8,
  "overall_level" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'red'::character varying,
  "total_floors" int4,
  "total_rooms" int4,
  "house_type" varchar(20) COLLATE "pg_catalog"."default",
  "residence_type" varchar(20) COLLATE "pg_catalog"."default",
  "property_type" varchar(20) COLLATE "pg_catalog"."default",
  "is_online_rental" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "has_access_control" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "environment_type" varchar(20) COLLATE "pg_catalog"."default",
  "room_area" numeric(10,2),
  "rent" numeric(10,2),
  "rooms_per_floor" int4,
  "district" varchar(100) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."rental_houses" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_houses"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_houses"."address" IS '详细地址';
COMMENT ON COLUMN "public"."rental_houses"."latitude" IS '纬度';
COMMENT ON COLUMN "public"."rental_houses"."longitude" IS '经度';
COMMENT ON COLUMN "public"."rental_houses"."town_street" IS '镇街（使用字典：town_street）';
COMMENT ON COLUMN "public"."rental_houses"."building" IS '楼栋';
COMMENT ON COLUMN "public"."rental_houses"."unit" IS '单元';
COMMENT ON COLUMN "public"."rental_houses"."floor" IS '楼层';
COMMENT ON COLUMN "public"."rental_houses"."room_no" IS '房号';
COMMENT ON COLUMN "public"."rental_houses"."owner_name" IS '房东姓名';
COMMENT ON COLUMN "public"."rental_houses"."owner_phone" IS '房东电话';
COMMENT ON COLUMN "public"."rental_houses"."device_id" IS '设备ID';
COMMENT ON COLUMN "public"."rental_houses"."device_location" IS '设备位置';
COMMENT ON COLUMN "public"."rental_houses"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."rental_houses"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."rental_houses"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."rental_houses"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."rental_houses"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."rental_houses"."manager_id" IS '管理者ID，外键';
COMMENT ON COLUMN "public"."rental_houses"."manager_type" IS '管理者身份类别（使用字典：manager_type）：owner=业主/trustee=托管人';
COMMENT ON COLUMN "public"."rental_houses"."police_station_id" IS '所属派出所ID';
COMMENT ON COLUMN "public"."rental_houses"."grid_id" IS '网格ID，外键';
COMMENT ON COLUMN "public"."rental_houses"."overall_level" IS '综合等级（使用字典：overall_level）：green-绿色 yellow-黄色 red-红色';
COMMENT ON COLUMN "public"."rental_houses"."total_floors" IS '总楼层数';
COMMENT ON COLUMN "public"."rental_houses"."total_rooms" IS '总房间数';
COMMENT ON COLUMN "public"."rental_houses"."house_type" IS '房屋类型（使用字典：house_type）';
COMMENT ON COLUMN "public"."rental_houses"."residence_type" IS '住所类型（使用字典：residence_type）';
COMMENT ON COLUMN "public"."rental_houses"."property_type" IS '产权性质';
COMMENT ON COLUMN "public"."rental_houses"."is_online_rental" IS '网约房：0=否，1=是';
COMMENT ON COLUMN "public"."rental_houses"."has_access_control" IS '安装门禁：0=否，1=是';
COMMENT ON COLUMN "public"."rental_houses"."environment_type" IS '环境类型（使用字典：environment_type）：village=城中村/residential=住宅小区/other=其他';
COMMENT ON COLUMN "public"."rental_houses"."room_area" IS '房间面积（平方米）';
COMMENT ON COLUMN "public"."rental_houses"."rent" IS '租金（元/月）';
COMMENT ON COLUMN "public"."rental_houses"."rooms_per_floor" IS '每层房间（间）';
COMMENT ON TABLE "public"."rental_houses" IS '出租屋信息表';

-- ----------------------------
-- Records of rental_houses
-- ----------------------------
BEGIN;
INSERT INTO "public"."rental_houses" ("id", "address", "latitude", "longitude", "town_street", "building", "unit", "floor", "room_no", "owner_name", "owner_phone", "device_id", "device_location", "status", "create_by", "create_time", "update_by", "update_time", "front_photo", "side_photo", "surrounding_photo", "manager_id", "manager_type", "police_station_id", "grid_id", "overall_level", "total_floors", "total_rooms", "house_type", "residence_type", "property_type", "is_online_rental", "has_access_control", "environment_type", "room_area", "rent", "rooms_per_floor", "district") VALUES (1, '开平市水口镇', 22.400920, 112.720273, '水口镇', '2号1幢', '23423', '2', NULL, '张三', '13600351234', NULL, NULL, '1', NULL, '2026-03-27 12:58:43.693804', NULL, '2026-04-02 15:54:52.508282', NULL, NULL, NULL, 1, NULL, 1, NULL, 'red', 1, 1, NULL, NULL, NULL, '0', '0', NULL, 20.00, 200.00, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for rental_managers
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_managers";
CREATE TABLE "public"."rental_managers" (
  "id" int8 NOT NULL DEFAULT nextval('rental_managers_id_seq'::regclass),
  "manager_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "id_card" varchar(18) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "id_card_address" varchar(255) COLLATE "pg_catalog"."default",
  "wechat" varchar(100) COLLATE "pg_catalog"."default",
  "id_card_front_photo" varchar(255) COLLATE "pg_catalog"."default",
  "id_card_back_photo" varchar(255) COLLATE "pg_catalog"."default",
  "face_photo" varchar(255) COLLATE "pg_catalog"."default",
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "identity" varchar(50) COLLATE "pg_catalog"."default",
  "user_id" int8
)
;
ALTER TABLE "public"."rental_managers" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_managers"."manager_name" IS '管理者姓名';
COMMENT ON COLUMN "public"."rental_managers"."id_card_address" IS '身份证登记地址';
COMMENT ON COLUMN "public"."rental_managers"."wechat" IS '微信号';
COMMENT ON TABLE "public"."rental_managers" IS '管理者信息表';

-- ----------------------------
-- Records of rental_managers
-- ----------------------------
BEGIN;
INSERT INTO "public"."rental_managers" ("id", "manager_name", "phone", "id_card", "address", "id_card_address", "wechat", "id_card_front_photo", "id_card_back_photo", "face_photo", "create_by", "create_time", "update_by", "update_time", "identity", "user_id") VALUES (1, '测试', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2026-04-02 15:01:42.252291', '', '2026-04-02 15:01:42.252291', 'owner', NULL);
COMMIT;

-- ----------------------------
-- Table structure for rental_metadata
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_metadata";
CREATE TABLE "public"."rental_metadata" (
  "id" int8 NOT NULL DEFAULT nextval('rental_metadata_id_seq'::regclass),
  "device_id" varchar(100) COLLATE "pg_catalog"."default",
  "metadata_type" varchar(50) COLLATE "pg_catalog"."default",
  "capture_url" varchar(500) COLLATE "pg_catalog"."default",
  "detect_url" varchar(500) COLLATE "pg_catalog"."default",
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "attributes" jsonb,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_metadata" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_metadata"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_metadata"."device_id" IS '设备ID';
COMMENT ON COLUMN "public"."rental_metadata"."metadata_type" IS '元数据类型';
COMMENT ON COLUMN "public"."rental_metadata"."capture_url" IS '抓拍图片URL';
COMMENT ON COLUMN "public"."rental_metadata"."detect_url" IS '小图URL';
COMMENT ON COLUMN "public"."rental_metadata"."description" IS '描述';
COMMENT ON COLUMN "public"."rental_metadata"."attributes" IS '其他属性';
COMMENT ON COLUMN "public"."rental_metadata"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."rental_metadata" IS '元数据记录表';

-- ----------------------------
-- Records of rental_metadata
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rental_residents
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_residents";
CREATE TABLE "public"."rental_residents" (
  "id" int8 NOT NULL DEFAULT nextval('rental_residents_id_seq'::regclass),
  "house_id" int8,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "id_card" varchar(20) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "face_id" varchar(100) COLLATE "pg_catalog"."default",
  "resident_type" varchar(20) COLLATE "pg_catalog"."default",
  "check_in_date" date,
  "check_out_date" date,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" varchar(64) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "room_id" int8,
  "room_no" varchar(50) COLLATE "pg_catalog"."default",
  "gender" varchar(10) COLLATE "pg_catalog"."default",
  "relationship" varchar(50) COLLATE "pg_catalog"."default",
  "hukou_address" varchar(255) COLLATE "pg_catalog"."default",
  "workplace" varchar(200) COLLATE "pg_catalog"."default",
  "resident_composition" varchar(20) COLLATE "pg_catalog"."default",
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."rental_residents" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_residents"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_residents"."house_id" IS '所属房屋ID';
COMMENT ON COLUMN "public"."rental_residents"."name" IS '承租人姓名';
COMMENT ON COLUMN "public"."rental_residents"."id_card" IS '身份证号码';
COMMENT ON COLUMN "public"."rental_residents"."phone" IS '电话号码';
COMMENT ON COLUMN "public"."rental_residents"."face_id" IS '人脸表ID，外键';
COMMENT ON COLUMN "public"."rental_residents"."resident_type" IS '类型（使用字典：resident_type）：owner=业主/tenant=租户/family=家属';
COMMENT ON COLUMN "public"."rental_residents"."check_in_date" IS '入住日期';
COMMENT ON COLUMN "public"."rental_residents"."check_out_date" IS '退房日期';
COMMENT ON COLUMN "public"."rental_residents"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."rental_residents"."room_no" IS '房间号';
COMMENT ON COLUMN "public"."rental_residents"."gender" IS '性别';
COMMENT ON COLUMN "public"."rental_residents"."relationship" IS '与户主关系';
COMMENT ON COLUMN "public"."rental_residents"."hukou_address" IS '户籍所在地';
COMMENT ON COLUMN "public"."rental_residents"."workplace" IS '工作单位';
COMMENT ON COLUMN "public"."rental_residents"."resident_composition" IS '住户构成';
COMMENT ON COLUMN "public"."rental_residents"."remark" IS '备注';
COMMENT ON TABLE "public"."rental_residents" IS '住户信息表';

-- ----------------------------
-- Records of rental_residents
-- ----------------------------
BEGIN;
INSERT INTO "public"."rental_residents" ("id", "house_id", "name", "id_card", "phone", "face_id", "resident_type", "check_in_date", "check_out_date", "status", "create_by", "create_time", "update_by", "update_time", "room_id", "room_no", "gender", "relationship", "hukou_address", "workplace", "resident_composition", "remark") VALUES (1, 1, '沙发发', '440783198102057233', '13600351234', NULL, 'tenant', NULL, NULL, '1', NULL, '2026-03-27 12:59:26.064422', NULL, '2026-03-27 12:59:26.064422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."rental_residents" ("id", "house_id", "name", "id_card", "phone", "face_id", "resident_type", "check_in_date", "check_out_date", "status", "create_by", "create_time", "update_by", "update_time", "room_id", "room_no", "gender", "relationship", "hukou_address", "workplace", "resident_composition", "remark") VALUES (34, 1, '李四', '440783198101017238', NULL, NULL, 'tenant', '2026-03-28', NULL, '2', NULL, '2026-03-27 16:02:59.348234', NULL, '2026-03-27 16:03:17.017799', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for rental_room
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_room";
CREATE TABLE "public"."rental_room" (
  "id" int8 NOT NULL DEFAULT nextval('rental_room_id_seq'::regclass),
  "house_id" int8 NOT NULL,
  "room_no" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "floor" varchar(20) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
ALTER TABLE "public"."rental_room" OWNER TO "postgres";

-- ----------------------------
-- Records of rental_room
-- ----------------------------
BEGIN;
INSERT INTO "public"."rental_room" ("id", "house_id", "room_no", "floor", "status", "remark", "create_by", "create_time", "update_by", "update_time") VALUES (1, 1, '101', '1', '1', NULL, NULL, '2026-03-27 16:02:36.751481', NULL, '2026-03-27 16:03:33.383852');
COMMIT;

-- ----------------------------
-- Table structure for rental_verifications
-- ----------------------------
DROP TABLE IF EXISTS "public"."rental_verifications";
CREATE TABLE "public"."rental_verifications" (
  "id" int8 NOT NULL DEFAULT nextval('rental_verifications_id_seq'::regclass),
  "alert_id" int8,
  "verifier_id" int8,
  "verify_type" varchar(20) COLLATE "pg_catalog"."default",
  "verify_result" varchar(20) COLLATE "pg_catalog"."default",
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "verified_at" timestamp(6),
  "create_by" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "public"."rental_verifications" OWNER TO "postgres";
COMMENT ON COLUMN "public"."rental_verifications"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rental_verifications"."alert_id" IS '告警ID';
COMMENT ON COLUMN "public"."rental_verifications"."verifier_id" IS '核查人ID';
COMMENT ON COLUMN "public"."rental_verifications"."verify_type" IS '核查方式';
COMMENT ON COLUMN "public"."rental_verifications"."verify_result" IS '核查结果';
COMMENT ON COLUMN "public"."rental_verifications"."remark" IS '备注';
COMMENT ON COLUMN "public"."rental_verifications"."verified_at" IS '核查时间';
COMMENT ON TABLE "public"."rental_verifications" IS '核查记录表';

-- ----------------------------
-- Records of rental_verifications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "config_id" int4 NOT NULL DEFAULT nextval('sys_config_config_id_seq'::regclass),
  "config_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "config_key" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "config_value" varchar(500) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "config_type" char(1) COLLATE "pg_catalog"."default" DEFAULT 'N'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_config" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_config"."config_id" IS '参数主键';
COMMENT ON COLUMN "public"."sys_config"."config_name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_config"."config_key" IS '参数键名';
COMMENT ON COLUMN "public"."sys_config"."config_value" IS '参数键值';
COMMENT ON COLUMN "public"."sys_config"."config_type" IS '系统内置（Y是 N否）';
COMMENT ON COLUMN "public"."sys_config"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_config"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_config"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_config" IS '参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-03-24 22:10:49.207718', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-03-24 22:10:49.208234', '', NULL, '初始化密码 123456');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-03-24 22:10:49.208573', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-03-24 22:10:49.20923', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-03-24 22:10:49.209503', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-03-24 22:10:49.209866', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-03-24 22:10:49.210167', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-03-24 22:10:49.210473', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO "public"."sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (10, '二维码基础URL', 'qrcode.baseurl', 'http://localhost', 'Y', 'admin', '2026-04-02 15:31:52.493319', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "dept_id" int8 NOT NULL DEFAULT nextval('sys_dept_dept_id_seq'::regclass),
  "parent_id" int8 DEFAULT 0,
  "ancestors" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dept_name" varchar(30) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "order_num" int4 DEFAULT 0,
  "leader" varchar(20) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "phone" varchar(11) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "email" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6)
)
;
ALTER TABLE "public"."sys_dept" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_dept"."dept_id" IS '部门id';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父部门id';
COMMENT ON COLUMN "public"."sys_dept"."ancestors" IS '祖级列表';
COMMENT ON COLUMN "public"."sys_dept"."dept_name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."order_num" IS '显示顺序';
COMMENT ON COLUMN "public"."sys_dept"."leader" IS '负责人';
COMMENT ON COLUMN "public"."sys_dept"."phone" IS '联系电话';
COMMENT ON COLUMN "public"."sys_dept"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_dept"."status" IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_dept"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "public"."sys_dept"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."sys_dept" IS '部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.873955', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.875457', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.875977', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.876496', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.877488', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.877854', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.87832', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.878763', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.879207', '', NULL);
INSERT INTO "public"."sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-24 22:10:48.879658', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "dict_code" int8 NOT NULL DEFAULT nextval('sys_dict_data_dict_code_seq'::regclass),
  "dict_sort" int4 DEFAULT 0,
  "dict_label" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dict_value" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dict_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "css_class" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "list_class" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_default" char(1) COLLATE "pg_catalog"."default" DEFAULT 'N'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_dict_data" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_dict_data"."dict_code" IS '字典编码';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_sort" IS '字典排序';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_label" IS '字典标签';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_value" IS '字典键值';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_data"."css_class" IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN "public"."sys_dict_data"."list_class" IS '表格回显样式';
COMMENT ON COLUMN "public"."sys_dict_data"."is_default" IS '是否默认（Y是 N否）';
COMMENT ON COLUMN "public"."sys_dict_data"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_dict_data"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict_data"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_data"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dict_data"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_data"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_dict_data" IS '字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-03-24 22:10:49.183542', '', NULL, '性别男');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-24 22:10:49.184167', '', NULL, '性别女');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-24 22:10:49.184689', '', NULL, '性别未知');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-03-24 22:10:49.186215', '', NULL, '显示菜单');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.186551', '', NULL, '隐藏菜单');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-03-24 22:10:49.186823', '', NULL, '正常状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.187124', '', NULL, '停用状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-03-24 22:10:49.187458', '', NULL, '正常状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.187728', '', NULL, '停用状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-03-24 22:10:49.188059', '', NULL, '默认分组');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-03-24 22:10:49.188373', '', NULL, '系统分组');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-03-24 22:10:49.188734', '', NULL, '系统默认是');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.189319', '', NULL, '系统默认否');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-03-24 22:10:49.189592', '', NULL, '通知');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-03-24 22:10:49.189875', '', NULL, '公告');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-03-24 22:10:49.190236', '', NULL, '正常状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.190493', '', NULL, '关闭状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-24 22:10:49.190813', '', NULL, '其他操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-24 22:10:49.19115', '', NULL, '新增操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-24 22:10:49.191401', '', NULL, '修改操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.191689', '', NULL, '删除操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-03-24 22:10:49.192001', '', NULL, '授权操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-24 22:10:49.192265', '', NULL, '导出操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-24 22:10:49.192573', '', NULL, '导入操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.193025', '', NULL, '强退操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-24 22:10:49.19334', '', NULL, '生成操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.19365', '', NULL, '清空操作');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-03-24 22:10:49.194004', '', NULL, '正常状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-03-24 22:10:49.194307', '', NULL, '停用状态');
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (98, 1, '业主', 'owner', 'manager_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.915842', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (99, 2, '托管人', 'trustee', 'manager_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.919216', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (100, 1, '单房屋', 'single', 'house_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.925061', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (101, 2, '整栋', 'entire', 'house_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.929225', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (102, 1, '长租住房', 'long_rent_house', 'residence_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.93122', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (103, 2, '长租公寓', 'long_rent_apartment', 'residence_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.931837', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (104, 3, '时租日租房屋', 'daily_rent_house', 'residence_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.932491', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (105, 4, '时租日租公寓', 'daily_rent_apartment', 'residence_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.933604', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (106, 1, '国有房产', 'state', 'property_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.93491', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (107, 2, '集体所有房产', 'collective', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.935625', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (108, 3, '私有房产', 'private', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.936277', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (109, 4, '联营企业房产', 'joint', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.936936', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (110, 5, '港、澳、台胞房产', 'hong_au_tai', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.938071', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (111, 6, '涉外房产', 'foreign', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.938845', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (112, 7, '混合', 'mixed', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.939696', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (113, 8, '其他', 'other', 'property_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.940425', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (114, 1, '城中村', 'village', 'environment_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.94227', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (115, 2, '住宅小区', 'residential', 'environment_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.942971', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (116, 3, '其他', 'other', 'environment_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.943795', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (117, 1, '一级', '1', 'fire_level', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.945837', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (118, 2, '二级', '2', 'fire_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.946555', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (119, 3, '三级', '3', 'fire_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.9471', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (120, 1, '一级', '1', 'data_level', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.948547', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (121, 2, '二级', '2', 'data_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.949149', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (122, 3, '三级', '3', 'data_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.949769', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (123, 1, '一级', '1', 'security_level', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.951998', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (124, 2, '二级', '2', 'security_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.952532', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (125, 3, '三级', '3', 'security_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.953116', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (126, 1, '绿色', 'green', 'overall_level', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.954629', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (127, 2, '黄色', 'yellow', 'overall_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.955222', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (128, 3, '红色', 'red', 'overall_level', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.955849', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (129, 1, '摄像头', 'camera', 'device_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.957664', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (130, 2, '门禁', 'intercom', 'device_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.958796', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (131, 1, '业主', 'owner', 'resident_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.960255', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (132, 2, '租户', 'tenant', 'resident_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.961153', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (133, 3, '家属', 'family', 'resident_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.962101', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (134, 1, '家庭型', 'family', 'resident_composition', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.963171', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (135, 2, '单身型', 'single', 'resident_composition', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.964177', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (136, 3, '集体租住型', 'group', 'resident_composition', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.964792', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (137, 4, '合伙型', 'partner', 'resident_composition', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.966084', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (138, 5, '其他', 'other', 'resident_composition', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.966689', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (139, 1, '电话咨询', 'phone_consult', 'verify_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.967726', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (140, 2, '现场核查', 'on_site', 'verify_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.96825', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (141, 1, '真实陌生人', 'real_stranger', 'verify_result', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.969795', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (142, 2, '住户', 'resident', 'verify_result', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.970295', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (143, 3, '快递外卖', 'delivery', 'verify_result', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.971111', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (144, 1, '陌生人告警', 'stranger', 'alert_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.972525', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (145, 2, '异常行为告警', 'abnormal', 'alert_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.973131', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (146, 3, '设备离线告警', 'device_offline', 'alert_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.974283', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (147, 1, '待处理', 'pending', 'alert_status', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:47:57.975993', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (148, 2, '处理中', 'processing', 'alert_status', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.976642', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (149, 3, '已解决', 'resolved', 'alert_status', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.977712', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (150, 4, '已忽略', 'ignored', 'alert_status', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.9784', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (151, 1, '三埠街道', 'sanbu', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.979926', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (152, 2, '长沙街道', 'changsha', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.98052', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (153, 3, '月山镇', 'yueshan', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.981301', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (154, 4, '水口镇', 'shuikou', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.981837', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (155, 5, '沙塘镇', 'shatang', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.982385', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (156, 6, '苍城镇', 'cangcheng', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.982971', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (157, 7, '龙胜镇', 'longsheng', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.983674', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (158, 8, '大沙镇', 'dasha', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.984224', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (159, 9, '马冈镇', 'magang', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.98494', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (160, 10, '塘口镇', 'tangkou', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.985974', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (161, 11, '赤坎镇', 'chikan', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.986502', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (162, 12, '百合镇', 'baihe', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.987031', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (163, 13, '蚬冈镇', 'xiangang', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.987532', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (164, 14, '金鸡镇', 'jinji', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.988232', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (165, 15, '赤水镇', 'chishui', 'town_street', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:47:57.988935', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (166, 1, '住宅', 'residential', 'house_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:51:27.409712', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (167, 2, '商业', 'commercial', 'house_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:51:27.412703', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (168, 3, '工业', 'industrial', 'house_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:51:27.4143', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (169, 4, '城中村', 'village', 'house_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:51:27.415856', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (170, 5, '其他', 'other', 'house_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:51:27.418211', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (171, 1, '自有', 'own', 'residence_type', NULL, NULL, 'Y', '0', 'admin', '2026-04-02 11:51:27.420278', '', NULL, NULL);
INSERT INTO "public"."sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (172, 2, '租用', 'rented', 'residence_type', NULL, NULL, 'N', '0', 'admin', '2026-04-02 11:51:27.421949', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "dict_id" int8 NOT NULL DEFAULT nextval('sys_dict_type_dict_id_seq'::regclass),
  "dict_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dict_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_dict_type" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_dict_type"."dict_id" IS '字典主键';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_dict_type"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dict_type"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_type"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_dict_type" IS '字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-03-24 22:10:49.143759', '', NULL, '用户性别列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-03-24 22:10:49.144457', '', NULL, '菜单状态列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-03-24 22:10:49.144835', '', NULL, '系统开关列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-03-24 22:10:49.145525', '', NULL, '任务状态列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-03-24 22:10:49.145856', '', NULL, '任务分组列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-03-24 22:10:49.146132', '', NULL, '系统是否列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-03-24 22:10:49.146434', '', NULL, '通知类型列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-03-24 22:10:49.146748', '', NULL, '通知状态列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-03-24 22:10:49.147041', '', NULL, '操作类型列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-03-24 22:10:49.14732', '', NULL, '登录状态列表');
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (28, '管理者身份类别', 'manager_type', '0', 'admin', '2026-04-02 11:47:57.910432', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (29, '房屋类型', 'house_type', '0', 'admin', '2026-04-02 11:47:57.923192', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (30, '住所类型', 'residence_type', '0', 'admin', '2026-04-02 11:47:57.930535', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (31, '产权性质', 'property_type', '0', 'admin', '2026-04-02 11:47:57.934181', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (32, '环境类型', 'environment_type', '0', 'admin', '2026-04-02 11:47:57.941285', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (33, '消防等级', 'fire_level', '0', 'admin', '2026-04-02 11:47:57.944608', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (34, '数据维护等级', 'data_level', '0', 'admin', '2026-04-02 11:47:57.947888', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (35, '治安等级', 'security_level', '0', 'admin', '2026-04-02 11:47:57.950351', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (36, '综合等级', 'overall_level', '0', 'admin', '2026-04-02 11:47:57.954082', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (37, '设备类型', 'device_type', '0', 'admin', '2026-04-02 11:47:57.956434', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (38, '住户类型', 'resident_type', '0', 'admin', '2026-04-02 11:47:57.959482', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (39, '租住人员组成分类', 'resident_composition', '0', 'admin', '2026-04-02 11:47:57.962611', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (40, '核查方式', 'verify_type', '0', 'admin', '2026-04-02 11:47:57.967216', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (41, '核查结果', 'verify_result', '0', 'admin', '2026-04-02 11:47:57.96876', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (42, '告警类型', 'alert_type', '0', 'admin', '2026-04-02 11:47:57.971675', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (43, '告警状态', 'alert_status', '0', 'admin', '2026-04-02 11:47:57.974927', '', NULL, NULL);
INSERT INTO "public"."sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (44, '镇街', 'town_street', '0', 'admin', '2026-04-02 11:47:57.979269', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_job";
CREATE TABLE "public"."sys_job" (
  "job_id" int8 NOT NULL DEFAULT nextval('sys_job_job_id_seq'::regclass),
  "job_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "job_group" varchar(64) COLLATE "pg_catalog"."default" DEFAULT 'DEFAULT'::character varying,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "misfire_policy" varchar(20) COLLATE "pg_catalog"."default" DEFAULT '3'::character varying,
  "concurrent" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT ''::character varying
)
;
ALTER TABLE "public"."sys_job" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_job"."job_id" IS '任务ID';
COMMENT ON COLUMN "public"."sys_job"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."sys_job"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."sys_job"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "public"."sys_job"."cron_expression" IS 'cron执行表达式';
COMMENT ON COLUMN "public"."sys_job"."misfire_policy" IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN "public"."sys_job"."concurrent" IS '是否并发执行（0允许 1禁止）';
COMMENT ON COLUMN "public"."sys_job"."status" IS '状态（0正常 1暂停）';
COMMENT ON COLUMN "public"."sys_job"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_job"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_job"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_job"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_job"."remark" IS '备注信息';
COMMENT ON TABLE "public"."sys_job" IS '定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_job" ("job_id", "job_name", "job_group", "invoke_target", "cron_expression", "misfire_policy", "concurrent", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-03-24 22:10:49.247942', '', NULL, '');
INSERT INTO "public"."sys_job" ("job_id", "job_name", "job_group", "invoke_target", "cron_expression", "misfire_policy", "concurrent", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-03-24 22:10:49.248503', '', NULL, '');
INSERT INTO "public"."sys_job" ("job_id", "job_name", "job_group", "invoke_target", "cron_expression", "misfire_policy", "concurrent", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000, 316.50, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-03-24 22:10:49.250465', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_job_log";
CREATE TABLE "public"."sys_job_log" (
  "job_log_id" int8 NOT NULL DEFAULT nextval('sys_job_log_job_log_id_seq'::regclass),
  "job_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "job_message" varchar(500) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "exception_info" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6)
)
;
ALTER TABLE "public"."sys_job_log" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_job_log"."job_log_id" IS '任务日志ID';
COMMENT ON COLUMN "public"."sys_job_log"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."sys_job_log"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."sys_job_log"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "public"."sys_job_log"."job_message" IS '日志信息';
COMMENT ON COLUMN "public"."sys_job_log"."status" IS '执行状态（0正常 1失败）';
COMMENT ON COLUMN "public"."sys_job_log"."exception_info" IS '异常信息';
COMMENT ON COLUMN "public"."sys_job_log"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_job_log" IS '定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_logininfor";
CREATE TABLE "public"."sys_logininfor" (
  "info_id" int8 NOT NULL DEFAULT nextval('sys_logininfor_info_id_seq'::regclass),
  "user_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "ipaddr" varchar(128) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "login_location" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "browser" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "os" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "msg" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "login_time" timestamp(6)
)
;
ALTER TABLE "public"."sys_logininfor" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_logininfor"."info_id" IS '访问ID';
COMMENT ON COLUMN "public"."sys_logininfor"."user_name" IS '用户账号';
COMMENT ON COLUMN "public"."sys_logininfor"."ipaddr" IS '登录IP地址';
COMMENT ON COLUMN "public"."sys_logininfor"."login_location" IS '登录地点';
COMMENT ON COLUMN "public"."sys_logininfor"."browser" IS '浏览器类型';
COMMENT ON COLUMN "public"."sys_logininfor"."os" IS '操作系统';
COMMENT ON COLUMN "public"."sys_logininfor"."status" IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN "public"."sys_logininfor"."msg" IS '提示消息';
COMMENT ON COLUMN "public"."sys_logininfor"."login_time" IS '访问时间';
COMMENT ON TABLE "public"."sys_logininfor" IS '系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (1, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-27 10:08:05.095562');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (2, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-27 10:53:39.905021');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (35, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-27 12:22:43.199097');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (36, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-27 16:00:44.48004');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (69, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-31 20:33:18.192006');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (70, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-03-31 23:02:32.187506');
INSERT INTO "public"."sys_logininfor" ("info_id", "user_name", "ipaddr", "login_location", "browser", "os", "status", "msg", "login_time") VALUES (103, 'admin', '192.168.64.1', '内网IP', 'Chrome 146', 'Mac OS >=10.15.7', '0', '登录成功', '2026-04-01 02:25:55.889068');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "menu_id" int8 NOT NULL DEFAULT nextval('sys_menu_menu_id_seq'::regclass),
  "menu_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8 DEFAULT 0,
  "order_num" int4 DEFAULT 0,
  "path" varchar(200) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "component" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "query" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "route_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "is_frame" int4 DEFAULT 1,
  "is_cache" int4 DEFAULT 0,
  "menu_type" char(1) COLLATE "pg_catalog"."default" DEFAULT ''::bpchar,
  "visible" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "perms" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "icon" varchar(100) COLLATE "pg_catalog"."default" DEFAULT '#'::character varying,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT ''::character varying
)
;
ALTER TABLE "public"."sys_menu" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_menu"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."menu_name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."order_num" IS '显示顺序';
COMMENT ON COLUMN "public"."sys_menu"."path" IS '路由地址';
COMMENT ON COLUMN "public"."sys_menu"."component" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."query" IS '路由参数';
COMMENT ON COLUMN "public"."sys_menu"."route_name" IS '路由名称';
COMMENT ON COLUMN "public"."sys_menu"."is_frame" IS '是否为外链（0是 1否）';
COMMENT ON COLUMN "public"."sys_menu"."is_cache" IS '是否缓存（0缓存 1不缓存）';
COMMENT ON COLUMN "public"."sys_menu"."menu_type" IS '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN "public"."sys_menu"."visible" IS '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '菜单状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_menu"."perms" IS '权限标识';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_menu"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_menu" IS '菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-03-24 22:10:48.969223', '', NULL, '系统管理目录');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-03-24 22:10:48.969921', '', NULL, '系统监控目录');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-03-24 22:10:48.970237', '', NULL, '系统工具目录');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-03-24 22:10:48.971044', '', NULL, '用户管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-03-24 22:10:48.971466', '', NULL, '角色管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-03-24 22:10:48.971838', '', NULL, '菜单管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-03-24 22:10:48.97221', '', NULL, '部门管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-03-24 22:10:48.972589', '', NULL, '岗位管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-03-24 22:10:48.973317', '', NULL, '字典管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-03-24 22:10:48.973653', '', NULL, '参数设置菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-03-24 22:10:48.973984', '', NULL, '通知公告菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-03-24 22:10:48.974318', '', NULL, '日志管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-03-24 22:10:48.974649', '', NULL, '在线用户菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-03-24 22:10:48.974939', '', NULL, '定时任务菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-03-24 22:10:48.975312', '', NULL, '数据监控菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-03-24 22:10:48.975682', '', NULL, '服务监控菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-03-24 22:10:48.975997', '', NULL, '缓存监控菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-03-24 22:10:48.976339', '', NULL, '缓存列表菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-03-24 22:10:48.976667', '', NULL, '表单构建菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-03-24 22:10:48.977237', '', NULL, '代码生成菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-03-24 22:10:48.977526', '', NULL, '系统接口菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-03-24 22:10:48.97786', '', NULL, '操作日志菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-03-24 22:10:48.97816', '', NULL, '登录日志菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-03-24 22:10:48.978423', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-03-24 22:10:48.978727', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-03-24 22:10:48.978989', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-03-24 22:10:48.979282', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-03-24 22:10:48.979592', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-03-24 22:10:48.979913', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-03-24 22:10:48.980252', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-03-24 22:10:48.980626', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-03-24 22:10:48.981255', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-03-24 22:10:48.981551', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-03-24 22:10:48.981828', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-03-24 22:10:48.982118', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-03-24 22:10:48.982395', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-03-24 22:10:48.98269', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-03-24 22:10:48.98302', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-03-24 22:10:48.98333', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-03-24 22:10:48.983626', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-03-24 22:10:48.98399', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-03-24 22:10:48.984284', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-03-24 22:10:48.984709', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-03-24 22:10:48.985291', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-03-24 22:10:48.985589', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-03-24 22:10:48.98597', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-03-24 22:10:48.986268', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-03-24 22:10:48.986571', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-03-24 22:10:48.986868', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-03-24 22:10:48.987181', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-03-24 22:10:48.987449', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-03-24 22:10:48.987742', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-03-24 22:10:48.988046', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-03-24 22:10:48.988683', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-03-24 22:10:48.989435', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-03-24 22:10:48.989773', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-03-24 22:10:48.990111', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-03-24 22:10:48.990414', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-03-24 22:10:48.990737', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-03-24 22:10:48.991124', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-03-24 22:10:48.991449', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-03-24 22:10:48.991746', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-03-24 22:10:48.992021', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-03-24 22:10:48.992331', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-03-24 22:10:48.992602', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-03-24 22:10:48.993222', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-03-24 22:10:48.993575', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-03-24 22:10:48.993885', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-03-24 22:10:48.994219', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-03-24 22:10:48.994552', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-03-24 22:10:48.994888', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-03-24 22:10:48.995207', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-03-24 22:10:48.995562', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-03-24 22:10:48.995872', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-03-24 22:10:48.996232', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-03-24 22:10:48.996602', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-03-24 22:10:48.997303', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-03-24 22:10:48.997615', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-03-24 22:10:48.997877', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-03-24 22:10:48.998229', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-03-24 22:10:48.998521', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-03-24 22:10:48.998909', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-03-24 22:10:48.999149', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-03-24 22:10:48.999487', '', NULL, '');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2002, '房源新增', 2001, 1, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:add', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '房源新增按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2003, '房源编辑', 2001, 2, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:edit', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '房源编辑按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2004, '房源删除', 2001, 3, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:remove', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '房源删除按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2005, '房源导出', 2001, 4, 'house', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:house:export', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '房源导出按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2010, '住户管理', 2000, 2, 'resident', 'rental/resident/index', '', 'RentalResident', 1, 0, 'C', '0', '0', 'system:rental:resident:list', 'peoples', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '住户管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2011, '住户新增', 2010, 1, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:add', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '住户新增按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2012, '住户编辑', 2010, 2, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:edit', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '住户编辑按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2013, '住户删除', 2010, 3, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:remove', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '住户删除按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2014, '人脸采集', 2010, 4, 'resident', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:resident:face', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '人脸采集按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2020, '通行记录', 2000, 3, 'accessLog', 'rental/accessLog/index', '', 'RentalAccessLog', 1, 0, 'C', '0', '0', 'system:rental:accessLog:list', 'log', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '通行记录菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2021, '通行导出', 2020, 1, 'accessLog', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:accessLog:export', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '通行导出按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2030, '告警管理', 2000, 4, 'alert', 'rental/alert/index', '', 'RentalAlert', 1, 0, 'C', '0', '0', 'system:rental:alert:list', 'message', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '告警管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2031, '告警处理', 2030, 1, 'alert', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:alert:edit', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '告警处理按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2032, '告警核查', 2030, 2, 'alert', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:alert:verify', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '告警核查按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2041, '设备新增', 2040, 1, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:add', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '设备新增按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2042, '设备编辑', 2040, 2, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:edit', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '设备编辑按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2043, '设备删除', 2040, 3, 'device', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:device:remove', '#', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '设备删除按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2001, '出租屋', 2000, 1, 'house', 'rental/house/index', '', 'RentalHouse', 1, 0, 'C', '0', '0', 'system:rental:house:list', 'logininfor', 'admin', '2026-03-27 10:07:42.245675', 'admin', '2026-03-31 20:34:56.630526', '房源管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2050, '统计分析', 2000, 6, 'statistics', 'rental/statistics/dashboard', '', 'RentalStatistics', 1, 0, 'C', '0', '0', 'system:rental:statistics:view', 'chart', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '统计分析菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2060, '地图可视化', 2000, 7, 'map', 'rental/map/index', '', 'RentalMap', 1, 0, 'C', '0', '0', 'system:rental:map:view', 'tree', 'admin', '2026-03-27 10:07:42.245675', '', NULL, '地图可视化菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2000, '租房管理', 0, 0, 'rental', NULL, '', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2026-03-27 10:07:42.245675', 'admin', '2026-03-27 12:30:36.461621', '租房管理目录');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2040, '设备管理', 2000, 5, 'device', 'rental/device/index', '', 'RentalDevice', 1, 0, 'C', '0', '0', 'system:rental:device:list', 'tool', 'admin', '2026-03-27 10:07:42.245675', 'admin', '2026-03-27 12:31:19.200218', '设备管理菜单');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2071, '元数据查看', 2070, 1, 'metadata', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:metadata:query', '#', 'admin', '2026-03-29 11:40:17.063268', '', NULL, '元数据查看按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2072, '元数据导出', 2070, 2, 'metadata', '', '', '', 1, 0, 'F', '0', '0', 'system:rental:metadata:export', '#', 'admin', '2026-03-29 11:40:17.065685', '', NULL, '元数据导出按钮');
INSERT INTO "public"."sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "route_name", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2070, '元数据管理', 2000, 8, 'metadata', 'rental/metadata/index', '', 'RentalMetadata', 1, 0, 'C', '0', '0', 'system:rental:metadata:list', 'dict', 'admin', '2026-03-29 11:40:17.02874', 'admin', '2026-03-31 20:34:29.356485', '元数据管理菜单');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "notice_id" int4 NOT NULL DEFAULT nextval('sys_notice_notice_id_seq'::regclass),
  "notice_title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_type" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_content" bytea,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_notice" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_notice"."notice_id" IS '公告ID';
COMMENT ON COLUMN "public"."sys_notice"."notice_title" IS '公告标题';
COMMENT ON COLUMN "public"."sys_notice"."notice_type" IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN "public"."sys_notice"."notice_content" IS '公告内容';
COMMENT ON COLUMN "public"."sys_notice"."status" IS '公告状态（0正常 1关闭）';
COMMENT ON COLUMN "public"."sys_notice"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_notice"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_notice"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_notice"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_notice" IS '通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_notice" ("notice_id", "notice_title", "notice_type", "notice_content", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', E'\\346\\226\\260\\347\\211\\210\\346\\234\\254\\345\\206\\205\\345\\256\\271', '0', 'admin', '2026-03-24 22:10:50.31997', '', NULL, '管理员');
INSERT INTO "public"."sys_notice" ("notice_id", "notice_title", "notice_type", "notice_content", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', E'\\347\\273\\264\\346\\212\\244\\345\\206\\205\\345\\256\\271', '0', 'admin', '2026-03-24 22:10:50.320561', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oper_log";
CREATE TABLE "public"."sys_oper_log" (
  "oper_id" int8 NOT NULL DEFAULT nextval('sys_oper_log_oper_id_seq'::regclass),
  "title" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "business_type" int4 DEFAULT 0,
  "method" varchar(200) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "request_method" varchar(10) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "operator_type" int2 DEFAULT 0,
  "oper_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dept_name" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "oper_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "oper_ip" varchar(128) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "oper_location" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "oper_param" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "json_result" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" int2 DEFAULT 0,
  "error_msg" varchar(2000) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "oper_time" timestamp(6),
  "cost_time" int8 DEFAULT 0
)
;
ALTER TABLE "public"."sys_oper_log" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_oper_log"."oper_id" IS '日志主键';
COMMENT ON COLUMN "public"."sys_oper_log"."title" IS '模块标题';
COMMENT ON COLUMN "public"."sys_oper_log"."business_type" IS '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN "public"."sys_oper_log"."method" IS '方法名称';
COMMENT ON COLUMN "public"."sys_oper_log"."request_method" IS '请求方式';
COMMENT ON COLUMN "public"."sys_oper_log"."operator_type" IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_name" IS '操作人员';
COMMENT ON COLUMN "public"."sys_oper_log"."dept_name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_url" IS '请求URL';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_ip" IS '主机地址';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_location" IS '操作地点';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_param" IS '请求参数';
COMMENT ON COLUMN "public"."sys_oper_log"."json_result" IS '返回参数';
COMMENT ON COLUMN "public"."sys_oper_log"."status" IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN "public"."sys_oper_log"."error_msg" IS '错误消息';
COMMENT ON COLUMN "public"."sys_oper_log"."oper_time" IS '操作时间';
COMMENT ON COLUMN "public"."sys_oper_log"."cost_time" IS '消耗时间';
COMMENT ON TABLE "public"."sys_oper_log" IS '操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (1, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"createTime":"2026-03-27 10:07:42","icon":"house","isCache":"0","isFrame":"1","menuId":2000,"menuName":"租房管理","menuType":"M","orderNum":10,"params":{},"parentId":0,"path":"rental","perms":"","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"} ', NULL, 1, '
### Error updating database.  Cause: org.postgresql.util.PSQLException: ERROR: column "is_frame" is of type integer but expression is of type character varying
  Hint: You will need to rewrite or cast the expression.
  Position: 147
### The error may exist in URL [jar:nested:/app/ruoyi-admin.jar/!BOOT-INF/lib/ruoyi-system-3.9.1.jar!/mapper/system/SysMenuMapper.xml]
### The error may involve com.ruoyi.system.mapper.SysMenuMapper.updateMenu-Inline
### The error occurred while setting parameters
### SQL: update sys_menu    SET menu_name = ?,    parent_id = ?,    order_num = ?,    path = ?,        "query" = ?,    route_name = ?,    is_frame = ?,    is_cache = ?,    menu_type = ?,    visible = ?,    status = ?,    perms = ?,    icon = ?,        update_by = ?,    update_time = now()    where menu_id = ?
### Cause: org.postgresql.util.PSQLException: ERROR: column "is_frame" is of type integer but expression is of type character varying
  Hint: You will need to rewrite or cast the expression.
  Position: 147
; bad SQL grammar []', '2026-03-27 10:54:07.510816', 90);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (34, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"createTime":"2026-03-27 10:07:42","icon":"house","isCache":"0","isFrame":"1","menuId":2000,"menuName":"租房管理","menuType":"M","orderNum":10,"params":{},"parentId":0,"path":"rental","perms":"","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 11:05:35.408966', 43);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (35, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"createTime":"2026-03-27 10:07:42","icon":"house","isCache":"0","isFrame":"1","menuId":2000,"menuName":"租房管理","menuType":"M","orderNum":0,"params":{},"parentId":0,"path":"rental","perms":"","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 11:05:52.176657', 25);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (36, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"createTime":"2026-03-27 10:07:42","icon":"shopping","isCache":"0","isFrame":"1","menuId":2000,"menuName":"租房管理","menuType":"M","orderNum":0,"params":{},"parentId":0,"path":"rental","perms":"","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 11:06:11.725371', 26);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (67, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"createTime":"2026-03-27 10:07:42","icon":"shopping","isCache":"0","isFrame":"1","menuId":2000,"menuName":"租房管理","menuType":"M","orderNum":0,"params":{},"parentId":0,"path":"rental","perms":"","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:30:36.510525', 28);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (68, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"component":"rental/house/index","createTime":"2026-03-27 10:07:42","icon":"logininfor","isCache":"0","isFrame":"1","menuId":2001,"menuName":"房源管理","menuType":"C","orderNum":1,"params":{},"parentId":2000,"path":"house","perms":"system:rental:house:list","query":"","routeName":"RentalHouse","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:31:02.413669', 26);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (69, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"component":"rental/device/index","createTime":"2026-03-27 10:07:42","icon":"tool","isCache":"0","isFrame":"1","menuId":2040,"menuName":"设备管理","menuType":"C","orderNum":5,"params":{},"parentId":2000,"path":"device","perms":"system:rental:device:list","query":"","routeName":"RentalDevice","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:31:19.235945', 27);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (70, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '192.168.64.1', '内网IP', '4 ', '{"msg":"菜单已分配,不允许删除","code":601}', 0, NULL, '2026-03-27 12:33:45.271609', 17);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (71, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '192.168.64.1', '内网IP', '{"admin":false,"createTime":"2026-03-24 22:10:48","dataScope":"2","delFlag":"0","deptCheckStrictly":true,"flag":false,"menuCheckStrictly":true,"menuIds":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":2,"status":"0","updateBy":"admin"} ', NULL, 1, '
### Error updating database.  Cause: org.postgresql.util.PSQLException: ERROR: column "menu_check_strictly" is of type smallint but expression is of type boolean
  Hint: You will need to rewrite or cast the expression.
  Position: 127
### The error may exist in URL [jar:nested:/app/ruoyi-admin.jar/!BOOT-INF/lib/ruoyi-system-3.9.1.jar!/mapper/system/SysRoleMapper.xml]
### The error may involve com.ruoyi.system.mapper.SysRoleMapper.updateRole-Inline
### The error occurred while setting parameters
### SQL: update sys_role     SET role_name = ?,     role_key = ?,     role_sort = ?,     data_scope = ?,     menu_check_strictly = ?,     dept_check_strictly = ?,     status = ?,     remark = ?,     update_by = ?,     update_time = now()     where role_id = ?
### Cause: org.postgresql.util.PSQLException: ERROR: column "menu_check_strictly" is of type smallint but expression is of type boolean
  Hint: You will need to rewrite or cast the expression.
  Position: 127
; bad SQL grammar []', '2026-03-27 12:34:15.257344', 127);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (72, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '192.168.64.1', '内网IP', '{"admin":false,"createTime":"2026-03-24 22:10:48","dataScope":"2","delFlag":"0","deptCheckStrictly":true,"flag":false,"menuCheckStrictly":true,"menuIds":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":2,"status":"0","updateBy":"admin"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:55:52.315777', 62);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (73, '出租屋', 1, 'com.ruoyi.rental.controller.RentalHouseController.add()', 'POST', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"沃尔沃二","building":"23432","district":"水电费是的","floor":"2","id":1,"ownerName":"32432","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:58:43.736814', 36);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (74, '住户', 1, 'com.ruoyi.rental.controller.RentalResidentController.add()', 'POST', 1, 'admin', '研发部门', '/rental/resident', '192.168.64.1', '内网IP', '{"houseId":1,"id":1,"idCard":"440783198102057233","name":"沙发发","params":{},"phone":"13600351234","residentType":"tenant","status":"1"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 12:59:26.091066', 18);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (105, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"测试","building":"测试","createTime":"2026-03-27 12:58:43","district":"测试","floor":"2","id":1,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-27 12:58:43"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 16:02:25.486284', 26);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (106, '房间管理', 1, 'com.ruoyi.rental.controller.RentalRoomController.add()', 'POST', 1, 'admin', '研发部门', '/rental/room', '192.168.64.1', '内网IP', '{"floor":"1","houseId":1,"id":1,"params":{},"roomNo":"101","status":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 16:02:36.782556', 25);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (107, '住户', 1, 'com.ruoyi.rental.controller.RentalResidentController.add()', 'POST', 1, 'admin', '研发部门', '/rental/resident', '192.168.64.1', '内网IP', '{"houseId":1,"id":34,"idCard":"440783198101017238","name":"李四","params":{},"residentType":"tenant","roomId":1,"status":"1"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 16:02:59.375156', 22);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (108, '住户', 2, 'com.ruoyi.rental.controller.RentalResidentController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/resident', '192.168.64.1', '内网IP', '{"checkInDate":"2026-03-28","createTime":"2026-03-27 16:02:59","houseId":1,"id":34,"idCard":"440783198101017238","name":"李四","params":{},"residentType":"tenant","roomId":1,"status":"2","updateTime":"2026-03-27 16:02:59"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 16:03:17.037419', 14);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (109, '房间管理', 2, 'com.ruoyi.rental.controller.RentalRoomController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/room', '192.168.64.1', '内网IP', '{"createTime":"2026-03-27 16:02:36","floor":"1","house":{"address":"测试","id":1,"params":{}},"houseId":1,"id":1,"params":{},"roomNo":"101","status":"1"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-27 16:03:33.40577', 11);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '192.168.64.1', '内网IP', '4 ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 20:34:11.669921', 20);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"component":"rental/metadata/index","createTime":"2026-03-29 11:40:17","icon":"dict","isCache":"0","isFrame":"1","menuId":2070,"menuName":"元数据管理","menuType":"C","orderNum":8,"params":{},"parentId":2000,"path":"metadata","perms":"system:rental:metadata:list","query":"","routeName":"RentalMetadata","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 20:34:29.384129', 22);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.64.1', '内网IP', '{"children":[],"component":"rental/house/index","createTime":"2026-03-27 10:07:42","icon":"logininfor","isCache":"0","isFrame":"1","menuId":2001,"menuName":"出租屋","menuType":"C","orderNum":1,"params":{},"parentId":2000,"path":"house","perms":"system:rental:house:list","query":"","routeName":"RentalHouse","status":"0","updateBy":"admin","visible":"0"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 20:34:56.649344', 24);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (141, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"开平市水口镇","building":"2号1幢","createTime":"2026-03-27 12:58:43","district":"水口镇","floor":"2","id":1,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-27 16:02:25"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 21:20:24.826037', 18);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (142, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"开平市水口镇","building":"2号1幢","createTime":"2026-03-27 12:58:43","district":"水口镇","floor":"2","id":1,"latitude":22.41432,"longitude":112.725409,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-31 21:20:24"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 22:02:25.632971', 23);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (175, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"开平市水口镇","building":"2号1幢","createTime":"2026-03-27 12:58:43","district":"水口镇","floor":"2","id":1,"latitude":22.401764,"longitude":112.720601,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-31 22:02:25"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 23:24:18.286961', 30);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (176, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '192.168.64.1', '内网IP', '{"address":"开平市水口镇","building":"2号1幢","createTime":"2026-03-27 12:58:43","district":"水口镇","floor":"2","id":1,"latitude":22.40092,"longitude":112.720273,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-31 23:24:18"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-03-31 23:24:36.203162', 13);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (208, '出租屋', 2, 'com.ruoyi.rental.controller.RentalHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/rental/house', '127.0.0.1', '内网IP', '{"address":"开平市水口镇","building":"2号1幢","createTime":"2026-03-27 12:58:43","floor":"2","id":1,"latitude":22.40092,"longitude":112.720273,"ownerName":"张三","ownerPhone":"13600351234","params":{},"status":"1","unit":"23423","updateTime":"2026-03-31 23:24:36"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 13:28:21.245507', 18);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (209, '管理者管理', 1, 'com.ruoyi.rental.controller.RentalManagerController.add()', 'POST', 1, 'admin', '研发部门', '/rental/manager', '127.0.0.1', '内网IP', '{"id":1,"identity":"owner","managerName":"测试","params":{}} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:01:42.281078', 16);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (210, '出租屋检查', 1, 'com.ruoyi.rental.controller.RentalHouseInspectionController.add()', 'POST', 1, 'admin', '研发部门', '/rental/inspection', '127.0.0.1', '内网IP', '{"dataLevel":"2","fireLevel":"1","houseId":1,"id":5,"inspectionTime":"2026-04-04 21:40:30","overallLevel":"red","params":{},"securityLevel":"2"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:17.703678', 38);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (211, '出租屋检查', 1, 'com.ruoyi.rental.controller.RentalHouseInspectionController.add()', 'POST', 1, 'admin', '研发部门', '/rental/inspection', '127.0.0.1', '内网IP', '{"dataLevel":"2","fireLevel":"1","houseId":1,"id":6,"inspectionTime":"2026-04-04 21:40:30","overallLevel":"yellow","params":{},"securityLevel":"1"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:24.470028', 28);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (212, '出租屋检查', 3, 'com.ruoyi.rental.controller.RentalHouseInspectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/rental/inspection/6', '127.0.0.1', '内网IP', '[6] ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:33.720952', 11);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (213, '出租屋检查', 3, 'com.ruoyi.rental.controller.RentalHouseInspectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/rental/inspection/5', '127.0.0.1', '内网IP', '[5] ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:35.602696', 12);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (214, '出租屋检查', 3, 'com.ruoyi.rental.controller.RentalHouseInspectionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/rental/inspection/4', '127.0.0.1', '内网IP', '[4] ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:37.490958', 12);
INSERT INTO "public"."sys_oper_log" ("oper_id", "title", "business_type", "method", "request_method", "operator_type", "oper_name", "dept_name", "oper_url", "oper_ip", "oper_location", "oper_param", "json_result", "status", "error_msg", "oper_time", "cost_time") VALUES (215, '出租屋检查', 1, 'com.ruoyi.rental.controller.RentalHouseInspectionController.add()', 'POST', 1, 'admin', '研发部门', '/rental/inspection', '127.0.0.1', '内网IP', '{"dataLevel":"2","fireLevel":"1","houseId":1,"id":7,"inspectionTime":"2026-04-04 21:41:01","overallLevel":"red","params":{},"securityLevel":"2"} ', '{"msg":"操作成功","code":200}', 0, NULL, '2026-04-02 15:54:52.525333', 24);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_post";
CREATE TABLE "public"."sys_post" (
  "post_id" int8 NOT NULL DEFAULT nextval('sys_post_post_id_seq'::regclass),
  "post_code" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "post_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "post_sort" int4 NOT NULL,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_post" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_post"."post_id" IS '岗位ID';
COMMENT ON COLUMN "public"."sys_post"."post_code" IS '岗位编码';
COMMENT ON COLUMN "public"."sys_post"."post_name" IS '岗位名称';
COMMENT ON COLUMN "public"."sys_post"."post_sort" IS '显示顺序';
COMMENT ON COLUMN "public"."sys_post"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_post"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_post"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_post"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_post"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_post"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_post" IS '岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_post" ("post_id", "post_code", "post_name", "post_sort", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-03-24 22:10:48.918215', '', NULL, '');
INSERT INTO "public"."sys_post" ("post_id", "post_code", "post_name", "post_sort", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-03-24 22:10:48.918832', '', NULL, '');
INSERT INTO "public"."sys_post" ("post_id", "post_code", "post_name", "post_sort", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-03-24 22:10:48.91921', '', NULL, '');
INSERT INTO "public"."sys_post" ("post_id", "post_code", "post_name", "post_sort", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-03-24 22:10:48.919529', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "role_id" int8 NOT NULL DEFAULT nextval('sys_role_role_id_seq'::regclass),
  "role_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "role_key" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "role_sort" int4 NOT NULL,
  "data_scope" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "menu_check_strictly" int2 DEFAULT 1,
  "dept_check_strictly" int2 DEFAULT 1,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_role" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."role_key" IS '角色权限字符串';
COMMENT ON COLUMN "public"."sys_role"."role_sort" IS '显示顺序';
COMMENT ON COLUMN "public"."sys_role"."data_scope" IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
COMMENT ON COLUMN "public"."sys_role"."menu_check_strictly" IS '菜单树选择项是否关联显示';
COMMENT ON COLUMN "public"."sys_role"."dept_check_strictly" IS '部门树选择项是否关联显示';
COMMENT ON COLUMN "public"."sys_role"."status" IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_role"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "public"."sys_role"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_role" IS '角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_role" ("role_id", "role_name", "role_key", "role_sort", "data_scope", "menu_check_strictly", "dept_check_strictly", "status", "del_flag", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-03-24 22:10:48.951742', '', NULL, '超级管理员');
INSERT INTO "public"."sys_role" ("role_id", "role_name", "role_key", "role_sort", "data_scope", "menu_check_strictly", "dept_check_strictly", "status", "del_flag", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-03-24 22:10:48.952611', 'admin', '2026-03-27 12:55:52.269642', '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_dept";
CREATE TABLE "public"."sys_role_dept" (
  "role_id" int8 NOT NULL,
  "dept_id" int8 NOT NULL
)
;
ALTER TABLE "public"."sys_role_dept" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_role_dept"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_dept"."dept_id" IS '部门ID';
COMMENT ON TABLE "public"."sys_role_dept" IS '角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_role_dept" ("role_id", "dept_id") VALUES (2, 100);
INSERT INTO "public"."sys_role_dept" ("role_id", "dept_id") VALUES (2, 101);
INSERT INTO "public"."sys_role_dept" ("role_id", "dept_id") VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;
ALTER TABLE "public"."sys_role_menu" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 100);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1000);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1001);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1002);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1003);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1004);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1005);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1006);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 101);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1007);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1008);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1009);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1010);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1011);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 102);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1012);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1013);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1014);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1015);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 103);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1016);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1017);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1018);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1019);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 104);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1020);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1021);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1022);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1023);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1024);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 105);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1025);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1026);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1027);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1028);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1029);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 106);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1030);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1031);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1032);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1033);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1034);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 107);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1035);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1036);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1037);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1038);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 108);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 500);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1039);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1040);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1041);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 501);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1042);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1043);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1044);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1045);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 2);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 109);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1046);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1047);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1048);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 110);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1049);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1050);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1051);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1052);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1053);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1054);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 111);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 112);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 113);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 114);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 3);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 115);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 116);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1055);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1056);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1057);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1058);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1059);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 1060);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (2, 117);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "user_id" int8 NOT NULL DEFAULT nextval('sys_user_user_id_seq'::regclass),
  "dept_id" int8,
  "user_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "nick_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "user_type" varchar(2) COLLATE "pg_catalog"."default" DEFAULT '00'::character varying,
  "email" varchar(50) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "phonenumber" varchar(11) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "sex" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "avatar" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "password" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "login_ip" varchar(128) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "login_date" timestamp(6),
  "pwd_update_date" timestamp(6),
  "create_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "create_time" timestamp(6),
  "update_by" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "update_time" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
ALTER TABLE "public"."sys_user" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_user"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."user_name" IS '用户账号';
COMMENT ON COLUMN "public"."sys_user"."nick_name" IS '用户昵称';
COMMENT ON COLUMN "public"."sys_user"."user_type" IS '用户类型（00系统用户）';
COMMENT ON COLUMN "public"."sys_user"."email" IS '用户邮箱';
COMMENT ON COLUMN "public"."sys_user"."phonenumber" IS '手机号码';
COMMENT ON COLUMN "public"."sys_user"."sex" IS '用户性别（0男 1女 2未知）';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像地址';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."status" IS '账号状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_user"."del_flag" IS '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN "public"."sys_user"."login_ip" IS '最后登录IP';
COMMENT ON COLUMN "public"."sys_user"."login_date" IS '最后登录时间';
COMMENT ON COLUMN "public"."sys_user"."pwd_update_date" IS '密码最后更新时间';
COMMENT ON COLUMN "public"."sys_user"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_user" IS '用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user" ("user_id", "dept_id", "user_name", "nick_name", "user_type", "email", "phonenumber", "sex", "avatar", "password", "status", "del_flag", "login_ip", "login_date", "pwd_update_date", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-24 22:10:48.903892', '2026-03-24 22:10:48.903892', 'admin', '2026-03-24 22:10:48.903892', '', NULL, '测试员');
INSERT INTO "public"."sys_user" ("user_id", "dept_id", "user_name", "nick_name", "user_type", "email", "phonenumber", "sex", "avatar", "password", "status", "del_flag", "login_ip", "login_date", "pwd_update_date", "create_by", "create_time", "update_by", "update_time", "remark") VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-04-04 20:17:30.469', '2026-03-24 22:10:48.903262', 'admin', '2026-03-24 22:10:48.903262', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_post";
CREATE TABLE "public"."sys_user_post" (
  "user_id" int8 NOT NULL,
  "post_id" int8 NOT NULL
)
;
ALTER TABLE "public"."sys_user_post" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_user_post"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_post"."post_id" IS '岗位ID';
COMMENT ON TABLE "public"."sys_user_post" IS '用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user_post" ("user_id", "post_id") VALUES (1, 1);
INSERT INTO "public"."sys_user_post" ("user_id", "post_id") VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
ALTER TABLE "public"."sys_user_role" OWNER TO "postgres";
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."sys_user_role" IS '用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys_user_role" ("user_id", "role_id") VALUES (1, 1);
INSERT INTO "public"."sys_user_role" ("user_id", "role_id") VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."db_version_id_seq"
OWNED BY "public"."db_version"."id";
SELECT setval('"public"."db_version_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gen_table_column_column_id_seq"
OWNED BY "public"."gen_table_column"."column_id";
SELECT setval('"public"."gen_table_column_column_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gen_table_table_id_seq"
OWNED BY "public"."gen_table"."table_id";
SELECT setval('"public"."gen_table_table_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_access_logs_id_seq"
OWNED BY "public"."rental_access_logs"."id";
SELECT setval('"public"."rental_access_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_alerts_id_seq"
OWNED BY "public"."rental_alerts"."id";
SELECT setval('"public"."rental_alerts_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_devices_id_seq"
OWNED BY "public"."rental_devices"."id";
SELECT setval('"public"."rental_devices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_face_photos_id_seq"
OWNED BY "public"."rental_face_photos"."id";
SELECT setval('"public"."rental_face_photos_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_grids_id_seq"
OWNED BY "public"."rental_grids"."id";
SELECT setval('"public"."rental_grids_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_house_devices_id_seq"
OWNED BY "public"."rental_house_devices"."id";
SELECT setval('"public"."rental_house_devices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_house_inspections_id_seq"
OWNED BY "public"."rental_house_inspections"."id";
SELECT setval('"public"."rental_house_inspections_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_houses_id_seq"
OWNED BY "public"."rental_houses"."id";
SELECT setval('"public"."rental_houses_id_seq"', 33, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_managers_id_seq"
OWNED BY "public"."rental_managers"."id";
SELECT setval('"public"."rental_managers_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_metadata_id_seq"
OWNED BY "public"."rental_metadata"."id";
SELECT setval('"public"."rental_metadata_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_residents_id_seq"
OWNED BY "public"."rental_residents"."id";
SELECT setval('"public"."rental_residents_id_seq"', 66, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_room_id_seq"
OWNED BY "public"."rental_room"."id";
SELECT setval('"public"."rental_room_id_seq"', 33, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rental_verifications_id_seq"
OWNED BY "public"."rental_verifications"."id";
SELECT setval('"public"."rental_verifications_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_config_config_id_seq"
OWNED BY "public"."sys_config"."config_id";
SELECT setval('"public"."sys_config_config_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dept_dept_id_seq"
OWNED BY "public"."sys_dept"."dept_id";
SELECT setval('"public"."sys_dept_dept_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_data_dict_code_seq"
OWNED BY "public"."sys_dict_data"."dict_code";
SELECT setval('"public"."sys_dict_data_dict_code_seq"', 172, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_type_dict_id_seq"
OWNED BY "public"."sys_dict_type"."dict_id";
SELECT setval('"public"."sys_dict_type_dict_id_seq"', 44, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_job_job_id_seq"
OWNED BY "public"."sys_job"."job_id";
SELECT setval('"public"."sys_job_job_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_job_log_job_log_id_seq"
OWNED BY "public"."sys_job_log"."job_log_id";
SELECT setval('"public"."sys_job_log_job_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_logininfor_info_id_seq"
OWNED BY "public"."sys_logininfor"."info_id";
SELECT setval('"public"."sys_logininfor_info_id_seq"', 103, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_menu_menu_id_seq"
OWNED BY "public"."sys_menu"."menu_id";
SELECT setval('"public"."sys_menu_menu_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_notice_notice_id_seq"
OWNED BY "public"."sys_notice"."notice_id";
SELECT setval('"public"."sys_notice_notice_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_oper_log_oper_id_seq"
OWNED BY "public"."sys_oper_log"."oper_id";
SELECT setval('"public"."sys_oper_log_oper_id_seq"', 215, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_post_post_id_seq"
OWNED BY "public"."sys_post"."post_id";
SELECT setval('"public"."sys_post_post_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_role_role_id_seq"
OWNED BY "public"."sys_role"."role_id";
SELECT setval('"public"."sys_role_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_user_user_id_seq"
OWNED BY "public"."sys_user"."user_id";
SELECT setval('"public"."sys_user_user_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table db_version
-- ----------------------------
ALTER TABLE "public"."db_version" ADD CONSTRAINT "db_version_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table gen_table
-- ----------------------------
ALTER TABLE "public"."gen_table" ADD CONSTRAINT "gen_table_pkey" PRIMARY KEY ("table_id");

-- ----------------------------
-- Primary Key structure for table gen_table_column
-- ----------------------------
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_pkey" PRIMARY KEY ("column_id");

-- ----------------------------
-- Primary Key structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_blob_triggers" ADD CONSTRAINT "qrtz_blob_triggers_pkey" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_calendars
-- ----------------------------
ALTER TABLE "public"."qrtz_calendars" ADD CONSTRAINT "qrtz_calendars_pkey" PRIMARY KEY ("sched_name", "calendar_name");

-- ----------------------------
-- Primary Key structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_cron_triggers" ADD CONSTRAINT "qrtz_cron_triggers_pkey" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_fired_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_fired_triggers" ADD CONSTRAINT "qrtz_fired_triggers_pkey" PRIMARY KEY ("sched_name", "entry_id");

-- ----------------------------
-- Primary Key structure for table qrtz_job_details
-- ----------------------------
ALTER TABLE "public"."qrtz_job_details" ADD CONSTRAINT "qrtz_job_details_pkey" PRIMARY KEY ("sched_name", "job_name", "job_group");

-- ----------------------------
-- Primary Key structure for table qrtz_locks
-- ----------------------------
ALTER TABLE "public"."qrtz_locks" ADD CONSTRAINT "qrtz_locks_pkey" PRIMARY KEY ("sched_name", "lock_name");

-- ----------------------------
-- Primary Key structure for table qrtz_paused_trigger_grps
-- ----------------------------
ALTER TABLE "public"."qrtz_paused_trigger_grps" ADD CONSTRAINT "qrtz_paused_trigger_grps_pkey" PRIMARY KEY ("sched_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_scheduler_state
-- ----------------------------
ALTER TABLE "public"."qrtz_scheduler_state" ADD CONSTRAINT "qrtz_scheduler_state_pkey" PRIMARY KEY ("sched_name", "instance_name");

-- ----------------------------
-- Primary Key structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simple_triggers" ADD CONSTRAINT "qrtz_simple_triggers_pkey" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simprop_triggers" ADD CONSTRAINT "qrtz_simprop_triggers_pkey" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_triggers" ADD CONSTRAINT "qrtz_triggers_pkey" PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Indexes structure for table rental_access_logs
-- ----------------------------
CREATE INDEX "idx_rental_access_logs_capture_time" ON "public"."rental_access_logs" USING btree (
  "capture_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_access_logs_house_id" ON "public"."rental_access_logs" USING btree (
  "house_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_access_logs_is_stranger" ON "public"."rental_access_logs" USING btree (
  "is_stranger" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_access_logs
-- ----------------------------
ALTER TABLE "public"."rental_access_logs" ADD CONSTRAINT "rental_access_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_alerts
-- ----------------------------
CREATE INDEX "idx_rental_alerts_create_time" ON "public"."rental_alerts" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_alerts_house_id" ON "public"."rental_alerts" USING btree (
  "house_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_alerts_status" ON "public"."rental_alerts" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_alerts
-- ----------------------------
ALTER TABLE "public"."rental_alerts" ADD CONSTRAINT "rental_alerts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_devices
-- ----------------------------
CREATE INDEX "idx_rental_devices_status" ON "public"."rental_devices" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table rental_devices
-- ----------------------------
ALTER TABLE "public"."rental_devices" ADD CONSTRAINT "rental_devices_device_code_key" UNIQUE ("device_code");

-- ----------------------------
-- Primary Key structure for table rental_devices
-- ----------------------------
ALTER TABLE "public"."rental_devices" ADD CONSTRAINT "rental_devices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_face_photos
-- ----------------------------
CREATE INDEX "idx_rental_face_photos_resident_id" ON "public"."rental_face_photos" USING btree (
  "resident_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_face_photos
-- ----------------------------
ALTER TABLE "public"."rental_face_photos" ADD CONSTRAINT "rental_face_photos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_grids
-- ----------------------------
CREATE INDEX "idx_rental_grids_grid_code" ON "public"."rental_grids" USING btree (
  "grid_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_grids_status" ON "public"."rental_grids" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_grids_town_street" ON "public"."rental_grids" USING btree (
  "town_street" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_grids
-- ----------------------------
ALTER TABLE "public"."rental_grids" ADD CONSTRAINT "rental_grids_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_house_devices
-- ----------------------------
CREATE INDEX "idx_rental_house_devices_device_id" ON "public"."rental_house_devices" USING btree (
  "device_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_house_devices_house_id" ON "public"."rental_house_devices" USING btree (
  "house_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_house_devices
-- ----------------------------
ALTER TABLE "public"."rental_house_devices" ADD CONSTRAINT "rental_house_devices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_house_inspections
-- ----------------------------
CREATE INDEX "idx_rental_house_inspections_house_id" ON "public"."rental_house_inspections" USING btree (
  "house_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_house_inspections_inspection_time" ON "public"."rental_house_inspections" USING btree (
  "inspection_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_house_inspections_inspector_id" ON "public"."rental_house_inspections" USING btree (
  "inspector_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_house_inspections
-- ----------------------------
ALTER TABLE "public"."rental_house_inspections" ADD CONSTRAINT "rental_house_inspections_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_houses
-- ----------------------------
CREATE INDEX "idx_rental_houses_create_time" ON "public"."rental_houses" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_houses_district" ON "public"."rental_houses" USING btree (
  "town_street" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_houses_manager_id" ON "public"."rental_houses" USING btree (
  "manager_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_houses_status" ON "public"."rental_houses" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_houses
-- ----------------------------
ALTER TABLE "public"."rental_houses" ADD CONSTRAINT "rental_houses_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rental_managers
-- ----------------------------
ALTER TABLE "public"."rental_managers" ADD CONSTRAINT "rental_managers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_metadata
-- ----------------------------
CREATE INDEX "idx_rental_metadata_create_time" ON "public"."rental_metadata" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_metadata_device_id" ON "public"."rental_metadata" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_metadata_type" ON "public"."rental_metadata" USING btree (
  "metadata_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_metadata
-- ----------------------------
ALTER TABLE "public"."rental_metadata" ADD CONSTRAINT "rental_metadata_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_residents
-- ----------------------------
CREATE INDEX "idx_rental_residents_house_id" ON "public"."rental_residents" USING btree (
  "house_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_residents_phone" ON "public"."rental_residents" USING btree (
  "phone" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_residents_room_no" ON "public"."rental_residents" USING btree (
  "room_no" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_rental_residents_status" ON "public"."rental_residents" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_residents
-- ----------------------------
ALTER TABLE "public"."rental_residents" ADD CONSTRAINT "rental_residents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rental_room
-- ----------------------------
ALTER TABLE "public"."rental_room" ADD CONSTRAINT "rental_room_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rental_verifications
-- ----------------------------
CREATE INDEX "idx_rental_verifications_alert_id" ON "public"."rental_verifications" USING btree (
  "alert_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rental_verifications
-- ----------------------------
ALTER TABLE "public"."rental_verifications" ADD CONSTRAINT "rental_verifications_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("config_id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_pkey" PRIMARY KEY ("dict_code");

-- ----------------------------
-- Uniques structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "uk_dict_type" UNIQUE ("dict_type");

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("dict_id");

-- ----------------------------
-- Primary Key structure for table sys_job
-- ----------------------------
ALTER TABLE "public"."sys_job" ADD CONSTRAINT "sys_job_pkey" PRIMARY KEY ("job_id");

-- ----------------------------
-- Primary Key structure for table sys_job_log
-- ----------------------------
ALTER TABLE "public"."sys_job_log" ADD CONSTRAINT "sys_job_log_pkey" PRIMARY KEY ("job_log_id");

-- ----------------------------
-- Indexes structure for table sys_logininfor
-- ----------------------------
CREATE INDEX "idx_sys_logininfor_lt" ON "public"."sys_logininfor" USING btree (
  "login_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_logininfor_s" ON "public"."sys_logininfor" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_logininfor
-- ----------------------------
ALTER TABLE "public"."sys_logininfor" ADD CONSTRAINT "sys_logininfor_pkey" PRIMARY KEY ("info_id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_pkey" PRIMARY KEY ("notice_id");

-- ----------------------------
-- Indexes structure for table sys_oper_log
-- ----------------------------
CREATE INDEX "idx_sys_oper_log_bt" ON "public"."sys_oper_log" USING btree (
  "business_type" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_oper_log_ot" ON "public"."sys_oper_log" USING btree (
  "oper_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys_oper_log_s" ON "public"."sys_oper_log" USING btree (
  "status" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_oper_log
-- ----------------------------
ALTER TABLE "public"."sys_oper_log" ADD CONSTRAINT "sys_oper_log_pkey" PRIMARY KEY ("oper_id");

-- ----------------------------
-- Primary Key structure for table sys_post
-- ----------------------------
ALTER TABLE "public"."sys_post" ADD CONSTRAINT "sys_post_pkey" PRIMARY KEY ("post_id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "sys_role_dept_pkey" PRIMARY KEY ("role_id", "dept_id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("role_id", "menu_id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table sys_user_post
-- ----------------------------
ALTER TABLE "public"."sys_user_post" ADD CONSTRAINT "sys_user_post_pkey" PRIMARY KEY ("user_id", "post_id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("user_id", "role_id");

-- ----------------------------
-- Foreign Keys structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_blob_triggers" ADD CONSTRAINT "qrtz_blob_triggers_sched_name_fkey" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_cron_triggers" ADD CONSTRAINT "qrtz_cron_triggers_sched_name_fkey" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simple_triggers" ADD CONSTRAINT "qrtz_simple_triggers_sched_name_fkey" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simprop_triggers" ADD CONSTRAINT "qrtz_simprop_triggers_sched_name_fkey" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_triggers" ADD CONSTRAINT "qrtz_triggers_sched_name_fkey" FOREIGN KEY ("sched_name", "job_name", "job_group") REFERENCES "public"."qrtz_job_details" ("sched_name", "job_name", "job_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_access_logs
-- ----------------------------
ALTER TABLE "public"."rental_access_logs" ADD CONSTRAINT "fk_rental_access_logs_house" FOREIGN KEY ("house_id") REFERENCES "public"."rental_houses" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_alerts
-- ----------------------------
ALTER TABLE "public"."rental_alerts" ADD CONSTRAINT "fk_rental_alerts_access_log" FOREIGN KEY ("access_log_id") REFERENCES "public"."rental_access_logs" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."rental_alerts" ADD CONSTRAINT "fk_rental_alerts_house" FOREIGN KEY ("house_id") REFERENCES "public"."rental_houses" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_face_photos
-- ----------------------------
ALTER TABLE "public"."rental_face_photos" ADD CONSTRAINT "fk_rental_face_photos_resident" FOREIGN KEY ("resident_id") REFERENCES "public"."rental_residents" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_residents
-- ----------------------------
ALTER TABLE "public"."rental_residents" ADD CONSTRAINT "fk_rental_residents_house" FOREIGN KEY ("house_id") REFERENCES "public"."rental_houses" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."rental_residents" ADD CONSTRAINT "rental_residents_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "public"."rental_room" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_room
-- ----------------------------
ALTER TABLE "public"."rental_room" ADD CONSTRAINT "rental_room_house_id_fkey" FOREIGN KEY ("house_id") REFERENCES "public"."rental_houses" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rental_verifications
-- ----------------------------
ALTER TABLE "public"."rental_verifications" ADD CONSTRAINT "fk_rental_verifications_alert" FOREIGN KEY ("alert_id") REFERENCES "public"."rental_alerts" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
