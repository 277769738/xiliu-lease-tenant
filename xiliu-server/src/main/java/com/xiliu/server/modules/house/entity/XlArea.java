package com.xiliu.server.modules.house.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.xiliu.common.domain.BaseEntity;

/**
 * 省市区表对象 xl_area
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_area")
public class XlArea extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键id */
    @ApiModelProperty("主键ID")
    @TableId(value = "area_id", type = IdType.AUTO)
    private Long areaId;

    /** 上级区域id */
    private Long parentId;

    /** 名称 */
    private String name;

    /** 区域类型：0 省 1 市 2 区 */
    private Long type;


}
