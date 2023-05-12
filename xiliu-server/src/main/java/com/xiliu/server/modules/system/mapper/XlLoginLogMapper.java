package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiliu.server.modules.system.entity.XlLoginLog;

import java.util.List;

/**
 * 系统访问日志表Mapper接口
 * 
 * @author xiliu
 * @date 2022-07-25
 */
public interface XlLoginLogMapper extends BaseMapper<XlLoginLog>{
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
     * 清空系统登录日志
     * @return 结果
     */
    int cleanLoginlog();

}
