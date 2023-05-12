package com.xiliu.server.modules.house.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlProjectClassify;
import com.xiliu.server.modules.house.vo.ProjectResultVo;

/**
 * 项目分类表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface XlProjectClassifyMapper extends BaseMapper<XlProjectClassify>{
    /**
     * 查询项目分类表
     * @param classifyId 项目分类表主键
     * @return 项目分类表
     */
    XlProjectClassify selectXlProjectClassifyByClassifyId(Long classifyId);

    /**
     * 查询项目分类表列表
     * @param xlProjectClassify 项目分类表
     * @return 项目分类表集合
     */
   List<XlProjectClassify> selectXlProjectClassifyList(XlProjectClassify xlProjectClassify);

    /**
     * 查询用户分配项目列表
     * @param userId 用户id
     * @return 项目分类表集合
     */
    List<ProjectResultVo> getUserProjectList(Long userId);
}
