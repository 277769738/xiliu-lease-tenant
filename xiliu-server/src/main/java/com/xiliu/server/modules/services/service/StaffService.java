package com.xiliu.server.modules.services.service;

import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.services.vo.*;

import java.util.List;

/**
 * @author xiliu
 * @description ${description}
 * @date 2023/3/27
 */
public interface StaffService {

    /**
     * 查询员工信息列表
     * @param queryVo 员工信息表
     * @return 员工信息集合
     */
    List<StaffResultVo> getStaffList(StaffQueryVo queryVo);

    /**
     * 新增员工
     * @param vo 员工信息
     * @return 结果
     */
    R addStaff(StaffDetailResultVo vo);

    /**
     * 修改员工
     * @param vo 员工信息
     * @return 结果
     */
    R updateStaff(StaffDetailResultVo vo);

    /**
     * 批量删除员工
     * @param userIds
     * @return boolean
     **/
    R deleteStaff(Long[] userIds);

    /**
     * 获取员工信息
     * @param userId
     * @return staffDetailResultVo
     **/
    StaffDetailResultVo getStaffInfo(Long userId);

    /**
     *  获取分配门店列表
     * @param xlApartment
     * @return list
     **/
    List<ApartmentResultVo> getApartmentList(XlApartment xlApartment);

    /**
     * 获取已分配门店
     * @param userId 用户id
     * @return 结果
     */
    List<Long> selectAuthListByUserId(Long userId);

    /**
     * 分配门店
     * @param vo
     * @return boolean
     **/
    boolean authApartment(StaffResultVo vo);
}
