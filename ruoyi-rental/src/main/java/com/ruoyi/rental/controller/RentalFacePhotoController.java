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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.rental.domain.RentalFacePhoto;
import com.ruoyi.rental.service.IRentalFacePhotoService;

/**
 * 人脸照片管理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental/facePhoto")
public class RentalFacePhotoController extends BaseController
{
    @Autowired
    private IRentalFacePhotoService facePhotoService;

    /**
     * 获取人脸照片列表
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:list')")
    @GetMapping("/list")
    public TableDataInfo list(RentalFacePhoto facePhoto)
    {
        startPage();
        List<RentalFacePhoto> list = facePhotoService.selectFacePhotoList(facePhoto);
        return getDataTable(list);
    }

    /**
     * 根据ID获取人脸照片详情
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(facePhotoService.selectFacePhotoById(id));
    }

    /**
     * 新增人脸照片
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:add')")
    @Log(title = "人脸照片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RentalFacePhoto facePhoto)
    {
        return toAjax(facePhotoService.insertFacePhoto(facePhoto));
    }

    /**
     * 修改人脸照片
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:edit')")
    @Log(title = "人脸照片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RentalFacePhoto facePhoto)
    {
        return toAjax(facePhotoService.updateFacePhoto(facePhoto));
    }

    /**
     * 删除人脸照片
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:remove')")
    @Log(title = "人脸照片", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(facePhotoService.deleteFacePhotoByIds(ids));
    }

    /**
     * 上传人脸照片
     */
    @PreAuthorize("@ss.hasPermi('rental:facePhoto:add')")
    @Log(title = "上传人脸照片", businessType = BusinessType.UPDATE)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam("file") MultipartFile file)
    {
        try
        {
            // 上传文件到服务器指定目录
            String filePath = FileUploadUtils.upload(file);
            return success(filePath);
        }
        catch (Exception e)
        {
            return error("上传失败：" + e.getMessage());
        }
    }
}
