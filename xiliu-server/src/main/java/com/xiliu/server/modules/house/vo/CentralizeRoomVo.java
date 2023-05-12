package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @author xiliu
 * @description
 * @date 2023/4/18
 */
@Data
public class CentralizeRoomVo {

    @ApiModelProperty("房源ID")
    private Long houseId;

    @ApiModelProperty("楼层")
    private Long floor;

    @ApiModelProperty("房间号")
    private String houseNo;

    @ApiModelProperty("户型")
    private String unitType;

    @ApiModelProperty("下定人")
    private String realName;

    @ApiModelProperty("租客")
    private String zkRealName;

    @ApiModelProperty("房间定价")
    private BigDecimal money;

    @ApiModelProperty("押金")
    private BigDecimal deposit;

    @ApiModelProperty("房间空置天数")
    private String vacantDay;

    @ApiModelProperty("房间状态")
    private Long state;

    @ApiModelProperty("定金")
    private BigDecimal frontMoney;


}
