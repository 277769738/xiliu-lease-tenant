package com.xiliu.server.common.security.handler;

import com.alibaba.fastjson2.JSON;

import com.xiliu.common.constant.Constants;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.ServletUtils;
import com.xiliu.server.common.component.JwtToken;
import com.xiliu.server.common.security.entity.JwtUser;
import com.xiliu.server.manager.AsyncManager;
import com.xiliu.server.manager.factory.AsyncFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xiliu
 * @description 自定义退出处理类 返回成功
 * @date 2022/7/8
 */
@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler{

    @Autowired
    private JwtToken jwtToken;

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        JwtUser jwtUser = jwtToken.getLoginUser(httpServletRequest);
        if (null != jwtUser) {
            // 删除用户缓存记录
            jwtToken.removeJwtUser(jwtUser.getToken());
            // 记录用户退出日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(jwtUser.getUsername(), Constants.LOGOUT, "退出成功"));
        }
        ServletUtils.renderString(httpServletResponse, JSON.toJSONString(R.ok("退出成功")));
    }
}
