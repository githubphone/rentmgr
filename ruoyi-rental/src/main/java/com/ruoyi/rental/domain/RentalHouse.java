package com.ruoyi.rental.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class RentalHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    @Excel(name = "详细地址")
    private String address;

    @Excel(name = "纬度")
    private BigDecimal latitude;

    @Excel(name = "经度")
    private BigDecimal longitude;

    @Excel(name = "镇街")
    private String townStreet;

    @Excel(name = "总楼层数")
    private Integer totalFloors;

    @Excel(name = "总房间数")
    private Integer totalRooms;

    @Excel(name = "管理者ID")
    private Long managerId;

    @Excel(name = "管理者身份类别")
    private String managerType;

    @Excel(name = "房屋类型")
    private String houseType;

    @Excel(name = "住所类型")
    private String residenceType;

    @Excel(name = "产权性质")
    private String propertyType;

    @Excel(name = "网约房", readConverterExp = "0=否,1=是")
    private String isOnlineRental;

    @Excel(name = "安装门禁", readConverterExp = "0=否,1=是")
    private String hasAccessControl;

    @Excel(name = "环境类型")
    private String environmentType;

    @Excel(name = "房间面积")
    private BigDecimal roomArea;

    @Excel(name = "租金")
    private BigDecimal rent;

    @Excel(name = "每层房间")
    private Integer roomsPerFloor;

    @Excel(name = "正面照片")
    private String frontPhoto;

    @Excel(name = "侧面照片")
    private String sidePhoto;

    @Excel(name = "周边环境照片")
    private String surroundingPhoto;

    @Excel(name = "所属派出所ID")
    private Long policeStationId;

    @Excel(name = "网格ID")
    private Long gridId;

    @Excel(name = "综合等级")
    private String overallLevel;

    @Excel(name = "状态", readConverterExp = "0=未启用,1=正常,2=停用")
    private String status;

    private RentalManager manager;
    private RentalGrid grid;
    private RentalManagerHouse managerHouse;

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

    public String getTownStreet()
    {
        return townStreet;
    }

    public void setTownStreet(String townStreet)
    {
        this.townStreet = townStreet;
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

    public Long getManagerId()
    {
        return managerId;
    }

    public void setManagerId(Long managerId)
    {
        this.managerId = managerId;
    }

    public String getManagerType()
    {
        return managerType;
    }

    public void setManagerType(String managerType)
    {
        this.managerType = managerType;
    }

    public String getHouseType()
    {
        return houseType;
    }

    public void setHouseType(String houseType)
    {
        this.houseType = houseType;
    }

    public String getResidenceType()
    {
        return residenceType;
    }

    public void setResidenceType(String residenceType)
    {
        this.residenceType = residenceType;
    }

    public String getPropertyType()
    {
        return propertyType;
    }

    public void setPropertyType(String propertyType)
    {
        this.propertyType = propertyType;
    }

    public String getIsOnlineRental()
    {
        return isOnlineRental;
    }

    public void setIsOnlineRental(String isOnlineRental)
    {
        this.isOnlineRental = isOnlineRental;
    }

    public String getHasAccessControl()
    {
        return hasAccessControl;
    }

    public void setHasAccessControl(String hasAccessControl)
    {
        this.hasAccessControl = hasAccessControl;
    }

    public String getEnvironmentType()
    {
        return environmentType;
    }

    public void setEnvironmentType(String environmentType)
    {
        this.environmentType = environmentType;
    }

    public BigDecimal getRoomArea()
    {
        return roomArea;
    }

    public void setRoomArea(BigDecimal roomArea)
    {
        this.roomArea = roomArea;
    }

    public BigDecimal getRent()
    {
        return rent;
    }

    public void setRent(BigDecimal rent)
    {
        this.rent = rent;
    }

    public Integer getRoomsPerFloor()
    {
        return roomsPerFloor;
    }

    public void setRoomsPerFloor(Integer roomsPerFloor)
    {
        this.roomsPerFloor = roomsPerFloor;
    }

    public String getFrontPhoto()
    {
        return frontPhoto;
    }

    public void setFrontPhoto(String frontPhoto)
    {
        this.frontPhoto = frontPhoto;
    }

    public String getSidePhoto()
    {
        return sidePhoto;
    }

    public void setSidePhoto(String sidePhoto)
    {
        this.sidePhoto = sidePhoto;
    }

    public String getSurroundingPhoto()
    {
        return surroundingPhoto;
    }

    public void setSurroundingPhoto(String surroundingPhoto)
    {
        this.surroundingPhoto = surroundingPhoto;
    }

    public Long getPoliceStationId()
    {
        return policeStationId;
    }

    public void setPoliceStationId(Long policeStationId)
    {
        this.policeStationId = policeStationId;
    }

    public Long getGridId()
    {
        return gridId;
    }

    public void setGridId(Long gridId)
    {
        this.gridId = gridId;
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

    public RentalManager getManager()
    {
        return manager;
    }

    public void setManager(RentalManager manager)
    {
        this.manager = manager;
    }

    public String getManagerName()
    {
        return manager != null ? manager.getManagerName() : null;
    }

    public String getManagerPhone()
    {
        return manager != null ? manager.getPhone() : null;
    }

    public String getManagerIdCard()
    {
        return manager != null ? manager.getIdCard() : null;
    }

    public String getManagerIdCardAddress()
    {
        return manager != null ? manager.getIdCardAddress() : null;
    }

    public String getManagerIdentity()
    {
        return manager != null ? manager.getIdentity() : null;
    }

    public String getManagerWechat()
    {
        return manager != null ? manager.getWechat() : null;
    }

    public RentalGrid getGrid()
    {
        return grid;
    }

    public void setGrid(RentalGrid grid)
    {
        this.grid = grid;
    }

    public RentalManagerHouse getManagerHouse()
    {
        return managerHouse;
    }

    public void setManagerHouse(RentalManagerHouse managerHouse)
    {
        this.managerHouse = managerHouse;
    }

    @Override
    public String toString()
    {
        return "RentalHouse{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", townStreet='" + townStreet + '\'' +
                ", totalFloors=" + totalFloors +
                ", totalRooms=" + totalRooms +
                ", managerId=" + managerId +
                ", managerType='" + managerType + '\'' +
                ", houseType='" + houseType + '\'' +
                ", residenceType='" + residenceType + '\'' +
                ", propertyType='" + propertyType + '\'' +
                ", isOnlineRental='" + isOnlineRental + '\'' +
                ", hasAccessControl='" + hasAccessControl + '\'' +
                ", environmentType='" + environmentType + '\'' +
                ", roomArea=" + roomArea +
                ", rent=" + rent +
                ", roomsPerFloor=" + roomsPerFloor +
                ", frontPhoto='" + frontPhoto + '\'' +
                ", sidePhoto='" + sidePhoto + '\'' +
                ", surroundingPhoto='" + surroundingPhoto + '\'' +
                ", policeStationId=" + policeStationId +
                ", gridId=" + gridId +
                ", overallLevel='" + overallLevel + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
