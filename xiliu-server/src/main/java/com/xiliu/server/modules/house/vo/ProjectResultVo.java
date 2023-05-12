package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author xiliu
 * @description 精简信息Vo
 * @date 2023/3/17
 */
@ApiModel("管理后台 - 项目分类返回信息")
@Data
public class ProjectResultVo {

    @ApiModelProperty("主键ID")
    private Long classifyId;

    @ApiModelProperty("项目分类名称")
    private String classifyName;

    @ApiModelProperty("简介")
    private String remarks;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;
}
