package com.ruoyi.rental.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.rental.domain.RentalManager;
import com.ruoyi.rental.domain.RentalManagerHouse;
import com.ruoyi.rental.service.IRentalManagerService;

@RestController
@RequestMapping("/rental/manager")
public class RentalManagerController extends BaseController
{
    @Autowired
    private IRentalManagerService managerService;

    @PreAuthorize("@ss.hasPermi('rental:manager:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalManager manager)
    {
        startPage();
        List<RentalManager> list = managerService.selectManagerList(manager);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:export')")
    @Log(title = "管理者管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RentalManager manager)
    {
        List<RentalManager> list = managerService.selectManagerList(manager);
        ExcelUtil<RentalManager> util = new ExcelUtil<>(RentalManager.class);
        util.exportExcel(response, list, "管理者数据");
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:query')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(managerService.selectManagerById(id));
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:add')")
    @Log(title = "管理者管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalManager manager)
    {
        return toAjax(managerService.insertManager(manager));
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:edit')")
    @Log(title = "管理者管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalManager manager)
    {
        return toAjax(managerService.updateManager(manager));
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:remove')")
    @Log(title = "管理者管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(managerService.deleteManagerByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:list')")
    @GetMapping("/house/list")
    public TableDataInfo listManagerHouse(RentalManagerHouse managerHouse)
    {
        startPage();
        List<RentalManagerHouse> list = managerService.selectManagerHouseList(managerHouse);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:edit')")
    @Log(title = "管理者出租屋关联", businessType = BusinessType.INSERT)
    @PostMapping("/house")
    public AjaxResult addManagerHouse(@RequestBody RentalManagerHouse managerHouse)
    {
        return toAjax(managerService.insertManagerHouse(managerHouse));
    }

    @PreAuthorize("@ss.hasPermi('rental:manager:edit')")
    @Log(title = "管理者出租屋关联", businessType = BusinessType.DELETE)
    @DeleteMapping("/house/{id}")
    public AjaxResult removeManagerHouse(@PathVariable Long id)
    {
        return toAjax(managerService.deleteManagerHouseById(id));
    }

    @GetMapping("/houses/{managerId}")
    public AjaxResult getHousesByManagerId(@PathVariable Long managerId)
    {
        return success(managerService.selectHouseIdsByManagerId(managerId));
    }
}
