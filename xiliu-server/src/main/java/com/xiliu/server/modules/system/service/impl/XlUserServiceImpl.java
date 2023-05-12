package com.xiliu.server.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.common.annotation.DataScope;
import com.xiliu.common.constant.UserConstants;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.modules.platform.entity.XlTenant;
import com.xiliu.server.modules.platform.service.IXlTenantService;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.entity.XlUser;
import com.xiliu.server.modules.system.entity.XlUserRole;
import com.xiliu.server.modules.system.mapper.XlRoleMapper;
import com.xiliu.server.modules.system.mapper.XlUserMapper;
import com.xiliu.server.modules.system.service.LoginService;
import com.xiliu.server.modules.system.service.XlUserRoleService;
import com.xiliu.server.modules.system.service.XlUserService;
import com.xiliu.server.modules.system.vo.RoleUserResultVo;
import com.xiliu.server.modules.system.vo.UserQueryVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p>
 * 后台用户表 服务实现类
 * </p>
 *
 * @author xiliu
 * @since 2021-09-03
 */
@Slf4j
@Service
public class XlUserServiceImpl extends ServiceImpl<XlUserMapper, XlUser> implements XlUserService {

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private XlUserRoleService userRoleService;
    @Autowired
    private XlRoleMapper xlRoleMapper;



    @Override
    public XlUser register(XlUser user) {
        XlUser newXlUser = new XlUser();
        BeanUtils.copyProperties(user, newXlUser);
        // 判断账号是否存在
        int usercount = baseMapper.checkUserNameUnique(newXlUser.getUserCode());
        if (usercount > 0) {
            return null;
        }
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(user.getPassWord());
        newXlUser.setPassWord(encodePassword);
        this.baseMapper.insert(newXlUser);
        return newXlUser;
    }

    @Override
    public XlUser getUserByCode(String userCode) {
        List<XlUser> users = baseMapper.selectList(new LambdaQueryWrapper<XlUser>().eq(XlUser::getUserCode,userCode));
        if (CollectionUtil.isNotEmpty(users)) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public XlUser selectUserByUserName(String userName) {
        return baseMapper.selectUserByUserName(userName);
    }

    @Override
    public Page<XlUser> listMemberPage(UserQueryVo queryVo) {
        Page<XlUser> page = new Page<>(queryVo.getCurrentPage(),queryVo.getPageSize());
        List<XlUser> list = baseMapper.selectUserList(queryVo,page);
        page.setRecords(list);
        return page;
    }

    @Override
    public String checkUserNameUnique(String userCode) {
        //查询是否有相同用户名的用户
        int usercount = baseMapper.checkUserNameUnique(userCode);
        if (usercount > 0) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean create(XlUser user) {
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(user.getPassWord());
        user.setPassWord(encodePassword);
        boolean flag = save(user);
        if (flag) {
            //新增用户角色信息
            flag = insertUserRole(user);
        }
        return flag;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean update(XlUser user) {
        boolean flag = updateById(user);
        if (flag) {
            //删除用户角色信息
            userRoleService.remove(new LambdaQueryWrapper<XlUserRole>().eq(XlUserRole::getUserId, user.getUserId()));
            //新增用户角色信息
            flag = insertUserRole(user);
        }
        return flag;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean delete(List<Long> ids) {
        if (CollectionUtil.isNotEmpty(ids)) {
            boolean flag = this.removeBatchByIds(ids);
            if (flag) {
                // 删除用户角色表
                flag = userRoleService.remove(new LambdaQueryWrapper<XlUserRole>().in(XlUserRole::getUserId,ids));
                return flag;
            }
        }
        return true;
    }

    @Override
    public XlUser selectUserById(Long userId) {
        return baseMapper.selectUserById(userId);
    }

    @Override
    public String selectUserRoleGroup(Long userId) {
        List<XlRole> list = xlRoleMapper.selectRolePermissionByUserId(userId);
        if (CollectionUtil.isEmpty(list)) {
            return StringUtils.EMPTY;
        }
        return list.stream().map(XlRole::getRoleName).collect(Collectors.joining(","));
    }

    @Override
    public boolean updateUserAvatar(Long userId, String avatar) {
        XlUser user = getById(userId);
        if (user != null) {
            user.setAvatar(avatar);
            return updateById(user);
        }
        return false;
    }

    /**
     * 新增用户角色信息
     * @param user 用户对象
     */
    public boolean insertUserRole(XlUser user) {
        if (user.getRoleIds() != null && user.getRoleIds().length > 0) {
            // 新增用户与角色管理
            List<XlUserRole> list = new ArrayList<XlUserRole>(user.getRoleIds().length);
            for (Long roleId : user.getRoleIds()) {
                XlUserRole ur = new XlUserRole();
                ur.setUserId(user.getUserId());
                ur.setRoleId(roleId);
                list.add(ur);
            }
            return userRoleService.saveBatch(list);
        }
        return true;
    }

    /**
     * 根据条件分页查询已分配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<RoleUserResultVo> selectAllocatedList(XlUser user) {
        return baseMapper.selectAllocatedList(user);
    }

    /**
     * 根据条件分页查询未分配用户角色列表
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<RoleUserResultVo> selectUnallocatedList(XlUser user) {
        return baseMapper.selectUnallocatedList(user);
    }
}
