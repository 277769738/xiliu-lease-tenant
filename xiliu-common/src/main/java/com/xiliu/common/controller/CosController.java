package com.xiliu.common.controller;

import com.tencent.cloud.CosStsClient;
import com.tencent.cloud.Response;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.file.CosClientUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.TreeMap;

/**
 * @author xiliu
 * @description cos存储前端控制器
 * @date 2022/11/13 17:51
 */
@RestController
@RequestMapping("/cos")
public class CosController {

    @Value("${cos.secretId}")
    private String secretId;
    @Value("${cos.secretKey}")
    private String secretKey;
    @Value("${cos.regionName}")
    private String regionName;
    @Value("${cos.bucketName}")
    private String bucketName;

    @ApiOperation(value = "照片上传")
    @PostMapping("/upload/image")
    public R uploadImage(MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String avatar = CosClientUtils.upload(file, "house");
            return R.ok(avatar);
        }
        return R.error("上传照片异常，请联系管理员");
    }

    @ApiOperation(value = "获取cos临时密钥")
    @GetMapping("/temp-key")
    public R getTempKey() {
        TreeMap<String, Object> config = new TreeMap<String, Object>();
        try {
            // 替换为您的云 api 密钥 SecretId
            config.put("secretId", secretId);
            // 替换为您的云 api 密钥 SecretKey
            config.put("secretKey", secretKey);
            // 临时密钥有效时长，单位是秒，默认 1800 秒，目前主账号最长 2 小时（即 7200 秒），子账号最长 36 小时（即 129600）秒
            config.put("durationSeconds", 1800);
            // 换成您的 bucket
            config.put("bucket", bucketName);
            // 换成 bucket 所在地区
            config.put("region", regionName);

            // 只允许用户访问 upload/house 目录下的资源
            config.put("allowPrefixes", new String[] {"upload/house/*"});

            // 密钥的权限列表。必须在这里指定本次临时密钥所需要的权限。
            String[] allowActions = new String[] {
                    // 简单上传
                    "name/cos:PutObject",
                    // 表单上传、小程序上传
                    "name/cos:PostObject",
                    // 分块上传
                    "name/cos:InitiateMultipartUpload",
                    "name/cos:ListMultipartUploads",
                    "name/cos:ListParts",
                    "name/cos:UploadPart",
                    "name/cos:CompleteMultipartUpload"
            };
            config.put("allowActions", allowActions);

            Response response = CosStsClient.getCredential(config);
            return R.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new IllegalArgumentException("no valid secret !");
        }
    }
}
