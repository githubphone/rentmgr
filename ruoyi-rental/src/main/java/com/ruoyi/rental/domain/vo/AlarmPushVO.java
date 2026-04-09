package com.ruoyi.rental.domain.vo;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 告警推送请求 VO
 *
 * @author ruoyi
 */
public class AlarmPushVO
{
    @JsonProperty("alarmInfo")
    private AlarmInfo alarmInfo;

    public AlarmInfo getAlarmInfo()
    {
        return alarmInfo;
    }

    public void setAlarmInfo(AlarmInfo alarmInfo)
    {
        this.alarmInfo = alarmInfo;
    }

    public static class AlarmInfo
    {
        @JsonProperty("alarmId")
        private String alarmId;

        @JsonProperty("alarmCamId")
        private String alarmCamId;

        @JsonProperty("alarmType")
        private String alarmType;

        @JsonProperty("alarmTypeName")
        private String alarmTypeName;

        @JsonProperty("alarmLevel")
        private String alarmLevel;

        @JsonProperty("alarmLevelName")
        private String alarmLevelName;

        @JsonProperty("alarmTime")
        private String alarmTime;

        @JsonProperty("alarmSnapUrl")
        private String alarmSnapUrl;

        public String getAlarmId()
        {
            return alarmId;
        }

        public void setAlarmId(String alarmId)
        {
            this.alarmId = alarmId;
        }

        public String getAlarmCamId()
        {
            return alarmCamId;
        }

        public void setAlarmCamId(String alarmCamId)
        {
            this.alarmCamId = alarmCamId;
        }

        public String getAlarmType()
        {
            return alarmType;
        }

        public void setAlarmType(String alarmType)
        {
            this.alarmType = alarmType;
        }

        public String getAlarmTypeName()
        {
            return alarmTypeName;
        }

        public void setAlarmTypeName(String alarmTypeName)
        {
            this.alarmTypeName = alarmTypeName;
        }

        public String getAlarmLevel()
        {
            return alarmLevel;
        }

        public void setAlarmLevel(String alarmLevel)
        {
            this.alarmLevel = alarmLevel;
        }

        public String getAlarmLevelName()
        {
            return alarmLevelName;
        }

        public void setAlarmLevelName(String alarmLevelName)
        {
            this.alarmLevelName = alarmLevelName;
        }

        public String getAlarmTime()
        {
            return alarmTime;
        }

        public void setAlarmTime(String alarmTime)
        {
            this.alarmTime = alarmTime;
        }

        public String getAlarmSnapUrl()
        {
            return alarmSnapUrl;
        }

        public void setAlarmSnapUrl(String alarmSnapUrl)
        {
            this.alarmSnapUrl = alarmSnapUrl;
        }
    }
}