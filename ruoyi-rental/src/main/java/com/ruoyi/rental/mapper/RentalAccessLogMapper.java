package com.ruoyi.rental.mapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.ruoyi.rental.domain.RentalAccessLog;
import com.ruoyi.rental.domain.RentalFacePhoto;
import com.ruoyi.rental.domain.RentalResident;

/**
 * 通行记录Mapper接口
 *
 * @author ruoyi
 */
public interface RentalAccessLogMapper
{
    /**
     * 查询通行记录列表
     *
     * @param accessLog 通行记录信息
     * @return 通行记录集合
     */
    public List<RentalAccessLog> selectAccessLogList(RentalAccessLog accessLog);

    /**
     * 根据ID查询通行记录
     *
     * @param id 主键ID
     * @return 通行记录信息
     */
    public RentalAccessLog selectAccessLogById(Long id);

    /**
     * 新增通行记录
     *
     * @param accessLog 通行记录信息
     * @return 结果
     */
    public int insertAccessLog(RentalAccessLog accessLog);

    /**
     * 修改通行记录
     *
     * @param accessLog 通行记录信息
     * @return 结果
     */
    public int updateAccessLog(RentalAccessLog accessLog);

    /**
     * 删除通行记录
     *
     * @param id 主键ID
     * @return 结果
     */
    public int deleteAccessLogById(Long id);

    /**
     * 批量删除通行记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAccessLogByIds(Long[] ids);

    /**
     * 新增通行记录并返回主键ID
     *
     * @param accessLog 通行记录信息
     * @return 结果
     */
    public int insertAccessLogAndGetId(RentalAccessLog accessLog);

    /**
     * 查询指定日期每小时的通行次数
     *
     * @param date 日期
     * @return 每小时通行次数列表
     */
    public List<Map<String, Object>> selectHourlyAccessCount(Date date);

    /**
     * 查询指定日期每小时的通行次数（范围查询）
     *
     * @param beginOfDay 当天开始时间
     * @param nextDay 次日开始时间
     * @return 每小时通行次数列表
     */
    public List<Map<String, Object>> selectHourlyAccessCountByRange(Date beginOfDay, Date nextDay);

    /**
     * 根据人脸ID查询住户
     *
     * @param faceId 人脸ID
     * @return 住户信息
     */
    public List<RentalResident> selectResidentByFaceId(String faceId);

    /**
     * 根据特征ID查询人脸照片
     *
     * @param featureId 特征ID
     * @return 人脸照片信息
     */
    public List<RentalFacePhoto> selectFacePhotoByFeatureId(String featureId);
}
