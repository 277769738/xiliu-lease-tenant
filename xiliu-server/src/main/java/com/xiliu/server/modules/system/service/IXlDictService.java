package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.system.entity.XlDict;

import java.util.List;

/**
 * 字典表Service接口
 * 
 * @author xiliu
 * @date 2022-08-09
 */
public interface IXlDictService extends IService<XlDict>{
    /**
     * 查询字典表
     * @param dictId 字典表主键
     * @return 字典表
     */
    XlDict selectXlDictByDictId(Long dictId);

    /**
     * 查询字典表列表
     * @param xlDict 字典表
     * @return 字典表集合
     */
    List<XlDict> selectXlDictList(XlDict xlDict);

    /**
     * 新增字典表
     * @param xlDict 字典表
     * @return 结果
     */
    boolean create(XlDict xlDict);

    /**
     * 修改字典表
     * @param xlDict 字典表
     * @return 结果
     */
    boolean update(XlDict xlDict);

    /**
     * 批量删除字典表
     * 
     * @param dictIds 需要删除的字典表主键集合
     * @return 结果
     */
    int deleteXlDictByDictIds(Long[] dictIds);

    /**
     * 删除字典表信息
     * 
     * @param dictId 字典表主键
     * @return 结果
     */
    int deleteXlDictByDictId(Long dictId);

    /**
     * 根据所有字典类型
     * @return 字典类型集合信息
     */
    List<XlDict> selectDictTypeAll();

    /**
     * 加载字典缓存数据
     */
    void loadingDictCache();

    /**
     * 清空字典缓存数据
     */
    void clearDictCache();

    /**
     * 重置字典缓存数据
     */
    void resetDictCache();

}
