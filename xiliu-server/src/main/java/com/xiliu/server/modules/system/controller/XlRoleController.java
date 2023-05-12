package com.xiliu.server.modules.system.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.system.entity.XlDept;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.entity.XlUserRole;
import com.xiliu.server.modules.system.service.XlDeptService;
import com.xiliu.server.modules.system.service.XlRoleService;
import com.xiliu.server.modules.system.service.XlUserService;
import com.xiliu.server.modules.system.vo.RoleUserResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author xiliu
 * @since 2022-07-01
 */
@Api(tags = "角色管理")
@RestController
@RequestMapping("/ucenter/role")
public class XlRoleController extends BaseController{

    @Autowired
    private XlRoleService roleService;
    @Autowired
    private XlDeptService deptService;
    @Autowired
    private XlUserService userService;

    @ApiOperation("添加角色")
    @PreAuthorize("@customSs.hasPermi('system:role:create')")
    @PostMapping("/create")
    public R create(@RequestBody XlRole role) {
        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
            return R.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
            return R.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        boolean success = roleService.create(role);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    @ApiOperation("修改角色")
    @PreAuthorize("@customSs.hasPermi('system:role:edit')")
    @PostMapping("/update/{id}")
    public R update(@PathVariable Long id, @RequestBody XlRole role) {
        role.setRoleId(id);
        roleService.checkRoleAllowed(role);
        roleService.checkRoleDataScope(role.getRoleId());
        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
            return R.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
            return R.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        boolean success = roleService.updateById(role);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation("批量删除角色")
    @PreAuthorize("@customSs.hasPermi('system:role:remove')")
    @DeleteMapping("/{roleIds}")
    public R delete(@PathVariable Long[] roleIds) {
        boolean success = roleService.delete(roleIds);
        if (success) {
            return R.ok();
        }
        return R.error("删除失败");
    }

    @ApiOperation("获取所有角色")
    @GetMapping("/list-all")
    public R listAll() {
        List<XlRole> list = roleService.list();
        return R.ok(list);
    }

    @ApiOperation("根据角色名称分页获取角色列表")
    @GetMapping("/list-page")
    public R listPage(@RequestParam(value = "keyword", required = false) String keyword,
                      @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                      @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<XlRole> rolePage = roleService.list(keyword, pageSize, pageNum);
        return R.ok(rolePage);
    }

    @ApiOperation("修改角色状态")
    @PreAuthorize("@customSs.hasPermi('system:role:edit')")
    @PostMapping("/update-status/{id}")
    public R updateStatus(@PathVariable Long id, @RequestParam(value = "status") Integer status) {
        XlRole role = new XlRole();
        role.setRoleId(id);
        role.setStatus(status);
        boolean success = roleService.updateById(role);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation("分配菜单权限")
    @PreAuthorize("@customSs.hasPermi('system:role:auth')")
    @PostMapping("/auth-role-menu")
    public R authRoleMenu(@RequestBody XlRole role) {
        boolean success = roleService.authRoleMenu(role);
        if (success) {
            return R.ok();
        }
        return R.error("分配失败");
    }
    /**
     * 根据角色编号获取详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:role:query')")
    @GetMapping(value = "/{roleId}")
    public R getInfo(@PathVariable Long roleId) {
        roleService.checkRoleDataScope(roleId);
        return R.ok(roleService.getById(roleId));
    }
    /**
     * 获取对应角色部门树列表
     */
    @ApiOperation("获取对应角色部门树列表")
    @PreAuthorize("@customSs.hasPermi('system:role:query')")
    @GetMapping(value = "/deptTree/{roleId}")
    public R deptTree(@PathVariable("roleId") Long roleId) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("checkedKeys", deptService.selectDeptListByRoleId(roleId));
        resultMap.put("depts", deptService.selectDeptTreeList(new XlDept()));
        return R.ok(resultMap);
    }

    /**
     * 修改保存数据权限
     */
    @ApiOperation("修改保存数据权限")
    @PreAuthorize("@customSs.hasPermi('system:role:query')")
    @Log(title = "角色管理-保存数据权限", businessType = BusinessType.UPDATE)
    @PostMapping("/dataScope")
    public R dataScope(@RequestBody XlRole role) {
        roleService.checkRoleAllowed(role);
        roleService.checkRoleDataScope(role.getRoleId());
        return R.ok(roleService.authDataScope(role));
    }

    /**
     * 查询已分配用户角色列表
     */
    @ApiOperation("查询已分配用户角色列表")
    @PreAuthorize("@customSs.hasPermi('system:role:list')")
    @GetMapping("/authUser/allocatedList")
    public TableDataInfo allocatedList(XlUser user) {
        startPage();
        List<RoleUserResultVo> list = userService.selectAllocatedList(user);
        return getDataTable(list);
    }

    /**
     * 查询未分配用户角色列表
     */
    @ApiOperation("查询未分配用户角色列表")
    @PreAuthorize("@customSs.hasPermi('system:role:list')")
    @GetMapping("/authUser/unallocatedList")
    public TableDataInfo unallocatedList(XlUser user) {
        startPage();
        List<RoleUserResultVo> list = userService.selectUnallocatedList(user);
        return getDataTable(list);
    }

    /**
     * 取消授权用户
     */
    @ApiOperation("取消授权用户")
    @PreAuthorize("@customSs.hasPermi('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.GRANT)
    @PutMapping("/authUser/cancel")
    public R cancelAuthUser(@RequestBody XlUserRole userRole) {
        return R.ok(roleService.deleteAuthUser(userRole));
    }

    /**
     * 批量取消授权用户
     */
    @ApiOperation("批量取消授权用户")
    @PreAuthorize("@customSs.hasPermi('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.GRANT)
    @PutMapping("/authUser/cancelAll")
    public R cancelAuthUserAll(Long roleId, Long[] userIds) {
        return R.ok(roleService.deleteAuthUsers(roleId, userIds));
    }

    /**
     * 批量选择用户授权
     */
    @ApiOperation("批量选择用户授权")
    @PreAuthorize("@customSs.hasPermi('system:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.GRANT)
    @PutMapping("/authUser/selectAll")
    public R selectAuthUserAll(Long roleId, Long[] userIds) {
        roleService.checkRoleDataScope(roleId);
        return R.ok(roleService.insertAuthUsers(roleId, userIds));
    }
}

 