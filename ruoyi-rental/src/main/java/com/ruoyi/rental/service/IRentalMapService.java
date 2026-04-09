package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.domain.vo.HeatmapVO;

/**
 * 地图可视化Service接口
 *
 * @author ruoyi
 */
public interface IRentalMapService
{
    /**
     * 查询房源地图标注列表
     *
     * @param houseId 房源ID（可选）
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> getHouseMapList(Long houseId);

    /**
     * 查询设备地图标注列表
     *
     * @param deviceId 设备ID（可选）
     * @return 设备地图标注列表
     */
    public List<DeviceMapVO> getDeviceMapList(Long deviceId);

    /**
     * 查询告警地图标注列表
     *
     * @param alertId 告警ID（可选）
     * @return 告警地图标注列表
     */
    public List<AlertMapVO> getAlertMapList(Long alertId);

    /**
     * 查询通行热力图数据
     *
     * @param startDate 开始日期
     * @param endDate 结束日期
     * @return 热力图数据列表
     */
    public List<HeatmapVO> getAccessHeatmap(String startDate, String endDate);

    /**
     * 根据镇街查询房源地图标注
     *
     * @param townStreet 镇街
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> getHouseMapByTownStreet(String townStreet);

    /**
     * 根据网格查询房源地图标注
     *
     * @param gridId 网格ID
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> getHouseMapByGridId(Long gridId);

    /**
     * 查询最近告警标注（用于地图实时告警）
     *
     * @param limit 数量限制
     * @return 告警地图标注列表
     */
    public List<AlertMapVO> getRecentAlertMap(int limit);

    /**
     * 获取地图首页数据（房源+设备+告警）
     *
     * @return 综合地图数据
     */
    public java.util.Map<String, Object> getMapOverview();
}
