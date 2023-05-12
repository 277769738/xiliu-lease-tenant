package com.xiliu.server.modules.system.vo;


import com.xiliu.common.domain.BasePageEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author xiliu
 * @description
 * @date 2021/9/2
 */
@Data
public class MemberQueryVo extends BasePageEntity {

    @ApiModelProperty(value = "用户名")
    private String userName;
}
