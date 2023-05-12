package com.xiliu.server.modules.house.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlHouseFee;

import java.util.List;


/**
 * 房源其他费用表Mapper接口
 *
 * @author xiliu
 * @date 2023-04-04
 */
public interface XlHouseFeeMapper extends BaseMapper<XlHouseFee>{
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

}