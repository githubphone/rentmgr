package com.ruoyi.rental.service.impl;

import java.util.List;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalRoomMapper;
import com.ruoyi.rental.domain.RentalRoom;
import com.ruoyi.rental.service.IRentalRoomService;

/**
 * 房间Service实现
 *
 * @author ruoyi
 */
@Service
public class RentalRoomServiceImpl implements IRentalRoomService
{
    @Autowired
    private RentalRoomMapper roomMapper;

    @Override
    public List<RentalRoom> selectRoomList(RentalRoom room)
    {
        return roomMapper.selectRoomList(room);
    }

    @Override
    public RentalRoom selectRoomById(Long id)
    {
        return roomMapper.selectRoomById(id);
    }

    @Override
    public List<RentalRoom> selectRoomByHouseId(Long houseId)
    {
        return roomMapper.selectRoomByHouseId(houseId);
    }

    @Override
    public int insertRoom(RentalRoom room)
    {
        return roomMapper.insertRoom(room);
    }

    @Override
    public int updateRoom(RentalRoom room)
    {
        return roomMapper.updateRoom(room);
    }

    @Override
    public int deleteRoomById(Long id)
    {
        return roomMapper.deleteRoomById(id);
    }

    @Override
    public int deleteRoomByIds(Long[] ids)
    {
        if (ids != null && ids.length > 0)
        {
            return roomMapper.deleteRoomByIds(ids);
        }
        return 0;
    }
}
