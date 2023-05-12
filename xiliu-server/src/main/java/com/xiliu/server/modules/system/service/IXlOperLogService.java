package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.system.entity.XlOperLog;

import java.util.List;

/**
 * 操作日志表Service接口
 * 
 * @author xiliu
 * @date 2022-07-22
 */
public interface IXlOperLogService extends IService<XlOperLog> {
    /**
     * 查询操作日志表
     * @param operId 操作日志表主键
     * @return 操作日志表
     */
    XlOperLog selectXlOperLogByOperId(Long operId);

    /**
     * 查询操作日志表列表
     * @param xlOperLog 操作日志表
     * @return 操作日志表集合
     */
    List<XlOperLog> selectXlOperLogList(XlOperLog xlOperLog);

    /**
     * 新增操作日志表
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    boolean create(XlOperLog xlOperLog);

    /**
     * 修改操作日志表
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    boolean updateXlOperLog(XlOperLog xlOperLog);

    /**
     * 批量删除操作日志表
     * 
     * @param operIds 需要删除的操作日志表主键集合
     * @return 结果
     */
    int deleteXlOperLogByOperIds(Long[] operIds);

    /**
     * 删除操作日志表信息
     * 
     * @param operId 操作日志表主键
     * @return 结果
     */
    int deleteXlOperLogByOperId(Long operId);
}
