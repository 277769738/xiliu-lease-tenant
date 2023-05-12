package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.xiliu.common.domain.BaseEntity;

/**
 * 品牌分类表对象 xl_brand_classify
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_brand_classify")
@ApiModel(value = "xl_brand_classify对象}", description = "品牌分类表")
public class XlBrandClassify extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "brand_id", type = IdType.AUTO)
    private Long brandId;

    /** 品牌分类名称 */
    @ApiModelProperty("名称")
    private String brandName;

    /** 品牌分类简介 */
    @ApiModelProperty("简介")
    private String remarks;

    /** 公寓ID */
    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    /** 租户ID */
    @ApiModelProperty("租户ID")
    private Long tenantId;






}
