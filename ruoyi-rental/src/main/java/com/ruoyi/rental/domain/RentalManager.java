package com.ruoyi.rental.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalManager extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "用户ID")
    private Long userId;

    @Excel(name = "管理者姓名")
    private String managerName;

    @Excel(name = "联系电话")
    private String phone;

    @Excel(name = "身份证号")
    private String idCard;

    @Excel(name = "身份证登记地址")
    private String idCardAddress;

    @Excel(name = "身份")
    private String identity;

    @Excel(name = "微信号")
    private String wechat;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public String getManagerName()
    {
        return managerName;
    }

    public void setManagerName(String managerName)
    {
        this.managerName = managerName;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCardAddress()
    {
        return idCardAddress;
    }

    public void setIdCardAddress(String idCardAddress)
    {
        this.idCardAddress = idCardAddress;
    }

    public String getIdentity()
    {
        return identity;
    }

    public void setIdentity(String identity)
    {
        this.identity = identity;
    }

    public String getWechat()
    {
        return wechat;
    }

    public void setWechat(String wechat)
    {
        this.wechat = wechat;
    }

    @Override
    public String toString()
    {
        return "RentalManager{" +
                "id=" + id +
                ", userId=" + userId +
                ", managerName='" + managerName + '\'' +
                ", phone='" + phone + '\'' +
                ", idCard='" + idCard + '\'' +
                ", idCardAddress='" + idCardAddress + '\'' +
                ", identity='" + identity + '\'' +
                ", wechat='" + wechat + '\'' +
                '}';
    }
}
