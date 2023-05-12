package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.vo.RoleUserResultVo;
import com.xiliu.server.modules.system.vo.UserQueryVo;


import java.util.List;

/**
 * <p>
 * 后台用户表 服务类
 * </p>
 *
 * @author xiliu
 * @since 2021-09-03
 */
public interface XlUserService extends IService<XlUser> {

    /**
     * 注册功能
     * @param user
     * @return XlUser
     */
    XlUser register(XlUser user);

    /**
     * 查询用户
     * @param userCode
     * @return XlUser
     */
    XlUser getUserByCode(String userCode);

    /**
     * 通过用户名查询用户
     * @param userName 用户名
     * @return 用户对象信息
     */
    XlUser selectUserByUserName(String userName);
    /**
     * 获取列表。分页
     * @param queryVo 查询参数
     * @return page
     */
    Page<XlUser> listMemberPage(UserQueryVo queryVo);

    /**
     * 校验用户名称是否唯一
     * @param userName 用户名称
     * @return 结果
     */
    String checkUserNameUnique(String userName);

    /**
     * 添加用户
     * @param user
     * @return boolean
     **/
    boolean create(XlUser user);

    /**
     * 修改用户
     * @param user
     * @return boolean
     **/
    boolean update(XlUser user);

    /**
     * 批量删除用户
     * @param ids
     * @return boolean
     **/
    boolean delete(List<Long> ids);

    /**
     * 通过用户ID查询用户
     * @param userId 用户ID
     * @return 用户对象信息
     */
    XlUser selectUserById(Long userId);

    /**
     * 根据用户ID查询用户所属角色组
     * @param userId 用户id
     * @return 结果
     */
    String selectUserRoleGroup(Long userId);

    /**
     * 修改用户头像
     * @param userId 用户id
     * @param avatar 头像地址
     * @return 结果
     */
    boolean updateUserAvatar(Long userId, String avatar);

    /**
     * 根据条件分页查询已配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<RoleUserResultVo> selectAllocatedList(XlUser user);

    /**
     * 根据条件分页查询已配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<RoleUserResultVo> selectUnallocatedList(XlUser user);
}
