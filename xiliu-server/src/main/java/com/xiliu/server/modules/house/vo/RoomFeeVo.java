package com.xiliu.server.modules.house.vo;

import com.xiliu.server.modules.house.entity.XlHouseFee;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class RoomFeeVo {

    @ApiModelProperty("度表费用集合")
    private List<XlHouseFee> dbs;

    @ApiModelProperty("其他费用集合")
    private List<XlHouseFee> qts;
}
