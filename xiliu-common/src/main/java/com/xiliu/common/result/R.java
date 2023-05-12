package com.xiliu.common.result;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.beans.ConstructorProperties;
import java.io.Serializable;

/**
 * @author xiliu
 * @description
 * @date 2021/9/1
 */
@Data
@ApiModel(value = "全局统一返回结果")
public class R implements Serializable {

    public final static String OK_MSG = "请求成功";
    public final static String FAIL_MSG = "请求失败";

    @ApiModelProperty(value = "是否成功")
    private boolean success;

    @ApiModelProperty(value = "返回码")
    private Integer code;

    @ApiModelProperty(value = "返回消息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private Object data;

    @ApiModelProperty(value = "总条数")
    private Long total;

    @ApiModelProperty(value = "分页信息")
    private PageInfo pageInfo;

    @Data
    public static class PageInfo {

        @ApiModelProperty("当前页")
        protected int currentPage;
        @ApiModelProperty("页大小")
        protected int pageSize;
        @ApiModelProperty("总记录数")
        protected long totalCount;
        @ApiModelProperty("总页数")
        protected long totalPage;

        public PageInfo() {
        }

        @ConstructorProperties({"currentPage", "pageSize", "totalCount", "totalPage"})
        public PageInfo(int currentPage, int pageSize, long totalCount, long totalPage) {
            this.currentPage = currentPage;
            this.pageSize = pageSize;
            this.totalCount = totalCount;
            this.totalPage = totalPage;
        }
    }

    private R(){}

    private R(int code, Boolean success,String msg, Object data) {
        this.code = code;
        this.success = success;
        this.message = msg;
        if (data instanceof Page<?>) {
            Page<?> page = (Page<?>) data;
            this.total = page.getTotal();
            this.data = page.getRecords();
            this.pageInfo = new PageInfo((int)page.getCurrent(), (int)page.getSize(), page.getTotal(), page.getPages());
        } else {
            this.data = data;
        }
    }

    public static R ok(){
        R r = new R();
        r.setSuccess(true);
        r.setCode(ResultCodeEnum.SUCCESS.getCode());
        r.setMessage(ResultCodeEnum.SUCCESS.getMessage());
        return r;
    }
    public static R ok(Object data) {
        return new R(ResultCodeEnum.SUCCESS.getCode(),true, ResultCodeEnum.SUCCESS.getMessage(), data);
    }

    public static R ok(String msg, Object data) {
        return new R(ResultCodeEnum.SUCCESS.getCode(),true, msg, data);
    }

    public static R error(){
        R r = new R();
        r.setSuccess(false);
        r.setCode(ResultCodeEnum.FAILED.getCode());
        r.setMessage(ResultCodeEnum.FAILED.getMessage());
        return r;
    }

    public static R error(String msg) {
        return new R(ResultCodeEnum.FAILED.getCode(),false, msg, null);
    }

    public static R error(int errorCode, String msg) {
        return new R(errorCode,false, msg, null);
    }

    public static R unauthorized() {
        return new R(ResultCodeEnum.UNAUTHORIZED.getCode(),false, ResultCodeEnum.UNAUTHORIZED.getMessage(), null);
    }

    public R message(String message){
        this.setMessage(message);
        return this;
    }

    public R code(Integer code){
        this.setCode(code);
        return this;
    }

    public R data(Object data){
        this.setData(data);
        return this;
    }

}
