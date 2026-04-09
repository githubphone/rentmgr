package com.ruoyi.rental.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalManagerHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "管理者ID")
    private Long managerId;

    @Excel(name = "出租屋ID")
    private Long houseId;

    @Excel(name = "关系类型", readConverterExp = "owner=业主,trustee=托管人")
    private String relationType;

    private RentalManager manager;

    private RentalHouse house;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getManagerId()
    {
        return managerId;
    }

    public void setManagerId(Long managerId)
    {
        this.managerId = managerId;
    }

    public Long getHouseId()
    {
        return houseId;
    }

    public void setHouseId(Long houseId)
    {
        this.houseId = houseId;
    }

    public String getRelationType()
    {
        return relationType;
    }

    public void setRelationType(String relationType)
    {
        this.relationType = relationType;
    }

    public RentalManager getManager()
    {
        return manager;
    }

    public void setManager(RentalManager manager)
    {
        this.manager = manager;
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
        return "RentalManagerHouse{" +
                "id=" + id +
                ", managerId=" + managerId +
                ", houseId=" + houseId +
                ", relationType='" + relationType + '\'' +
                '}';
    }
}
