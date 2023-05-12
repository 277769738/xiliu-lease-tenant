package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlUserRole;
import org.apache.ibatis.annotations.Param;


/**
 * <p>
 * 用户角色关联表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-08
 */
public interface XlUserRoleMapper extends BaseMapper<XlUserRole> {

    /**
     * 批量删除用户和角色关联-根据租户
     * @param ids 需要删除的用户租户id
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteUserRoleByTenantId(Long[] ids);

    /**
     * 删除用户和角色关联信息
     * @param userRole 用户和角色关联信息
     * @return 结果
     */
    int deleteUserRoleInfo(XlUserRole userRole);

    /**
     * 批量取消授权用户角色
     * @param roleId 角色ID
     * @param userIds 需要删除的用户数据ID
     * @return 结果
     */
    int deleteUserRoleInfos(@Param("roleId") Long roleId, @Param("userIds") Long[] userIds);
}
