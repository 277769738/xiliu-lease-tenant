package com.xiliu.server.common.security.handler;

import cn.hutool.json.JSONUtil;
import com.xiliu.common.result.R;
import com.xiliu.common.result.ResultCodeEnum;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xiliu
 * @description 当访问接口没有权限时，自定义的返回结果
 * @date 2021/9/6
 */
@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json");
        httpServletResponse.getWriter().println(JSONUtil.parse(R.error(ResultCodeEnum.FORBIDDEN.getCode(),ResultCodeEnum.FORBIDDEN.getMessage())));
        httpServletResponse.getWriter().flush();
    }
}
