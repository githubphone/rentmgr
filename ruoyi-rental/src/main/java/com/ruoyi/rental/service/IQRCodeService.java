package com.ruoyi.rental.service;

import java.io.IOException;
import com.ruoyi.rental.domain.RentalHouse;

public interface IQRCodeService
{
    byte[] generateHouseQRCode(Long houseId) throws IOException;

    String getQRCodeContent(Long houseId);

    RentalHouse getHouseDetailForQR(Long houseId);
}
