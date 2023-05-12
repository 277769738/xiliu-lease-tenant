package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @description
 * @date 2023/4/18
 */
@Data
public class CentralizeRequestVo {

    @ApiModelProperty("品牌ID")
    private Long brandId;

    @ApiModelProperty("门店ID")
    private Long projectId;

    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("房间状态")
    private Long state;

    @ApiModelProperty("房间号")
    private String houseNo;
}
