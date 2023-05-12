package com.xiliu.common.annotation;

import com.xiliu.common.enums.BusinessType;

import java.lang.annotation.*;

/**
 * @author xiliu
 * @description 自定义操作日志记录注解
 * @date 2022/7/22
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD }) // 注解放置的目标位置,PARAMETER: 可用在参数上  METHOD：可用在方法级别上
@Retention(RetentionPolicy.RUNTIME)    // 指明修饰的注解的生存周期  RUNTIME：运行级别保留
@Documented
public @interface Log {

    /**
     * 模块
     */
    String title() default "";

    /**
     * 功能
     */
    public BusinessType businessType() default BusinessType.OTHER;

    /**
     * 是否保存请求的参数
     */
    public boolean isSaveRequestData() default true;

    /**
     * 是否保存响应的参数
     */
    public boolean isSaveResponseData() default true;
}
