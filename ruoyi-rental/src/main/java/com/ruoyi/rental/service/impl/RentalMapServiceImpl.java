package com.ruoyi.rental.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalMapMapper;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.domain.vo.HeatmapVO;
import com.ruoyi.rental.service.IRentalMapService;

/**
 * 地图可视化Service实现
 *
 * @author ruoyi
 */
@Service
public class RentalMapServiceImpl implements IRentalMapService
{
    @Autowired
    private RentalMapMapper mapMapper;

    @Override
    public List<HouseMapVO> getHouseMapList(Long houseId)
    {
        return mapMapper.selectHouseMapList(houseId);
    }

    @Override
    public List<DeviceMapVO> getDeviceMapList(Long deviceId)
    {
        return mapMapper.selectDeviceMapList(deviceId);
    }

    @Override
    public List<AlertMapVO> getAlertMapList(Long alertId)
    {
        return mapMapper.selectAlertMapList(alertId);
    }

    @Override
    public List<HeatmapVO> getAccessHeatmap(String startDate, String endDate)
    {
        return mapMapper.selectAccessHeatmap(startDate, endDate);
    }

    @Override
    public List<HouseMapVO> getHouseMapByTownStreet(String townStreet)
    {
        return mapMapper.selectHouseMapByTownStreet(townStreet);
    }

    @Override
    public List<HouseMapVO> getHouseMapByGridId(Long gridId)
    {
        return mapMapper.selectHouseMapByGridId(gridId);
    }

    @Override
    public List<AlertMapVO> getRecentAlertMap(int limit)
    {
        return mapMapper.selectRecentAlertMap(limit);
    }

    @Override
    public Map<String, Object> getMapOverview()
    {
        Map<String, Object> overview = new HashMap<>();

        // 房源标注（全部）
        List<HouseMapVO> houseList = mapMapper.selectHouseMapList(null);
        overview.put("houseList", houseList);
        overview.put("houseCount", houseList.size());

        // 设备标注（全部）
        List<DeviceMapVO> deviceList = mapMapper.selectDeviceMapList(null);
        overview.put("deviceList", deviceList);
        overview.put("deviceCount", deviceList.size());

        // 最近告警（限制50条）
        List<AlertMapVO> alertList = mapMapper.selectRecentAlertMap(50);
        overview.put("alertList", alertList);
        overview.put("alertCount", alertList.size());

        // 按等级统计房源
        Map<String, Long> levelStats = new HashMap<>();
        for (HouseMapVO house : houseList)
        {
            String level = house.getOverallLevel() != null ? house.getOverallLevel() : "unknown";
            levelStats.put(level, levelStats.getOrDefault(level, 0L) + 1);
        }
        overview.put("houseLevelStats", levelStats);

        return overview;
    }
}
