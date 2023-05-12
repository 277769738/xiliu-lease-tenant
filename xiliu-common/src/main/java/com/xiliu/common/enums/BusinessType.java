package com.xiliu.common.enums;

/**
 * @author xiliu
 * @description 业务操作类型
 * @date 2022/7/22
 */
public enum BusinessType {
    /**
     * 其它
     */
    OTHER,

    /**
     * 新增
     */
    INSERT,

    /**
     * 修改
     */
    UPDATE,

    /**
     * 删除
     */
    DELETE,
    /**
     * 导出
     */
    EXPORT,

    /**
     * 导入
     */
    IMPORT,
    /**
     * 生成代码
     */
    GENCODE,
    /**
     * 清空数据
     */
    CLEAN,
    /**
     * 强退
     */
    FORCE,
    /**
     * 授权
     */
    GRANT,
}
