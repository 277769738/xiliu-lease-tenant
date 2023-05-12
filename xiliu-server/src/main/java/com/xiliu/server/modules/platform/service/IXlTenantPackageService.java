package com.xiliu.server.modules.platform.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.platform.entity.XlTenantPackage;
import com.xiliu.server.modules.platform.vo.SimplePackage;

/**
 * 租户套餐表Service接口
 * 
 * @author xiliu
 * @date 2023-03-03
 */
public interface IXlTenantPackageService extends IService<XlTenantPackage>{
    /**
     * 查询租户套餐表
     * @param packageId 租户套餐表主键
     * @return 租户套餐表
     */
    XlTenantPackage selectXlTenantPackageByPackageId(Long packageId);

    /**
     * 查询租户套餐表列表
     * @param xlTenantPackage 租户套餐表
     * @return 租户套餐表集合
     */
    List<XlTenantPackage> selectXlTenantPackageList(XlTenantPackage xlTenantPackage);

    /**
     * 新增租户套餐表
     * @param xlTenantPackage 租户套餐表
     * @return 结果
     */
    boolean create(XlTenantPackage xlTenantPackage);

    /**
     * 修改租户套餐表
     * @param xlTenantPackage 租户套餐表
     * @return 结果
     */
    boolean update(XlTenantPackage xlTenantPackage);

    /**
     * 批量删除租户套餐表
     * 
     * @param packageIds 需要删除的租户套餐表主键集合
     * @return 结果
     */
    int deleteXlTenantPackageByPackageIds(Long[] packageIds);

    /**
     * 删除租户套餐表信息
     * 
     * @param packageId 租户套餐表主键
     * @return 结果
     */
    int deleteXlTenantPackageByPackageId(Long packageId);

    /**
     * 查询租户套餐
     * @return 租户套餐
     */
    List<SimplePackage> getSimpleList();
}
