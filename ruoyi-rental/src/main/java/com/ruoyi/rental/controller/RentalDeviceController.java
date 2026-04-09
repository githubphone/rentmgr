package com.ruoyi.rental.controller;

import java.util.List;
import java.util.Map;
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
import com.ruoyi.rental.domain.RentalDevice;
import com.ruoyi.rental.domain.vo.DeviceMapVO;
import com.ruoyi.rental.service.IRentalDeviceService;
import com.ruoyi.rental.service.IUnifiedMonitorService;

/**
 * 设备管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/device")
public class RentalDeviceController extends BaseController
{
    @Autowired
    private IRentalDeviceService deviceService;

    @Autowired
    private IUnifiedMonitorService unifiedMonitorService;

    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(RentalDeviceController.class);

    /**
     * 获取设备列表
     */
    @PreAuthorize("@ss.hasPermi('rental:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalDevice device)
    {
        startPage();
        List<RentalDevice> list = deviceService.selectDeviceList(device);
        return getDataTable(list);
    }

    /**
     * 导出设备列表
     */
    @PreAuthorize("@ss.hasPermi('rental:device:export')")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(RentalDevice device)
    {
        List<RentalDevice> list = deviceService.selectDeviceList(device);
        ExcelUtil<RentalDevice> util = new ExcelUtil<RentalDevice>(RentalDevice.class);
        util.exportExcel(list, "设备数据");
    }

    /**
     * 根据ID获取设备详情
     */
    @PreAuthorize("@ss.hasPermi('rental:device:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(deviceService.selectDeviceById(id));
    }

    /**
     * 根据设备编码获取设备
     */
    @PreAuthorize("@ss.hasPermi('rental:device:query')")
    @GetMapping(value = "/code/{deviceCode}")
    public AjaxResult getByCode(@PathVariable("deviceCode") String deviceCode)
    {
        return success(deviceService.selectDeviceByCode(deviceCode));
    }

    /**
     * 新增设备
     */
    @PreAuthorize("@ss.hasPermi('rental:device:add')")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalDevice device)
    {
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改设备
     */
    @PreAuthorize("@ss.hasPermi('rental:device:edit')")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalDevice device)
    {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除设备
     */
    @PreAuthorize("@ss.hasPermi('rental:device:remove')")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(deviceService.deleteDeviceByIds(ids));
    }

    /**
     * 获取设备地图标注列表
     */
    @PreAuthorize("@ss.hasPermi('rental:device:list')")
    @GetMapping("/map")
    public R<List<DeviceMapVO>> deviceMap()
    {
        List<DeviceMapVO> list = deviceService.selectDeviceMapList();
        return R.ok(list);
    }

    /**
     * 从统一监控平台同步摄像头
     */
    @PreAuthorize("@ss.hasPermi('rental:device:sync')")
    @PostMapping("/sync")
    public AjaxResult syncCameras()
    {
        Map<String, Object> result = unifiedMonitorService.syncCamerasFromPlatform();
        if (Boolean.TRUE.equals(result.get("success")))
        {
            return success(result);
        }
        else
        {
            return error(result.get("message").toString());
        }
    }

    /**
     * 订阅设备告警
     */
    @PreAuthorize("@ss.hasPermi('rental:device:subscribe')")
    @PostMapping("/subscribe/alarm/{id}")
    public AjaxResult subscribeAlarm(@PathVariable("id") Long id)
    {
        RentalDevice device = deviceService.selectDeviceById(id);
        if (device == null)
        {
            return error("设备不存在");
        }
        Map<String, Object> result = unifiedMonitorService.subscribeAlarm(device.getDeviceCode(), null);
        log.info("告警订阅结果: {}", result);
        Object successObj = result.get("success");
        if (successObj != null && Boolean.parseBoolean(successObj.toString()))
        {
            RentalDevice updateDevice = new RentalDevice();
            updateDevice.setId(id);
            updateDevice.setAlarmSubscribed("1");
            deviceService.updateDevice(updateDevice);
            log.info("设备 {} 告警订阅状态已更新", id);
        }
        return success(result);
    }

    /**
     * 取消订阅设备告警
     */
    @PreAuthorize("@ss.hasPermi('rental:device:subscribe')")
    @PostMapping("/unsubscribe/alarm/{id}")
    public AjaxResult unsubscribeAlarm(@PathVariable("id") Long id)
    {
        RentalDevice device = deviceService.selectDeviceById(id);
        if (device == null)
        {
            return error("设备不存在");
        }
        Map<String, Object> result = unifiedMonitorService.unsubscribeAlarm();
        log.info("取消告警订阅结果: {}", result);
        Object successObj = result.get("success");
        if (successObj != null && Boolean.parseBoolean(successObj.toString()))
        {
            RentalDevice updateDevice = new RentalDevice();
            updateDevice.setId(id);
            updateDevice.setAlarmSubscribed("0");
            deviceService.updateDevice(updateDevice);
            log.info("设备 {} 告警订阅状态已取消", id);
        }
        return success(result);
    }

    /**
     * 订阅设备元数据
     */
    @PreAuthorize("@ss.hasPermi('rental:device:subscribe')")
    @PostMapping("/subscribe/metadata/{id}")
    public AjaxResult subscribeMetadata(@PathVariable("id") Long id)
    {
        RentalDevice device = deviceService.selectDeviceById(id);
        if (device == null)
        {
            return error("设备不存在");
        }
        Map<String, Object> result = unifiedMonitorService.subscribeMetadata(device.getDeviceCode(), null);
        log.info("元数据订阅结果: {}", result);
        Object successObj = result.get("success");
        if (successObj != null && Boolean.parseBoolean(successObj.toString()))
        {
            RentalDevice updateDevice = new RentalDevice();
            updateDevice.setId(id);
            updateDevice.setMetadataSubscribed("1");
            deviceService.updateDevice(updateDevice);
            log.info("设备 {} 元数据订阅状态已更新", id);
        }
        return success(result);
    }

    /**
     * 取消订阅设备元数据
     */
    @PreAuthorize("@ss.hasPermi('rental:device:subscribe')")
    @PostMapping("/unsubscribe/metadata/{id}")
    public AjaxResult unsubscribeMetadata(@PathVariable("id") Long id)
    {
        RentalDevice device = deviceService.selectDeviceById(id);
        if (device == null)
        {
            return error("设备不存在");
        }
        Map<String, Object> result = unifiedMonitorService.unsubscribeMetadata(device.getDeviceCode());
        log.info("取消元数据订阅结果: {}", result);
        Object successObj = result.get("success");
        if (successObj != null && Boolean.parseBoolean(successObj.toString()))
        {
            RentalDevice updateDevice = new RentalDevice();
            updateDevice.setId(id);
            updateDevice.setMetadataSubscribed("0");
            deviceService.updateDevice(updateDevice);
            log.info("设备 {} 元数据订阅状态已取消", id);
        }
        return success(result);
    }
}
