package com.xiliu.server.modules.house.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlHouseSubscribe;

import java.util.List;

/**
 * @author huoqiang
 * @description ${description}
 * @date 2023/4/20
 */
public interface IXlHouseSubscribeService extends IService<XlHouseSubscribe> {
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

    /**
     * 新增房间预订表
     * @param xlHouseSubscribe 房间预订表
     * @return 结果
     */
    boolean create(XlHouseSubscribe xlHouseSubscribe);

    /**
     * 修改房间预订表
     * @param xlHouseSubscribe 房间预订表
     * @return 结果
     */
    boolean update(XlHouseSubscribe xlHouseSubscribe);

    /**
     * 批量删除房间预订表
     *
     * @param subscribeIds 需要删除的房间预订表主键集合
     * @return 结果
     */
    int deleteXlHouseSubscribeBySubscribeIds(Long[] subscribeIds);

    /**
     * 删除房间预订表信息
     *
     * @param subscribeId 房间预订表主键
     * @return 结果
     */
    int deleteXlHouseSubscribeBySubscribeId(Long subscribeId);
}
