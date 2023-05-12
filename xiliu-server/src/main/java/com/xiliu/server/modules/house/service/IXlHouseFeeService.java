package com.xiliu.server.modules.house.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlHouseFee;
import com.xiliu.server.modules.house.vo.RoomFeeVo;

import java.util.List;

/**
 * 房源表Service接口
 *
 * @author xiliu
 * @date 2023-04-04
 */
public interface IXlHouseFeeService extends IService<XlHouseFee>{
    /**
     * 查询房源其他费用表
     * @param feeId 房源其他费用表主键
     * @return 房源其他费用表
     */
    XlHouseFee selectXlHouseFeeByFeeId(Long feeId);

    /**
     * 查询房源其他费用表列表
     * @param xlHouseFee 房源其他费用表
     * @return 房源其他费用表集合
     */
    List<XlHouseFee> selectXlHouseFeeList(XlHouseFee xlHouseFee);

    /**
     * 新增房源其他费用表
     * @param xlHouseFee 房源其他费用表
     * @return 结果
     */
    boolean create(XlHouseFee xlHouseFee);

    /**
     * 修改房源其他费用表
     * @param xlHouseFee 房源其他费用表
     * @return 结果
     */
    boolean update(XlHouseFee xlHouseFee);

    /**
     * 批量删除房源其他费用表
     *
     * @param feeIds 需要删除的房源其他费用表主键集合
     * @return 结果
     */
    int deleteXlHouseFeeByFeeIds(Long[] feeIds);

    /**
     * 删除房源其他费用表信息
     *
     * @param feeId 房源其他费用表主键
     * @return 结果
     */
    int deleteXlHouseFeeByFeeId(Long feeId);

    /**
     * 获取房源其他费用
     * @param houseId 房源id
     * @return 结果
     */
    RoomFeeVo getHouseFeeInfo(Long houseId);
}
