package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @author xiliu
 * @description
 * @date 2023/4/6
 */
@ApiModel("管理后台 - 房源编辑返回信息")
@Data
public class RoomDetailRespVo {
    /** 房源ID */
    @ApiModelProperty("房源ID")
    private Long houseId;

    @ApiModelProperty("楼层")
    private Long floor;

    @ApiModelProperty("房间号")
    private String houseNo;

    @ApiModelProperty("厅室")
    private Long hall;

    @ApiModelProperty("房间")
    private Long room;

    @ApiModelProperty("卫生间")
    private Long toilet;

    @ApiModelProperty("面积")
    private BigDecimal area;

    @ApiModelProperty("房源状态")
    private Long state;

    @ApiModelProperty("原租金")
    private BigDecimal money;

    @ApiModelProperty("押金")
    private BigDecimal deposit;

    @ApiModelProperty("实际租金")
    private BigDecimal realityMoney;

    @ApiModelProperty("对外租金")
    private BigDecimal externalMoney;

    @ApiModelProperty("周付价")
    private BigDecimal weekMoney;

    @ApiModelProperty("押金方式")
    private String depositNum;

    @ApiModelProperty("付款方式")
    private String payNum;


}
