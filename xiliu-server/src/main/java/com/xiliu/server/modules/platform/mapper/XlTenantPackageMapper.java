package com.xiliu.server.modules.platform.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.platform.entity.XlTenantPackage;
import com.xiliu.server.modules.platform.vo.SimplePackage;

/**
 * 租户套餐表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-03
 */
public interface XlTenantPackageMapper extends BaseMapper<XlTenantPackage>{
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
     * 查询租户套餐
     * @return 租户套餐
     */
    List<SimplePackage> getSimpleList();

}
