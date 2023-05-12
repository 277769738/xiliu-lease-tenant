package com.xiliu.server.common.mybatis.handler;

import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.NullValue;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * @author xiliu
 * @description 多租户处理器
 * @date 2023/3/7
 */
@Slf4j
@Component
public class MyTenantLineHandler implements TenantLineHandler {

    /**
     * 排除过滤的表
     */
    private static final String[] TABLE_FILTER = {"xl_menu","xl_tenant_package","xl_tenant","xl_dict","xl_dict_data"};

    /**
     * 排除过滤的表前缀
     */
    private static final String[] TABLE_PRE = {"qrtz", "gen"};

    @Override
    public Expression getTenantId() {
        // 取出当前请求的服务商ID，通过解析器注入到SQL中。
        Long tenantId = SecurityUtils.getTenantId();
        if (tenantId == null) {
            return new NullValue();
        }
        return new LongValue(tenantId);
    }

    /**
     * 跳过不需要加多租户的表
     */
    @Override
    public boolean ignoreTable(String tableName) {
        String prefix = StringUtils.substringBefore(tableName, "_");
        if (Arrays.asList(TABLE_FILTER).contains(tableName) || Arrays.asList(TABLE_PRE).contains(prefix)) {
            return true;
        }
        return false;
    }
}
