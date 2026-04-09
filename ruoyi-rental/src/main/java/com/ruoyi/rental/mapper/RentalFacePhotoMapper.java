package com.ruoyi.rental.mapper;

import java.util.List;
import com.ruoyi.rental.domain.RentalFacePhoto;

/**
 * 人脸照片Mapper接口
 *
 * @author ruoyi
 */
public interface RentalFacePhotoMapper
{
    /**
     * 查询人脸照片列表
     *
     * @param facePhoto 人脸照片信息
     * @return 人脸照片集合
     */
    public List<RentalFacePhoto> selectFacePhotoList(RentalFacePhoto facePhoto);

    /**
     * 根据ID查询人脸照片
     *
     * @param id 主键ID
     * @return 人脸照片信息
     */
    public RentalFacePhoto selectFacePhotoById(Long id);

    /**
     * 新增人脸照片
     *
     * @param facePhoto 人脸照片信息
     * @return 结果
     */
    public int insertFacePhoto(RentalFacePhoto facePhoto);

    /**
     * 修改人脸照片
     *
     * @param facePhoto 人脸照片信息
     * @return 结果
     */
    public int updateFacePhoto(RentalFacePhoto facePhoto);

    /**
     * 删除人脸照片
     *
     * @param id 主键ID
     * @return 结果
     */
    public int deleteFacePhotoById(Long id);

    /**
     * 批量删除人脸照片
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFacePhotoByIds(Long[] ids);
}
