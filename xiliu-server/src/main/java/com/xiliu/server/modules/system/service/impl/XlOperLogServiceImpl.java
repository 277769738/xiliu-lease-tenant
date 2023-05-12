package com.xiliu.server.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.server.modules.system.entity.XlOperLog;
import com.xiliu.server.modules.system.mapper.XlOperLogMapper;
import com.xiliu.server.modules.system.service.IXlOperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 操作日志表Service业务层处理
 * 
 * @author xiliu
 * @date 2022-07-22
 */
@Service
public class XlOperLogServiceImpl extends ServiceImpl<XlOperLogMapper, XlOperLog> implements IXlOperLogService {

    @Autowired
    private XlOperLogMapper xlOperLogMapper;

    /**
     * 查询操作日志表
     * @param operId 操作日志表主键
     * @return 操作日志表
     */
    @Override
    public XlOperLog selectXlOperLogByOperId(Long operId) {
        return xlOperLogMapper.selectXlOperLogByOperId(operId);
    }

    /**
     * 查询操作日志表列表
     * @param xlOperLog 操作日志表
     * @return 操作日志表
     */
    @Override
    public List<XlOperLog> selectXlOperLogList(XlOperLog xlOperLog) {
        return xlOperLogMapper.selectXlOperLogList(xlOperLog);
    }

    /**
     * 新增操作日志表
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    @Override
    public boolean create(XlOperLog xlOperLog) {
        return save(xlOperLog);
    }

    /**
     * 修改操作日志表
     * @param xlOperLog 操作日志表
     * @return 结果
     */
    @Override
    public boolean updateXlOperLog(XlOperLog xlOperLog) {
        return updateById(xlOperLog);
    }

    /**
     * 批量删除操作日志表
     * @param operIds 需要删除的操作日志表主键
     * @return 结果
     */
    @Override
    public int deleteXlOperLogByOperIds(Long[] operIds) {
        return xlOperLogMapper.deleteBatchIds(Arrays.asList(operIds));
    }

    /**
     * 删除操作日志表信息
     * @param operId 操作日志表主键
     * @return 结果
     */
    @Override
    public int deleteXlOperLogByOperId(Long operId) {
        return xlOperLogMapper.deleteById(operId);
    }
}
