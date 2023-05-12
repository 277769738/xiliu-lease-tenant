package com.xiliu.server.modules.house.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.entity.XlHouseSubscribe;
import com.xiliu.server.modules.house.service.IXlApartmentService;
import com.xiliu.server.modules.house.service.IXlCentralizeService;
import com.xiliu.server.modules.house.service.IXlHouseService;
import com.xiliu.server.modules.house.service.IXlHouseSubscribeService;
import com.xiliu.server.modules.house.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author xiliu
 * @description
 * @date 2023/4/18
 */
@Service
public class XlCentralizeServiceImpl implements IXlCentralizeService{

    @Autowired
    private IXlApartmentService apartmentService;
    @Autowired
    private IXlHouseService houseService;
    @Autowired
    private IXlHouseSubscribeService houseSubscribeService;

    @Override
    public List<CentralizeRespVo> getCentralizeList(CentralizeRequestVo requestVo) {
        List<CentralizeRespVo> list = new ArrayList<>();
        // 查询已分配的门店
        List<ApartmentSimpleVo> vos = apartmentService.getUserApartmentList(requestVo.getUserId());
        if (CollectionUtil.isNotEmpty(vos)) {
            for (ApartmentSimpleVo vo : vos) {
                CentralizeRespVo centralizeRespVo = new CentralizeRespVo();
                centralizeRespVo.setApartmentId(vo.getApartmentId());
                centralizeRespVo.setName(vo.getBrandName() + "-" + vo.getClassifyName() + "-" + vo.getApartmentName());
                // 查询房源统计数
                Map<String, Object> counts = houseService.getHouseCount(vo.getApartmentId());
                centralizeRespVo.setCounts(counts);
                // 查询房源列表
                List<CentralizeRoomVo> centralizeRoomList = houseService.getCentralizeRoomList(vo.getApartmentId());
                centralizeRespVo.setRoomList(centralizeRoomList);
                Set<Long> floorList = centralizeRoomList.stream().map(CentralizeRoomVo::getFloor).collect(Collectors.toSet());
                centralizeRespVo.setFloorList(floorList);
                list.add(centralizeRespVo);

            }
        }
        return list;
    }

    @Override
    public List<CentralizeDetailVo> getCentralizeDetailInfo(Long houseId, Long state) {
        List<CentralizeDetailVo> list = new ArrayList<>();
        // 房源信息
        CentralizeDetailVo houseInfo = this.coventHouseData(houseId);
        list.add(houseInfo);
        if (state.intValue() != 1) {
            // 租客信息
            CentralizeDetailVo tenantInfo = this.coventTenantData(houseId,state);
            list.add(tenantInfo);
            // 租赁信息
            CentralizeDetailVo leaseInfo = this.coventLeaseData(houseId,state);
            list.add(leaseInfo);
        }
        return list;
    }

    private CentralizeDetailVo coventHouseData(Long houseId) {
        CentralizeDetailVo houseInfo = new CentralizeDetailVo();
        houseInfo.setTitle("房源信息");
        // 查询房源信息
        XlHouse xlHouse = houseService.selectXlHouseByHouseId(houseId);
        if (xlHouse != null) {
            ApartmentResultVo xlApartment = apartmentService.getApartmentInfo(xlHouse.getApartmentId());
            if (xlApartment != null) {
                List<String> houseItem = new ArrayList<>();
                String brandNameStr = "品牌:" + xlApartment.getBrandName();
                houseItem.add(brandNameStr);
                String projectNameStr = "门店:" + xlApartment.getProjectName();
                houseItem.add(projectNameStr);
                String apartmentNameStr = "楼栋:" + xlApartment.getApartmentName();
                houseItem.add(apartmentNameStr);
                String addressStr = "地址:" + xlApartment.getProvince() + xlApartment.getCity() + xlApartment.getCounty() + xlApartment.getDetailAddress();
                houseItem.add(addressStr);
                String unitTypeStr = "户型:" + houseService.setUnitTypeName(xlHouse);
                houseItem.add(unitTypeStr);
                String orientaStr = "朝向:";
                houseItem.add(orientaStr);
                houseInfo.setItem(houseItem);
            }
        }
        return houseInfo;
    }

    private CentralizeDetailVo coventTenantData(Long houseId,Long state) {
        CentralizeDetailVo tenantInfo = new CentralizeDetailVo();
        if (state.intValue() == 5) {
            tenantInfo.setTitle("租客信息");
            XlHouseSubscribe houseSubscribe = houseSubscribeService.getOne(new LambdaQueryWrapper<XlHouseSubscribe>().eq(XlHouseSubscribe::getHouseId,houseId),false);
            if (houseSubscribe != null) {
                List<String> tenantItem = new ArrayList<>();
                String nameStr = "姓名:" + houseSubscribe.getRealName();
                tenantItem.add(nameStr);
                String phoneStr = "手机号:" + houseSubscribe.getPhoneNumber();
                tenantItem.add(phoneStr);
                String idNoStr = "证件号:" + houseSubscribe.getIdNo();
                tenantItem.add(idNoStr);
                tenantInfo.setItem(tenantItem);
            }
        } else if (state.intValue() == 3) {

        }
        return tenantInfo;
    }
    private CentralizeDetailVo coventLeaseData(Long houseId,Long state) {
        CentralizeDetailVo leaseInfo = new CentralizeDetailVo();
        if (state.intValue() == 5) {
            leaseInfo.setTitle("下定信息");
            XlHouseSubscribe houseSubscribe = houseSubscribeService.getOne(new LambdaQueryWrapper<XlHouseSubscribe>().eq(XlHouseSubscribe::getHouseId,houseId),false);
            if (houseSubscribe != null) {
                List<String> leaseItem = new ArrayList<>();
                String frontMoneyStr = "定金:" + houseSubscribe.getFrontMoney();
                leaseItem.add(frontMoneyStr);
                String monthMoneyStr = "租金:" + houseSubscribe.getMonthMoney();
                leaseItem.add(monthMoneyStr);
                String depositStr = "押金:" + houseSubscribe.getDeposit();
                leaseItem.add(depositStr);
                String startDateStr = "开始:" + DateUtil.format(houseSubscribe.getContractStartDate(),"yyyy-MM-dd");
                leaseItem.add(startDateStr);
                String endDateStr = "结束:" + DateUtil.format(houseSubscribe.getContractEndDate(),"yyyy-MM-dd");
                leaseItem.add(endDateStr);
                leaseInfo.setItem(leaseItem);
            }
        }
        return leaseInfo;
    }
}
