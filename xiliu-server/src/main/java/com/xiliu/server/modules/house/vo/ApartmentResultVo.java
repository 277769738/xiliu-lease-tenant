package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author xiliu
 * @description
 * @date 2023/3/23
 */
@ApiModel("管理后台 - 公寓列表返回精简信息")
@Data
public class ApartmentResultVo {

    @ApiModelProperty("主键ID")
    private Long apartmentId;

    @ApiModelProperty("名称")
    private String apartmentName;

    @ApiModelProperty("公寓类型")
    private String apartmentType;

    /** 品牌分类id */
    private Long brandId;

    @ApiModelProperty("品牌名称")
    private String brandName;

    /** 项目分类id */
    private Long projectId;

    @ApiModelProperty("项目名称")
    private String projectName;

    @ApiModelProperty("地址")
    private String address;

    /** 楼层数 */
    private Long floorNum;

    @ApiModelProperty("房源数")
    private Integer houseNum;

    /** 省 */
    private String province;

    /** 市 */
    private String city;

    /** 区县 */
    private String county;

    /** 详细地址 */
    private String detailAddress;

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

    /** 简介 */
    private String remarks;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;
}
