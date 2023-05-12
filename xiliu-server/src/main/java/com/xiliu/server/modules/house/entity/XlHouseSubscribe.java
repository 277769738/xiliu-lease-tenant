package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author xiliu
 * @description
 * @date 2023/4/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_house_subscribe")
@ApiModel(value = "xl_house_subscribe对象}", description = "房间预订表")
public class XlHouseSubscribe extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键id")
    @TableId(value = "subscribe_id", type = IdType.AUTO)
    private Long subscribeId;

    /** 房源ID */
    @ApiModelProperty("房源ID")
    private Long houseId;

    /** 下定人 */
    @ApiModelProperty("下定人")
    private String realName;

    /** 联系电话 */
    @ApiModelProperty("联系电话")
    private String phoneNumber;

    /** 性别（1男 2女） */
    @ApiModelProperty("性别（1男 2女）")
    private String sex;

    /** 证件类型（1身份证 2军人证 3护照 4港澳台居民证件） */
    @ApiModelProperty("证件类型（1身份证 2军人证 3护照 4港澳台居民证件）")
    private String idType;

    /** 证件号码 */
    @ApiModelProperty("证件号码")
    private String idNo;

    /** 下定日期 */
    @ApiModelProperty("下定日期")
    private Date downDate;

    /** 失效日期 */
    @ApiModelProperty("失效日期")
    private Date expireDate;

    /** 合同开始时间 */
    @ApiModelProperty("合同开始时间")
    private Date contractStartDate;

    /** 合同结束时间 */
    @ApiModelProperty("合同结束时间")
    private Date contractEndDate;

    /** 约定月租金 */
    @ApiModelProperty("约定月租金")
    private BigDecimal monthMoney;

    /** 约定押金 */
    @ApiModelProperty("约定押金")
    private BigDecimal deposit;

    /** 下定金额 */
    @ApiModelProperty("下定金额")
    private BigDecimal frontMoney;

    /** 入账时间 */
    @ApiModelProperty("入账时间")
    private Date fromDate;

    /** 收费方式（1现金 2结清费用 3银行卡转账支付） */
    @ApiModelProperty("收费方式（1现金 2结清费用 3银行卡转账支付）")
    private String feeType;

    /** 备注 */
    @ApiModelProperty("备注")
    private String remarks;

    /** 公寓ID */
    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    /** 租户ID */
    @ApiModelProperty("租户ID")
    private Long tenantId;


}
