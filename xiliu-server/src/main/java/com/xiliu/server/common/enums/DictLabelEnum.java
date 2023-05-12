package com.xiliu.server.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author xiliu
 * @description 字典项枚举
 * @date 2023/3/23
 */
@Getter
@AllArgsConstructor
public enum DictLabelEnum {

    JZS("集中式","jzs"),
    FSS("分散式","fss"),
    LIFT_Y("是","Y"),
    LIFT_N("否","N"),;

    private final String name;
    private final String value;
}
