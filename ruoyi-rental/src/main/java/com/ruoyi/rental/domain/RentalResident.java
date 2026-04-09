package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 住户对象 rental_residents
 *
 * @author ruoyi
 */
public class RentalResident extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 所属房屋ID */
    @Excel(name = "所属房屋ID")
    private Long houseId;

    /** 所属房间ID */
    @Excel(name = "所属房间ID")
    private Long roomId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 人脸ID */
    @Excel(name = "人脸ID")
    private String faceId;

    /** 住户类型 */
    @Excel(name = "住户类型")
    private String residentType;

    /** 入住日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住日期", width = 20, dateFormat = "yyyy-MM-dd")
    private Date checkInDate;

    /** 退房日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "退房日期", width = 20, dateFormat = "yyyy-MM-dd")
    private Date checkOutDate;

    /** 状态（0未登记 1正常 2已搬离） */
    @Excel(name = "状态", readConverterExp = "0=未登记,1=正常,2=已搬离")
    private String status;

    /** 所属房屋对象 */
    private RentalHouse house;

    /** 所属房间对象 */
    private RentalRoom room;

    /** 出租屋地址（关联查询） */
    private String houseAddress;

    /** 房间号（关联查询） */
    private String roomNo;

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

    public Long getRoomId()
    {
        return roomId;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getFaceId()
    {
        return faceId;
    }

    public void setFaceId(String faceId)
    {
        this.faceId = faceId;
    }

    public String getResidentType()
    {
        return residentType;
    }

    public void setResidentType(String residentType)
    {
        this.residentType = residentType;
    }

    public Date getCheckInDate()
    {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate)
    {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate()
    {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate)
    {
        this.checkOutDate = checkOutDate;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public RentalHouse getHouse()
    {
        return house;
    }

    public void setHouse(RentalHouse house)
    {
        this.house = house;
    }

    public RentalRoom getRoom()
    {
        return room;
    }

    public void setRoom(RentalRoom room)
    {
        this.room = room;
    }

    public String getHouseAddress()
    {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress)
    {
        this.houseAddress = houseAddress;
    }

    public String getRoomNo()
    {
        return roomNo;
    }

    public void setRoomNo(String roomNo)
    {
        this.roomNo = roomNo;
    }

    @Override
    public String toString()
    {
        return "RentalResident{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", roomId=" + roomId +
                ", name='" + name + '\'' +
                ", idCard='" + idCard + '\'' +
                ", phone='" + phone + '\'' +
                ", faceId='" + faceId + '\'' +
                ", residentType='" + residentType + '\'' +
                ", checkInDate=" + checkInDate +
                ", checkOutDate=" + checkOutDate +
                ", status='" + status + '\'' +
                '}';
    }
}
