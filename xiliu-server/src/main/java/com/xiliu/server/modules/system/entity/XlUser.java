package com.xiliu.server.modules.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.xiliu.common.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 用户表
 * </p>
 * @author xiliu
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="XlUser对象", description="用户表")
public class XlUser extends BaseEntity<XlUser> {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    @ApiModelProperty(value = "用户类型;1:admin;2:会员")
    private Integer userType;

    @ApiModelProperty(value = "用户名")
    private String userCode;

    @ApiModelProperty(value = "密码")
    private String passWord;

    @ApiModelProperty(value = "姓名")
    private String realName;

    @ApiModelProperty(value = "用户昵称")
    private String userNickname;

    @ApiModelProperty(value = "邮箱")
    private String userEmail;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "中国手机不带国家代码，国际手机号格式为：国家代码-手机号")
    private String mobile;

    @ApiModelProperty(value = "性别 0：未知；1：男；2：女")
    private Integer sex;

    @ApiModelProperty(value = "出生年月")
    private Date birthday;

    @ApiModelProperty(value = "用户状态;0正常 1停用")
    private Integer status;

    @ApiModelProperty(value = "入职时间")
    private Date entryDate;

    @ApiModelProperty(value = "员工编号")
    private String userNumber;

    @ApiModelProperty(value = "身份证号码")
    private String idNo;

    @ApiModelProperty(value = "最后登录时间")
    private Date lastLoginTime;

    @ApiModelProperty(value = "最后登录ip")
    private String lastLoginIp;

    @ApiModelProperty(value = "所属部门id")
    private Long deptId;

    @ApiModelProperty(value = "租户id")
    private Long tenantId;

    /** 角色对象 */
    @TableField(exist = false)
    private List<XlRole> roles;

    /** 角色组 */
    @TableField(exist = false)
    private Long[] roleIds;

    /** 部门对象 */
    @TableField(exist = false)
    private XlDept dept;

    /** 角色ID */
    @TableField(exist = false)
    private Long roleId;

    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId) {
        return userId != null && 1L == userId;
    }
}
