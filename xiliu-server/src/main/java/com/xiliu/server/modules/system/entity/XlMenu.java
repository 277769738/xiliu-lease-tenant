package com.xiliu.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author xiliu
 * @since 2022-07-03
 */
@Getter
@Setter
@TableName("xl_menu")
@ApiModel(value = "XlMenu对象", description = "菜单表")
public class XlMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("菜单ID")
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Long menuId;

    @ApiModelProperty("菜单名")
    private String menuName;

    @ApiModelProperty("菜单编码")
    private String menuCode;

    @ApiModelProperty("权限字符串")
    private String permission;

    @ApiModelProperty("图标")
    private String icon;

    @ApiModelProperty("菜单级别")
    private Long menuLevel;

    @ApiModelProperty("排序")
    private Integer sort;

    @ApiModelProperty("父ID")
    private Long parentId;

    @ApiModelProperty("菜单类型;0:目录,1:菜单,2:按钮")
    private String menuType;

    @ApiModelProperty("菜单状态;0正常 1停用")
    private Integer status;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("路由地址")
    private String path;

    @ApiModelProperty("组件路径")
    private String component;

    @ApiModelProperty("路由参数")
    private String routerQuery;

    @ApiModelProperty("是否为外链（0否 1是）")
    private Integer isFrame;

    @ApiModelProperty("菜单状态;0:隐藏 1:显示")
    private Integer visible;

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
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long version;

    /** 子菜单 */
    @TableField(exist = false)
    private List<XlMenu> children = new ArrayList<>();
}
