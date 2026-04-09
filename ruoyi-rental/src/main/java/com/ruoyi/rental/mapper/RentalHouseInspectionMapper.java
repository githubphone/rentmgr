package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalHouseInspection;

public interface RentalHouseInspectionMapper
{
    public List<RentalHouseInspection> selectInspectionList(RentalHouseInspection inspection);

    public RentalHouseInspection selectInspectionById(Long id);

    public RentalHouseInspection selectLatestInspectionByHouseId(Long houseId);

    public int insertInspection(RentalHouseInspection inspection);

    public int updateInspection(RentalHouseInspection inspection);

    public int deleteInspectionById(Long id);

    public int deleteInspectionByHouseId(Long houseId);
}
