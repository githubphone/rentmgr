package com.ruoyi.rental.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.vo.AlertMapVO;
import com.ruoyi.rental.service.IRentalAlertService;

/**
 * 告警记录管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/alert")
public class RentalAlertController extends BaseController
{
    @Autowired
    private IRentalAlertService alertService;

    /**
     * 获取告警记录列表
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalAlert alert)
    {
        startPage();
        List<RentalAlert> list = alertService.selectAlertList(alert);
        return getDataTable(list);
    }

    /**
     * 导出告警记录列表
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:export')")
    @Log(title = "告警记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(RentalAlert alert)
    {
        List<RentalAlert> list = alertService.selectAlertList(alert);
        ExcelUtil<RentalAlert> util = new ExcelUtil<RentalAlert>(RentalAlert.class);
        util.exportExcel(list, "告警记录数据");
    }

    /**
     * 根据ID获取告警记录详情
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alertService.selectAlertById(id));
    }

    /**
     * 新增告警记录
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:add')")
    @Log(title = "告警记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalAlert alert)
    {
        return toAjax(alertService.insertAlert(alert));
    }

    /**
     * 修改告警记录
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:edit')")
    @Log(title = "告警记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalAlert alert)
    {
        return toAjax(alertService.updateAlert(alert));
    }

    /**
     * 删除告警记录
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:remove')")
    @Log(title = "告警记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alertService.deleteAlertByIds(ids));
    }

    /**
     * 获取告警地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:alert:list')")
    @GetMapping("/map")
    public R<List<AlertMapVO>> alertMap(RentalAlert alert)
    {
        List<AlertMapVO> list = alertService.selectAlertMapList(alert);
        return R.ok(list);
    }
}
