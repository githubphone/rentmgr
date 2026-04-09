package com.ruoyi.rental.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 核查记录对象 rental_verifications
 *
 * @author ruoyi
 */
public class RentalVerification extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 告警ID */
    @Excel(name = "告警ID")
    private Long alertId;

    /** 核查人ID */
    @Excel(name = "核查人ID")
    private Long verifierId;

    /** 核查方式 */
    @Excel(name = "核查方式")
    private String verifyType;

    /** 核查结果 */
    @Excel(name = "核查结果")
    private String verifyResult;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 核查时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "核查时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date verifiedAt;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getAlertId()
    {
        return alertId;
    }

    public void setAlertId(Long alertId)
    {
        this.alertId = alertId;
    }

    public Long getVerifierId()
    {
        return verifierId;
    }

    public void setVerifierId(Long verifierId)
    {
        this.verifierId = verifierId;
    }

    public String getVerifyType()
    {
        return verifyType;
    }

    public void setVerifyType(String verifyType)
    {
        this.verifyType = verifyType;
    }

    public String getVerifyResult()
    {
        return verifyResult;
    }

    public void setVerifyResult(String verifyResult)
    {
        this.verifyResult = verifyResult;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public Date getVerifiedAt()
    {
        return verifiedAt;
    }

    public void setVerifiedAt(Date verifiedAt)
    {
        this.verifiedAt = verifiedAt;
    }

    @Override
    public String toString()
    {
        return "RentalVerification{" +
                "id=" + id +
                ", alertId=" + alertId +
                ", verifierId=" + verifierId +
                ", verifyType='" + verifyType + '\'' +
                ", verifyResult='" + verifyResult + '\'' +
                ", remark='" + remark + '\'' +
                ", verifiedAt=" + verifiedAt +
                '}';
    }
}
