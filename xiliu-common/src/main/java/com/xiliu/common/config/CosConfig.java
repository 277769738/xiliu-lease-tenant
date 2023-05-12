package com.xiliu.common.config;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.region.Region;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author xiliu
 * @description 腾讯云cos对象存储配置类
 * @date 2022/10/28
 */
@Data
@Component
@ConfigurationProperties(prefix = "cos")
public class CosConfig {
    /**
     * 存储桶访问路径
     **/
    private String baseUrl;
    /**
     * 腾讯云账号秘钥
     **/
    private String secretId;
    /**
     * 密码秘钥
     **/
    private String secretKey;
    /**
     * 存储桶地区
     **/
    private String regionName;
    /**
     * 存储桶名称
     **/
    private String bucketName;
    /**
     * 上传的根目录
     **/
    private String folderPrefix;

    public COSClient getCosClient() {
        // 初始化用户信息
        COSCredentials cosCredentials = new BasicCOSCredentials(this.secretId,this.secretKey);
        // 设置地域
        Region region = new Region(this.regionName);
        ClientConfig config = new ClientConfig(region);
        // 生成COS客户端
        COSClient client = new COSClient(cosCredentials,config);
        return client;
    }

}
