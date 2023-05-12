package com.xiliu.server.modules.system.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author huoqiang
 * @description
 * @date 2021/9/6
 */
@Data
public class LoginVo implements Serializable{

    @ApiModelProperty(value = "用户名")
    private String userName;

    @ApiModelProperty(value = "密码")
    private String passWord;

    @ApiModelProperty(value = "验证码随机字符串")
    private String nonceStr;

    @ApiModelProperty(value = "验证值")
    private String value;
}
