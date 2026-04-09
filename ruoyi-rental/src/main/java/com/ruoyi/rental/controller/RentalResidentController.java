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
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.rental.domain.RentalResident;
import com.ruoyi.rental.service.IRentalResidentService;

/**
 * 住户管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/resident")
public class RentalResidentController extends BaseController
{
    @Autowired
    private IRentalResidentService residentService;

    /**
     * 获取住户列表
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalResident resident)
    {
        startPage();
        List<RentalResident> list = residentService.selectResidentList(resident);
        return getDataTable(list);
    }

    /**
     * 导出住户列表
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:export')")
    @Log(title = "住户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(RentalResident resident)
    {
        List<RentalResident> list = residentService.selectResidentList(resident);
        ExcelUtil<RentalResident> util = new ExcelUtil<RentalResident>(RentalResident.class);
        util.exportExcel(list, "住户数据");
    }

    /**
     * 根据ID获取住户详情
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residentService.selectResidentById(id));
    }

    /**
     * 新增住户
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:add')")
    @Log(title = "住户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalResident resident)
    {
        return toAjax(residentService.insertResident(resident));
    }

    /**
     * 修改住户
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:edit')")
    @Log(title = "住户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalResident resident)
    {
        return toAjax(residentService.updateResident(resident));
    }

    /**
     * 删除住户
     */
    @PreAuthorize("@ss.hasPermi('rental:resident:remove')")
    @Log(title = "住户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residentService.deleteResidentByIds(ids));
    }
}
