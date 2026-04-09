package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalHouseInspectionMapper;
import com.ruoyi.rental.domain.RentalHouseInspection;
import com.ruoyi.rental.service.IRentalHouseInspectionService;

@Service
public class RentalHouseInspectionServiceImpl implements IRentalHouseInspectionService
{
    @Autowired
    private RentalHouseInspectionMapper inspectionMapper;

    @Override
    public List<RentalHouseInspection> selectInspectionList(RentalHouseInspection inspection)
    {
        return inspectionMapper.selectInspectionList(inspection);
    }

    @Override
    public RentalHouseInspection selectInspectionById(Long id)
    {
        return inspectionMapper.selectInspectionById(id);
    }

    @Override
    public RentalHouseInspection selectLatestInspectionByHouseId(Long houseId)
    {
        return inspectionMapper.selectLatestInspectionByHouseId(houseId);
    }

    @Override
    public int insertInspection(RentalHouseInspection inspection)
    {
        inspection.setOverallLevel(calculateOverallLevel(
            inspection.getFireLevel(),
            inspection.getDataLevel(),
            inspection.getSecurityLevel()));
        return inspectionMapper.insertInspection(inspection);
    }

    @Override
    public int updateInspection(RentalHouseInspection inspection)
    {
        inspection.setOverallLevel(calculateOverallLevel(
            inspection.getFireLevel(),
            inspection.getDataLevel(),
            inspection.getSecurityLevel()));
        return inspectionMapper.updateInspection(inspection);
    }

    @Override
    public int deleteInspectionById(Long id)
    {
        return inspectionMapper.deleteInspectionById(id);
    }

    @Override
    public int deleteInspectionByHouseId(Long houseId)
    {
        return inspectionMapper.deleteInspectionByHouseId(houseId);
    }

    @Override
    public String calculateOverallLevel(String fireLevel, String dataLevel, String securityLevel)
    {
        int greenCount = 0;
        if ("1".equals(fireLevel)) greenCount++;
        if ("1".equals(dataLevel)) greenCount++;
        if ("1".equals(securityLevel)) greenCount++;

        if (greenCount >= 3) return "green";
        if (greenCount >= 2) return "yellow";
        return "red";
    }
}
