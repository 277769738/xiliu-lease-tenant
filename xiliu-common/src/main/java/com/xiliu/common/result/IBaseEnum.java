package com.xiliu.common.result;

/**
 * @author xiliu
 * @description 枚举接口
 * @date 2021/9/6
 */
public interface IBaseEnum {

    /**
     * 获取枚举值
     * @return
     */
    int getCode();

    /**
     * 获取枚举描述
     * @return
     */
    String getMessage();
}
