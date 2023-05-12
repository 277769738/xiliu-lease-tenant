package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.entity.XlUserRole;


import java.util.List;
import java.util.Set;


/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-01
 */
public interface XlRoleService extends IService<XlRole> {

    /**
     * 校验角色名称是否唯一
     * @param role 角色信息
     * @return 结果
     */
    String checkRoleNameUnique(XlRole role);

    /**
     * 校验角色权限是否唯一
     * @param role 角色信息
     * @return 结果
     */
    String checkRoleKeyUnique(XlRole role);

    /**
     * 添加角色
     * @param role
     * @return boolean
     **/
    boolean create(XlRole role);

    /**
     * 修改角色
     * @param role
     * @return boolean
     **/
    boolean updateRole(XlRole role);

    /**
     * 通过角色ID查询角色使用数量
     * @param roleId 角色ID
     * @return 结果
     */
    int countUserRoleByRoleId(Long roleId);
    /**
     * 批量删除角色
     * @param roleIds
     * @return boolean
     **/
    boolean delete(Long[] roleIds);

    /**
     * 分页获取角色列表
     * @param keyword
     * @param pageSize
     * @param pageNum
     * @return Page
     **/
    Page<XlRole> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * 分配菜单权限信息
     * @param role 角色信息
     * @return 结果
     */
    boolean authRoleMenu(XlRole role);

    /**
     * 根据用户ID查询角色权限
     * @param userId 用户ID
     * @return 权限列表
     */
    Set<String> selectRolePermissionByUserId(Long userId);

    /**
     * 根据条件分页查询角色数据
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    List<XlRole> selectRoleList(XlRole role);

    /**
     * 校验角色是否允许操作
     * @param role 角色信息
     */
    void checkRoleAllowed(XlRole role);

    /**
     * 校验角色是否有数据权限
     * @param roleId 角色id
     */
    void checkRoleDataScope(Long roleId);

    /**
     * 修改数据权限信息
     * @param role 角色信息
     * @return 结果
     */
    int authDataScope(XlRole role);

    /**
     * 取消授权用户角色
     *
     * @param userRole 用户和角色关联信息
     * @return 结果
     */
    int deleteAuthUser(XlUserRole userRole);

    /**
     * 批量取消授权用户角色
     *
     * @param roleId 角色ID
     * @param userIds 需要取消授权的用户数据ID
     * @return 结果
     */
    int deleteAuthUsers(Long roleId, Long[] userIds);

    /**
     * 批量选择授权用户角色
     *
     * @param roleId 角色ID
     * @param userIds 需要删除的用户数据ID
     * @return 结果
     */
    int insertAuthUsers(Long roleId, Long[] userIds);

    /**
     * 校验用户是否是管理员角色
     * @param userId 用户ID
     * @return 结果
     */
    boolean checkAdminRoleByUserId(Long userId);
}
