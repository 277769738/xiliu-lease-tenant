package com.xiliu.server.modules.services.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 用户分配项目表对象 xl_user_project
 *
 * @author xiliu
 * @date 2023-03-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_user_project")
@ApiModel(value = "xl_user_project对象}", description = "用户分配项目表")
public class XlUserProject extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "user_project_id", type = IdType.AUTO)
    private Long userProjectId;

    /** 用户id */
    @ApiModelProperty("用户id")
    private Long userId;

    /** 用户id */
    @ApiModelProperty("项目id")
    private Long projectId;

    /** 公寓ID */
    @ApiModelProperty("公寓ID")
    private Long apartmentId;

    /** 租户ID */
    @ApiModelProperty("租户ID")
    private Long tenantId;
}
