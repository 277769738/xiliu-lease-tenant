package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlDict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典表Mapper接口
 * 
 * @author xiliu
 * @date 2022-08-09
 */
public interface XlDictMapper extends BaseMapper<XlDict>{
    /**
     * 查询字典表
     * @param dictId 字典表主键
     * @return 字典表
     */
    XlDict selectXlDictByDictId(Long dictId);

    /**
     * 查询字典表列表
     * @param xlDict 字典表
     * @return 字典表集合
     */
   List<XlDict> selectXlDictList(@Param(value = "xlDict") XlDict xlDict);

}
