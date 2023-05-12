package com.xiliu.server.modules.house.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.vo.CentralizeRoomVo;


/**
 * 房源表Mapper接口
 *
 * @author xiliu
 * @date 2023-04-04
 */
public interface XlHouseMapper extends BaseMapper<XlHouse>{
    /**
     * 查询房源表
     * @param houseId 房源表主键
     * @return 房源表
     */
    XlHouse selectXlHouseByHouseId(Long houseId);

    /**
     * 查询房源表列表
     * @param xlHouse 房源表
     * @return 房源表集合
     */
    List<XlHouse> selectXlHouseList(XlHouse xlHouse);

    /**
     * 获取房源统计数
     * @param apartmentId 公寓id
     * @return 房源统计集合
     */
    Map<String, Object> getHouseCount(Long apartmentId);

    /**
     * 获取集中式房源信息
     * @param apartmentId 公寓id
     * @return 房源集合
     */
    List<CentralizeRoomVo> getCentralizeRoomList(Long apartmentId);

}
