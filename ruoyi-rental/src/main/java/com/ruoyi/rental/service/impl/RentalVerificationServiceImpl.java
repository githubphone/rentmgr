package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalVerificationMapper;
import com.ruoyi.rental.domain.RentalVerification;
import com.ruoyi.rental.service.IRentalVerificationService;

/**
 * 核查记录Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalVerificationServiceImpl implements IRentalVerificationService
{
    @Autowired
    private RentalVerificationMapper verificationMapper;

    /**
     * 查询核查记录列表
     * 
     * @param verification 核查记录信息
     * @return 核查记录集合
     */
    @Override
    public List<RentalVerification> selectVerificationList(RentalVerification verification)
    {
        return verificationMapper.selectVerificationList(verification);
    }

    /**
     * 根据ID查询核查记录
     * 
     * @param id 主键ID
     * @return 核查记录信息
     */
    @Override
    public RentalVerification selectVerificationById(Long id)
    {
        return verificationMapper.selectVerificationById(id);
    }

    /**
     * 新增核查记录
     * 
     * @param verification 核查记录信息
     * @return 结果
     */
    @Override
    public int insertVerification(RentalVerification verification)
    {
        return verificationMapper.insertVerification(verification);
    }

    /**
     * 修改核查记录
     * 
     * @param verification 核查记录信息
     * @return 结果
     */
    @Override
    public int updateVerification(RentalVerification verification)
    {
        return verificationMapper.updateVerification(verification);
    }

    /**
     * 删除核查记录
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteVerificationById(Long id)
    {
        return verificationMapper.deleteVerificationById(id);
    }

    /**
     * 批量删除核查记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteVerificationByIds(Long[] ids)
    {
        return verificationMapper.deleteVerificationByIds(ids);
    }
}
