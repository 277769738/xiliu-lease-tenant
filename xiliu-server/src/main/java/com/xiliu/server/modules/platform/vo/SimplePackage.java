package com.xiliu.server.modules.platform.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @date 2023/3/5 20:53
 */
@ApiModel("管理后台 - 租户套餐精简信息")
@Data
public class SimplePackage {

    @ApiModelProperty(value = "套餐编号", required = true, example = "1024")
    private Long id;

    @ApiModelProperty(value = "套餐名称", required = true, example = "希留")
    private String name;
}
