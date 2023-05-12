package com.xiliu.generator.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.common.utils.ServletUtils;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.generator.constant.GenConstants;
import com.xiliu.generator.entity.GenTable;
import com.xiliu.generator.entity.GenTableColumn;
import com.xiliu.generator.mapper.GenTableColumnMapper;
import com.xiliu.generator.mapper.GenTableMapper;
import com.xiliu.generator.utils.GenUtils;
import com.xiliu.generator.utils.VelocityInitializer;
import com.xiliu.generator.utils.VelocityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author xiliu
 * @description
 * @date 2022/7/14
 */
@Slf4j
@Service
public class GenTableServiceImpl extends ServiceImpl<GenTableMapper, GenTable> implements GenTableService{

    @Autowired
    private GenTableColumnMapper genTableColumnMapper;

    /*@Override
    public List<GenTable> selectDbTableList(GenTable genTable) {
        return baseMapper.selectDbTableList(genTable);
    }*/
    @Override
    public IPage<GenTable> selectDbTableList(GenTable genTable) {
        Page mpPage =new Page(Convert.toLong(ServletUtils.getParameterToInt("pageNum"),1L)
                ,Convert.toLong(ServletUtils.getParameterToInt("pageSize"),10L));
        return baseMapper.selectDbTableList(mpPage,genTable);
    }

    @Override
    public List<GenTable> selectDbTableListByNames(String[] tableNames) {
        return baseMapper.selectDbTableListByNames(tableNames);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importGenTable(List<GenTable> tableList) {
        if (CollectionUtil.isNotEmpty(tableList)) {
            for (GenTable table : tableList) {
                String tableName = table.getTableName();
                GenUtils.initTable(table);
                // 保存生成表数据
                int row = baseMapper.insert(table);
                if (row > 0) {
                    // 查询数据库表列信息
                    List<GenTableColumn> genTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
                    if (CollectionUtil.isNotEmpty(genTableColumns)) {
                        for (GenTableColumn column : genTableColumns) {
                            GenUtils.initColumnField(column, table);
                            // 保存生成表字段数据
                            genTableColumnMapper.insert(column);
                        }
                    }
                }
            }
        }
    }

    @Override
    public List<GenTable> selectGenTableList(GenTable genTable) {
        return baseMapper.selectGenTableList(genTable);
    }

    @Override
    public Map<String, String> previewCode(Long tableId) {
        Map<String, String> dataMap = new LinkedHashMap<>();
        // 查询表信息
        GenTable table = baseMapper.selectGenTableById(tableId);
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);
        //  初始化
        VelocityInitializer.initVelocity();
        // 设置模板变量信息
        VelocityContext context = VelocityUtils.prepareContext(table);
        // 获取模版列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template,"UTF-8");
            tpl.merge(context, sw);
            dataMap.put(template,sw.toString());
        }
        return dataMap;
    }

    @Override
    public byte[] downloadCode(String tableName) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        generatorCode(tableName, zip);
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    @Override
    public byte[] downloadCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName: tableNames) {
            generatorCode(tableName, zip);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteGenTableByIds(Long[] tableIds) {
        baseMapper.deleteBatchIds(Arrays.asList(tableIds));
        List<GenTableColumn> genTableColumns = genTableColumnMapper.selectList(new LambdaQueryWrapper<GenTableColumn>().in(GenTableColumn::getTableId,Arrays.asList(tableIds)));
        genTableColumnMapper.deleteBatchIds(genTableColumns);
    }

    private void generatorCode(String tableName, ZipOutputStream zip) {
        // 查询表信息
        GenTable table = baseMapper.selectGenTableByName(tableName);
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);
        //  初始化
        VelocityInitializer.initVelocity();
        // 设置模板变量信息
        VelocityContext context = VelocityUtils.prepareContext(table);
        // 获取模版列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template,"UTF-8");
            tpl.merge(context, sw);
            try {
                // 添加到zip
                zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template,table)));
                IOUtils.write(sw.toString(), zip, "UTF-8");
                IOUtils.closeQuietly(sw);
                zip.flush();
                zip.closeEntry();
            } catch (IOException e) {
                log.error("渲染模板失败，表名：" + table.getTableName(), e);
            }
        }
    }

    public void setSubTable(GenTable table) {
        String subTableName = table.getSubTableName();
        if (StringUtils.isNotBlank(subTableName)) {

        }
    }
    /**
     * 设置主键列信息
     * @param table 业务表信息
     */
    public void setPkColumn(GenTable table) {
        for (GenTableColumn column : table.getColumns()) {
            if ("1".equals(column.getIsPk())) {
                table.setPkColumn(column);
                break;
            }
            if (StringUtils.isNull(table.getPkColumn())) {
                table.setPkColumn(table.getColumns().get(0));
            }
            if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
                for (GenTableColumn columnSub : table.getSubTable().getColumns()) {
                    if ("1".equals(columnSub.getIsPk())) {
                        table.getSubTable().setPkColumn(columnSub);
                        break;
                    }
                    if (StringUtils.isNull(table.getSubTable().getPkColumn())) {
                        table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
                    }
                }
            }
        }
    }
}
