package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlOperLog;

import java.util.List;

/**
 * 操作日志表Mapper接口
 * 
 * @author xiliu
 * @date 2022-07-22
 */
public interface XlOperLogMapper extends BaseMapper<XlOperLog>{
    /**
     * 查询操作日志表
     * @param operId 操作日志表主键
     * @return 操作日志表
     */
    public XlOperLog selectXlOperLogByOperId(Long operId);

    /**
     * 查询操作日志表列表
     * @param xlOperLog 操作日志表
     * @return 操作日志表集合
     */
    public List<XlOperLog> selectXlOperLogList(XlOperLog xlOperLog);

    /**
     * 新增操作日志表
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    public int insertXlOperLog(XlOperLog xlOperLog);

    /**
     * 修改操作日志表
     * 
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    public int updateXlOperLog(XlOperLog xlOperLog);

    /**
     * 删除操作日志表
     * @param operId 操作日志表主键
     * @return 结果
     */
    public int deleteXlOperLogByOperId(Long operId);

    /**
     * 批量删除操作日志表
     * @param operIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteXlOperLogByOperIds(Long[] operIds);
}
