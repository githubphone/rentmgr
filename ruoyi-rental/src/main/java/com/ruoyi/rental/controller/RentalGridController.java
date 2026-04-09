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
import com.ruoyi.rental.domain.RentalGrid;
import com.ruoyi.rental.domain.RentalRoleGrid;
import com.ruoyi.rental.service.IRentalGridService;

@RestController
@RequestMapping("/rental/grid")
public class RentalGridController extends BaseController
{
    @Autowired
    private IRentalGridService gridService;

    @PreAuthorize("@ss.hasPermi('rental:grid:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalGrid grid)
    {
        startPage();
        List<RentalGrid> list = gridService.selectGridList(grid);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('rental:grid:export')")
    @Log(title = "网格管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RentalGrid grid)
    {
        List<RentalGrid> list = gridService.selectGridList(grid);
        ExcelUtil<RentalGrid> util = new ExcelUtil<>(RentalGrid.class);
        util.exportExcel(response, list, "网格数据");
    }

    @PreAuthorize("@ss.hasPermi('rental:grid:query')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(gridService.selectGridById(id));
    }

    @PreAuthorize("@ss.hasPermi('rental:grid:add')")
    @Log(title = "网格管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalGrid grid)
    {
        return toAjax(gridService.insertGrid(grid));
    }

    @PreAuthorize("@ss.hasPermi('rental:grid:edit')")
    @Log(title = "网格管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalGrid grid)
    {
        return toAjax(gridService.updateGrid(grid));
    }

    @PreAuthorize("@ss.hasPermi('rental:grid:remove')")
    @Log(title = "网格管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(gridService.deleteGridByIds(ids));
    }

    @GetMapping("/role/list")
    public TableDataInfo listRoleGrid(RentalRoleGrid roleGrid)
    {
        startPage();
        List<RentalRoleGrid> list = gridService.selectRoleGridList(roleGrid);
        return getDataTable(list);
    }

    @PostMapping("/role")
    public AjaxResult addRoleGrid(@RequestBody RentalRoleGrid roleGrid)
    {
        return toAjax(gridService.insertRoleGrid(roleGrid));
    }

    @DeleteMapping("/role/{id}")
    public AjaxResult removeRoleGrid(@PathVariable Long id)
    {
        return toAjax(gridService.deleteRoleGridById(id));
    }

    @DeleteMapping("/role/roleId/{roleId}")
    public AjaxResult removeRoleGridByRoleId(@PathVariable Long roleId)
    {
        return toAjax(gridService.deleteRoleGridByRoleId(roleId));
    }

    @GetMapping("/role/gridId/{roleId}")
    public AjaxResult getGridIdByRoleId(@PathVariable Long roleId)
    {
        return success(gridService.selectGridIdByRoleId(roleId));
    }
}
