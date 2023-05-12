package com.xiliu.server.modules.system.service;



import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.modules.system.entity.XlUser;

import java.util.Set;

/**
 * @author xiliu
 * @description
 * @date 2022/7/6
 */
public interface LoginService {

    /**
     * 登录功能
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username, String password);

    /**
     * 获取菜单数据权限
     * @param user 用户信息
     * @return 菜单权限信息
     */
    Set<String> getMenuPermission(XlUser user);

    /**
     * 获取角色数据权限
     * @param user 用户信息
     * @return 角色权限信息
     */
    Set<String> getRolePermission(XlUser user);

    /**
     * 登录功能
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    LoginUser newLogin(String username, String password);

    /**
     * 新登录功能，增加租户相关
     * @param userName 用户名
     * @return 获取信息
     */
    LoginUser getLoginUserInfo(String userName);
}
