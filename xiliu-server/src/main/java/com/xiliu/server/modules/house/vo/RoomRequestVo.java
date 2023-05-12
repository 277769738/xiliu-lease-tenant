package com.xiliu.server.modules.house.vo;

import com.xiliu.server.modules.house.entity.XlHouse;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class RoomRequestVo {

    @ApiModelProperty("房源集合")
    private List<XlHouse> roomList;

    @ApiModelProperty("公寓ID")
    private Long apartmentId;
}
