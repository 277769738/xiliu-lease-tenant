package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlRoleDept;

import java.util.List;


/**
 * <p>
 * 角色和部门关联表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-06
 */
public interface XlRoleDeptMapper extends BaseMapper<XlRoleDept> {

    /**
     * 通过租户ID删除角色和部门关联
     * @param tenantId 租户ID
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteRoleDeptByTenantId(Long tenantId);

    /**
     * 通过角色ID删除角色和部门关联
     * @param roleId 角色ID
     * @return 结果
     */
    int deleteRoleDeptByRoleId(Long roleId);

    /**
     * 批量新增角色部门信息
     * @param roleDeptList 角色部门列表
     * @return 结果
     */
    int batchRoleDept(List<XlRoleDept> roleDeptList);

    /**
     * 批量删除角色部门关联信息
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteRoleDept(Long[] ids);
}
