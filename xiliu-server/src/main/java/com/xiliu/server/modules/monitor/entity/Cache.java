package com.xiliu.server.modules.monitor.entity;


import com.xiliu.common.utils.StringUtils;
import lombok.Data;

/**
 * @author xiliu
 * @description 缓存信息
 * @date 2022/10/18
 */
@Data
public class Cache {

    /** 缓存名称 */
    private String cacheName = "";

    /** 缓存键名 */
    private String cacheKey = "";

    /** 缓存内容 */
    private String cacheValue = "";

    /** 备注 */
    private String remark = "";

    public Cache() {

    }

    public Cache(String cacheName, String remark){
        this.cacheName = cacheName;
        this.remark = remark;
    }

    public Cache(String cacheName, String cacheKey, String cacheValue) {
        this.cacheName = StringUtils.replace(cacheName, ":", "");
        this.cacheKey = StringUtils.replace(cacheKey, cacheName, "");
        this.cacheValue = cacheValue;
    }
}
