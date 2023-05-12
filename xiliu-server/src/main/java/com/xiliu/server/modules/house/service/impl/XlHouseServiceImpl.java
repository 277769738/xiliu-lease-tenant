package com.xiliu.server.modules.house.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.common.constant.DictTypeConstants;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.common.exception.ServiceException;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.entity.XlHouseFee;
import com.xiliu.server.modules.house.mapper.XlHouseMapper;
import com.xiliu.server.modules.house.service.IXlApartmentService;
import com.xiliu.server.modules.house.service.IXlHouseFeeService;
import com.xiliu.server.modules.house.service.IXlHouseService;
import com.xiliu.server.modules.house.vo.*;
import com.xiliu.server.modules.system.entity.XlDictData;
import com.xiliu.server.modules.system.service.IXlDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 房源表Service业务层处理
 *
 * @author xiliu
 * @date 2023-04-04
 */
@Service
public class XlHouseServiceImpl extends ServiceImpl<XlHouseMapper, XlHouse> implements IXlHouseService {
    @Autowired
    private XlHouseMapper xlHouseMapper;
    @Autowired
    private IXlHouseFeeService houseFeeService;
    @Autowired
    private IXlApartmentService apartmentService;
    @Autowired
    private IXlDictDataService dictDataService;

    /**
     * 查询房源表
     * @param houseId 房源表主键
     * @return 房源表
     */
    @Override
    public XlHouse selectXlHouseByHouseId(Long houseId) {
        return xlHouseMapper.selectXlHouseByHouseId(houseId);
    }

    /**
     * 查询房源表列表
     * @param xlHouse 房源表
     * @return 房源表
     */
    @Override
    public List<XlHouse> selectXlHouseList(XlHouse xlHouse) {
        return xlHouseMapper.selectXlHouseList(xlHouse);
    }

    /**
     * 新增房源表
     * @param vo 房源集合
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean create(RoomRequestVo vo) {
        boolean flag = true;
        if (CollectionUtil.isNotEmpty(vo.getRoomList())) {
            for (XlHouse house : vo.getRoomList()) {
                // 先新增房源
                house.setApartmentId(vo.getApartmentId());
                house.setHireType("zz");
                house.setHouseType("jzs");
                flag = save(house);
                // 再新增费用
                if (flag && house.getFee() != null) {
                    flag = this.saveHouseFee(house,house.getFee().getDbs(),"db");
                    if (flag) {
                        flag = this.saveHouseFee(house,house.getFee().getQts(),"qt");
                    }
                }
            }
        }
        return flag;
    }
    private boolean saveHouseFee(XlHouse xlHouse, List<XlHouseFee> dbs, String type) {
        List<XlHouseFee> addList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(dbs)) {
            for(XlHouseFee fee : dbs) {
                XlHouseFee newFee = new XlHouseFee();
                newFee.setApartmentId(xlHouse.getApartmentId());
                newFee.setHouseId(xlHouse.getHouseId());
                newFee.setFeeType(type);
                newFee.setFeeDbType(fee.getFeeDbType());
                newFee.setFeeCollectType(fee.getFeeCollectType());
                addList.add(newFee);
            }
        }
        if (CollectionUtil.isNotEmpty(addList)) {
            return houseFeeService.saveBatch(addList);
        }
        return true;
    }
    /**
     * 修改房源表
     * @param xlHouse 房源表
     * @return 结果
     */
    @Override
    public boolean update(XlHouse xlHouse) {
        return updateById(xlHouse);
    }

    /**
     * 批量删除房源表
     * @param houseIds 需要删除的房源表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseByHouseIds(Long[] houseIds) {
        return xlHouseMapper.deleteBatchIds(Arrays.asList(houseIds));
    }

    /**
     * 删除房源表信息
     * @param houseId 房源表主键
     * @return 结果
     */
    @Override
    public int deleteXlHouseByHouseId(Long houseId) {
        return xlHouseMapper.deleteById(houseId);
    }

