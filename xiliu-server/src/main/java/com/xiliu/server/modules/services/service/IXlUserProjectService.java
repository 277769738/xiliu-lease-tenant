package com.xiliu.server.modules.services.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.modules.services.entity.XlUserProject;

import java.util.List;

/**
 * 用户分配项目表Service接口
 *
 * @author xiliu
 * @date 2023-03-28
 */
public interface IXlUserProjectService extends IService<XlUserProject> {

    /**
     * 校验用户是否分配门店
     * @param userId 用户id
     * @return 结果
     */
    boolean checkAuth(Long userId);

    /**
     * 获取已分配门店
     * @param userId 用户id
     * @return 结果
     */
    List<Long> selectAuthListByUserId(Long userId);
}