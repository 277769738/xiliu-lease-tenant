package com.xiliu.server.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.utils.SpringUtils;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.common.exception.ServiceException;
import com.xiliu.server.modules.system.entity.*;
import com.xiliu.server.modules.system.mapper.XlRoleDeptMapper;
import com.xiliu.server.modules.system.mapper.XlRoleMapper;
import com.xiliu.server.modules.system.mapper.XlRoleMenuMapper;
import com.xiliu.server.modules.system.mapper.XlUserRoleMapper;
import com.xiliu.server.modules.system.service.XlRoleMenuService;
import com.xiliu.server.modules.system.service.XlRoleService;
import com.xiliu.server.modules.system.service.XlUserRoleService;
import com.xiliu.server.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-01
 */
@Service
public class XlRoleServiceImpl extends ServiceImpl<XlRoleMapper, XlRole> implements XlRoleService {

    @Autowired
    private XlRoleMenuService roleMenuService;
    @Autowired
    private XlRoleDeptMapper roleDeptMapper;
    @Autowired
    private XlRoleMenuMapper roleMenuMapper;
    @Autowired
    private XlUserRoleService userRoleService;
    @Autowired
    private XlUserRoleMapper userRoleMapper;

    /**
     * 校验角色名称是否唯一
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public String checkRoleNameUnique(XlRole role) {
        Long roleId = StringUtils.isNull(role.getRoleId()) ? -1L : role.getRoleId();
        XlRole info = baseMapper.checkRoleNameUnique(role.getRoleName());
        if (StringUtils.isNotNull(info) && info.getRoleId().longValue() != roleId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验角色权限是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public String checkRoleKeyUnique(XlRole role) {
        Long roleId = StringUtils.isNull(role.getRoleId()) ? -1L : role.getRoleId();
        XlRole info = baseMapper.checkRoleKeyUnique(role.getRoleKey());
        if (StringUtils.isNotNull(info) && info.getRoleId().longValue() != roleId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean create(XlRole role) {
        // 先新增角色
        save(role);
        return insertRoleMenu(role);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateRole(XlRole role) {
        // 先修改角色
        updateById(role);
        // 再删除角色菜单信息
        roleMenuService.remove(new LambdaQueryWrapper<XlRoleMenu>().eq(XlRoleMenu::getRoleId,role.getRoleId()));
        // 再新增
        return insertRoleMenu(role);
    }
    @Override
    public int countUserRoleByRoleId(Long roleId) {
        return baseMapper.countUserRoleByRoleId(roleId);
    }
    @Override
    public boolean delete(Long[] roleIds) {
        for (Long roleId : roleIds) {
            checkRoleAllowed(new XlRole(roleId));
            checkRoleDataScope(roleId);
            XlRole role = getById(roleId);
            if (countUserRoleByRoleId(roleId) > 0) {
                throw new ServiceException(String.format("%1$s已分配,不能删除", role.getRoleName()));
            }
        }
        // 删除角色与菜单关联
        roleMenuMapper.deleteRoleMenu(roleIds);
        // 删除角色与部门关联
        roleDeptMapper.deleteRoleDept(roleIds);
        return removeByIds(Arrays.asList(roleIds));
    }

    @Override
    public Page<XlRole> list(String keyword, Integer pageSize, Integer pageNum) {
        Page<XlRole> page = new Page<>(pageNum,pageSize);
        LambdaQueryWrapper<XlRole> wrapper = new LambdaQueryWrapper<XlRole>();
        if (StrUtil.isNotBlank(keyword)) {
            wrapper.like(XlRole::getRoleName, keyword);
        }
        return page(page,wrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean authRoleMenu(XlRole role) {
        // 先删除
        roleMenuService.remove(new LambdaQueryWrapper<XlRoleMenu>().eq(XlRoleMenu::getRoleId,role.getRoleId()));
        // 在新增
        return insertRoleMenu(role);
    }

    @Override
    public Set<String> selectRolePermissionByUserId(Long userId) {
        List<XlRole> list = baseMapper.selectRolePermissionByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        if (CollectionUtil.isNotEmpty(list)) {
            for (XlRole role : list) {
                permsSet.addAll(Arrays.asList(role.getRoleKey().trim().split(",")));
            }
        }
        return permsSet;
    }

    @Override
    public List<XlRole> selectRoleList(XlRole role) {
        return baseMapper.selectRoleList(role);
    }

    /**
     * 新增角色菜单信息
     * @param role 角色对象
     */
    public boolean insertRoleMenu(XlRole role) {
        // 新增角色与菜单管理
        List<XlRoleMenu> list = new ArrayList<XlRoleMenu>();
        for (Long menuId : role.getMenuIds()) {
            XlRoleMenu rm = new XlRoleMenu();
            rm.setRoleId(role.getRoleId());
            rm.setMenuId(menuId);
            list.add(rm);
        }
        if (list.size() > 0) {
            return roleMenuService.saveBatch(list);
        }
        return true;
    }

