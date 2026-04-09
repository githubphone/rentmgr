package com.ruoyi.rental.service;

import java.util.Map;

/**
 * 统一监控平台Service接口
 *
 * @author ruoyi
 */
public interface IUnifiedMonitorService
{
    /**
     * 从统一监控平台同步摄像头列表
     *
     * @return 同步结果
     */
    Map<String, Object> syncCamerasFromPlatform();

    /**
     * 订阅告警
     *
     * @param deviceId 设备ID（摄像头ID）
     * @param reportUrl 告警接收URL
     * @return 订阅结果
     */
    Map<String, Object> subscribeAlarm(String deviceId, String reportUrl);

    /**
     * 取消订阅告警
     *
     * @return 取消结果
     */
    Map<String, Object> unsubscribeAlarm();

    /**
     * 订阅元数据
     *
     * @param deviceId 设备ID（摄像头ID）
     * @param reportUrl 数据接收URL
     * @return 订阅结果
     */
    Map<String, Object> subscribeMetadata(String deviceId, String reportUrl);

    /**
     * 取消订阅元数据
     *
     * @param deviceId 设备ID（摄像头ID）
     * @return 取消结果
     */
    Map<String, Object> unsubscribeMetadata(String deviceId);
}