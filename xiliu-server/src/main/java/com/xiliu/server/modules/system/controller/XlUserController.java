package com.xiliu.server.modules.system.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.file.CosClientUtils;

import com.xiliu.server.common.component.JwtToken;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.common.security.entity.JwtUser;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.service.XlRoleService;
import com.xiliu.server.modules.system.service.XlUserService;
import com.xiliu.server.modules.system.vo.UserQueryVo;
import com.xiliu.server.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author xiliu
 * @since 2021-09-03
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/ucenter/user")
public class XlUserController {

    @Autowired
    private XlUserService userService;
    @Autowired
    private XlRoleService roleService;
    @Autowired
    private JwtToken tokenService;

    @ApiOperation(value = "注册用户")
    @PostMapping(value = "register")
    public R register(@RequestBody XlUser user) {
        XlUser xlUser = userService.register(user);
        if (xlUser == null) {
            return R.error("注册失败,用户名已存在");
        }
        return R.ok(xlUser);
    }

    @ApiOperation(value = "分页用户列表")
    @GetMapping(value = "/list-page")
    public R listPage(UserQueryVo queryVo) {
        Page<XlUser> page = userService.listMemberPage(queryVo);
        return R.ok(page);
    }

    @ApiOperation(value = "添加用户")
    @PostMapping(value = "add")
    public R add(@RequestBody XlUser user) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserCode()))){
            return R.error("新增用户'" + user.getUserCode() + "'失败，登录账号已存在");
        }
        boolean success = userService.create(user);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    @ApiOperation(value = "修改用户")
    @PostMapping(value = "/update/{id}")
    public R update(@PathVariable("id") Long id,@RequestBody XlUser user) {
        user.setUserId(id);
        Boolean flag = userService.update(user);
        if (flag) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation(value = "删除用户")
    @PostMapping(value = "/delete/{id}")
    public R delete(@PathVariable("id") Long id) {
        Boolean flag = userService.delete(Arrays.asList(id));
        if (flag) {
            return R.ok();
        }
        return R.error();
    }

    @ApiOperation(value = "登出功能")
    @PostMapping(value = "logout")
    public R logout() {
        return R.ok();
    }

    @ApiOperation(value = "根据用户id获取详细信息")
    @GetMapping(value = { "/", "/{userId}" })
    public R getInfo(@PathVariable(value = "userId", required = false) Long userId) {
        Map<String,Object> map = new HashMap<>();
        List<XlRole> roles = roleService.selectRoleList(new XlRole());
        map.put("roles",XlUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        if (userId != null) {
            XlUser user = userService.selectUserById(userId);
            map.put("roleIds",user.getRoles().stream().map(XlRole::getRoleId).collect(Collectors.toList()));
            map.put("user",user);
        }
        return R.ok(map);
    }

    @ApiOperation(value = "获取个人信息")
    @GetMapping(value = "/profile")
    public R getProfile() {
        Map<String,Object> map = new HashMap<>();
        XlUser loginUser = userService.selectUserById(SecurityUtils.getUserId());
        map.put("user",loginUser);
        map.put("roleGroup", userService.selectUserRoleGroup(loginUser.getUserId()));
        return R.ok(map);
    }

    @ApiOperation(value = "用户头像上传")
    @Log(title = "用户头像上传", businessType = BusinessType.UPDATE)
    @PostMapping("/profile/avatar")
    public R uploadAvatar(@RequestParam("avatarfile") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String avatar = CosClientUtils.upload(file, "avatar");
            if (userService.updateUserAvatar(SecurityUtils.getUserId(), avatar)) {
                // 更新缓存用户头像
                LoginUser loginUser = SecurityUtils.getLoginUser();
                loginUser.getUser().setAvatar(avatar);
                tokenService.refreshToken(loginUser);
                return R.ok(avatar);
            }
        }
        return R.error("上传头像异常，请联系管理员");
    }
}

