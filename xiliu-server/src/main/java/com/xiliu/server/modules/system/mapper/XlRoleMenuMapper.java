package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlRoleMenu;


/**
 * <p>
 * 角色和菜单关联表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-06
 */
public interface XlRoleMenuMapper extends BaseMapper<XlRoleMenu> {

    /**
     * 通过租户ID删除角色和菜单关联
     * @param tenantId 租户ID
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteRoleMenuByTenantId(Long tenantId);

    /**
     * 通过租户ID删除角色和菜单关联
     * @param ids 租户ID
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteRoleMenuByTenantIds(Long[] ids);

    /**
     * 批量删除角色菜单关联信息
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteRoleMenu(Long[] ids);
}
