package com.xiliu.server.modules.house.service.impl;

import java.util.List;
import java.util.Arrays;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.common.constant.DictTypeConstants;
import com.xiliu.server.modules.house.entity.XlHouseFee;
import com.xiliu.server.modules.house.mapper.XlHouseFeeMapper;
import com.xiliu.server.modules.house.service.IXlHouseFeeService;
import com.xiliu.server.modules.house.vo.RoomFeeVo;
import com.xiliu.server.modules.system.entity.XlDictData;
import com.xiliu.server.modules.system.service.IXlDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 房源其他费用表Service业务层处理
 *
 * @author xiliu
 * @date 2023-04-04
 */
@Service
public class XlHouseFeeServiceImpl extends ServiceImpl<XlHouseFeeMapper, XlHouseFee> implements IXlHouseFeeService {
    @Autowired
    private XlHouseFeeMapper xlHouseFeeMapper;
    @Autowired
    private IXlDictDataService dictDataService;

    /**
     * 查询房源其他费用表
     * @param feeId 房源其他费用表主键
     * @return 房源其他费用表
     */
    @Override
    public XlHouseFee selectXlHouseFeeByFeeId(Long feeId) {
        return xlHouseFeeMapper.selectXlHouseFeeByFeeId(feeId);
    }

    /**
     * 查询房源其他费用表列表
     * @param xlHouseFee 房源其他费用表
     * @return 房源其他费用表
     */
    @Override
    public List<XlHouseFee> selectXlHouseFeeList(XlHouseFee xlHouseFee) {
        return xlHouseFeeMapper.selectXlHouseFeeList(xlHouseFee);
    }

    /**
     * 新增房源其他费用表
     * @param xlHouseFee 房源其他费用表
     * @return 结果
     */
    @Override
    public boolean create(XlHouseFee xlHouseFee) {
        return save(xlHouseFee);
    }

    /**
     * 修改房源其他费用表
     * @param xlHouseFee 房源其他费用表
     * @return 结果
     */
    @Override
    public boolean update(XlHouseFee xlHouseFee) {
        return updateById(xlHouseFee);
    }

    /**
     * 批量删除房源其他费用表
     * @param feeIds 需要删除的房源其他费用表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseFeeByFeeIds(Long[] feeIds) {
        return xlHouseFeeMapper.deleteBatchIds(Arrays.asList(feeIds));
    }

    /**
     * 删除房源其他费用表信息
     * @param feeId 房源其他费用表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseFeeByFeeId(Long feeId) {
        return xlHouseFeeMapper.deleteById(feeId);
    }

    @Override
    public RoomFeeVo getHouseFeeInfo(Long houseId) {
        RoomFeeVo roomFeeVo = new RoomFeeVo();
        List<XlHouseFee> dbFees = list(new LambdaQueryWrapper<XlHouseFee>().eq(XlHouseFee::getHouseId,houseId).eq(XlHouseFee::getFeeType,"db"));
        List<XlHouseFee> qtFees = list(new LambdaQueryWrapper<XlHouseFee>().eq(XlHouseFee::getHouseId,houseId).eq(XlHouseFee::getFeeType,"qt"));
        if (CollectionUtil.isNotEmpty(qtFees)) {
            // 其他费用项
            List<XlDictData> dictDatas = dictDataService.selectDictDataByType(DictTypeConstants.QT_FEE_TYPE);
            for (XlHouseFee xlHouseFee : qtFees) {
                for (XlDictData dictData : dictDatas) {
                    if (xlHouseFee.getFeeDbType().equals(dictData.getDictValue())) {
                        xlHouseFee.setQtTypeName(dictData.getDictLabel());
                    }
                }
            }
        }
        roomFeeVo.setDbs(dbFees);
        roomFeeVo.setQts(qtFees);
        return roomFeeVo;
    }
}