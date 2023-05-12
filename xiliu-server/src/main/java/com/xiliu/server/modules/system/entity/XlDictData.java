package com.xiliu.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 字典数据表对象 xl_dict_data
 * 
 * @author xiliu
 * @date 2022-08-25
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_dict_data")
public class XlDictData extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "dict_data_id", type = IdType.AUTO)
    private Long dictDataId;

    /** 字典类型 */
    private String dictType;

    /** 字典名称 */
    private String dictLabel;

    /** 字典值 */
    private String dictValue;

    /** 显示顺序 */
    private Long sort;

    /** 是否默认（Y是 N否） */
    private String isDefault;

    /** 表格回显样式 */
    private String listClass;

    /** 状态（0正常 1停用） */
    private Integer status;

    /** 备注 */
    private String remark;

}
