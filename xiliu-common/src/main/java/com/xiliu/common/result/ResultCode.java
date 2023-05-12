package com.xiliu.common.result;

/**
 * @author xiliu
 * @description 返回码
 * @date 2021/9/1
 */
public class ResultCode {

    /**
     * 成功
     **/
    public final static int OK = 20000;
    /**
     * 失败
     **/
    public final static int ERROR = 20001;
    /**
     * 用户名或密码错误
     **/
    public final static int LOGIN_ERROR = 20002;
    /**
     * 权限不足
     **/
    public final static int ACCESS_ERROR = 20003;

    /**
     * 未登录
     **/
    public final static int UN_LOGIN = 20004;
    /**
     * 远程调用失败
     **/
    public final static int REMOTE_ERROR = 20005;
    /**
     * 重复操作
     **/
    public final static int REPEAT_ERROR = 20006;


}
