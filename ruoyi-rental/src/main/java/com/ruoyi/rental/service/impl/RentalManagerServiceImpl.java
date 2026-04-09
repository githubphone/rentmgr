package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalManagerMapper;
import com.ruoyi.rental.domain.RentalManager;
import com.ruoyi.rental.domain.RentalManagerHouse;
import com.ruoyi.rental.service.IRentalManagerService;

@Service
public class RentalManagerServiceImpl implements IRentalManagerService
{
    @Autowired
    private RentalManagerMapper managerMapper;

    @Override
    public List<RentalManager> selectManagerList(RentalManager manager)
    {
        return managerMapper.selectManagerList(manager);
    }

    @Override
    public RentalManager selectManagerById(Long id)
    {
        return managerMapper.selectManagerById(id);
    }

    @Override
    public RentalManager selectManagerByUserId(Long userId)
    {
        return managerMapper.selectManagerByUserId(userId);
    }

    @Override
    public int insertManager(RentalManager manager)
    {
        return managerMapper.insertManager(manager);
    }

    @Override
    public int updateManager(RentalManager manager)
    {
        return managerMapper.updateManager(manager);
    }

    @Override
    public int deleteManagerById(Long id)
    {
        return managerMapper.deleteManagerById(id);
    }

    @Override
    public int deleteManagerByIds(Long[] ids)
    {
        return managerMapper.deleteManagerByIds(ids);
    }

    @Override
    public List<RentalManagerHouse> selectManagerHouseList(RentalManagerHouse managerHouse)
    {
        return managerMapper.selectManagerHouseList(managerHouse);
    }

    @Override
    public int insertManagerHouse(RentalManagerHouse managerHouse)
    {
        return managerMapper.insertManagerHouse(managerHouse);
    }

    @Override
    public int deleteManagerHouseById(Long id)
    {
        return managerMapper.deleteManagerHouseById(id);
    }

    @Override
    public List<Long> selectHouseIdsByManagerId(Long managerId)
    {
        return managerMapper.selectHouseIdsByManagerId(managerId);
    }
}
