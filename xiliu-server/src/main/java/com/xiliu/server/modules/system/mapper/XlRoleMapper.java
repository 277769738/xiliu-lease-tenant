package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlRole;


import java.util.List;


/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-01
 */
public interface XlRoleMapper extends BaseMapper<XlRole> {

    /**
     * 通过角色ID查询角色
     * @param roleId 角色ID
     * @return 角色对象信息
     */
     XlRole selectRoleById(Long roleId);

    /**
     * 校验角色名称是否唯一
     * @param roleName 角色名称
     * @return 角色信息
     */
    XlRole checkRoleNameUnique(String roleName);

    /**
     * 校验角色权限是否唯一
     * @param roleKey 角色权限
     * @return 角色信息
     */
    XlRole checkRoleKeyUnique(String roleKey);

    /**
     * 根据用户ID查询角色
     * @param userId 用户ID
     * @return 角色列表
     */
     List<XlRole> selectRolePermissionByUserId(Long userId);

    /**
     * 根据条件分页查询角色数据
     * @param role 角色信息
     * @return 角色数据集合信息
     */
     List<XlRole> selectRoleList(XlRole role);

    /**
     * 根据租户ID查询默认管理员角色
     * @param tenantId 租户ID
     * @return 角色
     */
    @InterceptorIgnore(tenantLine = "1")
    List<XlRole> queryAdminRole(Long tenantId);

    /**
     * 批量删除角色信息-根据租户
     * @param ids 需要删除的租户id
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteRoleByTenantId(Long[] ids);

    /**
     * 通过角色ID查询角色使用数量
     * @param roleId 角色ID
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int countUserRoleByRoleId(Long roleId);

    /**
     * 根据userID查询默认管理员角色
     * @param userId 用户ID
     * @return 角色
     */
    List<XlRole> queryAdminRoleByUserId(Long userId);
}
