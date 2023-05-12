package com.xiliu.server.modules.services.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.services.entity.XlUserProject;
import com.xiliu.server.modules.services.mapper.XlUserProjectMapper;
import com.xiliu.server.modules.services.service.IXlUserProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色分配项目表Service业务层处理
 *
 * @author xiliu
 * @date 2023-03-28
 */
@Service
public class XlUserProjectServiceImpl extends ServiceImpl<XlUserProjectMapper, XlUserProject> implements IXlUserProjectService {


    @Override
    public boolean checkAuth(Long userId) {
        List<XlUserProject> userProjects = list(new LambdaQueryWrapper<XlUserProject>().eq(XlUserProject::getUserId,userId));
        if (CollectionUtil.isNotEmpty(userProjects)) {
            return true;
        }
        return false;
    }

    @Override
    public List<Long> selectAuthListByUserId(Long userId) {
        List<XlUserProject> userProjects = list(new LambdaQueryWrapper<XlUserProject>().eq(XlUserProject::getUserId,userId));
        return userProjects.stream().map(item -> item.getApartmentId()).collect(Collectors.toList());
    }
}
