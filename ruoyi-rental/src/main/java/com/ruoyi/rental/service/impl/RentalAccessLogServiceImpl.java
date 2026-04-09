package com.ruoyi.rental.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.rental.mapper.RentalAccessLogMapper;
import com.ruoyi.rental.domain.RentalAccessLog;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.RentalFacePhoto;
import com.ruoyi.rental.domain.RentalResident;
import com.ruoyi.rental.domain.vo.AccessLogPushResultVO;
import com.ruoyi.rental.domain.vo.AccessLogPushVO;
import com.ruoyi.rental.service.IRentalAccessLogService;
import com.ruoyi.rental.service.IRentalAlertService;

/**
 * 通行记录Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalAccessLogServiceImpl implements IRentalAccessLogService
{
    @Autowired
    private RentalAccessLogMapper accessLogMapper;

    @Autowired
    private IRentalAlertService alertService;

    /**
     * 查询通行记录列表
     * 
     * @param accessLog 通行记录信息
     * @return 通行记录集合
     */
    @Override
    public List<RentalAccessLog> selectAccessLogList(RentalAccessLog accessLog)
    {
        return accessLogMapper.selectAccessLogList(accessLog);
    }

    /**
     * 根据ID查询通行记录
     * 
     * @param id 主键ID
     * @return 通行记录信息
     */
    @Override
    public RentalAccessLog selectAccessLogById(Long id)
    {
        return accessLogMapper.selectAccessLogById(id);
    }

    /**
     * 新增通行记录
     * 
     * @param accessLog 通行记录信息
     * @return 结果
     */
    @Override
    public int insertAccessLog(RentalAccessLog accessLog)
    {
        return accessLogMapper.insertAccessLog(accessLog);
    }

    /**
     * 修改通行记录
     * 
     * @param accessLog 通行记录信息
     * @return 结果
     */
    @Override
    public int updateAccessLog(RentalAccessLog accessLog)
    {
        return accessLogMapper.updateAccessLog(accessLog);
    }

    /**
     * 删除通行记录
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteAccessLogById(Long id)
    {
        return accessLogMapper.deleteAccessLogById(id);
    }

    /**
     * 批量删除通行记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteAccessLogByIds(Long[] ids)
    {
        return accessLogMapper.deleteAccessLogByIds(ids);
    }

    /**
     * 新增通行记录并返回主键ID
     * 
     * @param accessLog 通行记录信息
     * @return 主键ID
     */
    @Override
    public Long insertAccessLogAndGetId(RentalAccessLog accessLog)
    {
        accessLogMapper.insertAccessLogAndGetId(accessLog);
        return accessLog.getId();
    }

    /**
     * 查询指定日期每小时的通行次数
     * 
     * @param date 日期
     * @return 每小时通行次数列表
     */
    @Override
    public List<Map<String, Object>> selectHourlyAccessCount(Date date)
    {
        return accessLogMapper.selectHourlyAccessCount(date);
    }

    /**
     * 查询指定日期每小时的通行次数（范围查询，避免索引失效）
     * 
     * @param beginOfDay 当天开始时间
     * @param nextDay 次日开始时间
     * @return 每小时通行次数列表
     */
    @Override
    public List<Map<String, Object>> selectHourlyAccessCount(Date beginOfDay, Date nextDay)
    {
        return accessLogMapper.selectHourlyAccessCountByRange(beginOfDay, nextDay);
    }

    /**
     * 校验人脸ID是否在白名单中（服务端自行判断是否陌生人）
     * 查询 rental_residents.face_id 和 rental_face_photos.feature_id
     * 
     * @param faceId 人脸ID
     * @return true=在白名单中（不是陌生人），false=不在白名单中（陌生人）
     */
    @Override
    public boolean isFaceIdInWhitelist(String faceId)
    {
        if (faceId == null || faceId.isEmpty())
        {
            return false;
        }
        // 查询住户白名单
        RentalResident resident = new RentalResident();
        resident.setFaceId(faceId);
        List<RentalResident> residents = accessLogMapper.selectResidentByFaceId(faceId);
        if (residents != null && !residents.isEmpty())
        {
            return true;
        }
        // 查询人脸照片特征ID白名单
        List<RentalFacePhoto> photos = accessLogMapper.selectFacePhotoByFeatureId(faceId);
        return photos != null && !photos.isEmpty();
    }

    /**
     * 新增通行记录并返回结果（包含事务：记录插入+告警创建）
     * 服务端自行判断是否陌生人，不信任设备上报的 is_stranger
     * 
     * @param houseId 出租屋ID
     * @param pushVO 推送数据
     * @return 结果包含 logId 和 alertId
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AccessLogPushResultVO insertAccessLogAndAlert(Long houseId, AccessLogPushVO pushVO)
    {
        // 服务端自行判断是否陌生人：查询人脸底库，不在白名单中才设置 isStranger=true
        boolean isStranger = !isFaceIdInWhitelist(pushVO.getFaceId());

        // 写入通行记录
        RentalAccessLog accessLog = new RentalAccessLog();
        accessLog.setHouseId(houseId);
        accessLog.setDeviceId(pushVO.getDeviceId());
        accessLog.setCaptureTime(pushVO.getCaptureTime());
        accessLog.setPhotoUrl(pushVO.getPhotoUrl());
        accessLog.setFaceId(pushVO.getFaceId());
        accessLog.setConfidence(pushVO.getConfidence());
        accessLog.setIsStranger(isStranger ? "1" : "0");
        accessLog.setIsVerified("0");
        Long logId = insertAccessLogAndGetId(accessLog);

        // 如果是陌生人，自动创建告警
        Long alertId = null;
        if (isStranger)
        {
            RentalAlert alert = new RentalAlert();
            alert.setAccessLogId(logId);
            alert.setHouseId(houseId);
            alert.setAlertType("stranger");
            alert.setAlertLevel("warning");
            alert.setPhotoUrl(pushVO.getPhotoUrl());
            alert.setCaptureTime(pushVO.getCaptureTime());
            alert.setStatus("0");
            alertService.insertAlert(alert);
            alertId = alert.getId();
        }

        return new AccessLogPushResultVO(logId, alertId);
    }
}
