package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.xiliu.common.domain.BaseEntity;

/**
 * 房源其他费用表对象 xl_house_fee
 *
 * @author xiliu
 * @date 2023-04-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_house_fee")
@ApiModel(value = "xl_house_fee对象}", description = "房源其他费用表")
public class XlHouseFee extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键id */
    @ApiModelProperty("主键id")
    @TableId(value = "fee_id", type = IdType.AUTO)
    private Long feeId;

    /** 房源ID */
    @ApiModelProperty("房源ID")
    private Long houseId;

    /** 费用类型 db:度表费用; qt:其他费用 */
    @ApiModelProperty("费用类型 db:度表费用; qt:其他费用")
    private String feeType;

    /** 度表费用类型 */
    @ApiModelProperty("度表费用类型")
    private String feeDbType;

    @TableField(exist = false)
    private String qtTypeName;

    /** 其他费用类型 */
    @ApiModelProperty("其他费用类型")
    private String feeQtType;


    /** 费用收取类型 */
    @ApiModelProperty("费用收取类型")
    private String feeCollectType;
    @TableField(exist = false)
    private String collectTypeName;

    /** 价格 */
    @ApiModelProperty("价格")
    private BigDecimal feeAmount;

    /** 公寓ID */
    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    /** 租户ID */
    @ApiModelProperty("租户ID")
    private Long tenantId;

}