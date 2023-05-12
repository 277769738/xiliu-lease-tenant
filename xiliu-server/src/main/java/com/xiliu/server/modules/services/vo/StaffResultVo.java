package com.xiliu.server.modules.services.vo;

import com.baomidou.mybatisplus.annotation.TableField;
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
@ApiModel("管理后台 - 员工管理列表返回精简信息")
@Data
public class StaffResultVo {

    @ApiModelProperty(value = "用户ID")
    private Long userId;

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "姓名")
    private String realName;

    @ApiModelProperty(value = "用户状态;0正常 1停用")
    private Integer status;

    @ApiModelProperty(value = "手机")
    private String mobile;

    @ApiModelProperty("部门")
    private String description;

    @ApiModelProperty("职务")
    private String roleName;

    @ApiModelProperty("是否分配门店")
    private Boolean isAuthProject;

    /** 选择要分配的门店 */
    @ApiModelProperty("分配的门店")
    private String apartmentIds;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;
}
