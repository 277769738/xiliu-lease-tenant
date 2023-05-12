package com.xiliu.server.modules.services.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author xiliu
 * @description
 * @date 2023/3/27
 */
@ApiModel("管理后台 - 员工详情返回精简信息")
@Data
public class StaffDetailResultVo {

    @ApiModelProperty(value = "用户ID")
    private Long userId;

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "密码")
    private String passWord;

    @ApiModelProperty(value = "姓名")
    private String realName;

    @ApiModelProperty(value = "入职时间")
    private Date entryDate;

    @ApiModelProperty(value = "员工编号")
    private String userNumber;

    @ApiModelProperty(value = "身份证号码")
    private String idNo;

    @ApiModelProperty("部门")
    private String description;

    @ApiModelProperty("职务")
    private Long roleId;

}