    /**
     * 校验角色是否允许操作
     * @param role 角色信息
     */
    @Override
    public void checkRoleAllowed(XlRole role) {
        if (StringUtils.isNotNull(role.getRoleId()) && role.isAdmin()) {
            throw new ServiceException("不允许操作超级管理员角色");
        }
    }

    /**
     * 校验角色是否有数据权限
     * @param roleId 角色id
     */
    @Override
    public void checkRoleDataScope(Long roleId) {
        if (!XlUser.isAdmin(SecurityUtils.getUserId())) {
            XlRole role = new XlRole();
            role.setRoleId(roleId);
            List<XlRole> roles = this.selectRoleList(role);
            if (CollectionUtil.isEmpty(roles)) {
                throw new ServiceException("没有权限访问角色数据！");
            }
        }
    }

    /**
     * 修改数据权限信息
     * @param role 角色信息
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int authDataScope(XlRole role) {
        // 修改角色信息
        this.updateById(role);
        // 删除角色与部门关联
        roleDeptMapper.deleteRoleDeptByRoleId(role.getRoleId());
        // 新增角色和部门信息（数据权限）
        return insertRoleDept(role);
    }
    /**
     * 新增角色部门信息(数据权限)
     * @param role 角色对象
     */
    public int insertRoleDept(XlRole role) {
        int rows = 1;
        // 新增角色与部门（数据权限）管理
        List<XlRoleDept> list = new ArrayList<XlRoleDept>();
        for (Long deptId : role.getDeptIds()) {
            XlRoleDept rd = new XlRoleDept();
            rd.setRoleId(role.getRoleId());
            rd.setDeptId(deptId);
            list.add(rd);
        }
        if (list.size() > 0) {
            rows = roleDeptMapper.batchRoleDept(list);
        }
        return rows;
    }

    /**
     * 取消授权用户角色
     * @param userRole 用户和角色关联信息
     * @return 结果
     */
    @Override
    public int deleteAuthUser(XlUserRole userRole) {
        return userRoleMapper.deleteUserRoleInfo(userRole);
    }

    /**
     * 批量取消授权用户角色
     * @param roleId 角色ID
     * @param userIds 需要取消授权的用户数据ID
     * @return 结果
     */
    @Override
    public int deleteAuthUsers(Long roleId, Long[] userIds) {
        return userRoleMapper.deleteUserRoleInfos(roleId, userIds);
    }

    /**
     * 批量选择授权用户角色
     *
     * @param roleId 角色ID
     * @param userIds 需要授权的用户数据ID
     * @return 结果
     */
    @Override
    public int insertAuthUsers(Long roleId, Long[] userIds) {
        // 新增用户与角色管理
        List<XlUserRole> list = new ArrayList<XlUserRole>();
        for (Long userId : userIds) {
            XlUserRole ur = new XlUserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        return userRoleService.saveBatch(list) ? 1 : 0;
    }

    @Override
    public boolean checkAdminRoleByUserId(Long userId) {
        List<XlRole> xlRoles = baseMapper.queryAdminRoleByUserId(userId);
        if (CollectionUtil.isNotEmpty(xlRoles)) {
            return true;
        }
        return false;
    }
}
