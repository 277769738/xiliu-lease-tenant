package com.xiliu.server.modules.platform.service.impl;

import java.util.List;
import java.util.Arrays;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.platform.vo.SimplePackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xiliu.server.modules.platform.mapper.XlTenantPackageMapper;
import com.xiliu.server.modules.platform.entity.XlTenantPackage;
import com.xiliu.server.modules.platform.service.IXlTenantPackageService;

/**
 * 租户套餐表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-03
 */
@Service
public class XlTenantPackageServiceImpl extends ServiceImpl<XlTenantPackageMapper, XlTenantPackage> implements IXlTenantPackageService {
    @Autowired
    private XlTenantPackageMapper xlTenantPackageMapper;

    /**
     * 查询租户套餐表
     * @param packageId 租户套餐表主键
     * @return 租户套餐表
     */
    @Override
    public XlTenantPackage selectXlTenantPackageByPackageId(Long packageId) {
        return xlTenantPackageMapper.selectXlTenantPackageByPackageId(packageId);
    }

    /**
     * 查询租户套餐表列表
     * @param xlTenantPackage 租户套餐表
     * @return 租户套餐表
     */
    @Override
    public List<XlTenantPackage> selectXlTenantPackageList(XlTenantPackage xlTenantPackage) {
        return xlTenantPackageMapper.selectXlTenantPackageList(xlTenantPackage);
    }

    /**
     * 新增租户套餐表
     * @param xlTenantPackage 租户套餐表
     * @return 结果
     */
    @Override
    public boolean create(XlTenantPackage xlTenantPackage) {
        return save(xlTenantPackage);
    }

    /**
     * 修改租户套餐表
     * @param xlTenantPackage 租户套餐表
     * @return 结果
     */
    @Override
    public boolean update(XlTenantPackage xlTenantPackage) {
        return updateById(xlTenantPackage);
    }

    /**
     * 批量删除租户套餐表
     * @param packageIds 需要删除的租户套餐表主键
     * @return 结果
     */
    @Override
    public int deleteXlTenantPackageByPackageIds(Long[] packageIds) {
        return xlTenantPackageMapper.deleteBatchIds(Arrays.asList(packageIds));
    }

    /**
     * 删除租户套餐表信息
     * @param packageId 租户套餐表主键
     * @return 结果
     */
    @Override
    public int deleteXlTenantPackageByPackageId(Long packageId) {
        return xlTenantPackageMapper.deleteById(packageId);
    }

    @Override
    public List<SimplePackage> getSimpleList() {
        return xlTenantPackageMapper.getSimpleList();
    }
}
