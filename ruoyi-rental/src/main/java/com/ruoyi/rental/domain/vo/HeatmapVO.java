package com.ruoyi.rental.domain.vo;

/**
 * 通行热力图 VO
 * 
 * @author ruoyi
 */
public class HeatmapVO
{
    /** 小时（0-23） */
    private Integer hour;

    /** 通行次数 */
    private Long count;

    /** 无参构造器（MyBatis/JSON反序列化需要） */
    public HeatmapVO()
    {
    }

    public HeatmapVO(Integer hour, Long count)
    {
        this.hour = hour;
        this.count = count;
    }

    public Integer getHour()
    {
        return hour;
    }

    public void setHour(Integer hour)
    {
        this.hour = hour;
    }

    public Long getCount()
    {
        return count;
    }

    public void setCount(Long count)
    {
        this.count = count;
    }
}
