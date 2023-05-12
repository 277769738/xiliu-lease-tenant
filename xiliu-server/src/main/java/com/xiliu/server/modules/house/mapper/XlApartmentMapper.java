package com.xiliu.server.modules.house.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.vo.ApartmentSimpleVo;

/**
 * 公寓信息表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface XlApartmentMapper extends BaseMapper<XlApartment>{
    /**
     * 查询公寓信息表
     * @param apartmentId 公寓信息表主键
     * @return 公寓信息表
     */
    XlApartment selectXlApartmentByApartmentId(Long apartmentId);

    /**
     * 查询公寓信息表列表
     * @param xlApartment 公寓信息表
     * @return 公寓信息表集合
     */
   List<XlApartment> selectXlApartmentList(XlApartment xlApartment);

    /**
     * 查询用户分配公寓列表
     * @param userId 用户id
     * @return 项目分类表集合
     */
   List<ApartmentSimpleVo> getUserApartmentList(Long userId);

}
