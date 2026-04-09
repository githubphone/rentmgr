package com.ruoyi.rental.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.service.IQRCodeService;
import com.ruoyi.rental.service.IRentalHouseService;
import com.ruoyi.system.service.ISysConfigService;

@Service
public class QRCodeServiceImpl implements IQRCodeService
{
    private static final String QR_CODE_BASE_URL_KEY = "rental.qrcode.baseurl";

    @Autowired
    private IRentalHouseService houseService;

    @Autowired
    private ISysConfigService configService;

    @Override
    public byte[] generateHouseQRCode(Long houseId) throws IOException
    {
        String content = getQRCodeContent(houseId);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        hints.put(EncodeHintType.MARGIN, 2);

        try {
            BitMatrix matrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, 300, 300, hints);
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
        } catch (com.google.zxing.WriterException e) {
            throw new IOException("Failed to generate QR code", e);
        }
        return out.toByteArray();
    }

    @Override
    public String getQRCodeContent(Long houseId)
    {
        String baseUrl = configService.selectConfigByKey(QR_CODE_BASE_URL_KEY);
        if (baseUrl == null || baseUrl.isEmpty())
        {
            baseUrl = "http://localhost:8080";
        }
        return baseUrl + "/rental/house/qr/" + houseId;
    }

    @Override
    public RentalHouse getHouseDetailForQR(Long houseId)
    {
        return houseService.selectHouseById(houseId);
    }
}
