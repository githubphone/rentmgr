-- 为 rental_houses 表添加缺失的列
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS district VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS building VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS unit VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS floor INT;
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS room_no VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS owner_name VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS owner_phone VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS device_id VARCHAR(100);
ALTER TABLE rental_houses ADD COLUMN IF NOT EXISTS device_location VARCHAR(500);

-- 为 rental_managers 表添加 identity 列（替换 managed_area, police_station, status）
ALTER TABLE rental_managers ADD COLUMN IF NOT EXISTS identity VARCHAR(50);
ALTER TABLE rental_managers ADD COLUMN IF NOT EXISTS wechat VARCHAR(100);
ALTER TABLE rental_managers ADD COLUMN IF NOT EXISTS user_id BIGINT;

-- 删除不需要的列（如果存在）
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_managers' AND column_name = 'managed_area') THEN
        ALTER TABLE rental_managers DROP COLUMN managed_area;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_managers' AND column_name = 'police_station') THEN
        ALTER TABLE rental_managers DROP COLUMN police_station;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'rental_managers' AND column_name = 'status') THEN
        ALTER TABLE rental_managers DROP COLUMN status;
    END IF;
END
$$;

-- 验证列已添加
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'rental_managers';
