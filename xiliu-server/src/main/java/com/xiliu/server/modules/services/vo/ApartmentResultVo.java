package com.xiliu.server.modules.services.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @description
 * @date 2023/3/28
 */
@ApiModel("管理后台 - 分配门店列表返回精简信息")
@Data
public class ApartmentResultVo {

    @ApiModelProperty("主键ID")
    private Long apartmentId;

    @ApiModelProperty("名称")
    private String apartmentName;

    /** 品牌分类id */
    private Long brandId;

    /** 项目分类id */
    private Long projectId;

    @ApiModelProperty("地址")
    private String address;
}
