package com.xiliu.server.modules.house.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author xiliu
 * @description
 * @date 2023/4/18
 */
@ApiModel("管理后台 - 集中式独栋返回信息")
@Data
public class CentralizeRespVo {

    private String name;

    private Long apartmentId;

    private Map<String, Object> counts;

    private List<CentralizeRoomVo> roomList;

    private Set<Long> floorList;
}
