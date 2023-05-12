package com.xiliu.server.modules.platform.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.Date;

/**
 * @author 租户列表返回结果VO
 * @description
 * @date 2023/3/7
 */
@ApiModel("管理后台 - 租户列表返回信息")
@Data
public class TenantResultVo {

    private Long tenantId;

    /** 租户类型;0:公司;1:部门;2:个人;3:其他 */
    private String tenantType;

    /** 用户状态;0:正常,1:停用 */
    private String tenantStatus;

    /** 名称 */
    private String tenantName;

    /** logo图 */
    private String tenantLogo;

    /** 管理员账号 */
    private String userName;

    /** 租户套餐 */
    private Long packageId;

    /** 租赁到期时间 */
    private Date tenantTime;
}
