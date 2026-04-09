package com.ruoyi.rental.controller;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.rental.domain.RentalHouse;
import com.ruoyi.rental.domain.vo.HouseMapVO;
import com.ruoyi.rental.service.IRentalHouseService;

/**
 * 出租屋管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/house")
public class RentalHouseController extends BaseController
{
    @Autowired
    private IRentalHouseService houseService;

    /**
     * 获取出租屋列表
     */
    @PreAuthorize("@ss.hasPermi('rental:house:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalHouse house)
    {
        startPage();
        List<RentalHouse> list = houseService.selectHouseList(house);
        return getDataTable(list);
    }

    /**
     * 导出出租屋列表
     */
    @PreAuthorize("@ss.hasPermi('rental:house:export')")
    @Log(title = "出租屋", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(RentalHouse house)
    {
        List<RentalHouse> list = houseService.selectHouseList(house);
        ExcelUtil<RentalHouse> util = new ExcelUtil<RentalHouse>(RentalHouse.class);
        util.exportExcel(list, "出租屋数据");
    }

    /**
     * 根据ID获取出租屋详情
     */
    @PreAuthorize("@ss.hasPermi('rental:house:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(houseService.selectHouseById(id));
    }

    /**
     * 新增出租屋
     */
    @PreAuthorize("@ss.hasPermi('rental:house:add')")
    @Log(title = "出租屋", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalHouse house)
    {
        return toAjax(houseService.insertHouse(house));
    }

    /**
     * 修改出租屋
     */
    @PreAuthorize("@ss.hasPermi('rental:house:edit')")
    @Log(title = "出租屋", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalHouse house)
    {
        return toAjax(houseService.updateHouse(house));
    }

    /**
     * 删除出租屋
     */
    @PreAuthorize("@ss.hasPermi('rental:house:remove')")
    @Log(title = "出租屋", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(houseService.deleteHouseByIds(ids));
    }

    /**
     * 获取出租屋地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:house:list')")
    @GetMapping("/map")
    public R<List<HouseMapVO>> houseMap(RentalHouse house)
    {
        List<HouseMapVO> list = houseService.selectHouseMapList(house);
        return R.ok(list);
    }

    /**
     * 查询附近出租屋
     * 
     * @param latitude  纬度
     * @param longitude 经度
     * @param radius    半径（米），默认 1000
     * @return 范围内的出租屋列表
     */
    @PreAuthorize("@ss.hasPermi('rental:house:list')")
    @GetMapping("/nearby")
    public R<List<RentalHouse>> nearby(
            @RequestParam("latitude") BigDecimal latitude,
            @RequestParam("longitude") BigDecimal longitude,
            @RequestParam(value = "radius", defaultValue = "1000") Integer radius)
    {
        List<RentalHouse> list = houseService.selectHouseNearby(latitude, longitude, radius);
        return R.ok(list);
    }
}
