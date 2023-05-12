package com.xiliu.server.modules.house.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlHouseSubscribe;

import java.util.List;

/**
 * @author huoqiang
 * @description ${description}
 * @date 2023/4/20
 */
public interface XlHouseSubscribeMapper extends BaseMapper<XlHouseSubscribe> {
    /**
     * 查询房间预订表
     * @param subscribeId 房间预订表主键
     * @return 房间预订表
     */
    XlHouseSubscribe selectXlHouseSubscribeBySubscribeId(Long subscribeId);

    /**
     * 查询房间预订表列表
     * @param xlHouseSubscribe 房间预订表
     * @return 房间预订表集合
     */
    List<XlHouseSubscribe> selectXlHouseSubscribeList(XlHouseSubscribe xlHouseSubscribe);

}