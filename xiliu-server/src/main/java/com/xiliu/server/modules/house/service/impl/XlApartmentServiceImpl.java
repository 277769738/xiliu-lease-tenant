package com.xiliu.server.modules.house.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.common.enums.DictLabelEnum;
import com.xiliu.server.common.exception.ServiceException;
import com.xiliu.server.modules.house.entity.XlBrandClassify;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.entity.XlProjectClassify;
import com.xiliu.server.modules.house.mapper.XlBrandClassifyMapper;
import com.xiliu.server.modules.house.mapper.XlProjectClassifyMapper;
import com.xiliu.server.modules.house.service.IXlHouseService;
import com.xiliu.server.modules.house.vo.ApartmentImportRespVo;
import com.xiliu.server.modules.house.vo.ApartmentImportVo;
import com.xiliu.server.modules.house.vo.ApartmentResultVo;
import com.xiliu.server.modules.house.vo.ApartmentSimpleVo;
import com.xiliu.server.modules.system.service.XlRoleService;
import com.xiliu.server.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xiliu.server.modules.house.mapper.XlApartmentMapper;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.service.IXlApartmentService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 公寓信息表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Service
public class XlApartmentServiceImpl extends ServiceImpl<XlApartmentMapper, XlApartment> implements IXlApartmentService {
    @Autowired
    private XlApartmentMapper xlApartmentMapper;
    @Autowired
    private XlBrandClassifyMapper brandClassifyMapper;
    @Autowired
    private XlProjectClassifyMapper projectClassifyMapper;
    @Autowired
    private XlRoleService roleService;
    @Autowired
    private IXlHouseService houseService;

    /**
     * 查询公寓信息表列表
     * @param xlApartment 公寓信息表
     * @return 公寓信息表
     */
    @Override
    public List<XlApartment> selectXlApartmentList(XlApartment xlApartment) {
        return xlApartmentMapper.selectXlApartmentList(xlApartment);
    }

    /**
     * 新增公寓信息表
     * @param xlApartment 公寓信息表
     * @return 结果
     */
    @Override
    public boolean create(XlApartment xlApartment) {
        xlApartment.setApartmentType(DictLabelEnum.JZS.getValue());
        return save(xlApartment);
    }

    /**
     * 修改公寓信息表
     * @param xlApartment 公寓信息表
     * @return 结果
     */
    @Override
    public boolean update(XlApartment xlApartment) {
        return updateById(xlApartment);
    }

