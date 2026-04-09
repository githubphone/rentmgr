package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalAlert extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "通行记录ID")
    private Long accessLogId;

    @Excel(name = "房屋ID")
    private Long houseId;

    @Excel(name = "告警类型")
    private String alertType;

    @Excel(name = "告警级别")
    private String alertLevel;

    @Excel(name = "告警照片URL")
    private String photoUrl;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "抓拍时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date captureTime;

    @Excel(name = "状态", readConverterExp = "pending=待处理,processing=处理中,resolved=已解决,ignored=已忽略")
    private String status;

    @Excel(name = "处理人ID")
    private Long handlerId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    @Excel(name = "闭环说明")
    private String closeRemark;

    @Excel(name = "处理凭证")
    private String closeVoucher;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "闭环时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date closeTime;

    private RentalHouse house;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getAccessLogId()
    {
        return accessLogId;
    }

    public void setAccessLogId(Long accessLogId)
    {
        this.accessLogId = accessLogId;
    }

    public Long getHouseId()
    {
        return houseId;
    }

    public void setHouseId(Long houseId)
    {
        this.houseId = houseId;
    }

    public String getAlertType()
    {
        return alertType;
    }

    public void setAlertType(String alertType)
    {
        this.alertType = alertType;
    }

    public String getAlertLevel()
    {
        return alertLevel;
    }

    public void setAlertLevel(String alertLevel)
    {
        this.alertLevel = alertLevel;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public Date getCaptureTime()
    {
        return captureTime;
    }

    public void setCaptureTime(Date captureTime)
    {
        this.captureTime = captureTime;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Long getHandlerId()
    {
        return handlerId;
    }

    public void setHandlerId(Long handlerId)
    {
        this.handlerId = handlerId;
    }

    public Date getHandleTime()
    {
        return handleTime;
    }

    public void setHandleTime(Date handleTime)
    {
        this.handleTime = handleTime;
    }

    public String getCloseRemark()
    {
        return closeRemark;
    }

    public void setCloseRemark(String closeRemark)
    {
        this.closeRemark = closeRemark;
    }

    public String getCloseVoucher()
    {
        return closeVoucher;
    }

    public void setCloseVoucher(String closeVoucher)
    {
        this.closeVoucher = closeVoucher;
    }

    public Date getCloseTime()
    {
        return closeTime;
    }

    public void setCloseTime(Date closeTime)
    {
        this.closeTime = closeTime;
    }

    public RentalHouse getHouse()
    {
        return house;
    }

    public void setHouse(RentalHouse house)
    {
        this.house = house;
    }

    @Override
    public String toString()
    {
        return "RentalAlert{" +
                "id=" + id +
                ", accessLogId=" + accessLogId +
                ", houseId=" + houseId +
                ", alertType='" + alertType + '\'' +
                ", alertLevel='" + alertLevel + '\'' +
                ", photoUrl='" + photoUrl + '\'' +
                ", captureTime=" + captureTime +
                ", status='" + status + '\'' +
                ", handlerId=" + handlerId +
                ", handleTime=" + handleTime +
                '}';
    }
}
