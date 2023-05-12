package com.xiliu.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 角色和菜单关联表
 * </p>
 *
 * @author xiliu
 * @since 2022-07-06
 */
@Getter
@Setter
@TableName("xl_role_menu")
@ApiModel(value = "XlRoleMenu对象", description = "角色和菜单关联表")
public class XlRoleMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键id")
    @TableId(value = "role_menu_id", type = IdType.AUTO)
    private Long roleMenuId;

    @ApiModelProperty("角色ID")
    private Long roleId;

    @ApiModelProperty("菜单ID")
    private Long menuId;

    @ApiModelProperty("租户ID")
    private Long tenantId;

    @TableField(fill = FieldFill.UPDATE)
    @ApiModelProperty("修改时间")
    private Date updatedTime;

    @ApiModelProperty("修改人的id")
    private Long updatedBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;

    @ApiModelProperty("创建人的id")
    private Long createdBy;

    @ApiModelProperty("逻辑删除 1已删除 0未删除")
    private Boolean deleted;

    @ApiModelProperty("数据版本")
    private Long version;


}
