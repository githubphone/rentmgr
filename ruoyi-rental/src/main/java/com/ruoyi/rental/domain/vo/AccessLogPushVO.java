package com.ruoyi.rental.domain.vo;

import java.math.BigDecimal;
import java.util.Date;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 设备通行记录推送请求 VO
 * 
 * @author ruoyi
 */
public class AccessLogPushVO
{
    /** 设备ID */
    @JsonProperty("device_id")
    @NotBlank(message = "设备ID不能为空")
    private String deviceId;

    /** 抓拍时间 */
    @JsonProperty("capture_time")
    @NotNull(message = "抓拍时间不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private Date captureTime;

    /** 抓拍照片URL */
    @JsonProperty("photo_url")
    private String photoUrl;

    /** 人脸ID */
    @JsonProperty("face_id")
    private String faceId;

    /** 比对置信度 */
    private BigDecimal confidence;

    /** 是否陌生人 */
    @JsonProperty("is_stranger")
    private Boolean isStranger;

    public String getDeviceId()
    {
        return deviceId;
    }

    public void setDeviceId(String deviceId)
    {
        this.deviceId = deviceId;
    }

    public Date getCaptureTime()
    {
        return captureTime;
    }

    public void setCaptureTime(Date captureTime)
    {
        this.captureTime = captureTime;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public String getFaceId()
    {
        return faceId;
    }

    public void setFaceId(String faceId)
    {
        this.faceId = faceId;
    }

    public BigDecimal getConfidence()
    {
        return confidence;
    }

    public void setConfidence(BigDecimal confidence)
    {
        this.confidence = confidence;
    }

    public Boolean getIsStranger()
    {
        return isStranger;
    }

    public void setIsStranger(Boolean isStranger)
    {
        this.isStranger = isStranger;
    }
}
