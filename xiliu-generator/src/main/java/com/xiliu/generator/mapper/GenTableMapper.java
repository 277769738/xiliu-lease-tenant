package com.xiliu.generator.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiliu.generator.entity.GenTable;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xiliu
 * @description 业务 数据层
 * @date 2022/7/14
 */
public interface GenTableMapper extends BaseMapper<GenTable> {

    /**
     * 查询业务列表
     * @param genTable 业务信息
     * @return 业务集合
     */
    @InterceptorIgnore(tenantLine = "1")
    List<GenTable> selectGenTableList(@Param(value = "genTable") GenTable genTable);

    List<GenTable> selectDbTable(@Param(value = "genTable") GenTable genTable);

    /**
     * 查询数据库列表
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    @InterceptorIgnore(tenantLine = "1")
    IPage<GenTable> selectDbTableList(Page page, @Param("genTable") GenTable genTable);

    /**
     * 查询数据库列表
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    @InterceptorIgnore(tenantLine = "1")
    List<GenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 查询所有表信息
     * @return 表信息集合
     */
    @InterceptorIgnore(tenantLine = "1")
    List<GenTable> selectGenTableAll();

    /**
     * 查询表ID业务信息
     * @param id 业务ID
     * @return 业务信息
     */
    @InterceptorIgnore(tenantLine = "1")
    GenTable selectGenTableById(Long id);

    /**
     * 查询表名称业务信息
     * @param tableName 表名称
     * @return 业务信息
     */
    @InterceptorIgnore(tenantLine = "1")
    GenTable selectGenTableByName(String tableName);
}