    /**
     * 批量删除公寓信息表
     * @param apartmentIds 需要删除的公寓信息表主键
     * @return 结果
     */
    @Override
    public int deleteXlApartmentByApartmentIds(Long[] apartmentIds) {
        return xlApartmentMapper.deleteBatchIds(Arrays.asList(apartmentIds));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ApartmentImportRespVo importApartmentList(List<ApartmentImportVo> imports, boolean isUpdateSupport) {
        if (CollectionUtil.isEmpty(imports)) {
            throw new ServiceException("导入数据不能为空！");
        }
        ApartmentImportRespVo respVO = ApartmentImportRespVo.builder().createNames(new ArrayList<>())
                .updateNames(new ArrayList<>()).failureNames(new LinkedHashMap<>()).build();
        imports.forEach(importApartment -> {
            // 校验品牌是否存在
            XlBrandClassify brandClassify = brandClassifyMapper.selectOne(new LambdaQueryWrapper<XlBrandClassify>().eq(XlBrandClassify::getBrandName,importApartment.getBrandName()));
            if (brandClassify == null) {
                respVO.getFailureNames().put(importApartment.getApartmentName(), "品牌分类不存在！");
                return;
            }
            // 校验项目是否存在
            XlProjectClassify projectClassify = projectClassifyMapper.selectOne(new LambdaQueryWrapper<XlProjectClassify>().eq(XlProjectClassify::getClassifyName,importApartment.getClassifyName()));
            if (projectClassify == null) {
                respVO.getFailureNames().put(importApartment.getApartmentName(), "项目分类不存在！");
                return;
            }
            // 校验公寓是否存在
            XlApartment apartment = xlApartmentMapper.selectOne(new LambdaQueryWrapper<XlApartment>().eq(XlApartment::getBrandId,brandClassify.getBrandId())
                    .eq(XlApartment::getProjectId,projectClassify.getClassifyId()).eq(XlApartment::getApartmentName,importApartment.getApartmentName()));
            if (apartment == null) {
                apartment = new XlApartment();
                BeanUtil.copyProperties(importApartment, apartment);
                apartment.setBrandId(brandClassify.getBrandId());
                apartment.setProjectId(projectClassify.getClassifyId());
                save(apartment);
            }
            // 如果存在，判断是否允许更新
            if (!isUpdateSupport) {
                respVO.getFailureNames().put(importApartment.getApartmentName(), "公寓已存在");
                return;
            }
            BeanUtil.copyProperties(importApartment, apartment);
            updateById(apartment);
            respVO.getUpdateNames().add(importApartment.getApartmentName());
        });
        return respVO;
    }

    @Override
    public List<ApartmentResultVo> getApartmentList(XlApartment xlApartment) {
        List<XlApartment> list = xlApartmentMapper.selectXlApartmentList(xlApartment);
        if (CollectionUtil.isNotEmpty(list)) {
            List<ApartmentResultVo> newList = list.stream().map(
                    item -> {
                        ApartmentResultVo vo = new ApartmentResultVo();
                        BeanUtil.copyProperties(item,vo);
                        vo.setAddress(item.getProvince() + item.getCity() + item.getCounty() + item.getDetailAddress());
                        vo.setBrandName(item.getBrand().getBrandName());
                        vo.setProjectName(item.getProject().getClassifyName());
                        vo.setHouseNum(this.getHouserNumByApartmentId(item.getApartmentId()));
                        return vo;
                    }
            ).collect(Collectors.toList());
            return newList;
        }
        return CollectionUtil.newArrayList();
    }

    private Integer getHouserNumByApartmentId(Long apartmentId) {
        Long num = houseService.count(new LambdaQueryWrapper<XlHouse>().eq(XlHouse::getApartmentId,apartmentId));
        return Integer.valueOf(String.valueOf(num));
    }

    @Override
    public ApartmentResultVo getApartmentInfo(Long apartmentId) {
        ApartmentResultVo vo = new ApartmentResultVo();
        XlApartment xlApartment = xlApartmentMapper.selectXlApartmentByApartmentId(apartmentId);
        BeanUtil.copyProperties(xlApartment,vo);
        vo.setBrandName(xlApartment.getBrand().getBrandName());
        vo.setProjectName(xlApartment.getProject().getClassifyName());
        return vo;
    }

    @Override
    public List<ApartmentSimpleVo> getUserApartmentList(Long userId) {
        List<ApartmentSimpleVo> list = CollectionUtil.newArrayList();
        // 判断用户角色是否是管理员
        if (SecurityUtils.isAdmin(userId) || roleService.checkAdminRoleByUserId(userId)) {
            list = baseMapper.getUserApartmentList(null);
        } else {
            list = baseMapper.getUserApartmentList(userId);
        }
        return list;
    }

    @Override
    public ApartmentSimpleVo getUserApartmentInfo(Long apartmentId) {
        ApartmentSimpleVo vo = new ApartmentSimpleVo();
        XlApartment xlApartment = xlApartmentMapper.selectXlApartmentByApartmentId(apartmentId);
        BeanUtil.copyProperties(xlApartment,vo);
        return vo;
    }

    /**
     * 删除公寓信息表信息
     * @param apartmentId 公寓信息表主键
     * @return 结果
     */
    @Override
    public int deleteXlApartmentByApartmentId(Long apartmentId) {
        return xlApartmentMapper.deleteById(apartmentId);
    }

}
