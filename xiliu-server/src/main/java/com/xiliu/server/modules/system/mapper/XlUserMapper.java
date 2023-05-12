package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import com.xiliu.server.modules.services.vo.StaffResultVo;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.vo.RoleUserResultVo;
import com.xiliu.server.modules.system.vo.UserQueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 后台用户表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2021-09-03
 */
public interface XlUserMapper extends BaseMapper<XlUser> {

    /**
     * 通过用户ID查询用户
     * @param userId 用户ID
     * @return 用户对象信息
     */
    XlUser selectUserById(Long userId);

    /**
     * 根据条件分页查询用户列表
     * @param queryVo 条件信息
     * @param page 分页信息
     * @return 用户信息集合信息
     */
    List<XlUser> selectUserList(@Param("user") UserQueryVo queryVo, IPage page);

    /**
     * 通过用户名查询用户
     * @param userName 用户名
     * @return 用户对象信息
     */
    @InterceptorIgnore(tenantLine = "1")
    XlUser selectUserByUserName(String userName);

    /**
     * 校验用户名称是否唯一
     * @param userName 用户名称
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int checkUserNameUnique(String userName);

    /**
     * 批量删除用户信息-根据租户
     * @param ids 需要删除的租户ID
     * @return 结果
     */
    @InterceptorIgnore(tenantLine = "1")
    int deleteUserByTenantId(Long[] ids);

    /**
     * 根据条件分页查询已配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<RoleUserResultVo> selectAllocatedList(@Param("query") XlUser user);

    /**
     * 根据条件分页查询未配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    List<RoleUserResultVo> selectUnallocatedList(@Param("query") XlUser user);


}
