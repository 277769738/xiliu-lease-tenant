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
 * 用户角色关联表
 * </p>
 *
 * @author xiliu
 * @since 2022-07-08
 */
@Getter
@Setter
@TableName("xl_user_role")
@ApiModel(value = "XlUserRole对象", description = "用户角色关联表")
public class XlUserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    @TableId(value = "user_role_id", type = IdType.AUTO)
    private Long userRoleId;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("角色ID")
    private Long roleId;

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

    @ApiModelProperty(value = "租户id")
    private Long tenantId;
}
