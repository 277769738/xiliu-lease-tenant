package com.xiliu.server.modules.monitor.service;


import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.common.security.entity.JwtUser;
import com.xiliu.server.modules.monitor.entity.UserOnline;

/**
 * @author xiliu
 * @description
 * @date 2022/10/18
 */
public interface UserOnlineService {

    /**
     * 通过登录地址/用户名称查询信息
     * @param ipaddr 登录地址
     * @param userName 用户名称
     * @param user 用户信息
     * @return 在线用户信息
     */
    UserOnline selectOnlineByInfo(String ipaddr, String userName, LoginUser user);

    /**
     * 通过登录地址查询信息
     * @param ipaddr 登录地址
     * @param user 用户信息
     * @return 在线用户信息
     */
    UserOnline selectOnlineByIpaddr(String ipaddr, LoginUser user);

    /**
     * 通过用户名称查询信息
     * @param userName 用户名称
     * @param user 用户信息
     * @return 在线用户信息
     */
    UserOnline selectOnlineByUserName(String userName, LoginUser user);

    /**
     * 设置在线用户信息
     * @param user 用户信息
     * @return 在线用户
     */
    UserOnline setUserOnline(LoginUser user);
}