    @Override
    public List<RoomListRespVo> getRoomList(XlHouse xlHouse) {
        List<XlHouse> list = xlHouseMapper.selectXlHouseList(xlHouse);
        if (CollectionUtil.isNotEmpty(list)) {
            List<RoomListRespVo> newList = list.stream().map(
                    item -> {
                        RoomListRespVo vo = new RoomListRespVo();
                        BeanUtil.copyProperties(item,vo);
                        vo.setUnitType(this.setUnitTypeName(item));
                        vo.setApartmentName(item.getApartment().getApartmentName());
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    @Override
    public RoomDetailRespVo getRoomDetail(Long houseId) {
        RoomDetailRespVo vo = new RoomDetailRespVo();
        XlHouse house = xlHouseMapper.selectXlHouseByHouseId(houseId);
        BeanUtil.copyProperties(house,vo);
        return vo;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ImportRespVo importRoomList(List<Map<String, String>> imports, boolean isUpdateSupport) {
        if (CollectionUtil.isEmpty(imports)) {
            throw new ServiceException("导入数据不能为空！");
        }
        ImportRespVo respVO = ImportRespVo.builder().createNames(new ArrayList<>())
                .updateNames(new ArrayList<>()).failureNames(new LinkedHashMap<>()).build();
        imports.forEach(importRoom -> {
            // 校验公寓是否存在
            XlApartment apartment = apartmentService.getOne(new LambdaQueryWrapper<XlApartment>().eq(XlApartment::getApartmentName,importRoom.get("公寓名称")),false);
            if (apartment == null) {
                respVO.getFailureNames().put(importRoom.get("公寓名称"), "公寓不存在！");
                return;
            }
            // 校验收费项目是否含水费、电费
            if (StringUtils.isBlank(importRoom.get("水费"))) {
                respVO.getFailureNames().put(importRoom.get("公寓名称"), "水费不存在！请添加");
                return;
            }
            // 校验收费项目是否含水费、电费
            if (StringUtils.isBlank(importRoom.get("电费"))) {
                respVO.getFailureNames().put(importRoom.get("公寓名称"), "电费不存在！请添加");
                return;
            }
            // 其他费用项
            List<XlDictData> dictDatas = dictDataService.selectDictDataByType(DictTypeConstants.QT_FEE_TYPE);
            // 校验其他收费项目是否存在
            Iterator iter = importRoom.entrySet().iterator();
            int index = 0;
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                if ("电费".equals(entry.getKey())) {
                    index += 1;
                    continue;
                }
                if (index >= 1 && !dictDatas.stream().filter(w -> entry.getKey().equals(w.getDictLabel())).findAny().isPresent()) {
                    respVO.getFailureNames().put(importRoom.get("房间号"), "【" + entry.getKey() + "】收费项不存在！请添加");
                    return;
                }
            }
            // 校验房源是否存在
            XlHouse house = getOne(new LambdaQueryWrapper<XlHouse>().eq(XlHouse::getApartmentId,apartment).eq(XlHouse::getFloor,importRoom.get("所在楼层")).eq(XlHouse::getHouseNo,importRoom.get("房间号")),false);
            if (house == null) {
                house = new XlHouse();
                house.setApartmentId(apartment.getApartmentId());
                house.setHouseType("jzs");
                house.setHireType("zz");
                house.setState(1L);
                this.coventHouse(house,importRoom);
                save(house);
                respVO.getCreateNames().add(importRoom.get("房间号"));
            } else {
                // 如果存在，判断是否允许更新
                if (!isUpdateSupport) {
                    respVO.getFailureNames().put(importRoom.get("房间号"), "房源已存在");
                    return;
                }
                this.coventHouse(house,importRoom);
                updateById(house);
                respVO.getUpdateNames().add(importRoom.get("房间号"));
            }
            // 保存费用
            this.saveHouseFee(house,importRoom);
        });
        return respVO;
    }

    @Override
    public Map<String, Object> getHouseCount(Long apartmentId) {
        return baseMapper.getHouseCount(apartmentId);
    }

    @Override
    public List<CentralizeRoomVo> getCentralizeRoomList(Long apartmentId) {
        return baseMapper.getCentralizeRoomList(apartmentId);
    }

    @Override
    public String setUnitTypeName(XlHouse xlHouse) {
        String name = Optional.ofNullable(xlHouse.getRoom()).orElse(0L) + "室" +
                Optional.ofNullable(xlHouse.getHall()).orElse(0L) + "厅" +
                Optional.ofNullable(xlHouse.getToilet()).orElse(0L) + "卫";
        return name;
    }

    private XlHouse coventHouse(XlHouse house, Map<String, String> importRoom) {
        house.setFloor(Long.valueOf(importRoom.get("所在楼层")));
        house.setHouseNo(importRoom.get("房间号"));
        house.setRoom(Long.valueOf(importRoom.get("室")));
        house.setHall(Long.valueOf(importRoom.get("厅")));
        house.setToilet(Long.valueOf(importRoom.get("卫")));
        house.setArea(new BigDecimal(importRoom.get("面积")));
        house.setMoney(new BigDecimal(importRoom.get("租金")));
        house.setDeposit(new BigDecimal(importRoom.get("押金")));
        // 押金除以租金， 得到商数、余数, 余数为0，则能被整除
        BigDecimal[] num = house.getDeposit().divideAndRemainder(house.getMoney());
        if (num[1].compareTo(BigDecimal.ZERO) == 0) {
            // 押几
            house.setDepositNum(String.valueOf(num[0]));
        } else {
            // 押自定
            house.setDepositNum("0");
        }
        house.setPayNum("1");
        return house;
    }

    private boolean saveHouseFee(XlHouse house, Map<String, String> map) {
        // 先删除
        List<XlHouseFee> removeList = houseFeeService.list(new LambdaQueryWrapper<XlHouseFee>().eq(XlHouseFee::getHouseId, house.getHouseId()));
        houseFeeService.removeBatchByIds(removeList);
        // 再新增
        List<XlHouseFee> addList = new ArrayList<>();
        if (StringUtils.isNotBlank(map.get("电费"))) {
            XlHouseFee newFee = new XlHouseFee();
            newFee.setApartmentId(house.getApartmentId());
            newFee.setHouseId(house.getHouseId());
            newFee.setFeeType("db");
            newFee.setFeeDbType("df");
            newFee.setFeeAmount(new BigDecimal(map.get("电费")));
            addList.add(newFee);
        }
        if (StringUtils.isNotBlank(map.get("水费"))) {
            XlHouseFee newFee = new XlHouseFee();
            newFee.setApartmentId(house.getApartmentId());
            newFee.setHouseId(house.getHouseId());
            newFee.setFeeType("db");
            newFee.setFeeDbType("sf");
            newFee.setFeeAmount(new BigDecimal(map.get("水费")));
            addList.add(newFee);
        }
        // 其他费用项
        List<XlDictData> dictDatas = dictDataService.selectDictDataByType(DictTypeConstants.QT_FEE_TYPE);
        for (String key : map.keySet()) {
            // 判断是否有该费用项
            for (XlDictData dictData : dictDatas) {
                if (dictData.getDictLabel().equals(key)) {
                    //说明有
                    XlHouseFee newFee = new XlHouseFee();
                    newFee.setApartmentId(house.getApartmentId());
                    newFee.setHouseId(house.getHouseId());
                    newFee.setFeeType("qt");
                    newFee.setFeeDbType(dictData.getDictValue());
                    newFee.setFeeAmount(new BigDecimal(map.get(key)));
                    addList.add(newFee);
                }
            }
        }
        if (CollectionUtil.isNotEmpty(addList)) {
            return houseFeeService.saveBatch(addList);
        }
        return true;
    }
}