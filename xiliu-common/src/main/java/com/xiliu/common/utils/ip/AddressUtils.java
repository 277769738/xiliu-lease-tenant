package com.xiliu.common.utils.ip;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import com.xiliu.common.utils.HttpUtils;
import com.xiliu.common.utils.StringUtils;
import lombok.extern.slf4j.Slf4j;

/**
 * @author xiliu
 * @description 获取地址工具类
 * @date 2022/7/25
 */
@Slf4j
public class AddressUtils {

    /**
     * IP地址查询
     **/
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";
    /**
     * 未知地址
     **/
    public static final String UNKNOWN = "XX XX";

    public static String getRealAddressByIp(String ip) {
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        } else {
            try {
                String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", "GBK");
                if (StringUtils.isEmpty(rspStr)) {
                    log.error("获取地理位置异常 {}", ip);
                    return UNKNOWN;
                }
                JSONObject obj = JSON.parseObject(rspStr);
                String region = obj.getString("pro");
                String city = obj.getString("city");
                return String.format("%s %s", region, city);
            } catch (Exception e) {
                log.error("获取地理位置异常 {}", ip);
            }
            return UNKNOWN;
        }
    }
}
