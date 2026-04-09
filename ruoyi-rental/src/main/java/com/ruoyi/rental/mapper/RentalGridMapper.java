package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalGrid;
import com.ruoyi.rental.domain.RentalRoleGrid;

public interface RentalGridMapper
{
    public List<RentalGrid> selectGridList(RentalGrid grid);

    public RentalGrid selectGridById(Long id);

    public int insertGrid(RentalGrid grid);

    public int updateGrid(RentalGrid grid);

    public int deleteGridById(Long id);

    public int deleteGridByIds(Long[] ids);

    public List<RentalRoleGrid> selectRoleGridList(RentalRoleGrid roleGrid);

    public int insertRoleGrid(RentalRoleGrid roleGrid);

    public int deleteRoleGridById(Long id);

    public int deleteRoleGridByRoleId(Long roleId);

    public Long selectGridIdByRoleId(Long roleId);

    public List<Long> selectGridMemberUserIds(Long gridId);
}
