package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备对象 rental_devices
 *
 * @author ruoyi
 */
public class RentalDevice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 设备编码 */
    @Excel(name = "设备编码")
    private String deviceCode;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备类型 */
    @Excel(name = "设备类型")
    private String deviceType;

    /** 安装位置 */
    @Excel(name = "安装位置")
    private String location;

    /** IP地址 */
    @Excel(name = "IP地址")
    private String ipAddress;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 最后心跳时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后心跳时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastHeartbeat;

    /** 告警订阅状态（0未订阅 1已订阅） */
    @Excel(name = "告警订阅", readConverterExp = "0=未订阅,1=已订阅")
    private String alarmSubscribed;

    /** 元数据订阅状态（0未订阅 1已订阅） */
    @Excel(name = "元数据订阅", readConverterExp = "0=未订阅,1=已订阅")
    private String metadataSubscribed;

    /** 纬度 */
    @Excel(name = "纬度")
    private java.math.BigDecimal latitude;

    /** 经度 */
    @Excel(name = "经度")
    private java.math.BigDecimal longitude;

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

    public String getDeviceCode()
    {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode)
    {
        this.deviceCode = deviceCode;
    }

    public String getDeviceName()
    {
        return deviceName;
    }

    public void setDeviceName(String deviceName)
    {
        this.deviceName = deviceName;
    }

    public String getDeviceType()
    {
        return deviceType;
    }

    public void setDeviceType(String deviceType)
    {
        this.deviceType = deviceType;
    }

    public String getLocation()
    {
        return location;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getIpAddress()
    {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress)
    {
        this.ipAddress = ipAddress;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Date getLastHeartbeat()
    {
        return lastHeartbeat;
    }

    public void setLastHeartbeat(Date lastHeartbeat)
    {
        this.lastHeartbeat = lastHeartbeat;
    }

    public String getAlarmSubscribed()
    {
        return alarmSubscribed;
    }

    public void setAlarmSubscribed(String alarmSubscribed)
    {
        this.alarmSubscribed = alarmSubscribed;
    }

    public String getMetadataSubscribed()
    {
        return metadataSubscribed;
    }

    public void setMetadataSubscribed(String metadataSubscribed)
    {
        this.metadataSubscribed = metadataSubscribed;
    }

    public RentalHouse getHouse()
    {
        return house;
    }

    public void setHouse(RentalHouse house)
    {
        this.house = house;
    }

    public java.math.BigDecimal getLatitude()
    {
        return latitude;
    }

    public void setLatitude(java.math.BigDecimal latitude)
    {
        this.latitude = latitude;
    }

    public java.math.BigDecimal getLongitude()
    {
        return longitude;
    }

    public void setLongitude(java.math.BigDecimal longitude)
    {
        this.longitude = longitude;
    }

    @Override
    public String toString()
    {
        return "RentalDevice{" +
                "id=" + id +
                ", deviceCode='" + deviceCode + '\'' +
                ", deviceName='" + deviceName + '\'' +
                ", deviceType='" + deviceType + '\'' +
                ", location='" + location + '\'' +
                ", ipAddress='" + ipAddress + '\'' +
                ", status='" + status + '\'' +
                ", lastHeartbeat=" + lastHeartbeat +
                ", alarmSubscribed='" + alarmSubscribed + '\'' +
                ", metadataSubscribed='" + metadataSubscribed + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                '}';
    }
}
