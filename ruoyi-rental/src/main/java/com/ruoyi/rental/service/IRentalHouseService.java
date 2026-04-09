package com.ruoyi.rental.service;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.domain.vo.HouseMapVO;

/**
 * 出租屋Service接口
 * 
 * @author ruoyi
 */
public interface IRentalHouseService
{
    /**
     * 查询出租屋列表
     * 
     * @param house 出租屋信息
     * @return 出租屋集合
     */
    public List<RentalHouse> selectHouseList(RentalHouse house);

    /**
     * 根据ID查询出租屋
     * 
     * @param id 主键ID
     * @return 出租屋信息
     */
    public RentalHouse selectHouseById(Long id);

    /**
     * 新增出租屋
     * 
     * @param house 出租屋信息
     * @return 结果
     */
    public int insertHouse(RentalHouse house);

    /**
     * 修改出租屋
     * 
     * @param house 出租屋信息
     * @return 结果
     */
    public int updateHouse(RentalHouse house);

    /**
     * 删除出租屋
     * 
     * @param id 主键ID
     * @return 结果
     */
    public int deleteHouseById(Long id);

    /**
     * 批量删除出租屋
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteHouseByIds(Long[] ids);

    /**
     * 查询出租屋地图标注列表
     *
     * @param house 出租屋信息
     * @return 出租屋地图标注列表
     */
    public List<HouseMapVO> selectHouseMapList(RentalHouse house);

    /**
     * 查询附近出租屋
     * 
     * @param latitude 纬度
     * @param longitude 经度
     * @param radius 半径（米）
     * @return 出租屋列表
     */
    public List<RentalHouse> selectHouseNearby(BigDecimal latitude, BigDecimal longitude, Integer radius);
}
