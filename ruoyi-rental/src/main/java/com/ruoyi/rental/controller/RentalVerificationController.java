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
import com.ruoyi.rental.domain.RentalVerification;
import com.ruoyi.rental.service.IRentalVerificationService;

/**
 * 核查记录管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/verification")
public class RentalVerificationController extends BaseController
{
    @Autowired
    private IRentalVerificationService verificationService;

    /**
     * 获取核查记录列表
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalVerification verification)
    {
        startPage();
        List<RentalVerification> list = verificationService.selectVerificationList(verification);
        return getDataTable(list);
    }

    /**
     * 导出核查记录列表
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:export')")
    @Log(title = "核查记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(RentalVerification verification)
    {
        List<RentalVerification> list = verificationService.selectVerificationList(verification);
        ExcelUtil<RentalVerification> util = new ExcelUtil<RentalVerification>(RentalVerification.class);
        util.exportExcel(list, "核查记录数据");
    }

    /**
     * 根据ID获取核查记录详情
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(verificationService.selectVerificationById(id));
    }

    /**
     * 新增核查记录
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:add')")
    @Log(title = "核查记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalVerification verification)
    {
        return toAjax(verificationService.insertVerification(verification));
    }

    /**
     * 修改核查记录
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:edit')")
    @Log(title = "核查记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalVerification verification)
    {
        return toAjax(verificationService.updateVerification(verification));
    }

    /**
     * 删除核查记录
     */
    @PreAuthorize("@ss.hasPermi('rental:verification:remove')")
    @Log(title = "核查记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(verificationService.deleteVerificationByIds(ids));
    }
}
