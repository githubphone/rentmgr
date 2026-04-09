package com.ruoyi.rental.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.rental.service.IRentalStatisticsService;

/**
 * 统计分析管理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/statistics")
public class RentalStatisticsController extends BaseController
{
    @Autowired
    private IRentalStatisticsService statisticsService;

    /**
     * 获取仪表盘统计数据
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/dashboard")
    public AjaxResult getDashboard()
    {
        return success(statisticsService.getDashboardStats());
    }

    /**
     * 获取今日统计
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/today")
    public AjaxResult getTodayStats()
    {
        Map<String, Object> stats = new java.util.HashMap<>();
        stats.put("accessCount", statisticsService.getTodayAccessCount());
        stats.put("strangerCount", statisticsService.getTodayStrangerCount());
        stats.put("alertCount", statisticsService.getTodayAlertCount());
        return success(stats);
    }

    /**
     * 获取设备统计
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/device")
    public AjaxResult getDeviceStats()
    {
        return success(statisticsService.getDeviceStats());
    }

    /**
     * 获取本月告警统计
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/alert/month")
    public AjaxResult getMonthAlertStats()
    {
        return success(statisticsService.getMonthAlertStats());
    }

    /**
     * 获取陌生人高频区域TOP10
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/stranger/top")
    public AjaxResult getStrangerTop()
    {
        return success(statisticsService.getStrangerTop());
    }

    /**
     * 获取告警统计
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/alert/stats")
    public AjaxResult getAlertStats()
    {
        return success(statisticsService.getAlertStats());
    }

    /**
     * 按镇街统计出租屋
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/house/byTownStreet")
    public AjaxResult getHouseStatsByTownStreet()
    {
        return success(statisticsService.getHouseStatsByTownStreet());
    }

    /**
     * 按综合等级统计出租屋
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/house/byLevel")
    public AjaxResult getHouseStatsByLevel()
    {
        return success(statisticsService.getHouseStatsByLevel());
    }

    /**
     * 获取通行趋势
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/access/trend")
    public AjaxResult getAccessTrend(@RequestParam(defaultValue = "6") int months)
    {
        return success(statisticsService.getAccessTrend(months));
    }

    /**
     * 获取告警趋势
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/alert/trend")
    public AjaxResult getAlertTrend(@RequestParam(defaultValue = "6") int months)
    {
        return success(statisticsService.getAlertTrend(months));
    }

    /**
     * 获取告警级别统计
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/alert/level")
    public AjaxResult getAlertLevelStats()
    {
        return success(statisticsService.getAlertLevelStats());
    }

    /**
     * 获取基础统计数据
     */
    @PreAuthorize("@ss.hasPermi('rental:statistics:view')")
    @GetMapping("/base")
    public AjaxResult getBaseStats()
    {
        Map<String, Object> stats = new java.util.HashMap<>();
        stats.put("houseTotal", statisticsService.getHouseTotal());
        stats.put("residentTotal", statisticsService.getResidentTotal());
        stats.put("deviceOnlineRate", statisticsService.getDeviceOnlineRate());
        return success(stats);
    }
}
