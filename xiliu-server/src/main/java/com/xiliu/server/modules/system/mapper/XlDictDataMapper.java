package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlDictData;

import java.util.List;

/**
 * 字典数据表Mapper接口
 * 
 * @author xiliu
 * @date 2022-08-25
 */
public interface XlDictDataMapper extends BaseMapper<XlDictData>{
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
     * 根据字典类型查询字典数据
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    List<XlDictData> selectDictDataByType(String dictType);
}
