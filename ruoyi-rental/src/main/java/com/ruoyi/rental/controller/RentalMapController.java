package com.ruoyi.rental.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.domain.vo.HeatmapVO;
import com.ruoyi.rental.service.IRentalMapService;

/**
 * 地图可视化管理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/map")
public class RentalMapController extends BaseController
{
    @Autowired
    private IRentalMapService mapService;

    /**
     * 获取地图首页数据（房源+设备+告警）
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/overview")
    public AjaxResult getOverview()
    {
        return success(mapService.getMapOverview());
    }

    /**
     * 查询房源地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/house/list")
    public AjaxResult getHouseMapList(@RequestParam(required = false) Long houseId)
    {
        return success(mapService.getHouseMapList(houseId));
    }

    /**
     * 根据镇街查询房源地图标注
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/house/byTownStreet")
    public AjaxResult getHouseMapByTownStreet(@RequestParam String townStreet)
    {
        return success(mapService.getHouseMapByTownStreet(townStreet));
    }

    /**
     * 根据网格查询房源地图标注
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/house/byGrid")
    public AjaxResult getHouseMapByGridId(@RequestParam Long gridId)
    {
        return success(mapService.getHouseMapByGridId(gridId));
    }

    /**
     * 查询设备地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/device/list")
    public AjaxResult getDeviceMapList(@RequestParam(required = false) Long deviceId)
    {
        return success(mapService.getDeviceMapList(deviceId));
    }

    /**
     * 查询告警地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/alert/list")
    public AjaxResult getAlertMapList(@RequestParam(required = false) Long alertId)
    {
        return success(mapService.getAlertMapList(alertId));
    }

    /**
     * 查询最近告警标注
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/alert/recent")
    public AjaxResult getRecentAlertMap(@RequestParam(defaultValue = "50") int limit)
    {
        return success(mapService.getRecentAlertMap(limit));
    }

    /**
     * 查询通行热力图数据
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/heatmap/access")
    public AjaxResult getAccessHeatmap(
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate)
    {
        // 默认查询最近7天
        if (startDate == null || endDate == null)
        {
            java.time.LocalDate today = java.time.LocalDate.now();
            endDate = today.toString();
            startDate = today.minusDays(7).toString();
        }
        return success(mapService.getAccessHeatmap(startDate, endDate));
    }

    /**
     * 获取房源详情（用于地图弹窗）
     */
    @PreAuthorize("@ss.hasPermi('rental:map:view')")
    @GetMapping("/house/detail/{id}")
    public AjaxResult getHouseDetail(@PathVariable("id") Long id)
    {
        List<HouseMapVO> list = mapService.getHouseMapList(id);
        if (list != null && !list.isEmpty())
        {
            return success(list.get(0));
        }
        return error("房源不存在");
    }
}
