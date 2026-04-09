package com.ruoyi.rental.domain.vo;

/**
 * 设备通行记录推送返回 VO
 * 
 * @author ruoyi
 */
public class AccessLogPushResultVO
{
    /** 通行记录ID */
    private Long logId;

    /** 告警记录ID（无告警时为null） */
    private Long alertId;

    public AccessLogPushResultVO(Long logId, Long alertId)
    {
        this.logId = logId;
        this.alertId = alertId;
    }

    public Long getLogId()
    {
        return logId;
    }

    public void setLogId(Long logId)
    {
        this.logId = logId;
    }

    public Long getAlertId()
    {
        return alertId;
    }

    public void setAlertId(Long alertId)
    {
        this.alertId = alertId;
    }
}
