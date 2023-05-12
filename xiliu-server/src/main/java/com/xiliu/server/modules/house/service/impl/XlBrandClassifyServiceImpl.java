package com.xiliu.server.modules.house.service.impl;

import java.util.List;
import java.util.Arrays;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.house.vo.BrandResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xiliu.server.modules.house.mapper.XlBrandClassifyMapper;
import com.xiliu.server.modules.house.entity.XlBrandClassify;
import com.xiliu.server.modules.house.service.IXlBrandClassifyService;

/**
 * 品牌分类表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Service
public class XlBrandClassifyServiceImpl extends ServiceImpl<XlBrandClassifyMapper, XlBrandClassify> implements IXlBrandClassifyService {
    @Autowired
    private XlBrandClassifyMapper xlBrandClassifyMapper;

    /**
     * 查询品牌分类表
     * @param brandId 品牌分类表主键
     * @return 品牌分类表
     */
    @Override
    public XlBrandClassify selectXlBrandClassifyByBrandId(Long brandId) {
        return xlBrandClassifyMapper.selectXlBrandClassifyByBrandId(brandId);
    }

    /**
     * 查询品牌分类表列表
     * @param xlBrandClassify 品牌分类表
     * @return 品牌分类表
     */
    @Override
    public List<XlBrandClassify> selectXlBrandClassifyList(XlBrandClassify xlBrandClassify) {
        return xlBrandClassifyMapper.selectXlBrandClassifyList(xlBrandClassify);
    }

    /**
     * 新增品牌分类表
     * @param xlBrandClassify 品牌分类表
     * @return 结果
     */
    @Override
    public boolean create(XlBrandClassify xlBrandClassify) {
        return save(xlBrandClassify);
    }

    /**
     * 修改品牌分类表
     * @param xlBrandClassify 品牌分类表
     * @return 结果
     */
    @Override
    public boolean update(XlBrandClassify xlBrandClassify) {
        return updateById(xlBrandClassify);
    }

    /**
     * 批量删除品牌分类表
     * @param brandIds 需要删除的品牌分类表主键
     * @return 结果
     */
    @Override
    public int deleteXlBrandClassifyByBrandIds(Long[] brandIds) {
        return xlBrandClassifyMapper.deleteBatchIds(Arrays.asList(brandIds));
    }

    /**
     * 删除品牌分类表信息
     * @param brandId 品牌分类表主键
     * @return 结果
     */
    @Override
    public int deleteXlBrandClassifyByBrandId(Long brandId) {
        return xlBrandClassifyMapper.deleteById(brandId);
    }

    @Override
    public List<BrandResultVo> selectBrandList(XlBrandClassify xlBrandClassify) {
        List<XlBrandClassify> list = xlBrandClassifyMapper.selectXlBrandClassifyList(xlBrandClassify);
        if (CollectionUtil.isNotEmpty(list)) {
            List<BrandResultVo> newList = list.stream().map(
                    item -> {
                        BrandResultVo vo = covent(item);
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    @Override
    public BrandResultVo getBrandById(Long brandId) {
        XlBrandClassify brandClassify = getById(brandId);
        if (brandClassify != null) {
            return covent(brandClassify);
        }
        return null;
    }

    private BrandResultVo covent(XlBrandClassify brandClassify) {
        BrandResultVo vo = new BrandResultVo();
        vo.setBrandId(brandClassify.getBrandId());
        vo.setBrandName(brandClassify.getBrandName());
        vo.setRemarks(brandClassify.getRemarks());
        vo.setCreatedTime(brandClassify.getCreatedTime());
        return vo;
    }

}
