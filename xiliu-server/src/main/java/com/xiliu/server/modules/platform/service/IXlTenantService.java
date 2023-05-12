package com.xiliu.server.modules.platform.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.platform.entity.XlTenant;
import com.xiliu.server.modules.platform.vo.TenantResultVo;

/**
 * 租户表Service接口
 * 
 * @author xiliu
 * @date 2023-03-03
 */
public interface IXlTenantService extends IService<XlTenant>{
    /**
     * 查询租户表
     * @param tenantId 租户表主键
     * @return 租户表
     */
    XlTenant selectXlTenantByTenantId(Long tenantId);

    /**
     * 查询租户表列表
     * @param xlTenant 租户表
     * @return 租户表集合
     */
    List<TenantResultVo> selectXlTenantList(XlTenant xlTenant);

    /**
     * 新增租户表
     * @param xlTenant 租户表
     * @return 结果
     */
    boolean create(XlTenant xlTenant);

    /**
     * 修改租户表
     * @param xlTenant 租户表
     * @return 结果
     */
    boolean update(XlTenant xlTenant);

    /**
     * 批量删除租户表
     * 
     * @param tenantIds 需要删除的租户表主键集合
     * @return 结果
     */
    int deleteXlTenantByTenantIds(Long[] tenantIds);

    /**
     * 删除租户表信息
     * 
     * @param tenantId 租户表主键
     * @return 结果
     */
    int deleteXlTenantByTenantId(Long tenantId);

    /**
     * 新增租户
     * @param xlTenant 租户表
     * @return 结果
     */
    R addTenant(XlTenant xlTenant);

    /**
     * 修改租户
     * @param xlTenant 租户表
     * @return 结果
     */
    R updateTenant(XlTenant xlTenant);
}
