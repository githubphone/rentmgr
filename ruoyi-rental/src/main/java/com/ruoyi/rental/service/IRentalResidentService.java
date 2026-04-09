package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalResident;

/**
 * 住户Service接口
 * 
 * @author ruoyi
 */
public interface IRentalResidentService
{
    /**
     * 查询住户列表
     * 
     * @param resident 住户信息
     * @return 住户集合
     */
    public List<RentalResident> selectResidentList(RentalResident resident);

    /**
     * 根据ID查询住户
     * 
     * @param id 主键ID
     * @return 住户信息
     */
    public RentalResident selectResidentById(Long id);

    /**
     * 新增住户
     * 
     * @param resident 住户信息
     * @return 结果
     */
    public int insertResident(RentalResident resident);

    /**
     * 修改住户
     * 
     * @param resident 住户信息
     * @return 结果
     */
    public int updateResident(RentalResident resident);

    /**
     * 删除住户
     * 
     * @param id 主键ID
     * @return 结果
     */
    public int deleteResidentById(Long id);

    /**
     * 批量删除住户
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteResidentByIds(Long[] ids);
}
