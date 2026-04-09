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
import com.ruoyi.rental.domain.RentalHouseInspection;
import com.ruoyi.rental.service.IRentalHouseInspectionService;
import com.ruoyi.rental.service.IRentalHouseService;

@RestController
@RequestMapping("/rental/inspection")
public class RentalHouseInspectionController extends BaseController
{
    @Autowired
    private IRentalHouseInspectionService inspectionService;

    @Autowired
    private IRentalHouseService houseService;

    @PreAuthorize("@ss.hasPermi('rental:inspection:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalHouseInspection inspection)
    {
        startPage();
        List<RentalHouseInspection> list = inspectionService.selectInspectionList(inspection);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('rental:inspection:export')")
    @Log(title = "出租屋检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RentalHouseInspection inspection)
    {
        List<RentalHouseInspection> list = inspectionService.selectInspectionList(inspection);
        ExcelUtil<RentalHouseInspection> util = new ExcelUtil<>(RentalHouseInspection.class);
        util.exportExcel(response, list, "检查数据");
    }

    @PreAuthorize("@ss.hasPermi('rental:inspection:query')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(inspectionService.selectInspectionById(id));
    }

    @GetMapping("/house/{houseId}/latest")
    public AjaxResult getLatestByHouseId(@PathVariable Long houseId)
    {
        return success(inspectionService.selectLatestInspectionByHouseId(houseId));
    }

    @PreAuthorize("@ss.hasPermi('rental:inspection:add')")
    @Log(title = "出租屋检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalHouseInspection inspection)
    {
        int result = inspectionService.insertInspection(inspection);
        if (result > 0 && inspection.getHouseId() != null && inspection.getOverallLevel() != null)
        {
            var house = houseService.selectHouseById(inspection.getHouseId());
            if (house != null)
            {
                house.setOverallLevel(inspection.getOverallLevel());
                houseService.updateHouse(house);
            }
        }
        return toAjax(result);
    }

    @PreAuthorize("@ss.hasPermi('rental:inspection:edit')")
    @Log(title = "出租屋检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalHouseInspection inspection)
    {
        int result = inspectionService.updateInspection(inspection);
        if (result > 0 && inspection.getHouseId() != null && inspection.getOverallLevel() != null)
        {
            var house = houseService.selectHouseById(inspection.getHouseId());
            if (house != null)
            {
                house.setOverallLevel(inspection.getOverallLevel());
                houseService.updateHouse(house);
            }
        }
        return toAjax(result);
    }

    @PreAuthorize("@ss.hasPermi('rental:inspection:remove')")
    @Log(title = "出租屋检查", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(inspectionService.deleteInspectionById(ids[0]));
    }
}
