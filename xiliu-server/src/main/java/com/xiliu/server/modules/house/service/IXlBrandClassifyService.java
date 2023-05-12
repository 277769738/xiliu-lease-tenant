package com.xiliu.server.modules.house.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.house.entity.XlBrandClassify;
import com.xiliu.server.modules.house.vo.BrandResultVo;

/**
 * 品牌分类表Service接口
 * 
 * @author xiliu
 * @date 2023-03-17
 */
public interface IXlBrandClassifyService extends IService<XlBrandClassify>{
    /**
     * 查询品牌分类表
     * @param brandId 品牌分类表主键
     * @return 品牌分类表
     */
    XlBrandClassify selectXlBrandClassifyByBrandId(Long brandId);

    /**
     * 查询品牌分类表列表
     * @param xlBrandClassify 品牌分类表
     * @return 品牌分类表集合
     */
    List<XlBrandClassify> selectXlBrandClassifyList(XlBrandClassify xlBrandClassify);

    /**
     * 新增品牌分类表
     * @param xlBrandClassify 品牌分类表
     * @return 结果
     */
    boolean create(XlBrandClassify xlBrandClassify);

    /**
     * 修改品牌分类表
     * @param xlBrandClassify 品牌分类表
     * @return 结果
     */
    boolean update(XlBrandClassify xlBrandClassify);

    /**
     * 批量删除品牌分类表
     * 
     * @param brandIds 需要删除的品牌分类表主键集合
     * @return 结果
     */
    int deleteXlBrandClassifyByBrandIds(Long[] brandIds);

    /**
     * 删除品牌分类表信息
     * 
     * @param brandId 品牌分类表主键
     * @return 结果
     */
    int deleteXlBrandClassifyByBrandId(Long brandId);

    /**
     * 查询品牌分类精简信息列表
     * @param xlBrandClassify 品牌分类表
     * @return 品牌分类表集合
     */
    List<BrandResultVo> selectBrandList(XlBrandClassify xlBrandClassify);

    /**
     * 查询品牌分类精简信息
     * @param brandId id
     * @return 品牌分类表集合
     */
    BrandResultVo getBrandById(Long brandId);
}
