package com.xiliu.server.modules.platform.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.platform.entity.XlTenant;
import com.xiliu.server.modules.platform.vo.TenantResultVo;

/**
 * 租户表Mapper接口
 * 
 * @author xiliu
 * @date 2023-03-03
 */
public interface XlTenantMapper extends BaseMapper<XlTenant>{
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
     * 批量删除租户管理
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteTenantByIds(Long[] ids);

}
