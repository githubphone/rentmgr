#!/usr/bin/env python3
"""
统一监控平台 - 订阅告警/元数据
使用 HTTP Digest 认证
"""

import os
import sys
import json
import hashlib
import secrets
import requests
import urllib3


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


def subscribe_alarm(base_url, username, password, camera_id_list=None, alarm_type_list=None, report_url=None):
    """
    订阅告警
    
    Args:
        base_url: 平台地址
        username: 用户名
        password: 密码
        camera_id_list: 摄像头ID列表，传空或None表示订阅全部
        alarm_type_list: 告警类型列表，传空或None表示全部类型
        report_url: 告警接收URL（必须外网可访问）
    
    Returns:
        订阅结果
    """
    path = "/uas/v1/api/alarm/subscribe"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    headers = {"Content-Type": "application/json"}
    
    # 第一次请求，获取 401 挑战
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code != 401:
        print(f"⚠️ 预期 401，实际: {response.status_code}")
        return None
    
    # 解析挑战信息
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    # 构建请求体
    body = {
        "reportUrl": report_url
    }
    
    if camera_id_list:
        body["cameraIdList"] = camera_id_list
    
    if alarm_type_list:
        body["alarmTypeList"] = alarm_type_list
    
    # 第二次请求，带 Digest 认证
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return None


def unsubscribe_alarm(base_url, username, password):
    """取消订阅告警"""
    path = "/uas/v1/api/alarm/subscribe/cancel"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    headers = {"Content-Type": "application/json"}
    
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code != 401:
        print(f"⚠️ 预期 401，实际: {response.status_code}")
        return None
    
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return None


def subscribe_metadata(base_url, username, password, device_id, algorithm_list=None, 
                      report_url=None, with_raw_data=0):
    """
    订阅元数据
    
    Args:
        base_url: 平台地址
        username: 用户名
        password: 密码
        device_id: 摄像头ID
        algorithm_list: 算法类型列表，如 ["FACE_DETECT"]（可选）
        report_url: 接收URL（必须外网可访问）
        with_raw_data: 是否携带原始数据，0-不携带 1-携带
    
    Returns:
        订阅结果
    """
    path = "/vir/v1/api/vir/metadata/subscribe"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    headers = {"Content-Type": "application/json"}
    
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code != 401:
        print(f"⚠️ 预期 401，实际: {response.status_code}")
        return None
    
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    body = {
        "deviceId": device_id,
        "reportInfo": {
            "reportType": 1,
            "reportUrl": report_url
        }
    }
    
    if algorithm_list:
        body["algorithmList"] = algorithm_list
    
    if with_raw_data:
        body["withRawData"] = with_raw_data
    
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return None


def unsubscribe_metadata(base_url, username, password, device_id):
    """取消订阅元数据"""
    path = "/vir/v1/api/vir/metadata/unsubscribe"
    url = f"{base_url}{path}"
    
    session = requests.Session()
    headers = {"Content-Type": "application/json"}
    
    response = session.post(url, headers=headers, json={}, verify=False)
    
    if response.status_code != 401:
        return None
    
    auth_info = parse_www_authenticate(response.headers.get('WWW-Authenticate', ''))
    
    body = {"deviceId": device_id}
    
    digest_auth = DigestAuth(username, password)
    digest_auth.nonce = auth_info.get('nonce')
    digest_auth.opaque = auth_info.get('opaque')
    digest_auth.realm = auth_info.get('realm')
    digest_auth.qop = auth_info.get('qop', 'auth')
    
    headers['Authorization'] = digest_auth.get_auth_header('POST', path)
    
    response = session.post(url, headers=headers, json=body, verify=False)
    
    if response.status_code == 200:
        return response.json()
    else:
        print(f"❌ 请求失败: {response.status_code}")
        print(response.text)
        return None


def main():
    BASE_URL = os.environ.get("MONITOR_BASE_URL")
    USERNAME = os.environ.get("MONITOR_USERNAME")
    PASSWORD = os.environ.get("MONITOR_PASSWORD")
    
    if not all([BASE_URL, USERNAME, PASSWORD]):
        print("❌ 请设置环境变量:")
        print("  export MONITOR_BASE_URL=https://112.60.33.18:10002")
        print("  export MONITOR_USERNAME=your_username")
        print("  export MONITOR_PASSWORD=your_password")
        return
    
    if len(sys.argv) < 2:
        print("""
📋 订阅脚本使用说明

用法:
  python3 subscribe.py alarm <report_url>        # 订阅告警
  python3 subscribe.py metadata <device_id> <report_url>  # 订阅元数据
  python3 subscribe.py cancel                   # 取消告警订阅

参数:
  report_url   - 接收推送的URL（必须外网可访问）
  device_id   - 摄像头ID

示例:
  # 订阅所有告警
  python3 subscribe.py alarm http://your-ip:8080/alarm/push
  
  # 订阅特定摄像头的人脸告警
  python3 subscribe.py metadata 44078326031605030301030001865786 http://your-ip:8080/metadata/push
  
  # 取消告警订阅
  python3 subscribe.py cancel
""")
        return
    
    action = sys.argv[1]
    
    if action == "alarm":
        if len(sys.argv) < 3:
            print("❌ 请提供 report_url")
            print("示例: python3 subscribe.py alarm http://your-ip:8080/alarm/push")
            return
        
        report_url = sys.argv[2]
        print(f"🔔 正在订阅告警，推送地址: {report_url}")
        
        result = subscribe_alarm(BASE_URL, USERNAME, PASSWORD, report_url=report_url)
        if result:
            print(f"✅ 订阅结果: {result}")
    
    elif action == "metadata":
        if len(sys.argv) < 4:
            print("❌ 请提供 device_id 和 report_url")
            print("示例: python3 subscribe.py metadata 44078326031605030301030001865786 http://your-ip:8080/metadata/push")
            return
        
        device_id = sys.argv[2]
        report_url = sys.argv[3]
        print(f"🔔 正在订阅元数据，设备: {device_id}")
        print(f"   推送地址: {report_url}")
        
        result = subscribe_metadata(BASE_URL, USERNAME, PASSWORD, device_id, report_url=report_url)
        if result:
            print(f"✅ 订阅结果: {result}")
    
    elif action == "cancel":
        print("🔔 正在取消告警订阅...")
        result = unsubscribe_alarm(BASE_URL, USERNAME, PASSWORD)
        if result:
            print(f"✅ 取消订阅结果: {result}")
    
    else:
        print(f"❌ 未知操作: {action}")


if __name__ == "__main__":
    main()
