package com.xiliu.common.result;

/**
 * @author xiliu
 * @description 返回码枚举
 * @date 2021/9/6
 */
public enum ResultCodeEnum implements IBaseEnum{

    SUCCESS(200, "操作成功"),
    FAILED(500, "操作失败"),
    VALIDATE_FAILED(404, "参数检验失败"),
    UNAUTHORIZED(401, "无效的会话，或者会话已过期，请重新登录。"),
    FORBIDDEN(403, "没有相关权限");

    private int code;
    private String message;

    private ResultCodeEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
