package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlDept;


import java.util.List;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-12
 */
public interface XlDeptService extends IService<XlDept> {

    /**
     * 查询部门管理数据
     * @param dept 部门信息
     * @return 部门信息集合
     */
    List<XlDept> selectDeptList(XlDept dept);

    /**
     * 校验部门名称是否唯一
     * @param dept 部门信息
     * @return 结果
     */
    String checkDeptNameUnique(XlDept dept);

    /**
     * 添加部门
     * @param dept
     * @return boolean
     **/
    boolean create(XlDept dept);

    /**
     * 修改部门
     * @param dept
     * @return boolean
     **/
    boolean update(XlDept dept);

    /**
     * 批量删除部门
     * @param ids
     * @return boolean
     **/
    boolean delete(List<Long> ids);

    /**
     * 是否存在部门子节点
     * @param deptId 部门ID
     * @return 结果
     */
    boolean hasChildByDeptId(Long deptId);

    /**
     * 构建前端所需要树结构
     * @param depts 部门列表
     * @return 树结构列表
     */
    List<TreeSelect> buildDeptTreeSelect(List<XlDept> depts);

    /**
     * 根据角色ID查询部门树信息
     * @param roleId 角色ID
     * @return 选中部门列表
     */
    List<Long> selectDeptListByRoleId(Long roleId);

    /**
     * 查询部门树结构信息
     * @param dept 部门信息
     * @return 部门树信息集合
     */
    List<TreeSelect> selectDeptTreeList(XlDept dept);
}
