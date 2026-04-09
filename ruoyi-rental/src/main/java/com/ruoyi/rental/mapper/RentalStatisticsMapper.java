package com.ruoyi.rental.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

/**
 * 统计分析Mapper接口
 *
 * @author ruoyi
 */
public interface RentalStatisticsMapper
{
    /**
     * 查询今日通行次数
     */
    public Long selectTodayAccessCount();

    /**
     * 查询今日陌生人次数
     */
    public Long selectTodayStrangerCount();

    /**
     * 查询今日告警次数
     */
    public Long selectTodayAlertCount();

    /**
     * 查询设备在线率
     */
    public Integer selectDeviceOnlineRate();

    /**
     * 查询出租屋总数
     */
    public Long selectHouseTotal();

    /**
     * 查询住户总数
     */
    public Long selectResidentTotal();

    /**
     * 查询设备总数
     */
    public Long selectDeviceTotal();

    /**
     * 查询在线设备数
     */
    public Long selectDeviceOnline();

    /**
     * 查询离线设备数
     */
    public Long selectDeviceOffline();

    /**
     * 查询本月告警总数
     */
    public Long selectMonthAlertTotal();

    /**
     * 查询本月已处理告警数
     */
    public Long selectMonthAlertResolved();

    /**
     * 查询陌生人高频区域TOP10
     */
    public List<Map<String, Object>> selectStrangerTop();

    /**
     * 查询告警统计
     */
    public List<Map<String, Object>> selectAlertStats();

    /**
     * 按镇街统计出租屋数量
     */
    public List<Map<String, Object>> selectHouseStatsByTownStreet();

    /**
     * 按综合等级统计出租屋数量
     */
    public List<Map<String, Object>> selectHouseStatsByLevel();

    /**
     * 按月统计通行记录
     */
    public List<Map<String, Object>> selectAccessStatsByMonth(@Param("months") int months);

    /**
     * 按月统计告警数量
     */
    public List<Map<String, Object>> selectAlertStatsByMonth(@Param("months") int months);

    /**
     * 按告警级别统计
     */
    public Map<String, Object> selectAlertLevelStats();
}
