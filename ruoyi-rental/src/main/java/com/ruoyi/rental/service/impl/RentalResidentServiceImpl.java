package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalResidentMapper;
import com.ruoyi.rental.domain.RentalResident;
import com.ruoyi.rental.service.IRentalResidentService;

/**
 * 住户Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalResidentServiceImpl implements IRentalResidentService
{
    @Autowired
    private RentalResidentMapper residentMapper;

    /**
     * 查询住户列表
     * 
     * @param resident 住户信息
     * @return 住户集合
     */
    @Override
    public List<RentalResident> selectResidentList(RentalResident resident)
    {
        return residentMapper.selectResidentList(resident);
    }

    /**
     * 根据ID查询住户
     * 
     * @param id 主键ID
     * @return 住户信息
     */
    @Override
    public RentalResident selectResidentById(Long id)
    {
        return residentMapper.selectResidentById(id);
    }

    /**
     * 新增住户
     * 
     * @param resident 住户信息
     * @return 结果
     */
    @Override
    public int insertResident(RentalResident resident)
    {
        return residentMapper.insertResident(resident);
    }

    /**
     * 修改住户
     * 
     * @param resident 住户信息
     * @return 结果
     */
    @Override
    public int updateResident(RentalResident resident)
    {
        return residentMapper.updateResident(resident);
    }

    /**
     * 删除住户
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteResidentById(Long id)
    {
        return residentMapper.deleteResidentById(id);
    }

    /**
     * 批量删除住户
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteResidentByIds(Long[] ids)
    {
        return residentMapper.deleteResidentByIds(ids);
    }
}
