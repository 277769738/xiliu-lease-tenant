package com.xiliu.server.modules.house.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlArea;
import com.xiliu.server.modules.house.vo.AreaResultVo;

/**
 * 省市区表Service接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface IXlAreaService extends IService<XlArea>{
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
     * 新增省市区表
     * @param xlArea 省市区表
     * @return 结果
     */
    boolean create(XlArea xlArea);

    /**
     * 修改省市区表
     * @param xlArea 省市区表
     * @return 结果
     */
    boolean update(XlArea xlArea);

    /**
     * 批量删除省市区表
     * 
     * @param areaIds 需要删除的省市区表主键集合
     * @return 结果
     */
    int deleteXlAreaByAreaIds(Long[] areaIds);

    /**
     * 删除省市区表信息
     * 
     * @param areaId 省市区表主键
     * @return 结果
     */
    int deleteXlAreaByAreaId(Long areaId);

    /**
     * 获取省份列表
     * @param type 区域类型
     * @param parentId 上级id
     * @return 结果
     */
    List<AreaResultVo> getAreaListByTypeAndParentId(Integer type, Long parentId);

    /**
     * 获取市、区县列表
     * @param type 区域类型
     * @param name 名称
     * @param parentName 上级名称
     * @return 结果
     */
    List<AreaResultVo> getAreaListByTypeAndParentName(Integer type, String name,String parentName);
}
