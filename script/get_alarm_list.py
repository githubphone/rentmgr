#!/usr/bin/env python3
"""
统一监控平台 - 获取告警列表
使用 HTTP Digest 认证
"""

import os
import sys
import json
import hashlib
import secrets
import requests
import urllib3
from datetime import datetime, timedelta


urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


class DigestAuth:
    """HTTP Digest 认证"""
    
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.nonce = None
        self.opaque = None
        self.realm = None
        self.qop = None
    
    def get_auth_header(self, method, uri):
        """生成 Digest 认证头"""
        nc = '00000001'
        cnonce = secrets.token_hex(8)
        
        a1 = f"{self.username}:{self.realm}:{self.password}"
        ha1 = hashlib.md5(a1.encode()).hexdigest()
        
        a2 = f"{method}:{uri}"
        ha2 = hashlib.md5(a2.encode()).hexdigest()
        
        if self.qop == 'auth':
            response = hashlib.md5(
                f"{ha1}:{self.nonce}:{nc}:{cnonce}:auth:{ha2}".encode()
            ).hexdigest()
        else:
            response = hashlib.md5(
                f"{ha1}:{self.nonce}:{ha2}".encode()
            ).hexdigest()
        
        return (
            f'Digest username="{self.username}", '
            f'realm="{self.realm}", '
            f'nonce="{self.nonce}", '
            f'uri="{uri}", '
            f'qop={self.qop}, '
            f'nc={nc}, '
            f'cnonce="{cnonce}", '
            f'response="{response}", '
            f'opaque="{self.opaque}"'
        )


def parse_www_authenticate(header):
    """解析 WWW-Authenticate 头"""
    parts = header.replace('Digest ', '')
    result = {}
    for item in parts.split(','):
        if '=' in item:
            key, val = item.split('=', 1)
            result[key.strip().strip('"')] = val.strip().strip('"')
    return result


