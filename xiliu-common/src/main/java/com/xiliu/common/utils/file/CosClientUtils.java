package com.xiliu.common.utils.file;


import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.UploadResult;
import com.qcloud.cos.transfer.TransferManager;
import com.qcloud.cos.transfer.Upload;
import com.xiliu.common.config.CosConfig;
import com.xiliu.common.utils.SpringUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author xiliu
 * @description 腾讯云COS文件上传工具类
 * @date 2022/10/31
 */
@Slf4j
public class CosClientUtils {

    /**
     * 获取配置信息
     */
    private static CosConfig cosConfig = SpringUtils.getBean(CosConfig.class);

    public static String upload(MultipartFile file, String dir) throws Exception {
        String originalFilename = file.getOriginalFilename();
        // 文件名
        String name = FilenameUtils.getBaseName(originalFilename) + "_" + System.currentTimeMillis() + originalFilename.substring(originalFilename.lastIndexOf("."));
        // 目录
        String folderName = cosConfig.getFolderPrefix() + "/" + dir + "/";
        String key = folderName + name;
        File localFile = null;
        try {
            localFile = transferToFile(file);
            String filePath = uploadFileToCos(localFile, key);
            log.info("upload COS successful: {}", filePath);
            return filePath;
        } catch (Exception e) {
            throw new Exception("文件上传失败");
        } finally {
            localFile.delete();
        }
    }

    /**
     * 用缓冲区来创建临时文件
     * 使用 MultipartFile.transferTo()
     * @param multipartFile
     * @return
     */
    private static File transferToFile(MultipartFile multipartFile) throws IOException {
        String originalFilename = multipartFile.getOriginalFilename();
        String prefix = originalFilename.split("\\.")[0];
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        File file = File.createTempFile(prefix, suffix);
        multipartFile.transferTo(file);
        return file;
    }

    /**
     * 上传文件到COS
     * @param localFile
     * @param key
     * @return
     */
    private static String uploadFileToCos(File localFile, String key) throws InterruptedException {
        PutObjectRequest putObjectRequest = new PutObjectRequest(cosConfig.getBucketName(), key, localFile);
        // 获取连接
        COSClient cosClient = cosConfig.getCosClient();
        // 创建线程池
        ThreadPoolExecutor threadPool = new ThreadPoolExecutor(8, 16,
                4, TimeUnit.SECONDS, new ArrayBlockingQueue(10), new ThreadPoolExecutor.AbortPolicy());
        // 传入一个threadPool, 若不传入线程池, 默认TransferManager中会生成一个单线程的线程池
        TransferManager transferManager = new TransferManager(cosClient, threadPool);
        // 返回一个异步结果Upload, 可同步的调用waitForUploadResult等待upload结束, 成功返回UploadResult, 失败抛出异常
        Upload upload = transferManager.upload(putObjectRequest);
        UploadResult uploadResult = upload.waitForUploadResult();
        transferManager.shutdownNow();
        cosClient.shutdown();
        String filePath = cosConfig.getBaseUrl() + uploadResult.getKey();
        return filePath;
    }

}
