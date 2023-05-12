package com.xiliu.server.modules.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author xiliu
 * @description 角色分配用户精简信息Vo
 * @date 2023/3/10
 */
@ApiModel("管理后台 - 角色分配用户返回信息")
@Data
public class RoleUserResultVo {

    @ApiModelProperty(value = "用户ID")
    private Long userId;

    @ApiModelProperty(value = "用户类型;1:admin;2:会员")
    private Integer userType;

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "姓名")
    private String realName;

    @ApiModelProperty(value = "用户昵称")
    private String userNickname;

    @ApiModelProperty(value = "邮箱")
    private String userEmail;

    @ApiModelProperty(value = "中国手机不带国家代码，国际手机号格式为：国家代码-手机号")
    private String mobile;

    @ApiModelProperty(value = "用户状态;0正常 1停用")
    private Integer status;

    @ApiModelProperty(value = "所属部门id")
    private Long deptId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;
}
