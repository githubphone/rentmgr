package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalFacePhotoMapper;
import com.ruoyi.rental.domain.RentalFacePhoto;
import com.ruoyi.rental.service.IRentalFacePhotoService;

/**
 * 人脸照片Service实现
 * 
 * @author ruoyi
 */
@Service
public class RentalFacePhotoServiceImpl implements IRentalFacePhotoService
{
    @Autowired
    private RentalFacePhotoMapper facePhotoMapper;

    /**
     * 查询人脸照片列表
     * 
     * @param facePhoto 人脸照片信息
     * @return 人脸照片集合
     */
    @Override
    public List<RentalFacePhoto> selectFacePhotoList(RentalFacePhoto facePhoto)
    {
        return facePhotoMapper.selectFacePhotoList(facePhoto);
    }

    /**
     * 根据ID查询人脸照片
     * 
     * @param id 主键ID
     * @return 人脸照片信息
     */
    @Override
    public RentalFacePhoto selectFacePhotoById(Long id)
    {
        return facePhotoMapper.selectFacePhotoById(id);
    }

    /**
     * 新增人脸照片
     * 
     * @param facePhoto 人脸照片信息
     * @return 结果
     */
    @Override
    public int insertFacePhoto(RentalFacePhoto facePhoto)
    {
        return facePhotoMapper.insertFacePhoto(facePhoto);
    }

    /**
     * 修改人脸照片
     * 
     * @param facePhoto 人脸照片信息
     * @return 结果
     */
    @Override
    public int updateFacePhoto(RentalFacePhoto facePhoto)
    {
        return facePhotoMapper.updateFacePhoto(facePhoto);
    }

    /**
     * 删除人脸照片
     * 
     * @param id 主键ID
     * @return 结果
     */
    @Override
    public int deleteFacePhotoById(Long id)
    {
        return facePhotoMapper.deleteFacePhotoById(id);
    }

    /**
     * 批量删除人脸照片
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFacePhotoByIds(Long[] ids)
    {
        return facePhotoMapper.deleteFacePhotoByIds(ids);
    }
}
