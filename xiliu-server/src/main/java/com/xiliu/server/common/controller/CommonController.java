package com.xiliu.server.common.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.xiliu.server.common.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author xiliu
 * @description
 * @date 2023/4/6
 */
@Slf4j
@RestController
@RequestMapping(value = "common")
public class CommonController {

    /**
     * 下载 /templates/file/ 下文件 param fileName throws IOException
     */
    @GetMapping(value = "downloadFile")
    public void downloadFile(String fileName) throws IOException {
        if (StrUtil.isBlank(fileName)) {
            throw new ServiceException("不存在的文件：" + fileName);
        }
        //Resource resource = new ClassPathResource("templates/file/" + fileName);
        InputStream inputStream = this.getClass().getResourceAsStream("/templates/file/" + fileName);
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        response.setCharacterEncoding("UTF-8");
        ServletUtil.write(response, inputStream,
                ObjectUtil.defaultIfNull(FileUtil.getMimeType(fileName), "application/octet-stream"), fileName);
    }
}
