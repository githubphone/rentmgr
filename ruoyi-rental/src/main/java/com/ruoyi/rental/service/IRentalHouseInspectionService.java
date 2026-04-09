package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalHouseInspection;

public interface IRentalHouseInspectionService
{
    public List<RentalHouseInspection> selectInspectionList(RentalHouseInspection inspection);

    public RentalHouseInspection selectInspectionById(Long id);

    public RentalHouseInspection selectLatestInspectionByHouseId(Long houseId);

    public int insertInspection(RentalHouseInspection inspection);

    public int updateInspection(RentalHouseInspection inspection);

    public int deleteInspectionById(Long id);

    public int deleteInspectionByHouseId(Long houseId);

    public String calculateOverallLevel(String fireLevel, String dataLevel, String securityLevel);
}
