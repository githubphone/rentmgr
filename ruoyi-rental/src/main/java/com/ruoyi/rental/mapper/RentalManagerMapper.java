package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalManager;
import com.ruoyi.rental.domain.RentalManagerHouse;

public interface RentalManagerMapper
{
    public List<RentalManager> selectManagerList(RentalManager manager);

    public RentalManager selectManagerById(Long id);

    public RentalManager selectManagerByUserId(Long userId);

    public int insertManager(RentalManager manager);

    public int updateManager(RentalManager manager);

    public int deleteManagerById(Long id);

    public int deleteManagerByIds(Long[] ids);

    public List<RentalManagerHouse> selectManagerHouseList(RentalManagerHouse managerHouse);

    public int insertManagerHouse(RentalManagerHouse managerHouse);

    public int deleteManagerHouseById(Long id);

    public List<Long> selectHouseIdsByManagerId(Long managerId);
}
