package com.xiliu.server.modules.house.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.vo.ApartmentImportRespVo;
import com.xiliu.server.modules.house.vo.ApartmentImportVo;
import com.xiliu.server.modules.house.vo.ApartmentResultVo;
import com.xiliu.server.modules.house.vo.ApartmentSimpleVo;

/**
 * 公寓信息表Service接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface IXlApartmentService extends IService<XlApartment>{

    /**
     * 查询公寓信息表列表
     * @param xlApartment 公寓信息表
     * @return 公寓信息表集合
     */
    List<XlApartment> selectXlApartmentList(XlApartment xlApartment);

    /**
     * 新增公寓信息表
     * @param xlApartment 公寓信息表
     * @return 结果
     */
    boolean create(XlApartment xlApartment);

    /**
     * 修改公寓信息表
     * @param xlApartment 公寓信息表
     * @return 结果
     */
    boolean update(XlApartment xlApartment);

    /**
     * 批量删除公寓信息表
     * 
     * @param apartmentIds 需要删除的公寓信息表主键集合
     * @return 结果
     */
    int deleteXlApartmentByApartmentIds(Long[] apartmentIds);

    /**
     * 删除公寓信息表信息
     * 
     * @param apartmentId 公寓信息表主键
     * @return 结果
     */
    int deleteXlApartmentByApartmentId(Long apartmentId);

    /**
     * 批量导入公寓
     * @param imports     导入公寓列表
     * @param isUpdateSupport 是否支持更新
     * @return 导入结果
     */
    ApartmentImportRespVo importApartmentList(List<ApartmentImportVo> imports, boolean isUpdateSupport);

    /**
     * 查询公寓信息列表
     * @param xlApartment 公寓信息表
     * @return 公寓信息表集合
     */
    List<ApartmentResultVo> getApartmentList(XlApartment xlApartment);

    /**
     * 查询公寓详细信息
     * @param apartmentId 公寓信息表主键
     * @return 公寓信息
     */
    ApartmentResultVo getApartmentInfo(Long apartmentId);

    /**
     * 查询用户公寓列表
     * @param userId 用户id
     * @return 品牌分类表集合
     */
    List<ApartmentSimpleVo> getUserApartmentList(Long userId);

    /**
     * 查询公寓简单信息
     * @param apartmentId 公寓id
     * @return 品牌分类表集合
     */
    ApartmentSimpleVo getUserApartmentInfo(Long apartmentId);
}
