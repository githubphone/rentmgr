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
import com.ruoyi.rental.domain.RentalAccessLog;
import com.ruoyi.rental.service.IRentalAccessLogService;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 通行记录管理
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/access")
public class RentalAccessLogController extends BaseController
{
    @Autowired
    private IRentalAccessLogService accessLogService;

    /**
     * 获取通行记录列表
     */
    @PreAuthorize("@ss.hasPermi('rental:access:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalAccessLog accessLog)
    {
        startPage();
        List<RentalAccessLog> list = accessLogService.selectAccessLogList(accessLog);
        return getDataTable(list);
    }

    /**
     * 根据ID获取通行记录详情
     */
    @PreAuthorize("@ss.hasPermi('rental:access:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(accessLogService.selectAccessLogById(id));
    }

    /**
     * 新增通行记录
     */
    @PreAuthorize("@ss.hasPermi('rental:access:add')")
    @Log(title = "通行记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalAccessLog accessLog)
    {
        return toAjax(accessLogService.insertAccessLog(accessLog));
    }

    /**
     * 修改通行记录
     */
    @PreAuthorize("@ss.hasPermi('rental:access:edit')")
    @Log(title = "通行记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalAccessLog accessLog)
    {
        return toAjax(accessLogService.updateAccessLog(accessLog));
    }

    /**
     * 删除通行记录
     */
    @PreAuthorize("@ss.hasPermi('rental:access:remove')")
    @Log(title = "通行记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(accessLogService.deleteAccessLogByIds(ids));
    }

    /**
     * 导出通行记录
     */
    @PreAuthorize("@ss.hasPermi('rental:access:export')")
    @Log(title = "通行记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RentalAccessLog accessLog)
    {
        List<RentalAccessLog> list = accessLogService.selectAccessLogList(accessLog);
        ExcelUtil<RentalAccessLog> util = new ExcelUtil<>(RentalAccessLog.class);
        util.exportExcel(response, list, "通行记录数据");
    }
}
