package com.ruoyi.rental.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.ruoyi.rental.domain.RentalAccessLog;
import com.ruoyi.rental.domain.vo.AccessLogPushResultVO;
import com.ruoyi.rental.domain.vo.AccessLogPushVO;

/**
 * 通行记录Service接口
 * 
 * @author ruoyi
 */
public interface IRentalAccessLogService
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
     * @return 主键ID
     */
    public Long insertAccessLogAndGetId(RentalAccessLog accessLog);

    /**
     * 查询指定日期每小时的通行次数
     * 
     * @param date 日期
     * @return 每小时通行次数列表
     */
    public List<Map<String, Object>> selectHourlyAccessCount(Date date);

    /**
     * 查询指定日期每小时的通行次数（范围查询，避免索引失效）
     * 
     * @param beginOfDay 当天开始时间
     * @param nextDay 次日开始时间
     * @return 每小时通行次数列表
     */
    public List<Map<String, Object>> selectHourlyAccessCount(Date beginOfDay, Date nextDay);

    /**
     * 校验人脸ID是否在白名单中（服务端自行判断是否陌生人）
     * 
     * @param faceId 人脸ID
     * @return true=在白名单中（不是陌生人），false=不在白名单中（陌生人）
     */
    public boolean isFaceIdInWhitelist(String faceId);

    /**
     * 新增通行记录并返回结果（包含事务：记录插入+告警创建）
     * 服务端自行判断是否陌生人，不信任设备上报的 is_stranger
     * 
     * @param houseId 出租屋ID
     * @param pushVO 推送数据
     * @return 结果包含 logId 和 alertId
     */
    public AccessLogPushResultVO insertAccessLogAndAlert(Long houseId, AccessLogPushVO pushVO);
}
