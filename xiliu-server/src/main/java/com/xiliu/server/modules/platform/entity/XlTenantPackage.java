package com.xiliu.server.modules.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 租户套餐表对象 xl_tenant_package
 *
 * @author xiliu
 * @date 2023-03-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_tenant_package")
public class XlTenantPackage extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 套餐id */
    @ApiModelProperty("主键ID")
    @TableId(value = "package_id", type = IdType.AUTO)
    private Long packageId;

    /** 名称 */
    private String packageName;

    /** 关联菜单id */
    private String menuIds;

    /** 状态;0:正常,1:停用 */
    private String status;

    /** 备注 */
    private String remarks;

}
