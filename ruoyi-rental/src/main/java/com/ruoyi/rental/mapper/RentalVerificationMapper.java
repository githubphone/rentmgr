package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalVerification;

/**
 * 核查记录Mapper接口
 *
 * @author ruoyi
 */
public interface RentalVerificationMapper
{
    /**
     * 查询核查记录列表
     *
     * @param verification 核查记录信息
     * @return 核查记录集合
     */
    public List<RentalVerification> selectVerificationList(RentalVerification verification);

    /**
     * 根据ID查询核查记录
     *
     * @param id 主键ID
     * @return 核查记录信息
     */
    public RentalVerification selectVerificationById(Long id);

    /**
     * 新增核查记录
     *
     * @param verification 核查记录信息
     * @return 结果
     */
    public int insertVerification(RentalVerification verification);

    /**
     * 修改核查记录
     *
     * @param verification 核查记录信息
     * @return 结果
     */
    public int updateVerification(RentalVerification verification);

    /**
     * 删除核查记录
     *
     * @param id 主键ID
     * @return 结果
     */
    public int deleteVerificationById(Long id);

    /**
     * 批量删除核查记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteVerificationByIds(Long[] ids);
}
