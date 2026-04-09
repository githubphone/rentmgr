package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.domain.vo.HeatmapVO;

/**
 * 地图可视化Mapper接口
 *
 * @author ruoyi
 */
public interface RentalMapMapper
{
    /**
     * 查询房源地图标注列表
     *
     * @param houseId 房源ID
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> selectHouseMapList(Long houseId);

    /**
     * 查询设备地图标注列表
     *
     * @param deviceId 设备ID
     * @return 设备地图标注列表
     */
    public List<DeviceMapVO> selectDeviceMapList(Long deviceId);

    /**
     * 查询告警地图标注列表
     *
     * @param alertId 告警ID
     * @return 告警地图标注列表
     */
    public List<AlertMapVO> selectAlertMapList(Long alertId);

    /**
     * 查询通行热力图数据
     *
     * @param startDate 开始日期
     * @param endDate 结束日期
     * @return 热力图数据列表
     */
    public List<HeatmapVO> selectAccessHeatmap(String startDate, String endDate);

    /**
     * 根据镇街查询房源地图标注
     *
     * @param townStreet 镇街
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> selectHouseMapByTownStreet(String townStreet);

    /**
     * 根据网格查询房源地图标注
     *
     * @param gridId 网格ID
     * @return 房源地图标注列表
     */
    public List<HouseMapVO> selectHouseMapByGridId(Long gridId);

    /**
     * 查询最近告警标注（用于地图实时告警）
     *
     * @param limit 数量限制
     * @return 告警地图标注列表
     */
    public List<AlertMapVO> selectRecentAlertMap(int limit);
}
