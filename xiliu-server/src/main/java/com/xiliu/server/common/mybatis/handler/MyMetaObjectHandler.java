package com.xiliu.server.common.mybatis.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.xiliu.server.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author xiliu
 * @description 字段默认值处理类
 * @date 2021/9/1
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        this.setFieldValByName("createdTime", new Date(), metaObject);
        this.setFieldValByName("deleted", false, metaObject);
        this.setFieldValByName("version", 1L, metaObject);
        Object createUser = this.getFieldValByName("createdBy", metaObject);
        if (createUser == null) {
            if(SecurityUtils.isLogin()) {
                this.setFieldValByName("createdBy",SecurityUtils.getUserId(),metaObject);
            }
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        this.setFieldValByName("updatedTime", new Date(), metaObject);
        Object createUser = this.getFieldValByName("updatedBy", metaObject);
        if (createUser == null) {
            if(SecurityUtils.isLogin()) {
                this.setFieldValByName("updatedBy",SecurityUtils.getUserId(),metaObject);
            }
        }
    }
}
