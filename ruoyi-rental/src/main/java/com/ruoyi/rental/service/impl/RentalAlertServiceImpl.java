package com.ruoyi.rental.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalAlertMapper;
import com.ruoyi.rental.mapper.RentalHouseMapper;
import com.ruoyi.rental.mapper.RentalGridMapper;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.service.IRentalAlertService;

@Service
public class RentalAlertServiceImpl implements IRentalAlertService
{
    @Autowired
    private RentalAlertMapper alertMapper;

    @Autowired
    private RentalHouseMapper houseMapper;

    @Autowired
    private RentalGridMapper gridMapper;

    @Override
    public List<RentalAlert> selectAlertList(RentalAlert alert)
    {
        return alertMapper.selectAlertList(alert);
    }

    @Override
    public RentalAlert selectAlertById(Long id)
    {
        return alertMapper.selectAlertById(id);
    }

    @Override
    public int insertAlert(RentalAlert alert)
    {
        if (alert.getStatus() == null)
        {
            alert.setStatus("pending");
        }
        return alertMapper.insertAlert(alert);
    }

    @Override
    public int updateAlert(RentalAlert alert)
    {
        return alertMapper.updateAlert(alert);
    }

    @Override
    public int deleteAlertById(Long id)
    {
        return alertMapper.deleteAlertById(id);
    }

    @Override
    public int deleteAlertByIds(Long[] ids)
    {
        return alertMapper.deleteAlertByIds(ids);
    }

    @Override
    public List<AlertMapVO> selectAlertMapList(RentalAlert alert)
    {
        return alertMapper.selectAlertMapList(alert);
    }

    @Override
    public int closeAlert(Long alertId, Long handlerId, String closeRemark, String closeVoucher)
    {
        RentalAlert alert = new RentalAlert();
        alert.setId(alertId);
        alert.setHandlerId(handlerId);
        alert.setStatus("resolved");
        alert.setCloseRemark(closeRemark);
        alert.setCloseVoucher(closeVoucher);
        alert.setCloseTime(new Date());
        return alertMapper.updateAlert(alert);
    }

    @Override
    public List<Long> selectGridMemberUserIds(Long houseId)
    {
        RentalHouse house = houseMapper.selectHouseById(houseId);
        if (house == null || house.getGridId() == null)
        {
            return List.of();
        }
        return gridMapper.selectGridMemberUserIds(house.getGridId());
    }
}
