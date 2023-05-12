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
@ApiModel("管理后台 - 房源列表返回信息")
@Data
public class RoomListRespVo {
    /** 房源ID */
    @ApiModelProperty("房源ID")
    private Long houseId;

    @ApiModelProperty("楼层")
    private Long floor;

    @ApiModelProperty("房间号")
    private String houseNo;

    @ApiModelProperty("出租方式 zz:整租; hz:合租")
    private String hireType;

    @ApiModelProperty("房源类型 jzs:集中式; sss分散式")
    private String houseType;

    @ApiModelProperty("户型")
    private String unitType;

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

    @ApiModelProperty("押金方式")
    private String depositNum;

    @ApiModelProperty("门店名称")
    private String apartmentName;
}
