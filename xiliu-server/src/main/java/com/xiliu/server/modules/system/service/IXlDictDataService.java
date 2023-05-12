package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.system.entity.XlDictData;


import java.util.List;

/**
 * 字典数据表Service接口
 * 
 * @author xiliu
 * @date 2022-08-25
 */
public interface IXlDictDataService extends IService<XlDictData>{
    /**
     * 查询字典数据表
     * @param dictDataId 字典数据表主键
     * @return 字典数据表
     */
    XlDictData selectXlDictDataByDictDataId(Long dictDataId);

    /**
     * 查询字典数据表列表
     * @param xlDictData 字典数据表
     * @return 字典数据表集合
     */
    List<XlDictData> selectXlDictDataList(XlDictData xlDictData);

    /**
     * 新增字典数据表
     * @param xlDictData 字典数据表
     * @return 结果
     */
    boolean create(XlDictData xlDictData);

    /**
     * 修改字典数据表
     * @param xlDictData 字典数据表
     * @return 结果
     */
    boolean update(XlDictData xlDictData);

    /**
     * 批量删除字典数据表
     * 
     * @param dictDataIds 需要删除的字典数据表主键集合
     * @return 结果
     */
    int deleteXlDictDataByDictDataIds(Long[] dictDataIds);

    /**
     * 删除字典数据表信息
     * 
     * @param dictDataId 字典数据表主键
     * @return 结果
     */
    int deleteXlDictDataByDictDataId(Long dictDataId);

    /**
     * 根据字典类型查询字典数据
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    List<XlDictData> selectDictDataByType(String dictType);
}
