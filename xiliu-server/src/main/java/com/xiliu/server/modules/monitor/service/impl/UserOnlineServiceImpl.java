package com.xiliu.server.modules.monitor.service.impl;


import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.common.security.entity.JwtUser;
import com.xiliu.server.modules.monitor.entity.UserOnline;
import com.xiliu.server.modules.monitor.service.UserOnlineService;
import org.springframework.stereotype.Service;

/**
 * @author xiliu
 * @description
 * @date 2022/10/18
 */
@Service
public class UserOnlineServiceImpl implements UserOnlineService {

    @Override
    public UserOnline selectOnlineByInfo(String ipaddr, String userName, LoginUser user) {
        if (StringUtils.equals(ipaddr, user.getIpaddr()) && StringUtils.equals(userName, user.getUsername())) {
            return setUserOnline(user);
        }
        return null;
    }

    @Override
    public UserOnline selectOnlineByIpaddr(String ipaddr, LoginUser user) {
        if (StringUtils.equals(ipaddr, user.getIpaddr())) {
            return setUserOnline(user);
        }
        return null;
    }

    @Override
    public UserOnline selectOnlineByUserName(String userName, LoginUser user) {
        if (StringUtils.equals(userName, user.getUsername())) {
            return setUserOnline(user);
        }
        return null;
    }

    @Override
    public UserOnline setUserOnline(LoginUser user) {
        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUser())) {
            return null;
        }
        UserOnline userOnline = new UserOnline();
        userOnline.setTokenId(user.getToken());
        userOnline.setUserName(user.getUsername());
        userOnline.setIpaddr(user.getIpaddr());
        userOnline.setLoginLocation(user.getLoginLocation());
        userOnline.setBrowser(user.getBrowser());
        userOnline.setOs(user.getOs());
        userOnline.setLoginTime(user.getLoginTime());
        if (StringUtils.isNotNull(user.getUser().getDept())) {
            userOnline.setDeptName(user.getUser().getDept().getDeptName());
        }
        return userOnline;
    }
}
