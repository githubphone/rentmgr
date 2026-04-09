#!/usr/bin/env python3
"""
统一监控平台 - 获取摄像头抓拍图片
使用 HTTP Digest 认证
"""

import requests
import hashlib
import random
import secrets
import json
import os
import sys
from datetime import datetime, timedelta


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
        
        # A1 = username:realm:password
        a1 = f"{self.username}:{self.realm}:{self.password}"
        ha1 = hashlib.md5(a1.encode()).hexdigest()
        
        # A2 = method:uri
        a2 = f"{method}:{uri}"
        ha2 = hashlib.md5(a2.encode()).hexdigest()
        
        # response = MD5(ha1:nonce:nc:cnonce:qop:ha2)
        if self.qop == 'auth':
            response = hashlib.md5(
                f"{ha1}:{self.nonce}:{nc}:{cnonce}:auth:{ha2}".encode()
            ).hexdigest()
        else:
            response = hashlib.md5(
                f"{ha1}:{self.nonce}:{ha2}".encode()
            ).hexdigest()
        
        auth_header = (
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
        return auth_header


def parse_www_authenticate(header):
    """解析 WWW-Authenticate 头"""
    parts = header.replace('Digest ', '')
    result = {}
    for item in parts.split(','):
        if '=' in item:
            key, val = item.split('=', 1)
            result[key.strip().strip('"')] = val.strip().strip('"')
    return result


def get_camera_snapshot_list(base_url, username, password, camera_id, days=1, snap_type=0, page_size=50):
    """
    获取摄像头抓拍图片列表
    
    Args:
        base_url: 平台地址，如 "http://10.137.47.206:8080"
        username: 用户名
        password: 密码
        camera_id: 摄像头ID
        days: 查询最近几天的数据，默认1天
        snap_type: 抓拍类型，0-全部，1-智能分析，2-告警抓拍，3-手动抓拍
        page_size: 每页数量，默认50条
    
    Returns:
        抓拍图片列表
    """
    import urllib3
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    
    path = "/uas/v1/api/snap/list"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    
    # 计算时间范围
    end_time = datetime.now()
    start_time = end_time - timedelta(days=days)
    
    # 构建请求体 - 注意 cameraList 是字符串数组，不是对象数组
    body = {
        "pageInfo": {
            "pageNum": 1,
            "pageSize": page_size
        },
        "cameraList": [
            camera_id  # 字符串数组，不是 {"cameraId": camera_id}
        ],
        "searchInfo": {
            "beginTime": start_time.strftime("%Y-%m-%d %H:%M:%S"),
            "endTime": end_time.strftime("%Y-%m-%d %H:%M:%S")
        }
    }
    
    # 如果指定了抓拍类型
    if snap_type > 0:
        body["snapType"] = snap_type
    
    # 第一次请求，获取 401 挑战
    headers = {"Content-Type": "application/json"}
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code != 401:
        print(f"⚠️ 预期 401，实际: {response.status_code}")
        print(response.text)
        return []
    
    # 解析挑战信息
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    # 第二次请求，带 Digest 认证
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code == 200:
        data = response.json()
        return parse_snap_list(data)
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return []


def parse_snap_list(data):
    """解析抓拍图片列表"""
    result_code = data.get('resultCode')
    if str(result_code) not in ('0', 'SUCCESS'):
        print(f"❌ 接口返回错误: {data.get('resultDesc')}")
        return []
    
    page_info = data.get('pageInfo', {})
    total = page_info.get('totalNum', 0)
    print(f"📷 共找到 {total} 张抓拍图片\n")
    
    snap_list = data.get('snapList', [])
    results = []
    
    for snap in snap_list:
        results.append({
            'contentId': snap.get('contentId'),
            'cameraId': snap.get('cameraId'),
            'cameraName': snap.get('cameraName'),
            'snapTime': snap.get('snapTime'),
            'snapType': parse_snap_type(snap.get('snapType')),
            'contentSize': parse_size(snap.get('contentSize')),
            'previewUrl': snap.get('previewUrl'),
            'url': snap.get('url')
        })
    
    return results


def parse_snap_type(snap_type):
    """解析抓拍类型"""
    mapping = {
        1: '智能分析',
        2: '告警抓拍',
        3: '手动抓拍'
    }
    return mapping.get(snap_type, '未知')


def parse_size(size_str):
    """解析文件大小"""
    if not size_str:
        return "未知"
    try:
        size = int(size_str)
        if size < 1024:
            return f"{size} B"
        elif size < 1024 * 1024:
            return f"{size / 1024:.1f} KB"
        else:
            return f"{size / (1024 * 1024):.1f} MB"
    except:
        return size_str


def main():
    # ========== 从环境变量读取 ==========
    BASE_URL = os.environ.get("MONITOR_BASE_URL")      # 平台地址，如 http://10.137.47.206:8080
    USERNAME = os.environ.get("MONITOR_USERNAME")       # 用户名
    PASSWORD = os.environ.get("MONITOR_PASSWORD")       # 密码
    # ===================================
    
    if not all([BASE_URL, USERNAME, PASSWORD]):
        print("❌ 请设置环境变量:")
        print("  export MONITOR_BASE_URL=http://10.137.47.206:8080")
        print("  export MONITOR_USERNAME=your_username")
        print("  export MONITOR_PASSWORD=your_password")
        return
    
    # 命令行参数解析
    if len(sys.argv) < 2:
        print("用法: python3 get_camera_snapshot.py <摄像头ID> [天数] [抓拍类型]")
        print("  摄像头ID: 必填，摄像头的 cameraId")
        print("  天数: 可选，查询最近几天数据，默认1天")
        print("  抓拍类型: 可选，0-全部，1-智能分析，2-告警抓拍，3-手动抓拍，默认0")
        print("\n示例:")
        print("  python3 get_camera_snapshot.py 2000834798001 1 0")
        return
    
    camera_id = sys.argv[1]
    days = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    snap_type = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    
    print(f"🔄 正在获取摄像头 {camera_id} 的抓拍图片 (最近 {days} 天)...\n")
    
    snaps = get_camera_snapshot_list(BASE_URL, USERNAME, PASSWORD, camera_id, days, snap_type)
    
    if snaps:
        print(f"\n{'序号':<4} {'抓拍时间':<20} {'类型':<10} {'大小':<10} {'图片URL'}")
        print("-" * 120)
        
        for i, snap in enumerate(snaps, 1):
            print(
                f"{i:<4} "
                f"{snap['snapTime']:<20} "
                f"{snap['snapType']:<10} "
                f"{snap['contentSize']:<10} "
                f"{snap['url']}"
            )
    else:
        print("❌ 未获取到抓拍图片（可能原因：")
        print("   1. 该摄像头最近没有抓拍记录")
        print("   2. 摄像头不支持抓拍功能")
        print("   3. 抓拍服务未启用)")
        print("\n💡 提示: 可以尝试用 python3 get_camera_snapshot.py <cameraId> <天数> 扩大时间范围")


if __name__ == "__main__":
    main()
