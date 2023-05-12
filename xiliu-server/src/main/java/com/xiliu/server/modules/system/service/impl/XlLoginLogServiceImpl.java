package com.xiliu.server.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.server.modules.system.entity.XlLoginLog;
import com.xiliu.server.modules.system.mapper.XlLoginLogMapper;
import com.xiliu.server.modules.system.service.IXlLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 系统访问日志表Service业务层处理
 * 
 * @author xiliu
 * @date 2022-07-25
 */
@Service
public class XlLoginLogServiceImpl extends ServiceImpl<XlLoginLogMapper, XlLoginLog> implements IXlLoginLogService {
    @Autowired
    private XlLoginLogMapper xlLoginLogMapper;

    /**
     * 查询系统访问日志表
     * @param loginId 系统访问日志表主键
     * @return 系统访问日志表
     */
    @Override
    public XlLoginLog selectXlLoginLogByLoginId(Long loginId) {
        return xlLoginLogMapper.selectXlLoginLogByLoginId(loginId);
    }

    /**
     * 查询系统访问日志表列表
     * @param xlLoginLog 系统访问日志表
     * @return 系统访问日志表
     */
    @Override
    public List<XlLoginLog> selectXlLoginLogList(XlLoginLog xlLoginLog) {
        return xlLoginLogMapper.selectXlLoginLogList(xlLoginLog);
    }

    /**
     * 新增系统访问日志表
     * @param xlLoginLog 系统访问日志表
     * @return 结果
     */
    @Override
    public boolean create(XlLoginLog xlLoginLog) {
        return save(xlLoginLog);
    }

    /**
     * 修改系统访问日志表
     * @param xlLoginLog 系统访问日志表
     * @return 结果
     */
    @Override
    public boolean update(XlLoginLog xlLoginLog) {
        return updateById(xlLoginLog);
    }

    /**
     * 批量删除系统访问日志表
     * @param loginIds 需要删除的系统访问日志表主键
     * @return 结果
     */
    @Override
    public int deleteXlLoginLogByLoginIds(Long[] loginIds) {
        return xlLoginLogMapper.deleteBatchIds(Arrays.asList(loginIds));
    }

    /**
     * 删除系统访问日志表信息
     * @param loginId 系统访问日志表主键
     * @return 结果
     */
    @Override
    public int deleteXlLoginLogByLoginId(Long loginId) {
        return xlLoginLogMapper.deleteById(loginId);
    }

    @Override
    public void cleanLoginlog() {
        xlLoginLogMapper.cleanLoginlog();
    }
}
