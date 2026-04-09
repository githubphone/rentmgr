package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.vo.AlertMapVO;

/**
 * 告警记录Mapper接口
 *
 * @author ruoyi
 */
public interface RentalAlertMapper
{
    /**
     * 查询告警记录列表
     *
     * @param alert 告警记录信息
     * @return 告警记录集合
     */
    public List<RentalAlert> selectAlertList(RentalAlert alert);

    /**
     * 根据ID查询告警记录
     *
     * @param id 主键ID
     * @return 告警记录信息
     */
    public RentalAlert selectAlertById(Long id);

    /**
     * 新增告警记录
     *
     * @param alert 告警记录信息
     * @return 结果
     */
    public int insertAlert(RentalAlert alert);

    /**
     * 修改告警记录
     *
     * @param alert 告警记录信息
     * @return 结果
     */
    public int updateAlert(RentalAlert alert);

    /**
     * 删除告警记录
     *
     * @param id 主键ID
     * @return 结果
     */
    public int deleteAlertById(Long id);

    /**
     * 批量删除告警记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAlertByIds(Long[] ids);

    /**
     * 查询告警地图标注列表
     *
     * @param alert 告警记录信息
     * @return 告警地图标注列表
     */
    public List<AlertMapVO> selectAlertMapList(RentalAlert alert);
}
