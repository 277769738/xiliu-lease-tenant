package com.xiliu.server.manager.factory;

import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;

import com.xiliu.common.constant.Constants;
import com.xiliu.common.utils.ServletUtils;
import com.xiliu.common.utils.SpringUtils;
import com.xiliu.common.utils.ip.AddressUtils;
import com.xiliu.common.utils.ip.IpUtils;
import com.xiliu.server.modules.system.entity.XlLoginLog;
import com.xiliu.server.modules.system.service.IXlLoginLogService;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.TimerTask;

/**
 * @author xiliu
 * @description 异步工厂（产生任务用）
 * @date 2022/7/25
 */
@Slf4j
public class AsyncFactory {

    /**
     * 记录登录信息
     * @param username 用户名
     * @param status 状态
     * @param message 消息
     * @param args 列表
     * @return 任务task
     */
    public static TimerTask recordLoginLog(final String username, final String status, final String message,final Object... args) {
        // 客户端操作系统、浏览器等信息
        final UserAgent userAgent = UserAgentUtil.parse(ServletUtils.getRequest().getHeader("User-Agent"));
        // 请求的IP地址
        final String ip = ServletUtil.getClientIP(ServletUtils.getRequest());
        //final String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
        return new TimerTask() {
            @Override
            public void run() {
                String address = AddressUtils.getRealAddressByIp(ip);
                // 获取客户端操作系统
                String os = userAgent.getOs().getName();
                // 获取客户端浏览器
                String browser = userAgent.getBrowser().getName();
                // 封装对象
                XlLoginLog loginLog = new XlLoginLog();
                loginLog.setUserCode(username);
                loginLog.setIpaddr(ip);
                loginLog.setLoginLocation(address);
                loginLog.setBrowser(browser);
                loginLog.setOs(os);
                loginLog.setMsg(message);
                loginLog.setLoginTime(new Date());
                // 日志状态
                if (Constants.LOGIN_FAIL.equals(status)) {
                    loginLog.setStatus(Integer.valueOf(Constants.FAIL));
                } else {
                    loginLog.setStatus(Integer.valueOf(Constants.SUCCESS));
                }
                // 插入数据
                SpringUtils.getBean(IXlLoginLogService.class).create(loginLog);
            }
        };
    }

}

