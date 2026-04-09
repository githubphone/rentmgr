#!/usr/bin/env python3
"""
统一监控平台 - 接收告警/元数据推送
这是一个简单的 HTTP 服务器，用于接收平台推送的消息
"""

import json
import threading
from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime


class PushHandler(BaseHTTPRequestHandler):
    """处理平台推送的请求"""
    
    def do_POST(self):
        """接收 POST 请求"""
        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length).decode('utf-8')
        
        try:
            data = json.loads(body)
            print(f"\n{'='*60}")
            print(f"📩 收到推送 | 时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
            print(f"{'='*60}")
            
            # 根据路径判断推送类型
            if '/alarm/' in self.path:
                self.handle_alarm_push(data)
            elif '/metadata/' in self.path:
                self.handle_metadata_push(data)
            else:
                print(f"📋 路径: {self.path}")
                print(f"📦 数据: {json.dumps(data, indent=2, ensure_ascii=False)}")
            
        except json.JSONDecodeError:
            print(f"❌ JSON 解析失败: {body[:200]}")
        
        # 返回成功响应
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps({"resultCode": 0, "resultDesc": "SUCCESS"}).encode())
    
    def handle_alarm_push(self, data):
        """处理告警推送"""
        alarm_info = data.get('alarmInfo', {})
        print(f"🚨 告警类型: {alarm_info.get('alarmTypeName', '未知')}")
        print(f"   告警ID: {alarm_info.get('alarmId')}")
        print(f"   设备ID: {alarm_info.get('alarmCamId')}")
        print(f"   告警时间: {alarm_info.get('alarmTime')}")
        print(f"   告警级别: {alarm_info.get('alarmLevelName')}")
        if alarm_info.get('alarmSnapUrl'):
            print(f"   抓拍图片: {alarm_info.get('alarmSnapUrl')}")
    
    def handle_metadata_push(self, data):
        """处理元数据推送"""
        metadata_info = data.get('metadataInfo', {})
        print(f"📊 元数据类型: {metadata_info.get('metadataType', '未知')}")
        print(f"   设备ID: {metadata_info.get('deviceId')}")
        print(f"   创建时间: {metadata_info.get('createTime')}")
        
        content = metadata_info.get('metadataContent', {})
        if content.get('captureUrl'):
            print(f"   抓拍图片: {content.get('captureUrl')}")
        if content.get('detectUrl'):
            print(f"   小图: {content.get('detectUrl')}")
        if content.get('desc'):
            print(f"   描述: {content.get('desc')}")
        if content.get('attributes'):
            print(f"   属性: {json.dumps(content.get('attributes'), ensure_ascii=False)}")
    
    def log_message(self, format, *args):
        """抑制 HTTP 日志输出"""
        pass


def run_server(port=8080, host='0.0.0.0'):
    """启动 HTTP 服务器"""
    server = HTTPServer((host, port), PushHandler)
    print(f"🚀 推送接收服务已启动")
    print(f"   地址: http://{host}:{port}")
    print(f"   等待平台推送消息...")
    print(f"   按 Ctrl+C 停止\n")
    
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n👋 服务已停止")
        server.shutdown()


def main():
    import sys
    
    port = 8080
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
    
    print("="*60)
    print("统一监控平台 - 推送接收服务")
    print("="*60)
    print(f"\n📌 启动前请确保:")
    print(f"   1. 本服务地址可被平台访问（如使用内网穿透）")
    print(f"   2. 平台已配置正确的 reportUrl")
    print(f"   3. 告警/元数据订阅已成功")
    print(f"\n📌 reportUrl 格式示例:")
    print(f"   http://your-ip:8080/alarm/push")
    print(f"   http://your-ip:8080/metadata/push")
    print()
    
    run_server(port)


if __name__ == "__main__":
    main()
