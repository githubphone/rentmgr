package com.ruoyi.rental.domain.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 地理编码请求 VO
 * 
 * @author ruoyi
 */
public class GeocoderReqVO
{
    /** 地址 */
    private String address;

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }
}
