package com.ruoyi.rental.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.rental.domain.RentalRoom;
import com.ruoyi.rental.service.IRentalRoomService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 房间管理Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/room")
public class RentalRoomController extends BaseController
{
    @Autowired
    private IRentalRoomService roomService;

    /**
     * 查询房间列表
     */
    @GetMapping("/list")
    public AjaxResult list(RentalRoom room)
    {
        List<RentalRoom> list = roomService.selectRoomList(room);
        return success(list);
    }

    /**
     * 获取房间下拉列表（根据出租屋ID）
     */
    @GetMapping("/simple/{houseId}")
    public AjaxResult getRoomsByHouseId(@PathVariable Long houseId)
    {
        List<RentalRoom> list = roomService.selectRoomByHouseId(houseId);
        return success(list);
    }

    /**
     * 导出房间列表
     */
    @Log(title = "房间管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RentalRoom room)
    {
        List<RentalRoom> list = roomService.selectRoomList(room);
        ExcelUtil<RentalRoom> util = new ExcelUtil<>(RentalRoom.class);
        util.exportExcel(response, list, "房间数据");
    }

    /**
     * 获取房间详细信息
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(roomService.selectRoomById(id));
    }

    /**
     * 新增房间
     */
    @Log(title = "房间管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalRoom room)
    {
        return toAjax(roomService.insertRoom(room));
    }

    /**
     * 修改房间
     */
    @Log(title = "房间管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalRoom room)
    {
        return toAjax(roomService.updateRoom(room));
    }

    /**
     * 删除房间
     */
    @Log(title = "房间管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(roomService.deleteRoomByIds(ids));
    }
}