def get_alarm_list(base_url, username, password, 
                   alarm_group_type="2",  # 1-状态通知 2-后端智能分析 3-前端设备业务 4-前端设备故障 5-视频质量检测
                   alarm_types=None,     # 告警类型列表，如 ["PERSON_RECOGNITION"]
                   begin_time=None,       # 开始时间，格式 "YYYY-MM-DD HH:MM:SS"
                   end_time=None,         # 结束时间
                   page_num=1,
                   page_size=50):
    """
    获取告警列表
    
    Args:
        base_url: 平台地址，如 "https://112.60.33.18:10002"
        username: 用户名
        password: 密码
        alarm_group_type: 告警分组类型
        alarm_types: 告警类型列表，如 ["PERSON_RECOGNITION", "ALARM_AI_MASK_NOT_WEAR"]
        begin_time: 开始时间
        end_time: 结束时间
        page_num: 页码
        page_size: 每页数量
    
    Returns:
        告警列表
    """
    path = "/ecs/v1/api/alarm/list"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    headers = {"Content-Type": "application/json"}
    
    # 第一次请求，获取 401 挑战
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code != 401:
        print(f"⚠️ 预期 401，实际: {response.status_code}")
        print(response.text)
        return []
    
    # 解析挑战信息
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    # 构建请求体
    search_info = {
        "alarmGroupType": alarm_group_type,
        "beginTime": begin_time or (datetime.now() - timedelta(days=1)).strftime("%Y-%m-%d %H:%M:%S"),
        "endTime": end_time or datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    
    if alarm_types:
        search_info["typeList"] = alarm_types
    
    body = {
        "pageInfo": {
            "pageNum": page_num,
            "pageSize": page_size
        },
        "searchInfo": search_info
    }
    
    # 第二次请求，带 Digest 认证
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code == 200:
        return parse_alarm_list(response.json())
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return []


def parse_alarm_list(data):
    """解析告警列表"""
    result_code = data.get('resultCode')
    if str(result_code) not in ('0', 'SUCCESS'):
        print(f"❌ 接口返回错误: {data.get('resultDesc')}")
        return []
    
    page_info = data.get('pageInfo', {})
    total = page_info.get('totalNum', 0)
    
    alarm_list = data.get('alarmList', [])
    
    print(f"📋 共找到 {total} 条告警记录\n")
    
    results = []
    for alarm in alarm_list:
        results.append({
            'alarmId': alarm.get('alarmId'),
            'alarmDevId': alarm.get('alarmDevId'),
            'alarmDevName': alarm.get('alarmDevName'),
            'alarmType': alarm.get('alarmType'),
            'alarmTypeName': alarm.get('alarmTypeName'),
            'alarmTime': alarm.get('alarmTime'),
            'alarmState': '活动告警' if alarm.get('alarmState') == 1 else '已消除',
            'confirmState': '已确认' if alarm.get('confirmState') == 1 else '未确认',
            'checkState': parse_check_state(alarm.get('checkState')),
            'alarmLevel': alarm.get('alarmLevel'),
            'alarmLevelName': alarm.get('alarmLevelName'),
            'alarmSnapUrl': alarm.get('alarmSnapUrl', ''),
            'addition': alarm.get('addition', '')
        })
    
    return results


def parse_check_state(state):
    """解析正检误检状态"""
    mapping = {
        0: '未设置',
        1: '误检',
        2: '正检'
    }
    return mapping.get(state, '未知')


def print_alarms(alarms):
    """打印告警列表"""
    if not alarms:
        print("❌ 没有告警记录")
        return
    
    print(f"{'序号':<4} {'告警时间':<20} {'告警类型':<30} {'设备名称':<25} {'状态':<8} {'确认':<6}")
    print("-" * 120)
    
    for i, alarm in enumerate(alarms, 1):
        alarm_type = alarm['alarmTypeName'] or alarm['alarmType']
        print(
            f"{i:<4} "
            f"{alarm['alarmTime']:<20} "
            f"{alarm_type:<30} "
            f"{alarm['alarmDevName']:<25} "
            f"{alarm['alarmState']:<8} "
            f"{alarm['confirmState']:<6}"
        )
    
    print(f"\n共 {len(alarms)} 条记录")


def main():
    # ========== 从环境变量读取 ==========
    BASE_URL = os.environ.get("MONITOR_BASE_URL")      # 平台地址
    USERNAME = os.environ.get("MONITOR_USERNAME")       # 用户名
    PASSWORD = os.environ.get("MONITOR_PASSWORD")       # 密码
    # ===================================
    
    if not all([BASE_URL, USERNAME, PASSWORD]):
        print("❌ 请设置环境变量:")
        print("  export MONITOR_BASE_URL=https://112.60.33.18:10002")
        print("  export MONITOR_USERNAME=your_username")
        print("  export MONITOR_PASSWORD=your_password")
        return
    
    # 命令行参数解析
    if len(sys.argv) > 1:
        if sys.argv[1] == "--help":
            print("用法: python3 get_alarm_list.py [天数] [告警类型]")
            print("  天数: 查询最近几天，默认1天")
            print("  告警类型: 可选，多个用逗号分隔")
            print("    - PERSON_RECOGNITION: 人脸识别")
            print("    - ALARM_AI_MASK_NOT_WEAR: 口罩检测")
            print("    - ALARM_AI_NOT_WEARING_TOOLING: 厨师服检测")
            print("    - ALARM_AI_CHEFHAT_NOT_WEA: 厨师帽检测")
            print("    - ALARM_AI_LEAVE_ATWORK_DETECTION: 离岗检测")
            print("    - ALARM_AI_SLEEP_ATWORK_DETECTION: 睡岗检测")
            print("    - ALARM_AI_INTRUSION_DETECTION: 周界入侵检测")
            print("    - ALARM_AI_FIGHTING_DETECTION: 打架识别")
            print("    - ALARM_AI_PERSONS_FALL_DETECTION: 人员摔倒检测")
            print("    - ALL: 所有告警")
            print("\n示例:")
            print("  python3 get_alarm_list.py 1")
            print("  python3 get_alarm_list.py 7 PERSON_RECOGNITION")
            print("  python3 get_alarm_list.py 3 PERSON_RECOGNITION,ALARM_AI_MASK_NOT_WEAR")
            return
        
        days = int(sys.argv[1]) if len(sys.argv) > 1 else 1
        alarm_types_arg = sys.argv[2] if len(sys.argv) > 2 else None
    else:
        days = 1
        alarm_types_arg = None
    
    # 解析告警类型
    alarm_types = None
    if alarm_types_arg:
        if alarm_types_arg.upper() == "ALL":
            alarm_types = None  # 查询所有
        else:
            alarm_types = alarm_types_arg.split(',')
    
    print(f"🔄 正在获取告警列表 (最近 {days} 天)...")
    if alarm_types:
        print(f"   告警类型: {alarm_types}")
    
    now = datetime.now()
    # 按天查询时，从当天0点开始
    if days >= 1:
        begin_time = now.replace(hour=0, minute=0, second=0).strftime("%Y-%m-%d 00:00:00")
    else:
        begin_time = (now - timedelta(hours=24)).strftime("%Y-%m-%d %H:%M:%S")
    end_time = now.strftime("%Y-%m-%d %H:%M:%S")
    
    alarms = get_alarm_list(
        BASE_URL, USERNAME, PASSWORD,
        alarm_group_type="2",  # 后端智能分析
        alarm_types=alarm_types,
        begin_time=begin_time,
        end_time=end_time
    )
    
    print_alarms(alarms)


if __name__ == "__main__":
    main()
