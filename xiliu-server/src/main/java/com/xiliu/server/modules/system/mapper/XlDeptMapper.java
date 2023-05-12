package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.xiliu.server.modules.system.entity.XlDept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-12
 */
public interface XlDeptMapper extends BaseMapper<XlDept> {

    /**
     * 查询部门管理数据
     * @param dept 部门信息
     * @return 部门信息集合
     */
    List<XlDept> selectDeptList(@Param(value = "dept") XlDept dept);

    /**
     * 根据ID查询所有子部门
     * @param deptId 部门ID
     * @return 部门列表
     */
    List<XlDept> selectChildrenDeptById(Long deptId);

    /**
     * 删除部门信息-根据租户ID
     * @param ids 租户id
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteDeptByTenantId(Long[] ids);

    /**
     * 根据角色ID查询部门树信息
     * @param roleId 角色ID
     * @param deptCheckStrictly 部门树选择项是否关联显示
     * @return 选中部门列表
     */
    List<Long> selectDeptListByRoleId(@Param("roleId") Long roleId, @Param("deptCheckStrictly") boolean deptCheckStrictly);
}
