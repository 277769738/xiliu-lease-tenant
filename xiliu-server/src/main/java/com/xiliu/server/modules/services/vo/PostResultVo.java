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
@ApiModel("管理后台 - 职务管理列表返回精简信息")
@Data
public class PostResultVo {

    @ApiModelProperty("主键ID")
    private Long roleId;

    @ApiModelProperty("部门名称")
    private String description;

    @ApiModelProperty("职务名称")
    private String roleName;

    @ApiModelProperty("权限分配")
    private Boolean isAuth;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;

}
