package com.xiliu.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author xiliu
 * @since 2022-07-01
 */
@Data
@TableName("xl_role")
@NoArgsConstructor
@ApiModel(value = "XlRole对象", description = "角色表")
public class XlRole extends BaseEntity<XlRole> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("角色ID")
    @TableId(value = "role_id", type = IdType.AUTO)
    private Long roleId;

    @ApiModelProperty("角色名称")
    private String roleName;

    @ApiModelProperty("角色描述")
    private String description;

    @ApiModelProperty("状态;0正常 1停用")
    private Integer status;

    @ApiModelProperty("数据范围（1：所有数据权限；2：自定义数据权限；3：本部门数据权限；4：本部门及以下数据权限；5：仅本人数据权限） ")
    private String dataScope;

    @ApiModelProperty("菜单树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）")
    private boolean menuCheckStrictly;

    @ApiModelProperty("部门树选择项是否关联显示（0：父子不互相关联显示 1：父子互相关联显示 ）")
    private boolean deptCheckStrictly;

    @ApiModelProperty("角色权限")
    private String roleKey;

    @ApiModelProperty("租户ID")
    private Long tenantId;

    /** 菜单组 */
    @TableField(exist = false)
    private Long[] menuIds;

    /** 部门组（数据权限） */
    @TableField(exist = false)
    private Long[] deptIds;

    /** 角色菜单权限 */
    @TableField(exist = false)
    private Set<String> permissions;

    public boolean isAdmin() {
        return isAdmin(this.roleId);
    }

    public static boolean isAdmin(Long roleId) {
        return roleId != null && 1L == roleId;
    }

    public XlRole(Long roleId) {
        this.roleId = roleId;
    }
}
