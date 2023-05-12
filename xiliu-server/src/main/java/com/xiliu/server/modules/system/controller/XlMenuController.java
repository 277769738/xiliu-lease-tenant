package com.xiliu.server.modules.system.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.result.R;

import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlMenu;
import com.xiliu.server.modules.system.service.XlMenuService;
import com.xiliu.server.modules.system.vo.SimpleMenu;
import com.xiliu.server.utils.SecurityUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author xiliu
 * @since 2022-07-03
 */
@RestController
@RequestMapping("/ucenter/menu")
public class XlMenuController {

    @Autowired
    private XlMenuService menuService;


    @ApiOperation("获取菜单列表")
    @PreAuthorize("@customSs.hasPermi('system:menu:list')")
    @GetMapping("/list")
    public R list(XlMenu menu) {
        // 获取登录人的userId;
        Long userId = SecurityUtils.getUserId();
        List<XlMenu> menus = menuService.selectMenuList(menu,userId);
        return R.ok(menus);
    }

    @ApiOperation("分页获取菜单列表")
    @GetMapping("/list-page")
    public R listPage(@RequestParam(value = "menu", required = false) XlMenu menu,
                      @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                      @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<XlMenu> pageMenu = menuService.listPage(menu,SecurityUtils.getUserId(), pageSize, pageNum);
        return R.ok(pageMenu);
    }

    @ApiOperation("添加菜单")
    @PreAuthorize("@customSs.hasPermi('system:menu:create')")
    @PostMapping("/create")
    public R create(@RequestBody XlMenu menu) {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return R.error("新增菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        } else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StrUtil.startWithAny(menu.getPath(), "http://", "https://")) {
            return R.error("新增菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        }
        boolean success = menuService.create(menu);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    @ApiOperation("修改菜单")
    @PreAuthorize("@customSs.hasPermi('system:menu:edit')")
    @PostMapping("/update/{id}")
    public R update(@PathVariable Long id, @RequestBody XlMenu menu) {
        menu.setMenuId(id);
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return R.error("修改菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        } else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StrUtil.startWithAny(menu.getPath(), "http://", "https://")) {
            return R.error("修改菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        } else if (menu.getMenuId().equals(menu.getParentId())) {
            return R.error("修改菜单'" + menu.getMenuName() + "'失败，上级菜单不能选择自己");
        }
        boolean success = menuService.updateById(menu);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation("删除菜单")
    @PreAuthorize("@customSs.hasPermi('system:menu:delete')")
    @PostMapping(value = "/delete/{id}")
    public R delete(@PathVariable("id") Long menuId) {
        if (menuService.hasChildByMenuId(menuId)) {
            return R.error("存在子菜单，不允许删除");
        }
        boolean success = menuService.delete(Arrays.asList(menuId));
        if (success) {
            return R.ok();
        }
        return R.error("删除失败");
    }

    @ApiOperation("获取菜单下拉树列表")
    @GetMapping("/treeselect")
    public R treeselect(XlMenu menu) {
        List<XlMenu> menus = menuService.selectMenuList(menu,SecurityUtils.getUserId());
        List<TreeSelect> tree = menuService.buildMenuTreeSelect(menus);
        return R.ok(tree);
    }

    @PreAuthorize("@customSs.hasPermi('system:menu:query')")
    @ApiOperation("根据菜单编号获取详细信息")
    @GetMapping(value = "/{menuId}")
    public R getInfo(@PathVariable Long menuId) {
        return R.ok(menuService.selectMenuById(menuId));
    }

    @ApiOperation("获取对应角色菜单列表树")
    @GetMapping(value = "/roleMenuTreeselect/{roleId}")
    public R roleMenuTreeselect(@PathVariable("roleId") Long roleId) {
        List<XlMenu> menus = menuService.selectMenuList(SecurityUtils.getUserId());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("checkedKeys", menuService.selectMenuListByRoleId(roleId));
        resultMap.put("menus", menuService.buildMenuTreeSelect(menus));
        return R.ok(resultMap);
    }

    @GetMapping("/list-all-simple")
    @ApiOperation(value = "获取菜单精简信息列表", notes = "只包含被开启的菜单，用于【角色分配菜单】功能的选项。" +
            "在多租户的场景下，会只返回租户所在套餐有的菜单")
    public R getSimpleMenus() {
        // 获得菜单列表，只要开启状态的
        List<SimpleMenu> menus = menuService.selectSimpleMenuList();
        return R.ok(menus);
    }
}

