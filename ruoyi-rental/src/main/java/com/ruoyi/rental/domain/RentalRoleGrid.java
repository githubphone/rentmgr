package com.ruoyi.rental.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalRoleGrid extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "角色ID")
    private Long roleId;

    @Excel(name = "网格ID")
    private Long gridId;

    private RentalGrid grid;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getRoleId()
    {
        return roleId;
    }

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getGridId()
    {
        return gridId;
    }

    public void setGridId(Long gridId)
    {
        this.gridId = gridId;
    }

    public RentalGrid getGrid()
    {
        return grid;
    }

    public void setGrid(RentalGrid grid)
    {
        this.grid = grid;
    }

    @Override
    public String toString()
    {
        return "RentalRoleGrid{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", gridId=" + gridId +
                '}';
    }
}
