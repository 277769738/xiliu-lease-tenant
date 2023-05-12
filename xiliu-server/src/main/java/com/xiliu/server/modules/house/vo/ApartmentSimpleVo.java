package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @description
 * @date 2023/4/3
 */
@Data
public class ApartmentSimpleVo {

    @ApiModelProperty("主键ID")
    private Long apartmentId;

    @ApiModelProperty("公寓名称")
    private String apartmentName;

    @ApiModelProperty("品牌名称")
    private String brandName;

    @ApiModelProperty("门店名称")
    private String classifyName;
}
