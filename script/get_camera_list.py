#!/usr/bin/env python3
"""
统一监控平台 - 获取摄像头列表
使用 HTTP Digest 认证
"""

import requests
import hashlib
import random
import secrets
import xml.etree.ElementTree as ET
from urllib.parse import parse_qs


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


def get_camera_list(base_url, username, password):
    """Suppress SSL warnings for internal certs"""
    import urllib3
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    
    """
    获取摄像头列表
    
    Args:
        base_url: 平台地址，如 "http://10.137.47.206:8080"
        username: 用户名
        password: 密码
    
    Returns:
        摄像头列表
    """
    path = "/uas/v1/api/dev/list"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    
    # 第一次请求，获取 401 挑战
    headers = {"Content-Type": "application/json"}
    response = session.post(url, headers=headers, json={}, verify=False)  # 内部平台跳过SSL验证
    
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
    
    response = session.post(url, headers=headers, json={}, verify=False)  # 内部平台跳过SSL验证
    
    if response.status_code == 200:
        data = response.json()
        return parse_cameras(data)
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return []


def parse_cameras(data):
    """解析摄像头列表"""
    cameras = []
    
    result_code = data.get('resultCode')
    if str(result_code) not in ('0', 'SUCCESS'):
        print(f"❌ 接口返回错误: {data.get('resultDesc')}")
        return cameras
    
    # 建立 groupId -> groupName 的映射
    group_map = {g.get('groupId'): g.get('groupName') for g in data.get('groupList', [])}
    
    # 遍历所有设备及其下的摄像头
    for dev in data.get('devList', []):
        dev_id = dev.get('devId')
        dev_name = dev.get('devName')
        
        for camera in dev.get('cameraList', []):
            cam_group_id = camera.get('groupId')
            cameras.append({
                'cameraId': camera.get('cameraId'),
                'cameraName': camera.get('cameraName'),
                'status': '在线' if camera.get('status') == '1' else '离线',
                'groupId': cam_group_id,
                'groupName': group_map.get(cam_group_id, '未知'),
                'devId': dev_id,
                'devName': dev_name,
                'ptzType': parse_ptz_type(camera.get('ptzType'))
            })
    
    return cameras


def parse_ptz_type(ptz_type):
    """解析云台类型"""
    mapping = {
        '1': '固定枪机',
        '2': '有云台枪机',
        '3': '球机'
    }
    return mapping.get(str(ptz_type), '未知')


def main():
    import os
    
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
    
    print("🔄 正在获取摄像头列表...")
    cameras = get_camera_list(BASE_URL, USERNAME, PASSWORD)
    
    if cameras:
        print(f"\n✅ 共获取到 {len(cameras)} 个摄像头:\n")
        print(f"{'序号':<4} {'摄像头名称':<30} {'状态':<6} {'设备':<20} {'分组':<15} {'类型':<10}")
        print("-" * 95)
        
        for i, cam in enumerate(cameras, 1):
            print(
                f"{i:<4} "
                f"{cam['cameraName']:<30} "
                f"{cam['status']:<6} "
                f"{cam['devName']:<20} "
                f"{cam['groupName']:<15} "
                f"{cam['cameraId']:<10}"
            )
    else:
        print("❌ 未获取到摄像头")


if __name__ == "__main__":
    main()
