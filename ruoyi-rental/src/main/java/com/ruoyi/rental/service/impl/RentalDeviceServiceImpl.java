package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalDeviceMapper;
import com.ruoyi.rental.domain.RentalDevice;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.service.IRentalDeviceService;

/**
 * 设备Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalDeviceServiceImpl implements IRentalDeviceService
{
    @Autowired
    private RentalDeviceMapper deviceMapper;

    /**
     * 查询设备列表
     * 
     * @param device 设备信息
     * @return 设备集合
     */
    @Override
    public List<RentalDevice> selectDeviceList(RentalDevice device)
    {
        return deviceMapper.selectDeviceList(device);
    }

    /**
     * 根据ID查询设备
     * 
     * @param id 主键ID
     * @return 设备信息
     */
    @Override
    public RentalDevice selectDeviceById(Long id)
    {
        return deviceMapper.selectDeviceById(id);
    }

    /**
     * 根据设备编码查询设备
     * 
     * @param deviceCode 设备编码
     * @return 设备信息
     */
    @Override
    public RentalDevice selectDeviceByCode(String deviceCode)
    {
        return deviceMapper.selectDeviceByCode(deviceCode);
    }

    /**
     * 新增设备
     * 
     * @param device 设备信息
     * @return 结果
     */
    @Override
    public int insertDevice(RentalDevice device)
    {
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改设备
     * 
     * @param device 设备信息
     * @return 结果
     */
    @Override
    public int updateDevice(RentalDevice device)
    {
        return deviceMapper.updateDevice(device);
    }

    /**
     * 删除设备
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteDeviceById(Long id)
    {
        return deviceMapper.deleteDeviceById(id);
    }

    /**
     * 批量删除设备
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDeviceByIds(Long[] ids)
    {
        return deviceMapper.deleteDeviceByIds(ids);
    }

    /**
     * 查询设备地图标注列表
     *
     * @return 设备地理位置列表
     */
    @Override
    public List<DeviceMapVO> selectDeviceMapList()
    {
        return deviceMapper.selectDeviceMapList();
    }

    /**
     * 根据设备编码查询关联的房屋ID
     *
     * @param deviceCode 设备编码
     * @return 房屋ID，不存在则返回null
     */
    @Override
    public Long selectHouseIdByDeviceCode(String deviceCode)
    {
        return deviceMapper.selectHouseIdByDeviceCode(deviceCode);
    }
}
