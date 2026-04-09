package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.vo.AlertMapVO;

public interface IRentalAlertService
{
    public List<RentalAlert> selectAlertList(RentalAlert alert);

    public RentalAlert selectAlertById(Long id);

    public int insertAlert(RentalAlert alert);

    public int updateAlert(RentalAlert alert);

    public int deleteAlertById(Long id);

    public int deleteAlertByIds(Long[] ids);

    public List<AlertMapVO> selectAlertMapList(RentalAlert alert);

    public int closeAlert(Long alertId, Long handlerId, String closeRemark, String closeVoucher);

    public List<Long> selectGridMemberUserIds(Long houseId);
}
