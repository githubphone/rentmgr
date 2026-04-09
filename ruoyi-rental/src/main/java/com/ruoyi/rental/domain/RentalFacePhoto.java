package com.ruoyi.rental.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 人脸照片对象 rental_face_photos
 *
 * @author ruoyi
 */
public class RentalFacePhoto extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 住户ID */
    @Excel(name = "住户ID")
    private Long residentId;

    /** 照片URL */
    @Excel(name = "照片URL")
    private String photoUrl;

    /** 特征ID */
    @Excel(name = "特征ID")
    private String featureId;

    /** 是否已验证（0否 1是） */
    @Excel(name = "是否已验证", readConverterExp = "0=否,1=是")
    private String isVerified;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getResidentId()
    {
        return residentId;
    }

    public void setResidentId(Long residentId)
    {
        this.residentId = residentId;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public String getFeatureId()
    {
        return featureId;
    }

    public void setFeatureId(String featureId)
    {
        this.featureId = featureId;
    }

    public String getIsVerified()
    {
        return isVerified;
    }

    public void setIsVerified(String isVerified)
    {
        this.isVerified = isVerified;
    }

    @Override
    public String toString()
    {
        return "RentalFacePhoto{" +
                "id=" + id +
                ", residentId=" + residentId +
                ", photoUrl='" + photoUrl + '\'' +
                ", featureId='" + featureId + '\'' +
                ", isVerified='" + isVerified + '\'' +
                '}';
    }
}
