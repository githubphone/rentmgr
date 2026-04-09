-- ================================================
-- 数据库版本表创建脚本
-- ================================================

-- ----------------------------
-- 创建数据库版本表
-- ----------------------------
CREATE TABLE IF NOT EXISTS db_version (
    id BIGSERIAL PRIMARY KEY,
    version VARCHAR(20) NOT NULL,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255)
);

COMMENT ON TABLE db_version IS '数据库版本表';
COMMENT ON COLUMN db_version.id IS '主键ID';
COMMENT ON COLUMN db_version.version IS '数据库版本号';
COMMENT ON COLUMN db_version.applied_at IS '应用时间';
COMMENT ON COLUMN db_version.description IS '版本描述';

-- ----------------------------
-- 插入初始版本记录
-- ----------------------------
INSERT INTO db_version (version, description) VALUES ('1.0.0', '初始版本') ON CONFLICT DO NOTHING;
