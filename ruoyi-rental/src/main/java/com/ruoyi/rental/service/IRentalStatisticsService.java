package com.ruoyi.rental.service;

import java.util.List;
import java.util.Map;

/**
 * 统计分析Service接口
 *
 * @author ruoyi
 */
public interface IRentalStatisticsService
{
    /**
     * 获取仪表盘统计数据
     *
     * @return 统计数据Map
     */
    public Map<String, Object> getDashboardStats();

    /**
     * 获取今日通行次数
     */
    public Long getTodayAccessCount();

    /**
     * 获取今日陌生人次数
     */
    public Long getTodayStrangerCount();

    /**
     * 获取今日告警次数
     */
    public Long getTodayAlertCount();

    /**
     * 获取设备在线率
     */
    public Integer getDeviceOnlineRate();

    /**
     * 获取出租屋总数
     */
    public Long getHouseTotal();

    /**
     * 获取住户总数
     */
    public Long getResidentTotal();

    /**
     * 获取设备统计
     */
    public Map<String, Object> getDeviceStats();

    /**
     * 获取本月告警统计
     */
    public Map<String, Object> getMonthAlertStats();

    /**
     * 获取陌生人高频区域TOP10
     */
    public List<Map<String, Object>> getStrangerTop();

    /**
     * 获取告警统计
     */
    public List<Map<String, Object>> getAlertStats();

    /**
     * 按镇街统计出租屋数量
     */
    public List<Map<String, Object>> getHouseStatsByTownStreet();

    /**
     * 按综合等级统计出租屋数量
     */
    public List<Map<String, Object>> getHouseStatsByLevel();

    /**
     * 获取近N月通行趋势
     */
    public List<Map<String, Object>> getAccessTrend(int months);

    /**
     * 获取近N月告警趋势
     */
    public List<Map<String, Object>> getAlertTrend(int months);

    /**
     * 按告警级别统计
     */
    public Map<String, Object> getAlertLevelStats();
}
