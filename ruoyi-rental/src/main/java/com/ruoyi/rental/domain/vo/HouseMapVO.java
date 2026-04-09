package com.ruoyi.rental.domain.vo;

import java.math.BigDecimal;

public class HouseMapVO
{
    private Long id;
    private String address;
    private String townStreet;
    private String building;
    private String unit;
    private String roomNo;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String managerName;
    private String managerPhone;
    private String gridName;
    private String overallLevel;
    private String status;
    private Integer totalFloors;
    private Integer totalRooms;
    private Integer occupiedRooms;
    private Integer vacantRooms;
    private Integer residentCount;
    private Integer leftCount;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getTownStreet()
    {
        return townStreet;
    }

    public void setTownStreet(String townStreet)
    {
        this.townStreet = townStreet;
    }

    public String getBuilding()
    {
        return building;
    }

    public void setBuilding(String building)
    {
        this.building = building;
    }

    public String getUnit()
    {
        return unit;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getRoomNo()
    {
        return roomNo;
    }

    public void setRoomNo(String roomNo)
    {
        this.roomNo = roomNo;
    }

    public BigDecimal getLatitude()
    {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude)
    {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude()
    {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude)
    {
        this.longitude = longitude;
    }

    public String getManagerName()
    {
        return managerName;
    }

    public void setManagerName(String managerName)
    {
        this.managerName = managerName;
    }

    public String getManagerPhone()
    {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone)
    {
        this.managerPhone = managerPhone;
    }

    public String getGridName()
    {
        return gridName;
    }

    public void setGridName(String gridName)
    {
        this.gridName = gridName;
    }

    public String getOverallLevel()
    {
        return overallLevel;
    }

    public void setOverallLevel(String overallLevel)
    {
        this.overallLevel = overallLevel;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public Integer getTotalFloors()
    {
        return totalFloors;
    }

    public void setTotalFloors(Integer totalFloors)
    {
        this.totalFloors = totalFloors;
    }

    public Integer getTotalRooms()
    {
        return totalRooms;
    }

    public void setTotalRooms(Integer totalRooms)
    {
        this.totalRooms = totalRooms;
    }

    public Integer getOccupiedRooms()
    {
        return occupiedRooms;
    }

    public void setOccupiedRooms(Integer occupiedRooms)
    {
        this.occupiedRooms = occupiedRooms;
    }

    public Integer getVacantRooms()
    {
        return vacantRooms;
    }

    public void setVacantRooms(Integer vacantRooms)
    {
        this.vacantRooms = vacantRooms;
    }

    public Integer getResidentCount()
    {
        return residentCount;
    }

    public void setResidentCount(Integer residentCount)
    {
        this.residentCount = residentCount;
    }

    public Integer getLeftCount()
    {
        return leftCount;
    }

    public void setLeftCount(Integer leftCount)
    {
        this.leftCount = leftCount;
    }
}
