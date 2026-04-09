package com.ruoyi.rental.domain.vo;

import java.math.BigDecimal;

/**
 * 告警地图标注 VO
 *
 * @author ruoyi
 */
public class AlertMapVO
{
    private Long id;

    private Long houseId;

    private String houseAddress;

    private String alertType;

    private String level;

    private String status;

    private String description;

    private String photoUrl;

    private BigDecimal latitude;

    private BigDecimal longitude;

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

    public String getHouseAddress()
    {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress)
    {
        this.houseAddress = houseAddress;
    }

    public String getAlertType()
    {
        return alertType;
    }

    public void setAlertType(String alertType)
    {
        this.alertType = alertType;
    }

    public String getLevel()
    {
        return level;
    }

    public void setLevel(String level)
    {
        this.level = level;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public BigDecimal getLatitude()
    {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude)
    {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude()
    {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude)
    {
        this.longitude = longitude;
    }
}