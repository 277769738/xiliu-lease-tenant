package com.xiliu.server.modules.house.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.stream.Collectors;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.house.vo.AreaResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xiliu.server.modules.house.mapper.XlAreaMapper;
import com.xiliu.server.modules.house.entity.XlArea;
import com.xiliu.server.modules.house.service.IXlAreaService;

/**
 * 省市区表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@Service
public class XlAreaServiceImpl extends ServiceImpl<XlAreaMapper, XlArea> implements IXlAreaService {
    @Autowired
    private XlAreaMapper xlAreaMapper;

    /**
     * 查询省市区表
     * @param areaId 省市区表主键
     * @return 省市区表
     */
    @Override
    public XlArea selectXlAreaByAreaId(Long areaId) {
        return xlAreaMapper.selectXlAreaByAreaId(areaId);
    }

    /**
     * 查询省市区表列表
     * @param xlArea 省市区表
     * @return 省市区表
     */
    @Override
    public List<XlArea> selectXlAreaList(XlArea xlArea) {
        return xlAreaMapper.selectXlAreaList(xlArea);
    }

    /**
     * 新增省市区表
     * @param xlArea 省市区表
     * @return 结果
     */
    @Override
    public boolean create(XlArea xlArea) {
        return save(xlArea);
    }

    /**
     * 修改省市区表
     * @param xlArea 省市区表
     * @return 结果
     */
    @Override
    public boolean update(XlArea xlArea) {
        return updateById(xlArea);
    }

    /**
     * 批量删除省市区表
     * @param areaIds 需要删除的省市区表主键
     * @return 结果
     */
    @Override
    public int deleteXlAreaByAreaIds(Long[] areaIds) {
        return xlAreaMapper.deleteBatchIds(Arrays.asList(areaIds));
    }

    /**
     * 删除省市区表信息
     * @param areaId 省市区表主键
     * @return 结果
     */
    @Override
    public int deleteXlAreaByAreaId(Long areaId) {
        return xlAreaMapper.deleteById(areaId);
    }

    @Override
    public List<AreaResultVo> getAreaListByTypeAndParentId(Integer type, Long parentId) {
        List<AreaResultVo> volist = new ArrayList<>();
        if (parentId == null) {
            volist = baseMapper.getAreaList(type,null,null);
        } else {
            volist = baseMapper.getAreaList(type,parentId,null);
        }
        return volist;
    }

    @Override
    public List<AreaResultVo> getAreaListByTypeAndParentName(Integer type, String name,String parentName) {
        Long parentId = null;
        //市有重复的名称，查询区/县 要带上parentId
        if(StrUtil.isNotBlank(parentName)){
            List<AreaResultVo> volist = baseMapper.getAreaList(0,null,parentName);
            if (CollectionUtil.isNotEmpty(volist)) {
                parentId = volist.get(0).getAreaId();
            }
        }
        List<AreaResultVo> volist = baseMapper.getAreaList(type,parentId,name);
        if (CollectionUtil.isNotEmpty(volist)) {
            List<AreaResultVo> list = getAreaListByTypeAndParentId(type+1, volist.get(0).getAreaId());
            return list;
        }
        return null;
    }

}
