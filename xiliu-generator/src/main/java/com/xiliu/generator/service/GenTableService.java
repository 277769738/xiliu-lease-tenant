package com.xiliu.generator.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.generator.entity.GenTable;

import java.util.List;
import java.util.Map;

/**
 * @author xiliu
 * @description
 * @date 2022/7/14
 */
public interface GenTableService extends IService<GenTable> {

    /**
     * 查询数据库列表
     * @param genTable 业务信息
     * @return 数据库表集合
     */
    /*List<GenTable> selectDbTableList(GenTable genTable);*/

    IPage<GenTable> selectDbTableList(GenTable genTable);
    /**
     * 查询据库列表
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    List<GenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 导入表结构
     * @param tableList 导入表列表
     */
    void importGenTable(List<GenTable> tableList);

    /**
     * 查询业务列表
     * @param genTable 业务信息
     * @return 业务集合
     */
    List<GenTable> selectGenTableList(GenTable genTable);

    /**
     * 预览代码
     * @param tableId 表编号
     * @return 预览数据列表
     */
    Map<String, String> previewCode(Long tableId);

    /**
     * 生成代码（下载方式）
     * @param tableName 表名称
     * @return 数据
     */
    byte[] downloadCode(String tableName);

    /**
     * 批量生成代码（下载方式）
     * @param tableNames 表数组
     * @return 数据
     */
    byte[] downloadCode(String[] tableNames);

    /**
     * 删除业务信息
     * @param tableIds 需要删除的表数据ID
     * @return 结果
     */
    void deleteGenTableByIds(Long[] tableIds);
}
