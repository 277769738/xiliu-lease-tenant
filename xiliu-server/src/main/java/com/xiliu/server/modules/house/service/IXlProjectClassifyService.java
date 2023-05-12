package com.xiliu.server.modules.house.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlProjectClassify;
import com.xiliu.server.modules.house.vo.ProjectResultVo;

import java.util.List;

/**
 * 项目分类表Service接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface IXlProjectClassifyService extends IService<XlProjectClassify>{
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
     * 新增项目分类表
     * @param xlProjectClassify 项目分类表
     * @return 结果
     */
    boolean create(XlProjectClassify xlProjectClassify);

    /**
     * 修改项目分类表
     * @param xlProjectClassify 项目分类表
     * @return 结果
     */
    boolean update(XlProjectClassify xlProjectClassify);

    /**
     * 批量删除项目分类表
     * 
     * @param classifyIds 需要删除的项目分类表主键集合
     * @return 结果
     */
    int deleteXlProjectClassifyByClassifyIds(Long[] classifyIds);

    /**
     * 删除项目分类表信息
     * 
     * @param classifyId 项目分类表主键
     * @return 结果
     */
    int deleteXlProjectClassifyByClassifyId(Long classifyId);

    /**
     * 查询项目分类精简信息列表
     * @param xlProjectClassify 项目分类表
     * @return 品牌分类表集合
     */
    List<ProjectResultVo> selectProjectList(XlProjectClassify xlProjectClassify);

    /**
     * 查询项目分类精简信息
     * @param classifyId id
     * @return 品牌分类表集合
     */
    ProjectResultVo getProjectById(Long classifyId);

    /**
     * 查询用户项目列表
     * @param userId 用户id
     * @return 品牌分类表集合
     */
    List<ProjectResultVo> getUserProjectList(Long userId);
}
