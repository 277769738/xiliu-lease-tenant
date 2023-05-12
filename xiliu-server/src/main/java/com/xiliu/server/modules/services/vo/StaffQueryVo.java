package com.xiliu.server.modules.services.vo;


import com.xiliu.common.domain.BasePageEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @description
 * @date 2021/9/26
 */
@Data
public class StaffQueryVo{

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "角色id")
    private String roleId;

    @ApiModelProperty(value = "部门")
    private String description;
}
