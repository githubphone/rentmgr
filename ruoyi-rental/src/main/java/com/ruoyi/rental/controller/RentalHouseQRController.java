package com.ruoyi.rental.controller;

import java.io.IOException;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.service.IQRCodeService;
import com.ruoyi.rental.service.IRentalHouseService;

@RestController
@RequestMapping("/rental/house")
public class RentalHouseQRController
{
    @Autowired
    private IQRCodeService qrCodeService;

    @Autowired
    private IRentalHouseService houseService;

    @GetMapping("/qr/{houseId}")
    public R<RentalHouse> getQRContent(@PathVariable Long houseId)
    {
        RentalHouse house = qrCodeService.getHouseDetailForQR(houseId);
        if (house == null)
        {
            return R.fail("出租屋不存在");
        }
        return R.ok(house);
    }

    @GetMapping("/qr/{houseId}/image")
    public void getQRImage(@PathVariable Long houseId, HttpServletResponse response) throws IOException
    {
        response.setContentType("image/png");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        byte[] qrCode = qrCodeService.generateHouseQRCode(houseId);
        response.getOutputStream().write(qrCode);
        response.getOutputStream().flush();
    }
}
