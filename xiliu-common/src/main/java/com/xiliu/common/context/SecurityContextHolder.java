package com.xiliu.common.context;

import cn.hutool.core.convert.Convert;
import com.alibaba.ttl.TransmittableThreadLocal;
import com.xiliu.common.constant.SecurityConstants;
import com.xiliu.common.utils.StringUtils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author xiliu
 * @description 获取当前线程变量中的 租户id 部门id 用户id、用户名称、Token等信息
 * @date 2023/3/6
 */
public class SecurityContextHolder {

    private static final TransmittableThreadLocal<Map<String, Object>> THREAD_LOCAL = new TransmittableThreadLocal<>();

    public static void set(String key, Object value) {
        Map<String, Object> map = getLocalMap();
        map.put(key, value == null ? StringUtils.EMPTY : value);
    }

    public static String get(String key) {
        Map<String, Object> map = getLocalMap();
        return Convert.toStr(map.getOrDefault(key, StringUtils.EMPTY));
    }


    public static <T> T get(String key, Class<T> clazz) {
        Map<String, Object> map = getLocalMap();
        return StringUtils.cast(map.getOrDefault(key, null));
    }

    public static Map<String, Object> getLocalMap() {
        Map<String, Object> map = THREAD_LOCAL.get();
        if (map == null) {
            map = new ConcurrentHashMap<String, Object>();
            THREAD_LOCAL.set(map);
        }
        return map;
    }

    public static void setLocalMap(Map<String, Object> threadLocalMap)
    {
        THREAD_LOCAL.set(threadLocalMap);
    }


    public static Long getTenantId() {
        return Convert.toLong(get(SecurityConstants.DETAILS_TENANT_ID), 9999L);
    }

    public static void setTenantId(String tenantId){
        set(SecurityConstants.DETAILS_TENANT_ID, tenantId);
    }

    public static Long getDeptId()
    {
        return Convert.toLong(get(SecurityConstants.DETAILS_DEPT_ID));
    }

    public static void setDeptId(String deptId)
    {
        set(SecurityConstants.DETAILS_DEPT_ID, deptId);
    }

    public static String getPermission() {
        return get(SecurityConstants.ROLE_PERMISSION);
    }

    public static void setPermission(String permissions) {
        set(SecurityConstants.ROLE_PERMISSION, permissions);
    }
    public static void remove()
    {
        THREAD_LOCAL.remove();
    }
}
