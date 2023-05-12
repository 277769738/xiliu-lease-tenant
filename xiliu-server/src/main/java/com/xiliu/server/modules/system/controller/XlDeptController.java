package com.xiliu.server.modules.system.controller;



import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.result.R;
import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlDept;
import com.xiliu.server.modules.system.service.XlDeptService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 部门表 前端控制器
 * </p>
 *
 * @author xiliu
 * @since 2022-07-12
 */
@RestController
@RequestMapping("/ucenter/dept")
public class XlDeptController {

    @Autowired
    private XlDeptService deptService;

    @ApiOperation("获取部门列表")
    @PreAuthorize("@customSs.hasPermi('system:dept:list')")
    @GetMapping("/list")
    public R list(XlDept dept) {
        List<XlDept> depts = deptService.selectDeptList(dept);
        return R.ok(depts);
    }

    @ApiOperation("添加部门")
    @PreAuthorize("@customSs.hasPermi('system:dept:create')")
    @PostMapping("/create")
    public R creat(@RequestBody XlDept dept) {
        if (UserConstants.NOT_UNIQUE.equals(deptService.checkDeptNameUnique(dept))) {
            return R.error("新增部门'" + dept.getDeptName() + "'失败，部门名称已存在");
        }
        boolean success = deptService.create(dept);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    @ApiOperation("修改部门")
    @PreAuthorize("@customSs.hasPermi('system:dept:edit')")
    @PostMapping("/update/{id}")
    public R update(@PathVariable Long id,@RequestBody XlDept dept) {
        dept.setDeptId(id);
        if (UserConstants.NOT_UNIQUE.equals(deptService.checkDeptNameUnique(dept))) {
            return R.error("修改部门'" + dept.getDeptName() + "'失败，部门名称已存在");
        } else if (dept.getParentId().equals(id)) {
            return R.error("修改部门'" + dept.getDeptName() + "'失败，上级部门不能是自己");
        }
        boolean success = deptService.update(dept);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation("删除部门")
    @PreAuthorize("@customSs.hasPermi('system:dept:delete')")
    @PostMapping(value = "/delete/{id}")
    public R delete(@PathVariable("id") Long deptId) {
        if (deptService.hasChildByDeptId(deptId)) {
            return R.error("存在下级部门,不允许删除");
        }
        boolean success = deptService.delete(Arrays.asList(deptId));
        if (success) {
            return R.ok();
        }
        return R.error("删除失败");
    }

    @ApiOperation("获取部门下拉树列表")
    @GetMapping("/treeselect")
    public R treeselect(XlDept dept) {
        List<XlDept> list = deptService.selectDeptList(dept);
        List<TreeSelect> treeList = deptService.buildDeptTreeSelect(list);
        return R.ok(treeList);
    }

    @ApiOperation("根据id获取详细信息")
    @GetMapping(value = "/{deptId}")
    public R getInfo(@PathVariable Long deptId) {
        return R.ok(deptService.getById(deptId));
    }

}

