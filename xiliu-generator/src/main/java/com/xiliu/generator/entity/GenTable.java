package com.xiliu.generator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.generator.constant.GenConstants;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author xiliu
 * @description 业务表 gen_table
 * @date 2022/7/14
 */
@Data
@TableName("gen_table")
@ApiModel(value = "GenTable对象", description = "代码生成业务表")
public class GenTable extends BaseEntity{

    @ApiModelProperty("主键ID")
    @TableId(value = "table_id", type = IdType.AUTO)
    private Long tableId;

    /** 表名称 */
    @NotBlank(message = "表名称不能为空")
    private String tableName;

    /** 表描述 */
    @NotBlank(message = "表描述不能为空")
    private String tableComment;

    /** 关联父表的表名 */
    private String subTableName;

    /** 本表关联父表的外键名 */
    private String subTableFkName;

    /** 实体类名称(首字母大写) */
    @NotBlank(message = "实体类名称不能为空")
    private String className;

    /** 使用的模板（crud单表操作 tree树表操作 sub主子表操作） */
    private String tplCategory;

    /** 生成包路径 */
    @NotBlank(message = "生成包路径不能为空")
    private String packageName;

    /** 生成模块名 */
    @NotBlank(message = "生成模块名不能为空")
    private String moduleName;

    /** 生成业务名 */
    @NotBlank(message = "生成业务名不能为空")
    private String businessName;

    /** 生成功能名 */
    @NotBlank(message = "生成功能名不能为空")
    private String functionName;

    /** 生成作者 */
    @NotBlank(message = "作者不能为空")
    private String functionAuthor;

    /** 生成代码方式（0zip压缩包 1自定义路径） */
    private String genType;

    /** 生成路径（不填默认项目路径） */
    private String genPath;

    /** 主键信息 */
    @TableField(exist = false)
    private GenTableColumn pkColumn;

    /** 子表信息 */
    @TableField(exist = false)
    private GenTable subTable;

    /** 表列信息 */
    @TableField(exist = false)
    private List<GenTableColumn> columns;

    /** 其它生成选项 */
    private String options;

    /** 树编码字段 */
    @TableField(exist = false)
    private String treeCode;

    /** 树父编码字段 */
    @TableField(exist = false)
    private String treeParentCode;

    /** 树名称字段 */
    @TableField(exist = false)
    private String treeName;

    /** 上级菜单ID字段 */
    @TableField(exist = false)
    private String parentMenuId;

    /** 上级菜单名称字段 */
    @TableField(exist = false)
    private String parentMenuName;

    public boolean isCrud() {
        return isCrud(this.tplCategory);
    }

    public static boolean isCrud(String tplCategory) {
        return tplCategory != null && StringUtils.equals(GenConstants.TPL_CRUD, tplCategory);
    }

    public boolean isTree() {
        return isTree(this.tplCategory);
    }

    public static boolean isTree(String tplCategory) {
        return tplCategory != null && StringUtils.equals(GenConstants.TPL_TREE, tplCategory);
    }
}
