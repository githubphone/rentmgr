package com.ruoyi.rental.domain.vo;

import java.math.BigDecimal;

/**
 * 地理编码返回 VO
 * 
 * @author ruoyi
 */
public class GeocoderRespVO
{
    /** 纬度 */
    private BigDecimal latitude;

    /** 经度 */
    private BigDecimal longitude;

    public GeocoderRespVO(BigDecimal longitude, BigDecimal latitude)
    {
        this.latitude = latitude;
        this.longitude = longitude;
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
