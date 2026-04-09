package com.ruoyi.rental.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalHouseMapper;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.service.IRentalHouseService;

/**
 * 出租屋Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalHouseServiceImpl implements IRentalHouseService
{
    @Autowired
    private RentalHouseMapper houseMapper;

    /**
     * 查询出租屋列表
     * 
     * @param house 出租屋信息
     * @return 出租屋集合
     */
    @Override
    public List<RentalHouse> selectHouseList(RentalHouse house)
    {
        return houseMapper.selectHouseList(house);
    }

    /**
     * 根据ID查询出租屋
     * 
     * @param id 主键ID
     * @return 出租屋信息
     */
    @Override
    public RentalHouse selectHouseById(Long id)
    {
        return houseMapper.selectHouseById(id);
    }

    /**
     * 新增出租屋
     * 
     * @param house 出租屋信息
     * @return 结果
     */
    @Override
    public int insertHouse(RentalHouse house)
    {
        return houseMapper.insertHouse(house);
    }

    /**
     * 修改出租屋
     * 
     * @param house 出租屋信息
     * @return 结果
     */
    @Override
    public int updateHouse(RentalHouse house)
    {
        return houseMapper.updateHouse(house);
    }

    /**
     * 删除出租屋
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteHouseById(Long id)
    {
        return houseMapper.deleteHouseById(id);
    }

    /**
     * 批量删除出租屋
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteHouseByIds(Long[] ids)
    {
        return houseMapper.deleteHouseByIds(ids);
    }

    /**
     * 查询附近出租屋
     * 
     * @param latitude 纬度
     * @param longitude 经度
     * @param radius 半径（米）
     * @return 出租屋列表
     */
    @Override
    public List<HouseMapVO> selectHouseMapList(RentalHouse house)
    {
        return houseMapper.selectHouseMapList(house);
    }

    /**
     * 查询附近出租屋
     *
     * @param latitude 纬度
     * @param longitude 经度
     * @param radius 半径（米）
     * @return 出租屋列表
     */
    @Override
    public List<RentalHouse> selectHouseNearby(BigDecimal latitude, BigDecimal longitude, Integer radius)
    {
        return houseMapper.selectHouseNearby(latitude, longitude, radius);
    }
}
