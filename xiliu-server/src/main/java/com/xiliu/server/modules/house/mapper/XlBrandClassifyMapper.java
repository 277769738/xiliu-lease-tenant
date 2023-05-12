package com.xiliu.server.modules.house.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlBrandClassify;

/**
 * 品牌分类表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface XlBrandClassifyMapper extends BaseMapper<XlBrandClassify>{
    /**
     * 查询品牌分类表
     * @param brandId 品牌分类表主键
     * @return 品牌分类表
     */
    XlBrandClassify selectXlBrandClassifyByBrandId(Long brandId);

    /**
     * 查询品牌分类表列表
     * @param xlBrandClassify 品牌分类表
     * @return 品牌分类表集合
     */
   List<XlBrandClassify> selectXlBrandClassifyList(XlBrandClassify xlBrandClassify);

}
