package com.xiliu.generator.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.generator.entity.GenTableColumn;

import java.util.List;

/**
 * <p>
 * 代码生成业务表字段 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-15
 */
public interface GenTableColumnMapper extends BaseMapper<GenTableColumn> {

    /**
     * 根据表名称查询列信息
     * @param tableName 表名称
     * @return 列信息
     */
    @InterceptorIgnore(tenantLine = "1")
    List<GenTableColumn> selectDbTableColumnsByName(String tableName);

}
