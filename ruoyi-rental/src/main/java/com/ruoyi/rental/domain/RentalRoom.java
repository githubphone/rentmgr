package com.ruoyi.rental.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房间对象 rental_room
 *
 * @author ruoyi
 */
public class RentalRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 所属出租屋ID */
    @Excel(name = "所属出租屋ID")
    private Long houseId;

    /** 房间编号 */
    @Excel(name = "房间编号")
    private String roomNo;

    /** 楼层 */
    @Excel(name = "楼层")
    private String floor;

    /** 房间状态（0空置 1已入住 2停用） */
    @Excel(name = "房间状态", readConverterExp = "0=空置,1=已入住,2=停用")
    private String status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 所属房屋对象 */
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

    public String getRoomNo()
    {
        return roomNo;
    }

    public void setRoomNo(String roomNo)
    {
        this.roomNo = roomNo;
    }

    public String getFloor()
    {
        return floor;
    }

    public void setFloor(String floor)
    {
        this.floor = floor;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
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

    @Override
    public String toString()
    {
        return "RentalRoom{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", roomNo='" + roomNo + '\'' +
                ", floor='" + floor + '\'' +
                ", status='" + status + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
