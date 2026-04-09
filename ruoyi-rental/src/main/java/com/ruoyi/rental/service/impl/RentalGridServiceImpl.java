package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalGridMapper;
import com.ruoyi.rental.domain.RentalGrid;
import com.ruoyi.rental.domain.RentalRoleGrid;
import com.ruoyi.rental.service.IRentalGridService;

@Service
public class RentalGridServiceImpl implements IRentalGridService
{
    @Autowired
    private RentalGridMapper gridMapper;

    @Override
    public List<RentalGrid> selectGridList(RentalGrid grid)
    {
        return gridMapper.selectGridList(grid);
    }

    @Override
    public RentalGrid selectGridById(Long id)
    {
        return gridMapper.selectGridById(id);
    }

    @Override
    public int insertGrid(RentalGrid grid)
    {
        return gridMapper.insertGrid(grid);
    }

    @Override
    public int updateGrid(RentalGrid grid)
    {
        return gridMapper.updateGrid(grid);
    }

    @Override
    public int deleteGridById(Long id)
    {
        return gridMapper.deleteGridById(id);
    }

    @Override
    public int deleteGridByIds(Long[] ids)
    {
        return gridMapper.deleteGridByIds(ids);
    }

    @Override
    public List<RentalRoleGrid> selectRoleGridList(RentalRoleGrid roleGrid)
    {
        return gridMapper.selectRoleGridList(roleGrid);
    }

    @Override
    public int insertRoleGrid(RentalRoleGrid roleGrid)
    {
        return gridMapper.insertRoleGrid(roleGrid);
    }

    @Override
    public int deleteRoleGridById(Long id)
    {
        return gridMapper.deleteRoleGridById(id);
    }

    @Override
    public int deleteRoleGridByRoleId(Long roleId)
    {
        return gridMapper.deleteRoleGridByRoleId(roleId);
    }

    @Override
    public Long selectGridIdByRoleId(Long roleId)
    {
        return gridMapper.selectGridIdByRoleId(roleId);
    }
}
