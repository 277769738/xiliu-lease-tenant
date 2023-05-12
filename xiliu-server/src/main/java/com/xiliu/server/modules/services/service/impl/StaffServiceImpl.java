package com.xiliu.server.modules.services.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.mapper.XlApartmentMapper;
import com.xiliu.server.modules.services.entity.XlUserProject;
import com.xiliu.server.modules.services.mapper.StaffMapper;
import com.xiliu.server.modules.services.service.IXlUserProjectService;
import com.xiliu.server.modules.services.service.StaffService;
import com.xiliu.server.modules.services.vo.*;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.service.XlUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xiliu
 * @description
 * @date 2023/3/27
 */
@Service
public class StaffServiceImpl  implements StaffService{

    @Resource
    private StaffMapper staffMapper;
    @Resource
    private XlUserService userService;
    @Resource
    private IXlUserProjectService userProjectService;
    @Resource
    private XlApartmentMapper xlApartmentMapper;

    @Override
    public List<StaffResultVo> getStaffList(StaffQueryVo queryVo) {
        List<StaffResultVo> list = staffMapper.getStaffList(queryVo);
        if (CollectionUtil.isNotEmpty(list)) {
            for (StaffResultVo vo : list) {
                // 查询是否分配门店
                vo.setIsAuthProject(userProjectService.checkAuth(vo.getUserId()));
            }
        }
        return list;
    }

    @Override
    public R addStaff(StaffDetailResultVo vo) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(vo.getUserCode()))){
            return R.error("新增员工'" + vo.getUserCode() + "'失败，登录账号已存在");
        }
        XlUser xlUser = new XlUser();
        BeanUtil.copyProperties(vo,xlUser);
        xlUser.setMobile(vo.getUserCode());
        xlUser.setRoleIds(stringToLong(vo.getRoleId().toString().split(",")));
        boolean flag = userService.create(xlUser);
        if (flag) {
            return R.ok();
        }
        return R.error();
    }

    private Long[] stringToLong(String[] str) {
        Long[] arr = new Long[str.length];
        for (int i = 0; i < str.length; i++) {
            arr[i] = Long.parseLong(str[i]);
        }
        return arr;
    }

    @Override
    public R updateStaff(StaffDetailResultVo vo) {
        XlUser xlUser = userService.selectUserById(vo.getUserId());
        xlUser.setRealName(vo.getRealName());
        xlUser.setEntryDate(vo.getEntryDate());
        xlUser.setUserNumber(vo.getUserNumber());
        xlUser.setIdNo(vo.getIdNo());
        xlUser.setRoleIds(stringToLong(vo.getRoleId().toString().split(",")));
        boolean flag = userService.update(xlUser);
        if (flag) {
            return R.ok();
        }
        return R.error();
    }

    @Override
    public R deleteStaff(Long[] userIds) {
        boolean flag = userService.delete(Arrays.asList(userIds));
        if (flag) {
            return R.ok();
        }
        return R.error();
    }

    @Override
    public StaffDetailResultVo getStaffInfo(Long userId) {
        StaffDetailResultVo vo = new StaffDetailResultVo();
        XlUser user = userService.selectUserById(userId);
        BeanUtil.copyProperties(user,vo);
        vo.setRoleId(user.getRoles().get(0).getRoleId());
        vo.setPassWord(null);
        return vo;
    }

    @Override
    public List<ApartmentResultVo> getApartmentList(XlApartment xlApartment) {
        List<XlApartment> list = xlApartmentMapper.selectXlApartmentList(xlApartment);
        if (CollectionUtil.isNotEmpty(list)) {
            List<ApartmentResultVo> newList = list.stream().map(
                    item -> {
                        ApartmentResultVo vo = new ApartmentResultVo();
                        BeanUtil.copyProperties(item,vo);
                        vo.setAddress(item.getProvince() + item.getCity() + item.getCounty() + item.getDetailAddress());
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    @Override
    public List<Long> selectAuthListByUserId(Long userId) {
        return userProjectService.selectAuthListByUserId(userId);
    }

    @Override
    public boolean authApartment(StaffResultVo vo) {
        // 先删除
        userProjectService.remove(new LambdaQueryWrapper<XlUserProject>().eq(XlUserProject::getUserId,vo.getUserId()));
        // 再新增
        List<XlUserProject> list = new ArrayList<XlUserProject>();
        String[] apartmentIds = Convert.toStrArray(vo.getApartmentIds());
        for (String apartmentId : apartmentIds) {
            XlUserProject up = new XlUserProject();
            up.setUserId(vo.getUserId());
            up.setApartmentId(Long.valueOf(apartmentId));
            XlApartment xlApartment = xlApartmentMapper.selectById(apartmentId);
            up.setProjectId(xlApartment.getProjectId());
            list.add(up);
        }
        if (list.size() > 0) {
            return userProjectService.saveBatch(list);
        }
        return false;
    }
}
