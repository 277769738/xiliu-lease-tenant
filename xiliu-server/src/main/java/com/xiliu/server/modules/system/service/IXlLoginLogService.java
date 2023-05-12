package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.system.entity.XlLoginLog;

import java.util.List;

/**
 * 系统访问日志表Service接口
 * 
 * @author xiliu
 * @date 2022-07-25
 */
public interface IXlLoginLogService extends IService<XlLoginLog>{
    /**
     * 查询系统访问日志表
     * @param loginId 系统访问日志表主键
     * @return 系统访问日志表
     */
    XlLoginLog selectXlLoginLogByLoginId(Long loginId);

    /**
     * 查询系统访问日志表列表
     * @param xlLoginLog 系统访问日志表
     * @return 系统访问日志表集合
     */
    List<XlLoginLog> selectXlLoginLogList(XlLoginLog xlLoginLog);

    /**
     * 新增系统访问日志表
     * @param xlLoginLog 系统访问日志表
     * @return 结果
     */
    boolean create(XlLoginLog xlLoginLog);

    /**
     * 修改系统访问日志表
     * @param xlLoginLog 系统访问日志表
     * @return 结果
     */
    boolean update(XlLoginLog xlLoginLog);

    /**
     * 批量删除系统访问日志表
     * 
     * @param loginIds 需要删除的系统访问日志表主键集合
     * @return 结果
     */
    int deleteXlLoginLogByLoginIds(Long[] loginIds);

    /**
     * 删除系统访问日志表信息
     * 
     * @param loginId 系统访问日志表主键
     * @return 结果
     */
    int deleteXlLoginLogByLoginId(Long loginId);

    /**
     * 清空系统登录日志
     */
    void cleanLoginlog();
}
