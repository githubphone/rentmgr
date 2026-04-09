package com.ruoyi.rental.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalStatisticsMapper;
import com.ruoyi.rental.service.IRentalStatisticsService;

/**
 * 统计分析Service实现
 *
 * @author ruoyi
 */
@Service
public class RentalStatisticsServiceImpl implements IRentalStatisticsService
{
    @Autowired
    private RentalStatisticsMapper statisticsMapper;

    /**
     * 获取仪表盘统计数据
     */
    @Override
    public Map<String, Object> getDashboardStats()
    {
        Map<String, Object> stats = new HashMap<>();

        // 今日统计
        stats.put("todayAccessCount", statisticsMapper.selectTodayAccessCount());
        stats.put("todayStrangerCount", statisticsMapper.selectTodayStrangerCount());
        stats.put("todayAlertCount", statisticsMapper.selectTodayAlertCount());

        // 设备统计
        stats.put("deviceOnlineRate", statisticsMapper.selectDeviceOnlineRate());
        stats.put("deviceTotal", statisticsMapper.selectDeviceTotal());
        stats.put("deviceOnline", statisticsMapper.selectDeviceOnline());
        stats.put("deviceOffline", statisticsMapper.selectDeviceOffline());

        // 基础统计
        stats.put("houseTotal", statisticsMapper.selectHouseTotal());
        stats.put("residentTotal", statisticsMapper.selectResidentTotal());

        // 本月告警统计
        stats.put("monthAlertTotal", statisticsMapper.selectMonthAlertTotal());
        stats.put("monthAlertResolved", statisticsMapper.selectMonthAlertResolved());

        // 计算处理率
        Long monthTotal = statisticsMapper.selectMonthAlertTotal();
        Long monthResolved = statisticsMapper.selectMonthAlertResolved();
        if (monthTotal != null && monthTotal > 0)
        {
            int resolveRate = (int) (monthResolved * 100 / monthTotal);
            stats.put("monthAlertResolveRate", resolveRate);
        }
        else
        {
            stats.put("monthAlertResolveRate", 0);
        }

        // 陌生人TOP10
        stats.put("strangerTop", statisticsMapper.selectStrangerTop());

        // 告警统计
        stats.put("alertStats", statisticsMapper.selectAlertStats());

        return stats;
    }

    @Override
    public Long getTodayAccessCount()
    {
        return statisticsMapper.selectTodayAccessCount();
    }

    @Override
    public Long getTodayStrangerCount()
    {
        return statisticsMapper.selectTodayStrangerCount();
    }

    @Override
    public Long getTodayAlertCount()
    {
        return statisticsMapper.selectTodayAlertCount();
    }

    @Override
    public Integer getDeviceOnlineRate()
    {
        return statisticsMapper.selectDeviceOnlineRate();
    }

    @Override
    public Long getHouseTotal()
    {
        return statisticsMapper.selectHouseTotal();
    }

    @Override
    public Long getResidentTotal()
    {
        return statisticsMapper.selectResidentTotal();
    }

    @Override
    public Map<String, Object> getDeviceStats()
    {
        Map<String, Object> stats = new HashMap<>();
        stats.put("total", statisticsMapper.selectDeviceTotal());
        stats.put("online", statisticsMapper.selectDeviceOnline());
        stats.put("offline", statisticsMapper.selectDeviceOffline());
        stats.put("onlineRate", statisticsMapper.selectDeviceOnlineRate());
        return stats;
    }

    @Override
    public Map<String, Object> getMonthAlertStats()
    {
        Map<String, Object> stats = new HashMap<>();
        stats.put("total", statisticsMapper.selectMonthAlertTotal());
        stats.put("resolved", statisticsMapper.selectMonthAlertResolved());

        Long total = statisticsMapper.selectMonthAlertTotal();
        Long resolved = statisticsMapper.selectMonthAlertResolved();
        if (total != null && total > 0)
        {
            stats.put("resolveRate", (resolved * 100 / total));
        }
        else
        {
            stats.put("resolveRate", 0);
        }
        return stats;
    }

    @Override
    public List<Map<String, Object>> getStrangerTop()
    {
        return statisticsMapper.selectStrangerTop();
    }

    @Override
    public List<Map<String, Object>> getAlertStats()
    {
        return statisticsMapper.selectAlertStats();
    }

    @Override
    public List<Map<String, Object>> getHouseStatsByTownStreet()
    {
        return statisticsMapper.selectHouseStatsByTownStreet();
    }

    @Override
    public List<Map<String, Object>> getHouseStatsByLevel()
    {
        return statisticsMapper.selectHouseStatsByLevel();
    }

    @Override
    public List<Map<String, Object>> getAccessTrend(int months)
    {
        return statisticsMapper.selectAccessStatsByMonth(months);
    }

    @Override
    public List<Map<String, Object>> getAlertTrend(int months)
    {
        return statisticsMapper.selectAlertStatsByMonth(months);
    }

    @Override
    public Map<String, Object> getAlertLevelStats()
    {
        return statisticsMapper.selectAlertLevelStats();
    }
}
