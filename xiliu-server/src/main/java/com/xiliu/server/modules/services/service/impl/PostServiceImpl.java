package com.xiliu.server.modules.services.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xiliu.common.result.R;
import com.xiliu.server.common.exception.ServiceException;
import com.xiliu.server.modules.services.service.PostService;
import com.xiliu.server.modules.services.vo.PostResultVo;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.mapper.XlRoleMenuMapper;
import com.xiliu.server.modules.system.service.XlMenuService;
import com.xiliu.server.modules.system.service.XlRoleService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * @author xiliu
 * @description
 * @date 2023/3/27
 */
@Service
public class PostServiceImpl implements PostService{

    @Resource
    private XlRoleService roleService;
    @Resource
    private XlRoleMenuMapper roleMenuMapper;
    @Resource
    private XlMenuService menuService;

    @Override
    public List<PostResultVo> getPostList(XlRole xlRole) {
        List<XlRole> list = roleService.list(new LambdaQueryWrapper<XlRole>().ne(XlRole::getRoleKey,"admin"));
        if (CollectionUtil.isNotEmpty(list)) {
            List<PostResultVo> newList = list.stream().map(
                    item -> {
                        PostResultVo vo = new PostResultVo();
                        BeanUtil.copyProperties(item,vo);
                        // 查询是否分配权限
                        List<Long> longs = menuService.selectMenuListByRoleId(item.getRoleId());
                        if (CollectionUtil.isNotEmpty(longs)) {
                            vo.setIsAuth(true);
                        } else {
                            vo.setIsAuth(false);
                        }
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    @Override
    public R addPost(PostResultVo vo) {
        // 判断是否存在
        if (isExist(vo,"zw")) {
            return R.error("职务已存在");
        }
        XlRole xlRole = new XlRole();
        xlRole.setRoleName(vo.getRoleName());
        xlRole.setDescription(vo.getDescription());
        xlRole.setRoleKey(vo.getRoleName());
        roleService.save(xlRole);
        return R.ok();
    }

    private boolean isExist(PostResultVo vo, String type) {
        if ("zw".equals(type)) {
            // 判断是否存在
            List<XlRole> xlRoles = roleService.list(new LambdaQueryWrapper<XlRole>().eq(XlRole::getRoleName,vo.getRoleName()));
            if (CollectionUtil.isNotEmpty(xlRoles)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public R updatePost(PostResultVo vo) {
        XlRole newXlRole = roleService.getById(vo.getRoleId());
        if (newXlRole != null && !vo.getRoleName().equals(newXlRole.getRoleName())) {
            if (isExist(vo,"zw")) {
                return R.error("职务已存在");
            }
        }
        newXlRole.setRoleName(vo.getRoleName());
        newXlRole.setDescription(vo.getDescription());
        roleService.updateById(newXlRole);
        return R.ok();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public R deletePost(Long[] roleIds) {
        for (Long roleId : roleIds) {
            XlRole role = roleService.getById(roleId);
            if (roleService.countUserRoleByRoleId(roleId) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", role.getRoleName()));
            }
        }
        roleService.removeByIds(Arrays.asList(roleIds));
        // 删除角色与菜单关联
        roleMenuMapper.deleteRoleMenu(roleIds);
        // 删除角色与门店关联

        return R.ok();
    }

    @Override
    public Map<String, Object> getPostMap() {
        Map<String, Object> resultMap = new HashMap<>();
        List<XlRole> list = roleService.list(new LambdaQueryWrapper<XlRole>().ne(XlRole::getRoleKey,"admin"));
        if (CollectionUtil.isNotEmpty(list)) {
            List<String> descriptions = list.stream().map(item -> item.getDescription()).collect(Collectors.toList());
            resultMap.put("descriptions", descriptions.stream().distinct().collect(Collectors.toList()));
            resultMap.put("roles",list.stream().map(item -> {
                Map<String, Object> map = new HashMap<>();
                map.put("roleId", item.getRoleId());
                map.put("roleName", item.getRoleName());
                map.put("description",item.getDescription());
                return map;
                }
            ).collect(Collectors.toList()));
        }
        return resultMap;
    }

    @Override
    public PostResultVo getPostInfo(Long roleId) {
        PostResultVo vo = new PostResultVo();
        XlRole role = roleService.getById(roleId);
        vo.setDescription(role.getDescription());
        vo.setRoleName(role.getRoleName());
        return vo;
    }

}
