package com.xiliu.server.modules.monitor.controller;


import com.xiliu.common.result.R;
import com.xiliu.server.modules.monitor.entity.Server;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author huoqiang
 * @description 服务器监控
 * @date 2022/10/17
 */
@RestController
@RequestMapping("/monitor/server")
public class ServerController {

    @PreAuthorize("@customSs.hasPermi('monitor:server:list')")
    @GetMapping()
    public R getInfo() throws Exception {
        Server server = new Server();
        server.setServeInfo();
        return R.ok(server);
    }
}
