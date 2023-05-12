package com.xiliu.server.modules.system.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import com.xiliu.common.domain.BaseEntity;

import com.xiliu.server.modules.system.vo.StatusConverter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


/**
 * 系统访问日志表对象 xl_login_log
 * 
 * @author xiliu
 * @date 2022-07-25
 */
@ExcelIgnoreUnannotated
@Data
@TableName("xl_login_log")
@ApiModel(value = "XlLoginLog对象", description = "登录日志表")
public class XlLoginLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "login_id", type = IdType.AUTO)
    private Long loginId;

    /** 用户账号 */
    @ExcelProperty(value = "用户账号")
    private String userCode;

    /** 登录IP地址 */
    @ExcelProperty(value = "登录IP地址")
    private String ipaddr;

    /** 登录地点 */
    @ExcelProperty(value = "登录地点")
    private String loginLocation;

    /** 浏览器类型 */
    @ExcelProperty(value = "浏览器类型")
    private String browser;

    /** 操作系统 */
    @ExcelProperty(value = "操作系统")
    private String os;

    /** 提示消息 */
    private String msg;

    /** 登录状态（0成功 1失败） */
    @ExcelProperty(value = "登录状态", converter = StatusConverter.class)
    private Integer status;

    /** 访问时间 */
    private Date loginTime;


}
