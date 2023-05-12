package com.xiliu.server.modules.house.mapper;

import java.util.List;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlArea;
import com.xiliu.server.modules.house.vo.AreaResultVo;
import org.apache.ibatis.annotations.Param;


/**
 * 省市区表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface XlAreaMapper extends BaseMapper<XlArea>{
    /**
     * 查询省市区表
     * @param areaId 省市区表主键
     * @return 省市区表
     */
    XlArea selectXlAreaByAreaId(Long areaId);

    /**
     * 查询省市区表列表
     * @param xlArea 省市区表
     * @return 省市区表集合
     */
   List<XlArea> selectXlAreaList(XlArea xlArea);

    /**
     * 获取省市区表列表
     * @param type  类型
     * @param parentId 上级id
     * @param name 名称
     * @return 省市区表集合
     */
    @InterceptorIgnore(tenantLine = "1")
    List<AreaResultVo> getAreaList(@Param("type") Integer type, @Param("parentId")Long parentId, @Param("name")String name);

}
