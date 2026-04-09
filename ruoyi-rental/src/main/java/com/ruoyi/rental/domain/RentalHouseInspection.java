package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalHouseInspection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "出租屋ID")
    private Long houseId;

    @Excel(name = "检查人ID")
    private Long inspectorId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "检查时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date inspectionTime;

    @Excel(name = "消防等级", readConverterExp = "1=一级,2=二级,3=三级")
    private String fireLevel;

    @Excel(name = "数据维护等级", readConverterExp = "1=一级,2=二级,3=三级")
    private String dataLevel;

    @Excel(name = "治安等级", readConverterExp = "1=一级,2=二级,3=三级")
    private String securityLevel;

    @Excel(name = "综合等级", readConverterExp = "green=绿色,yellow=黄色,red=红色")
    private String overallLevel;

    @Excel(name = "备注")
    private String remark;

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

    public Long getInspectorId()
    {
        return inspectorId;
    }

    public void setInspectorId(Long inspectorId)
    {
        this.inspectorId = inspectorId;
    }

    public Date getInspectionTime()
    {
        return inspectionTime;
    }

    public void setInspectionTime(Date inspectionTime)
    {
        this.inspectionTime = inspectionTime;
    }

    public String getFireLevel()
    {
        return fireLevel;
    }

    public void setFireLevel(String fireLevel)
    {
        this.fireLevel = fireLevel;
    }

    public String getDataLevel()
    {
        return dataLevel;
    }

    public void setDataLevel(String dataLevel)
    {
        this.dataLevel = dataLevel;
    }

    public String getSecurityLevel()
    {
        return securityLevel;
    }

    public void setSecurityLevel(String securityLevel)
    {
        this.securityLevel = securityLevel;
    }

    public String getOverallLevel()
    {
        return overallLevel;
    }

    public void setOverallLevel(String overallLevel)
    {
        this.overallLevel = overallLevel;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public RentalHouse getHouse()
    {
        return house;
    }

    public void setHouse(RentalHouse house)
    {
        this.house = house;
    }

    public String calculateOverallLevel()
    {
        int greenCount = 0;
        if ("1".equals(fireLevel)) greenCount++;
        if ("1".equals(dataLevel)) greenCount++;
        if ("1".equals(securityLevel)) greenCount++;

        if (greenCount >= 3) return "green";
        if (greenCount >= 2) return "yellow";
        return "red";
    }

    @Override
    public String toString()
    {
        return "RentalHouseInspection{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", inspectorId=" + inspectorId +
                ", inspectionTime=" + inspectionTime +
                ", fireLevel='" + fireLevel + '\'' +
                ", dataLevel='" + dataLevel + '\'' +
                ", securityLevel='" + securityLevel + '\'' +
                ", overallLevel='" + overallLevel + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
