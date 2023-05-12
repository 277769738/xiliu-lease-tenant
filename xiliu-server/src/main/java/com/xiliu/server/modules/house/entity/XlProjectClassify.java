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
 * 项目分类表对象 xl_project_classify
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_project_classify")
public class XlProjectClassify extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "classify_id", type = IdType.AUTO)
    private Long classifyId;

    /** 项目分类名称 */
    private String classifyName;

    /** 项目分类简介 */
    private String remarks;

    /** 公寓ID */
    private Long apartmentId;

    /** 租户ID */
    private Long tenantId;



}
