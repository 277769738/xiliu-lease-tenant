package com.xiliu.server.modules.house.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.house.entity.XlProjectClassify;
import com.xiliu.server.modules.house.mapper.XlProjectClassifyMapper;
import com.xiliu.server.modules.house.service.IXlProjectClassifyService;
import com.xiliu.server.modules.house.vo.ProjectResultVo;
import com.xiliu.server.modules.system.service.XlRoleService;
import com.xiliu.server.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 项目分类表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Service
public class XlProjectClassifyServiceImpl extends ServiceImpl<XlProjectClassifyMapper, XlProjectClassify> implements IXlProjectClassifyService {
    @Autowired
    private XlProjectClassifyMapper xlProjectClassifyMapper;
    @Autowired
    private XlRoleService roleService;

    /**
     * 查询项目分类表
     * @param classifyId 项目分类表主键
     * @return 项目分类表
     */
    @Override
    public XlProjectClassify selectXlProjectClassifyByClassifyId(Long classifyId) {
        return xlProjectClassifyMapper.selectXlProjectClassifyByClassifyId(classifyId);
    }

    /**
     * 查询项目分类表列表
     * @param xlProjectClassify 项目分类表
     * @return 项目分类表
     */
    @Override
    public List<XlProjectClassify> selectXlProjectClassifyList(XlProjectClassify xlProjectClassify) {
        return xlProjectClassifyMapper.selectXlProjectClassifyList(xlProjectClassify);
    }

    /**
     * 新增项目分类表
     * @param xlProjectClassify 项目分类表
     * @return 结果
     */
    @Override
    public boolean create(XlProjectClassify xlProjectClassify) {
        return save(xlProjectClassify);
    }

    /**
     * 修改项目分类表
     * @param xlProjectClassify 项目分类表
     * @return 结果
     */
    @Override
    public boolean update(XlProjectClassify xlProjectClassify) {
        return updateById(xlProjectClassify);
    }

    /**
     * 批量删除项目分类表
     * @param classifyIds 需要删除的项目分类表主键
     * @return 结果
     */
    @Override
    public int deleteXlProjectClassifyByClassifyIds(Long[] classifyIds) {
        return xlProjectClassifyMapper.deleteBatchIds(Arrays.asList(classifyIds));
    }

    /**
     * 删除项目分类表信息
     * @param classifyId 项目分类表主键
     * @return 结果
     */
    @Override
    public int deleteXlProjectClassifyByClassifyId(Long classifyId) {
        return xlProjectClassifyMapper.deleteById(classifyId);
    }

    @Override
    public List<ProjectResultVo> selectProjectList(XlProjectClassify xlProjectClassify) {
        List<XlProjectClassify> list = xlProjectClassifyMapper.selectXlProjectClassifyList(xlProjectClassify);
        if (CollectionUtil.isNotEmpty(list)) {
            List<ProjectResultVo> newList = list.stream().map(
                    item -> {
                        ProjectResultVo vo = new ProjectResultVo();
                        BeanUtil.copyProperties(item,vo);
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    @Override
    public ProjectResultVo getProjectById(Long classifyId) {
        XlProjectClassify projectClassify = getById(classifyId);
        if (projectClassify != null) {
            ProjectResultVo vo = new ProjectResultVo();
            BeanUtil.copyProperties(projectClassify,vo);
            return vo;
        }
        return null;
    }

    @Override
    public List<ProjectResultVo> getUserProjectList(Long userId) {
        List<ProjectResultVo> list = CollectionUtil.newArrayList();
        // 判断用户角色是否是管理员
        if (SecurityUtils.isAdmin(userId) || roleService.checkAdminRoleByUserId(userId)) {
            list = baseMapper.getUserProjectList(null);
        } else {
            list = baseMapper.getUserProjectList(userId);
        }
        return list;
    }

}
