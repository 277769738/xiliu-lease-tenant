package com.xiliu.generator.utils;

import org.apache.velocity.app.Velocity;

import java.util.Properties;

/**
 * @author VelocityEngine工厂
 * @description
 * @date 2022/7/19
 */
public class VelocityInitializer {

    public static void initVelocity() {
        Properties p = new Properties();
        // 加载classpath目录下的vm文件
        p.setProperty("resource.loader.file.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        // 定义字符集
        p.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
        // 初始化Velocity引擎，指定配置Properties
        Velocity.init(p);
    }
}
