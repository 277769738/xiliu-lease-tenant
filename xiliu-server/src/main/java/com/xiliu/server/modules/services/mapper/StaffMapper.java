package com.xiliu.server.modules.services.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.services.vo.StaffQueryVo;
import com.xiliu.server.modules.services.vo.StaffResultVo;
import com.xiliu.server.modules.system.entity.XlUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author xiliu
 * @since
 */
public interface StaffMapper extends BaseMapper<XlUser> {


    /**
     * 查询员工列表信息
     * @param queryVo 用户信息
     * @return 员工集合信息
     */
    List<StaffResultVo> getStaffList(@Param("query") StaffQueryVo queryVo);


}
