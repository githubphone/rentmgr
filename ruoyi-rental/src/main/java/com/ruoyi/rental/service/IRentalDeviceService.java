package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalDevice;
import com.ruoyi.rental.domain.vo.DeviceMapVO;

/**
 * 设备Service接口
 * 
 * @author ruoyi
 */
public interface IRentalDeviceService
{
    /**
     * 查询设备列表
     * 
     * @param device 设备信息
     * @return 设备集合
     */
    public List<RentalDevice> selectDeviceList(RentalDevice device);

    /**
     * 根据ID查询设备
     * 
     * @param id 主键ID
     * @return 设备信息
     */
    public RentalDevice selectDeviceById(Long id);

    /**
     * 根据设备编码查询设备
     * 
     * @param deviceCode 设备编码
     * @return 设备信息
     */
    public RentalDevice selectDeviceByCode(String deviceCode);

    /**
     * 新增设备
     * 
     * @param device 设备信息
     * @return 结果
     */
    public int insertDevice(RentalDevice device);

    /**
     * 修改设备
     * 
     * @param device 设备信息
     * @return 结果
     */
    public int updateDevice(RentalDevice device);

    /**
     * 删除设备
     * 
     * @param id 主键ID
     * @return 结果
     */
    public int deleteDeviceById(Long id);

    /**
     * 批量删除设备
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDeviceByIds(Long[] ids);

    /**
     * 查询设备地图标注列表
     *
     * @return 设备地理位置列表
     */
    public List<DeviceMapVO> selectDeviceMapList();

    /**
     * 根据设备编码查询关联的房屋ID
     *
     * @param deviceCode 设备编码
     * @return 房屋ID，不存在则返回null
     */
    public Long selectHouseIdByDeviceCode(String deviceCode);
}
