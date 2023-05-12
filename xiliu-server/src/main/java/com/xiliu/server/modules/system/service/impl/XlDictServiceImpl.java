package com.xiliu.server.modules.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.server.modules.system.entity.XlDict;
import com.xiliu.server.modules.system.entity.XlDictData;
import com.xiliu.server.modules.system.mapper.XlDictDataMapper;
import com.xiliu.server.modules.system.mapper.XlDictMapper;
import com.xiliu.server.modules.system.service.IXlDictService;
import com.xiliu.server.utils.DictUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 字典表Service业务层处理
 * 
 * @author xiliu
 * @date 2022-08-09
 */
@Service
public class XlDictServiceImpl extends ServiceImpl<XlDictMapper, XlDict> implements IXlDictService {
    @Autowired
    private XlDictMapper xlDictMapper;
    @Autowired
    private XlDictDataMapper xlDictDataMapper;

    /**
     * 查询字典表
     * @param dictId 字典表主键
     * @return 字典表
     */
    @Override
    public XlDict selectXlDictByDictId(Long dictId) {
        return xlDictMapper.selectXlDictByDictId(dictId);
    }

    /**
     * 查询字典表列表
     * @param xlDict 字典表
     * @return 字典表
     */
    @Override
    public List<XlDict> selectXlDictList(XlDict xlDict) {
        return xlDictMapper.selectXlDictList(xlDict);
    }

    /**
     * 新增字典表
     * @param xlDict 字典表
     * @return 结果
     */
    @Override
    public boolean create(XlDict xlDict) {
        return save(xlDict);
    }

    /**
     * 修改字典表
     * @param xlDict 字典表
     * @return 结果
     */
    @Override
    public boolean update(XlDict xlDict) {
        return updateById(xlDict);
    }

    /**
     * 批量删除字典表
     * @param dictIds 需要删除的字典表主键
     * @return 结果
     */
    @Override
    public int deleteXlDictByDictIds(Long[] dictIds) {
        return xlDictMapper.deleteBatchIds(Arrays.asList(dictIds));
    }

    /**
     * 删除字典表信息
     * @param dictId 字典表主键
     * @return 结果
     */
    @Override
    public int deleteXlDictByDictId(Long dictId) {
        return xlDictMapper.deleteById(dictId);
    }

    @Override
    public List<XlDict> selectDictTypeAll() {
        List<XlDict> list = xlDictMapper.selectList(new LambdaQueryWrapper<XlDict>());
        return list;
    }

    /**
     * 加载字典缓存数据
     */
    @Override
    public void loadingDictCache() {
        XlDictData dictData = new XlDictData();
        dictData.setStatus(0);
        // 按字典编码分组
        Map<String, List<XlDictData>> dictDataMap = xlDictDataMapper.selectXlDictDataList(dictData).stream().collect(Collectors.groupingBy(XlDictData::getDictType));
        for (Map.Entry<String, List<XlDictData>> entry : dictDataMap.entrySet()) {
            DictUtils.setDictCache(entry.getKey(), entry.getValue().stream().sorted(Comparator.comparing(XlDictData::getSort)).collect(Collectors.toList()));
        }
    }

    /**
     * 清空字典缓存数据
     */
    @Override
    public void clearDictCache() {
        DictUtils.clearDictCache();
    }

    /**
     * 重置字典缓存数据
     */
    @Override
    public void resetDictCache() {
        clearDictCache();
        loadingDictCache();
    }
}
