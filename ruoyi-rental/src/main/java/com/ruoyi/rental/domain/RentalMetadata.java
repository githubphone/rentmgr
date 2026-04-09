package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 元数据记录对象 rental_metadata
 *
 * @author ruoyi
 */
public class RentalMetadata extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "设备ID")
    private String deviceId;

    @Excel(name = "元数据类型")
    private String metadataType;

    @Excel(name = "抓拍图片URL")
    private String captureUrl;

    @Excel(name = "小图URL")
    private String detectUrl;

    @Excel(name = "描述")
    private String description;

    @Excel(name = "其他属性")
    private String attributes;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getDeviceId()
    {
        return deviceId;
    }

    public void setDeviceId(String deviceId)
    {
        this.deviceId = deviceId;
    }

    public String getMetadataType()
    {
        return metadataType;
    }

    public void setMetadataType(String metadataType)
    {
        this.metadataType = metadataType;
    }

    public String getCaptureUrl()
    {
        return captureUrl;
    }

    public void setCaptureUrl(String captureUrl)
    {
        this.captureUrl = captureUrl;
    }

    public String getDetectUrl()
    {
        return detectUrl;
    }

    public void setDetectUrl(String detectUrl)
    {
        this.detectUrl = detectUrl;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getAttributes()
    {
        return attributes;
    }

    public void setAttributes(String attributes)
    {
        this.attributes = attributes;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    @Override
    public String toString()
    {
        return "RentalMetadata{" +
                "id=" + id +
                ", deviceId='" + deviceId + '\'' +
                ", metadataType='" + metadataType + '\'' +
                ", captureUrl='" + captureUrl + '\'' +
                ", detectUrl='" + detectUrl + '\'' +
                ", description='" + description + '\'' +
                ", attributes='" + attributes + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}