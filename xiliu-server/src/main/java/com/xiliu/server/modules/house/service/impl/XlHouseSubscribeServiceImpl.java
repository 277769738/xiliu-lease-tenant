package com.xiliu.server.modules.house.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.entity.XlHouseSubscribe;
import com.xiliu.server.modules.house.mapper.XlHouseSubscribeMapper;
import com.xiliu.server.modules.house.service.IXlHouseService;
import com.xiliu.server.modules.house.service.IXlHouseSubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author xiliu
 * @description
 * @date 2023/4/20
 */
@Service
public class XlHouseSubscribeServiceImpl extends ServiceImpl<XlHouseSubscribeMapper, XlHouseSubscribe> implements IXlHouseSubscribeService {
    @Autowired
    private XlHouseSubscribeMapper xlHouseSubscribeMapper;
    @Autowired
    private IXlHouseService houseService;

    /**
     * 查询房间预订表
     * @param subscribeId 房间预订表主键
     * @return 房间预订表
     */
    @Override
    public XlHouseSubscribe selectXlHouseSubscribeBySubscribeId(Long subscribeId) {
        return xlHouseSubscribeMapper.selectXlHouseSubscribeBySubscribeId(subscribeId);
    }

    /**
     * 查询房间预订表列表
     * @param xlHouseSubscribe 房间预订表
     * @return 房间预订表
     */
    @Override
    public List<XlHouseSubscribe> selectXlHouseSubscribeList(XlHouseSubscribe xlHouseSubscribe) {
        return xlHouseSubscribeMapper.selectXlHouseSubscribeList(xlHouseSubscribe);
    }

    /**
     * 新增房间预订表
     * @param xlHouseSubscribe 房间预订表
     * @return 结果
     */
    @Override
    public boolean create(XlHouseSubscribe xlHouseSubscribe) {
        XlHouse xlHouse = houseService.getById(xlHouseSubscribe.getHouseId());
        if (xlHouse != null && xlHouse.getState().intValue() != 5) {
            xlHouse.setState(5L);
            houseService.updateById(xlHouse);
            return save(xlHouseSubscribe);
        }
        return false;
    }

    /**
     * 修改房间预订表
     * @param xlHouseSubscribe 房间预订表
     * @return 结果
     */
    @Override
    public boolean update(XlHouseSubscribe xlHouseSubscribe) {
        return updateById(xlHouseSubscribe);
    }

    /**
     * 批量删除房间预订表
     * @param subscribeIds 需要删除的房间预订表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseSubscribeBySubscribeIds(Long[] subscribeIds) {
        return xlHouseSubscribeMapper.deleteBatchIds(Arrays.asList(subscribeIds));
    }

    /**
     * 删除房间预订表信息
     * @param subscribeId 房间预订表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseSubscribeBySubscribeId(Long subscribeId) {
        return xlHouseSubscribeMapper.deleteById(subscribeId);
    }
}
