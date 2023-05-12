package com.xiliu.server.modules.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 租户表对象 xl_tenant
 *
 * @author xiliu
 * @date 2023-03-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("xl_tenant")
public class XlTenant extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 租户ID */
    @ApiModelProperty("主键ID")
    @TableId(value = "tenant_id", type = IdType.AUTO)
    private Long tenantId;

    /** 租户类型;0:公司;1:部门;2:个人;3:其他 */
    private String tenantType;

    /** 用户状态;0:正常,1:停用 */
    private String tenantStatus;

    /** 编码 */
    private String tenantCode;

    /** 名称 */
    private String tenantName;

    /** logo图 */
    private String tenantLogo;

    /** 显示顺序 */
    private Long sortOrder;

    /** 官方地址 */
    private String homeUrl;

    /** 电话 */
    private String phone;

    /** 传真 */
    private String fax;

    /** 邮箱 */
    private String email;

    /** 地址 */
    private String address;

    /** 管理员账号 */
    private String userName;

    /** 管理员密码 */
    private String userPwd;

    /** 租户套餐 */
    private Long packageId;

    /** 租赁到期时间 */
    private Date tenantTime;

    /** 备注 */
    private String remarks;
}
