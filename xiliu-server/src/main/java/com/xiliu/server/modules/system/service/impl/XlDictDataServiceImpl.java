package com.xiliu.server.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.server.modules.system.entity.XlDictData;
import com.xiliu.server.modules.system.mapper.XlDictDataMapper;
import com.xiliu.server.modules.system.service.IXlDictDataService;
import com.xiliu.server.utils.DictUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 字典数据表Service业务层处理
 * 
 * @author xiliu
 * @date 2022-08-25
 */
@Service
public class XlDictDataServiceImpl extends ServiceImpl<XlDictDataMapper, XlDictData> implements IXlDictDataService {
    @Autowired
    private XlDictDataMapper xlDictDataMapper;

    /**
     * 查询字典数据表
     * @param dictDataId 字典数据表主键
     * @return 字典数据表
     */
    @Override
    public XlDictData selectXlDictDataByDictDataId(Long dictDataId) {
        return xlDictDataMapper.selectXlDictDataByDictDataId(dictDataId);
    }

    /**
     * 查询字典数据表列表
     * @param xlDictData 字典数据表
     * @return 字典数据表
     */
    @Override
    public List<XlDictData> selectXlDictDataList(XlDictData xlDictData) {
        return xlDictDataMapper.selectXlDictDataList(xlDictData);
    }

    /**
     * 新增字典数据表
     * @param xlDictData 字典数据表
     * @return 结果
     */
    @Override
    public boolean create(XlDictData xlDictData) {
        return save(xlDictData);
    }

    /**
     * 修改字典数据表
     * @param xlDictData 字典数据表
     * @return 结果
     */
    @Override
    public boolean update(XlDictData xlDictData) {
        return updateById(xlDictData);
    }

    /**
     * 批量删除字典数据表
     * @param dictDataIds 需要删除的字典数据表主键
     * @return 结果
     */
    @Override
    public int deleteXlDictDataByDictDataIds(Long[] dictDataIds) {
        return xlDictDataMapper.deleteBatchIds(Arrays.asList(dictDataIds));
    }

    /**
     * 删除字典数据表信息
     * @param dictDataId 字典数据表主键
     * @return 结果
     */
    @Override
    public int deleteXlDictDataByDictDataId(Long dictDataId) {
        return xlDictDataMapper.deleteById(dictDataId);
    }

    /**
     * 根据字典类型查询字典数据
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    @Override
    public List<XlDictData> selectDictDataByType(String dictType) {
        List<XlDictData> dictDataList = DictUtils.getDictCache(dictType);
        if (CollectionUtil.isNotEmpty(dictDataList)) {
            return dictDataList;
        }
        dictDataList = xlDictDataMapper.selectDictDataByType(dictType);
        if (CollectionUtil.isNotEmpty(dictDataList)) {
            DictUtils.setDictCache(dictType, dictDataList);
            return dictDataList;
        }
        return null;
    }
}
