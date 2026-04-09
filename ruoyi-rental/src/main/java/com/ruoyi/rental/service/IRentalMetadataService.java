package com.ruoyi.rental.service;

import java.util.List;
import com.ruoyi.rental.domain.RentalMetadata;

/**
 * 元数据记录Service接口
 *
 * @author ruoyi
 */
public interface IRentalMetadataService
{
    public List<RentalMetadata> selectMetadataList(RentalMetadata metadata);

    public RentalMetadata selectMetadataById(Long id);

    public int insertMetadata(RentalMetadata metadata);

    public int updateMetadata(RentalMetadata metadata);

    public int deleteMetadataById(Long id);

    public int deleteMetadataByIds(Long[] ids);
}