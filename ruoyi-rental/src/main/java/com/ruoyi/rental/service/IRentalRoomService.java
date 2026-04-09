package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalRoom;

/**
 * 房间Service接口
 *
 * @author ruoyi
 */
public interface IRentalRoomService
{
    /**
     * 查询房间列表
     *
     * @param room 房间信息
     * @return 房间集合
     */
    public List<RentalRoom> selectRoomList(RentalRoom room);

    /**
     * 根据ID查询房间
     *
     * @param id 主键ID
     * @return 房间信息
     */
    public RentalRoom selectRoomById(Long id);

    /**
     * 根据出租屋ID查询房间列表
     *
     * @param houseId 出租屋ID
     * @return 房间列表
     */
    public List<RentalRoom> selectRoomByHouseId(Long houseId);

    /**
     * 新增房间
     *
     * @param room 房间信息
     * @return 结果
     */
    public int insertRoom(RentalRoom room);

    /**
     * 修改房间
     *
     * @param room 房间信息
     * @return 结果
     */
    public int updateRoom(RentalRoom room);

    /**
     * 删除房间
     *
     * @param id 主键ID
     * @return 结果
     */
    public int deleteRoomById(Long id);

    /**
     * 批量删除房间
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoomByIds(Long[] ids);
}
