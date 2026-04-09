package com.ruoyi.rental.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 通行记录对象 rental_access_logs
 *
 * @author ruoyi
 */
public class RentalAccessLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 房屋ID */
    @Excel(name = "房屋ID")
    private Long houseId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private String deviceId;

    /** 抓拍时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "抓拍时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date captureTime;

    /** 抓拍照片URL */
    @Excel(name = "抓拍照片URL")
    private String photoUrl;

    /** 人脸ID */
    @Excel(name = "人脸ID")
    private String faceId;

    /** 比对置信度 */
    @Excel(name = "比对置信度")
    private BigDecimal confidence;

    /** 是否陌生人（0否 1是） */
    @Excel(name = "是否陌生人", readConverterExp = "0=否,1=是")
    private String isStranger;

    /** 是否已认证（0否 1是） */
    @Excel(name = "是否已认证", readConverterExp = "0=否,1=是")
    private String isVerified;

    /** 更新者 */
    private String updateBy;

    /** 更新时间 */
    private Date updateTime;

    /** 所属房屋对象 */
    private RentalHouse house;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getHouseId()
    {
        return houseId;
    }

    public void setHouseId(Long houseId)
    {
        this.houseId = houseId;
    }

    public String getDeviceId()
    {
        return deviceId;
    }

    public void setDeviceId(String deviceId)
    {
        this.deviceId = deviceId;
    }

    public Date getCaptureTime()
    {
        return captureTime;
    }

    public void setCaptureTime(Date captureTime)
    {
        this.captureTime = captureTime;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public String getFaceId()
    {
        return faceId;
    }

    public void setFaceId(String faceId)
    {
        this.faceId = faceId;
    }

    public BigDecimal getConfidence()
    {
        return confidence;
    }

    public void setConfidence(BigDecimal confidence)
    {
        this.confidence = confidence;
    }

    public String getIsStranger()
    {
        return isStranger;
    }

    public void setIsStranger(String isStranger)
    {
        this.isStranger = isStranger;
    }

    public String getIsVerified()
    {
        return isVerified;
    }

    public void setIsVerified(String isVerified)
    {
        this.isVerified = isVerified;
    }

    public String getUpdateBy()
    {
        return updateBy;
    }

    public void setUpdateBy(String updateBy)
    {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
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
        return "RentalAccessLog{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", deviceId='" + deviceId + '\'' +
                ", captureTime=" + captureTime +
                ", photoUrl='" + photoUrl + '\'' +
                ", faceId='" + faceId + '\'' +
                ", confidence=" + confidence +
                ", isStranger='" + isStranger + '\'' +
                ", isVerified='" + isVerified + '\'' +
                '}';
    }
}
