package com.ruoyi.rental.domain;

import java.math.BigDecimal;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalGrid extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "网格编码")
    private String gridCode;

    @Excel(name = "网格名称")
    private String gridName;

    @Excel(name = "镇街")
    private String townStreet;

    @Excel(name = "所属村委")
    private String villageCommittee;

    @Excel(name = "纬度坐标")
    private BigDecimal latitude;

    @Excel(name = "经度坐标")
    private BigDecimal longitude;

    @Excel(name = "备注")
    private String remark;

    @Excel(name = "状态", readConverterExp = "0=停用,1=启用")
    private String status;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getGridCode()
    {
        return gridCode;
    }

    public void setGridCode(String gridCode)
    {
        this.gridCode = gridCode;
    }

    public String getGridName()
    {
        return gridName;
    }

    public void setGridName(String gridName)
    {
        this.gridName = gridName;
    }

    public String getTownStreet()
    {
        return townStreet;
    }

    public void setTownStreet(String townStreet)
    {
        this.townStreet = townStreet;
    }

    public String getVillageCommittee()
    {
        return villageCommittee;
    }

    public void setVillageCommittee(String villageCommittee)
    {
        this.villageCommittee = villageCommittee;
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

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString()
    {
        return "RentalGrid{" +
                "id=" + id +
                ", gridCode='" + gridCode + '\'' +
                ", gridName='" + gridName + '\'' +
                ", townStreet='" + townStreet + '\'' +
                ", villageCommittee='" + villageCommittee + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", remark='" + remark + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
