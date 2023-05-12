package com.xiliu.server.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.common.annotation.DataScope;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.utils.SpringUtils;
import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlDept;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.mapper.XlDeptMapper;
import com.xiliu.server.modules.system.mapper.XlRoleMapper;
import com.xiliu.server.modules.system.service.XlDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 部门表 服务实现类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-12
 */
@Service
public class XlDeptServiceImpl extends ServiceImpl<XlDeptMapper, XlDept> implements XlDeptService {

    @Autowired
    private XlRoleMapper roleMapper;

    @Override
    @DataScope(deptAlias = "d")
    public List<XlDept> selectDeptList(XlDept dept) {
        return baseMapper.selectDeptList(dept);
    }

    @Override
    public String checkDeptNameUnique(XlDept dept) {
        Long deptId = dept.getDeptId() == null ? -1L : dept.getDeptId();
        List<XlDept> infos = list(new LambdaQueryWrapper<XlDept>()
                .eq(XlDept::getDeptName,dept.getDeptName())
                .eq(XlDept::getParentId,dept.getParentId()));
        // 查出有数据 并且不是自己，则不唯一
        if (CollectionUtil.isNotEmpty(infos) && infos.get(0).getDeptId().longValue() != deptId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    public boolean create(XlDept dept) {
        XlDept info = getById(dept.getParentId());
        // 若父节点不为正常状态,则不允许新增子节点
        if (!UserConstants.DEPT_NORMAL.equals(String.valueOf(info.getStatus()))) {
            throw new RuntimeException("部门停用，不允许新增");
        }
        dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
        dept.setDeptLevel(info.getDeptLevel() == null ? 0 : info.getDeptLevel() + 1);
        return save(dept);
    }

    @Override
    public boolean update(XlDept dept) {
        // 新的上级部门
        XlDept newParentDept = getById(dept.getParentId());
        // 当前部门
        XlDept oldDept = getById(dept.getDeptId());
        if (newParentDept != null && oldDept != null) {
            String newAncestors = newParentDept.getAncestors() + "," + newParentDept.getDeptId();
            String oldAncestors = oldDept.getAncestors();
            dept.setAncestors(newAncestors);
            updateDeptChildren(dept.getDeptId(), newAncestors, oldAncestors);
        }
        return updateById(dept);
    }

    @Override
    public boolean delete(List<Long> ids) {
        return removeBatchByIds(ids);
    }

    @Override
    public boolean hasChildByDeptId(Long deptId) {
        List<XlDept> list = baseMapper.selectList(new LambdaQueryWrapper<XlDept>().eq(XlDept::getParentId,deptId));
        if (CollectionUtil.isNotEmpty(list)) {
            return true;
        }
        return false;
    }

    @Override
    public List<TreeSelect> buildDeptTreeSelect(List<XlDept> depts) {
        List<XlDept> deptList = buildDeptTree(depts);
        //转换成树结构的list
        return deptList.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public List<XlDept> buildDeptTree(List<XlDept> depts) {
        List<XlDept> returnList = new ArrayList<>();
        // 所有部门id
        List<Long> tempList = new ArrayList<>();
        for (XlDept dept : depts) {
            tempList.add(dept.getDeptId());
        }
        for (XlDept dept : depts) {
            // 如若是顶级节点，遍历该父节点下的所有子节点
            if (!tempList.contains(dept.getParentId())) {
                recursionFn(depts, dept);
                returnList.add(dept);
            }
        }
        if (CollectionUtil.isEmpty(returnList)) {
            returnList = depts;
        }
        return returnList;
    }

    /**
     * 修改子元素关系
     * @param deptId 被修改的部门ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateDeptChildren(Long deptId, String newAncestors, String oldAncestors) {
        List<XlDept> childrens = baseMapper.selectChildrenDeptById(deptId);
        if (CollectionUtil.isNotEmpty(childrens)) {
            for (XlDept child : childrens) {
                child.setAncestors(child.getAncestors().replaceFirst(oldAncestors,newAncestors));
                updateById(child);
            }
        }
    }
    /**
     * 递归列表
     */
    private void recursionFn(List<XlDept> list, XlDept t) {
        List<XlDept> childList = getChildList(list,t);
        t.setChildren(childList);
        for (XlDept tChild : childList) {
            if (hasChild(list,tChild)) {
                recursionFn(list, tChild);
            }
        }
    }
    /**
     * 得到子节点列表
     */
    private List<XlDept> getChildList(List<XlDept> list, XlDept t) {
        List<XlDept> tList = new ArrayList<>();
        Iterator<XlDept> it = list.iterator();
        while (it.hasNext()) {
            XlDept n = it.next();
            if (n.getParentId() != null && n.getParentId().longValue() == t.getDeptId().longValue()) {
                tList.add(n);
            }
        }
        return tList;
    }
    /**
     * 判断是否还有子节点
     */
    private boolean hasChild(List<XlDept> list, XlDept t) {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 根据角色ID查询部门树信息
     * @param roleId 角色ID
     * @return 选中部门列表
     */
    @Override
    public List<Long> selectDeptListByRoleId(Long roleId) {
        XlRole role = roleMapper.selectRoleById(roleId);
        return baseMapper.selectDeptListByRoleId(roleId, role.isDeptCheckStrictly());
    }

    /**
     * 查询部门树结构信息
     *
     * @param dept 部门信息
     * @return 部门树信息集合
     */
    @Override
    public List<TreeSelect> selectDeptTreeList(XlDept dept) {
        List<XlDept> depts = this.selectDeptList(dept);
        return buildDeptTreeSelect(depts);
    }
}
