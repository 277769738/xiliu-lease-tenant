package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author xiliu
 * @description
 * @date 2023/3/23
 */
@ApiModel("管理后台 - 导入返回信息")
@Data
@Builder
public class ImportRespVo {

    @ApiModelProperty(value = "创建成功的数组", required = true)
    private List<String> createNames;

    @ApiModelProperty(value = "更新成功的数组", required = true)
    private List<String> updateNames;

    @ApiModelProperty(value = "导入失败的集合,key 为名称，value 为失败原因", required = true)
    private Map<String, String> failureNames;
}
