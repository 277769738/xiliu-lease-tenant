package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.xiliu.common.domain.BaseEntity;

/**
 * 公寓信息表对象 xl_apartment
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_apartment")
public class XlApartment extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 公寓ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "apartment_id", type = IdType.AUTO)
    private Long apartmentId;

    /** 名称 */
    private String apartmentName;

    /** 公寓类型 jzsdd:集中式独栋;fsszz:分散式整租;fsshz:分散式合租 */
    private String apartmentType;

    /** 品牌分类id */
    private Long brandId;

    /** 项目分类id */
    private Long projectId;

    /** 省 */
    private String province;

    /** 市 */
    private String city;

    /** 区县 */
    private String county;

    /** 详细地址 */
    private String detailAddress;

    /** 楼层数 */
    private Long floorNum;

    /** 房源数 */
    private Long houseNum;

    /** 是否电梯楼 N:否;Y:是 */
    private String isLift;

    /** 联系人 */
    private String contact;

    /** 联系电话 */
    private String contactNumber;

    /** 经度 */
    private String lng;

    /** 纬度 */
    private String lat;

    /** 地图所在地址 */
    private String mapAddress;

    /** 简介 */
    private String remarks;

    /** 状态;0:正常,1:停用 */
    private String apartmentStatus;

    /** logo图 */
    private String apartmentLogo;

    /** 显示顺序 */
    private Long sortOrder;

    /** 封面图 */
    private String coverImg;

    /** 甲方名称 */
    private String firstPartyName;

    /** 甲方客服电话 */
    private String firstPartyPhone;

    /** 甲方联系地址 */
    private String firstPartyAddress;

    /** 租户ID */
    private Long tenantId;

    /** 品牌对象 */
    @TableField(exist = false)
    private XlBrandClassify brand;

    /** 项目对象 */
    @TableField(exist = false)
    private XlProjectClassify project;

}
