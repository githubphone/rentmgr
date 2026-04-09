package com.ruoyi.rental.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.rental.mapper.RentalMetadataMapper;
import com.ruoyi.rental.domain.RentalMetadata;
import com.ruoyi.rental.service.IRentalMetadataService;

/**
 * 元数据记录Service实现
 *
 * @author ruoyi
 */
@Service
public class RentalMetadataServiceImpl implements IRentalMetadataService
{
    @Autowired
    private RentalMetadataMapper metadataMapper;

    @Override
    public List<RentalMetadata> selectMetadataList(RentalMetadata metadata)
    {
        return metadataMapper.selectMetadataList(metadata);
    }

    @Override
    public RentalMetadata selectMetadataById(Long id)
    {
        return metadataMapper.selectMetadataById(id);
    }

    @Override
    public int insertMetadata(RentalMetadata metadata)
    {
        return metadataMapper.insertMetadata(metadata);
    }

    @Override
    public int updateMetadata(RentalMetadata metadata)
    {
        return metadataMapper.updateMetadata(metadata);
    }

    @Override
    public int deleteMetadataById(Long id)
    {
        return metadataMapper.deleteMetadataById(id);
    }

    @Override
    public int deleteMetadataByIds(Long[] ids)
    {
        return metadataMapper.deleteMetadataByIds(ids);
    }
}