package com.xiliu.server.modules.house.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.vo.*;

import java.util.List;
import java.util.Map;

/**
 * 房源表Service接口
 *
 * @author xiliu
 * @date 2023-04-04
 */
public interface IXlHouseService extends IService<XlHouse>{
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
     * 新增房源表
     * @param vo 房源集合
     * @return 结果
     */
    boolean create(RoomRequestVo vo);

    /**
     * 修改房源表
     * @param xlHouse 房源表
     * @return 结果
     */
    boolean update(XlHouse xlHouse);

    /**
     * 批量删除房源表
     *
     * @param houseIds 需要删除的房源表主键集合
     * @return 结果
     */
    int deleteXlHouseByHouseIds(Long[] houseIds);

    /**
     * 删除房源表信息
     *
     * @param houseId 房源表主键
     * @return 结果
     */
    int deleteXlHouseByHouseId(Long houseId);

    /**
     * 查询房源列表
     * @param xlHouse 房源信息表
     * @return 房源信息表集合
     */
    List<RoomListRespVo> getRoomList(XlHouse xlHouse);

    /**
     * 查询房源详细
     * @param houseId 房源id
     * @return 房源详细
     */
    RoomDetailRespVo getRoomDetail(Long houseId);

    /**
     * 批量导入房源
     * @param imports     导入房源列表
     * @param isUpdateSupport 是否支持更新
     * @return 导入结果
     */
    ImportRespVo importRoomList(List<Map<String,String>> imports, boolean isUpdateSupport);

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

    String setUnitTypeName(XlHouse xlHouse);
}
