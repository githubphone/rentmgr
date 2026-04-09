package com.ruoyi.rental.domain.vo;

import java.util.Map;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 元数据推送请求 VO
 *
 * @author ruoyi
 */
public class MetadataPushVO
{
    @JsonProperty("metadataInfo")
    private MetadataInfo metadataInfo;

    public MetadataInfo getMetadataInfo()
    {
        return metadataInfo;
    }

    public void setMetadataInfo(MetadataInfo metadataInfo)
    {
        this.metadataInfo = metadataInfo;
    }

    public static class MetadataInfo
    {
        @JsonProperty("metadataType")
        private String metadataType;

        @JsonProperty("deviceId")
        private String deviceId;

        @JsonProperty("createTime")
        private String createTime;

        @JsonProperty("metadataContent")
        private MetadataContent metadataContent;

        public String getMetadataType()
        {
            return metadataType;
        }

        public void setMetadataType(String metadataType)
        {
            this.metadataType = metadataType;
        }

        public String getDeviceId()
        {
            return deviceId;
        }

        public void setDeviceId(String deviceId)
        {
            this.deviceId = deviceId;
        }

        public String getCreateTime()
        {
            return createTime;
        }

        public void setCreateTime(String createTime)
        {
            this.createTime = createTime;
        }

        public MetadataContent getMetadataContent()
        {
            return metadataContent;
        }

        public void setMetadataContent(MetadataContent metadataContent)
        {
            this.metadataContent = metadataContent;
        }
    }

    public static class MetadataContent
    {
        @JsonProperty("captureUrl")
        private String captureUrl;

        @JsonProperty("detectUrl")
        private String detectUrl;

        @JsonProperty("desc")
        private String desc;

        @JsonProperty("attributes")
        private Map<String, Object> attributes;

        public String getCaptureUrl()
        {
            return captureUrl;
        }

        public void setCaptureUrl(String captureUrl)
        {
            this.captureUrl = captureUrl;
        }

        public String getDetectUrl()
        {
            return detectUrl;
        }

        public void setDetectUrl(String detectUrl)
        {
            this.detectUrl = detectUrl;
        }

        public String getDesc()
        {
            return desc;
        }

        public void setDesc(String desc)
        {
            this.desc = desc;
        }

        public Map<String, Object> getAttributes()
        {
            return attributes;
        }

        public void setAttributes(Map<String, Object> attributes)
        {
            this.attributes = attributes;
        }
    }
}