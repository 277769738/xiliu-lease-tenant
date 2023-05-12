package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import com.xiliu.server.modules.house.vo.RoomFeeVo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 房源表对象 xl_house
 *
 * @author xiliu
 * @date 2023-04-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_house")
@ApiModel(value = "xl_house对象}", description = "房源表")
public class XlHouse extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 房源ID */
    @ApiModelProperty("房源ID")
    @TableId(value = "house_id", type = IdType.AUTO)
    private Long houseId;

    /** 楼层 */
    @ApiModelProperty("楼层")
    private Long floor;

    /** 房间号 */
    @ApiModelProperty("房间号")
    private String houseNo;

    /** 出租方式 zz:整租; hz:合租 */
    @ApiModelProperty("出租方式 zz:整租; hz:合租")
    private String hireType;

    /** 房源类型 jzs:集中式; sss分散式 */
    @ApiModelProperty("房源类型 jzs:集中式; sss分散式")
    private String houseType;

    /** 厅室 */
    @ApiModelProperty("厅室")
    private Long hall;

    /** 房间 */
    @ApiModelProperty("房间")
    private Long room;

    /** 卫生间 */
    @ApiModelProperty("卫生间")
    private Long toilet;

    /** 面积 */
    @ApiModelProperty("面积")
    private BigDecimal area;

    /** 房屋朝向 */
    @ApiModelProperty("房屋朝向")
    private String orienta;

    /** 房源状态 1:待出租 2:装修中 3:已出租 4:待确认 5:已预订*/
    @ApiModelProperty("房源状态")
    private Long state;

    /** 原租金 */
    @ApiModelProperty("原租金")
    private BigDecimal money;

    /** 押金 */
    @ApiModelProperty("押金")
    private BigDecimal deposit;

    /** 实际租金 */
    @ApiModelProperty("实际租金")
    private BigDecimal realityMoney;

    /** 对外租金 */
    @ApiModelProperty("对外租金")
    private BigDecimal externalMoney;

    /** 周付价 */
    @ApiModelProperty("周付价")
    private BigDecimal weekMoney;

    /** 押金方式 */
    @ApiModelProperty("押金方式")
    private String depositNum;

    /** 付款方式 */
    @ApiModelProperty("付款方式")
    private String payNum;

    /** 计费模式 1:按自然月 2:按周期 */
    @ApiModelProperty("计费模式 1:按自然月 2:按周期")
    private String chargingType;

    /** 房源编号 */
    @ApiModelProperty("房源编号")
    private String orderNo;

    /** 房屋亮点 */
    @ApiModelProperty("房屋亮点")
    private String tags;

    /** 公寓ID */
    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    /** 租户ID */
    @ApiModelProperty("租户ID")
    private Long tenantId;

    @TableField(exist = false)
    private RoomFeeVo fee;

    @TableField(exist = false)
    private XlApartment apartment;

    /** 品牌ID */
    @TableField(exist = false)
    private Long brandId;

    /** 项目ID */
    @TableField(exist = false)
    private Long projectId;

}
