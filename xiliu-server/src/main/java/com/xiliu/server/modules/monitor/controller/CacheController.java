package com.xiliu.server.modules.monitor.controller;


import com.xiliu.common.constant.CacheConstants;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.modules.monitor.entity.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @author huoqiang
 * @description 缓存监控
 * @date 2022/10/17
 */
@RestController
@RequestMapping("/monitor/cache")
public class CacheController {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    private final static List<Cache> CACHES = new ArrayList<Cache>();{
        CACHES.add(new Cache(CacheConstants.LOGIN_TOKEN_KEY, "用户信息"));
        CACHES.add(new Cache(CacheConstants.SYS_DICT_KEY, "数据字典"));
        CACHES.add(new Cache(CacheConstants.CAPTCHA_CODE_KEY, "验证码"));
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @GetMapping()
    public R getInfo() throws Exception {
        Properties info = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info());
        Properties commandStats = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info("commandstats"));
        Object dbSize = redisTemplate.execute((RedisCallback<Object>) connection -> connection.dbSize());

        Map<String, Object> result = new HashMap<>(3);
        result.put("info", info);
        result.put("dbSize", dbSize);
        List<Map<String, String>> pieList = new ArrayList<>();
        commandStats.stringPropertyNames().forEach(key -> {
            Map<String, String> data = new HashMap<>(2);
            String property = commandStats.getProperty(key);
            data.put("name", StringUtils.removeStart(key, "cmdstat_"));
            data.put("value", StringUtils.substringBetween(property, "calls=", ",usec"));
            pieList.add(data);
        });
        result.put("commandStats", pieList);
        return R.ok(result);
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @GetMapping("/getNames")
    public R cache() {
        return R.ok(CACHES);
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @GetMapping("/getKeys/{cacheName}")
    public R getCacheKeys(@PathVariable String cacheName) {
        Set<String> cacheKyes = redisTemplate.keys(cacheName + "*");
        return R.ok(cacheKyes);
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @GetMapping("/getValue/{cacheName}/{cacheKey}")
    public R getCacheValue(@PathVariable String cacheName, @PathVariable String cacheKey) {
        String cacheValue = redisTemplate.opsForValue().get(cacheKey);
        Cache cache = new Cache(cacheName, cacheKey, cacheValue);
        return R.ok(cache);
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheName/{cacheName}")
    public R clearCacheName(@PathVariable String cacheName) {
        Collection<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        redisTemplate.delete(cacheKeys);
        return R.ok();
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheKey/{cacheKey}")
    public R clearCacheKey(@PathVariable String cacheKey) {
        redisTemplate.delete(cacheKey);
        return R.ok();
    }

    @PreAuthorize("@customSs.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheAll")
    public R clearCacheAll() {
        Collection<String> cacheKeys = redisTemplate.keys("*");
        redisTemplate.delete(cacheKeys);
        return R.ok();
    }
}
