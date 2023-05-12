package com.xiliu.server.modules.platform.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiliu.common.component.redis.RedisCache;
import com.xiliu.common.constant.CacheConstants;
import com.xiliu.common.result.R;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.modules.platform.entity.XlTenant;
import com.xiliu.server.modules.platform.entity.XlTenantPackage;
import com.xiliu.server.modules.platform.mapper.XlTenantMapper;
import com.xiliu.server.modules.platform.mapper.XlTenantPackageMapper;
import com.xiliu.server.modules.platform.service.IXlTenantService;
import com.xiliu.server.modules.platform.vo.TenantResultVo;
import com.xiliu.server.modules.system.entity.*;
import com.xiliu.server.modules.system.mapper.*;
import com.xiliu.server.modules.system.service.XlRoleMenuService;
import com.xiliu.server.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 租户表Service业务层处理
 * 
 * @author xiliu
 * @date 2023-03-03
 */
@Service
public class XlTenantServiceImpl extends ServiceImpl<XlTenantMapper, XlTenant> implements IXlTenantService {
    @Autowired
    private XlTenantMapper xlTenantMapper;
    @Autowired
    private XlTenantPackageMapper tenantPackageMapper;
    @Autowired
    private XlUserMapper xlUserMapper;
    @Autowired
    private XlDeptMapper deptMapper;
    @Autowired
    private XlRoleMapper roleMapper;
    @Autowired
    private XlRoleMenuService roleMenuService;
    @Autowired
    private XlUserRoleMapper userRoleMapper;
    @Autowired
    private XlRoleMenuMapper xlRoleMenuMapper;
    @Autowired
    private RedisCache redisCache;

    /**
     * 查询租户表
     * @param tenantId 租户表主键
     * @return 租户表
     */
    @Override
    public XlTenant selectXlTenantByTenantId(Long tenantId) {
        return xlTenantMapper.selectXlTenantByTenantId(tenantId);
    }

    /**
     * 查询租户表列表
     * @param xlTenant 租户表
     * @return 租户表
     */
    @Override
    public List<TenantResultVo> selectXlTenantList(XlTenant xlTenant) {
        return xlTenantMapper.selectXlTenantList(xlTenant);
    }

    /**
     * 新增租户表
     * @param xlTenant 租户表
     * @return 结果
     */
    @Override
    public boolean create(XlTenant xlTenant) {
        return save(xlTenant);
    }

    /**
     * 修改租户表
     * @param xlTenant 租户表
     * @return 结果
     */
    @Override
    public boolean update(XlTenant xlTenant) {
        return updateById(xlTenant);
    }

    /**
     * 批量删除租户表
     * @param tenantIds 需要删除的租户表主键
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteXlTenantByTenantIds(Long[] tenantIds) {
        int num = xlTenantMapper.deleteTenantByIds(tenantIds);
        if (num > 0) {
            //下面才会进行子模块数据的删除
            //部门模块
            deptMapper.deleteDeptByTenantId(tenantIds);
            //权限
            roleMapper.deleteRoleByTenantId(tenantIds);
            xlRoleMenuMapper.deleteRoleMenuByTenantIds(tenantIds);
            //账号
            xlUserMapper.deleteUserByTenantId(tenantIds);
            userRoleMapper.deleteUserRoleByTenantId(tenantIds);
        } else {
            throw new RuntimeException("当前租户已被删除不存在！");
        }
        return 1;
    }

    /**
     * 删除租户表信息
     * @param tenantId 租户表主键
     * @return 结果
     */
    @Override
    public int deleteXlTenantByTenantId(Long tenantId) {
        return xlTenantMapper.deleteById(tenantId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public R addTenant(XlTenant xlTenant) {
        if (StringUtils.isEmpty(xlTenant.getTenantCode())) {
            return R.error("租户编码为空,请重新设置!");
        }
        // 判断租户编码是否存在
        Long tenantcount = xlTenantMapper.selectCount(new LambdaQueryWrapper<XlTenant>().eq(XlTenant::getTenantCode,xlTenant.getTenantCode()));
        if (tenantcount > 0) {
            return R.error("租户编码已存在,请重新设置!");
        }
        if (StringUtils.isEmpty(xlTenant.getUserName())){
            return R.error("管理员账号为空,请重新设置!");
        }
        // 判断账号是否存在
        int usercount = xlUserMapper.checkUserNameUnique(xlTenant.getUserName());
        if (usercount > 0) {
            return R.error("用户名已存在,请重新设置!");
        }
        //创建租户
        xlTenantMapper.insert(xlTenant);
        // 创建默认部门--部门默认名称以租户名称
        Long deptid = createDept(xlTenant);
        // 创建默认角色--角色默认为租户名称+管理员
        Long roleid = createRole(xlTenant);
        // 创建默认账号
        createUser(xlTenant,deptid,roleid);
        return R.ok("租户创建成功!");
    }

    private Long createDept(XlTenant xlTenant) {
        // 创建部门
        XlDept dept = new XlDept();
        dept.setParentId(0L);
        dept.setAncestors("0");
        dept.setDeptName(xlTenant.getTenantName());
        dept.setSort(0);
        dept.setLeader(xlTenant.getTenantName()+"管理员");
        dept.setPhone(xlTenant.getPhone());
        dept.setEmail(xlTenant.getEmail());
        dept.setTenantId(xlTenant.getTenantId());
        deptMapper.insert(dept);
        return dept.getDeptId();
    }

    private Long createRole(XlTenant xlTenant) {
        // 创建角色
        XlRole role = new XlRole();
        role.setRoleName(xlTenant.getTenantName()+"管理员");
        role.setRoleKey("admin");
        role.setDataScope("1");
        role.setMenuCheckStrictly(true);
        role.setDeptCheckStrictly(true);
        role.setDescription("租户管理员");
        role.setTenantId(xlTenant.getTenantId());
        roleMapper.insert(role);
        //根据租户套餐ids查出套餐编码塞入角色-菜单表
        createRoleMenu(xlTenant,role);
        return role.getRoleId();
    }
    /**
     * 目前为单套餐,跟租户绑定,解耦防止套餐变动影响多个租户
     **/
    private void createRoleMenu(XlTenant xlTenant,XlRole role) {
        XlTenantPackage sysTenantPackage = tenantPackageMapper.selectById(xlTenant.getPackageId());
        List<String> subMeuns = Arrays.asList(sysTenantPackage.getMenuIds().split(","));

        List<XlRoleMenu> roleMenuList = subMeuns.stream().map(menuid -> {
            XlRoleMenu entity = new XlRoleMenu();
            entity.setRoleId(role.getRoleId());
            entity.setMenuId(Long.valueOf(menuid));
            entity.setTenantId(xlTenant.getTenantId());
            return entity;
        }).collect(Collectors.toList());
        roleMenuService.saveBatch(roleMenuList);
    }
    private void createUser(XlTenant sysTenant,Long deptId,Long roleId) {
        XlUser user = new XlUser();
        user.setDeptId(deptId);
        user.setUserCode(sysTenant.getUserName());
        user.setRealName(sysTenant.getTenantName());
        user.setUserNickname(sysTenant.getTenantName());
        user.setUserType(1);
        user.setUserEmail(sysTenant.getEmail());
        user.setMobile(sysTenant.getPhone());
        String password = SecurityUtils.encryptPassword(sysTenant.getUserPwd());
        user.setPassWord(password);
        user.setTenantId(sysTenant.getTenantId());
        xlUserMapper.insert(user);
        createUserRole(sysTenant.getTenantId(),user.getUserId(),roleId);
    }
    private void createUserRole(Long tenantId,Long userId,Long roleId) {
        XlUserRole userRole = new XlUserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRole.setTenantId(tenantId);
        userRoleMapper.insert(userRole);
    }

    @Override
    public R updateTenant(XlTenant xlTenant) {
        //判断最新的租户套餐是否改变 重新授权 租户二级管理员账号需重新分配三级账号权限
        XlTenant newTenant = xlTenantMapper.selectById(xlTenant.getTenantId());
        if(xlTenant.getPackageId() != null && !xlTenant.getPackageId().equals(newTenant.getPackageId())) {
            List<XlRole> roleList = roleMapper.queryAdminRole(xlTenant.getTenantId());
            // 正常逻辑下每个租户只有一个二级管理员账号
            XlRole tRole = roleList.get(0);
            if (tRole != null) {
                // 删除原租户下所有的角色-菜单信息
                xlRoleMenuMapper.deleteRoleMenuByTenantId(xlTenant.getTenantId());
                // 新增默认角色-菜单信息
                createRoleMenu(xlTenant,tRole);
                // 原登录租户账号退出重登
                Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
                if (CollectionUtil.isNotEmpty(keys)) {
                    for (String key : keys) {
                        LoginUser onlineUser = redisCache.getCacheObject(key);
                        if(onlineUser.getUser().getTenantId() != null && onlineUser.getUser().getTenantId().equals(xlTenant.getTenantId())) {
                            redisCache.deleteObject(key);
                        }
                    }
                }
            }
        }
        xlTenantMapper.updateById(xlTenant);
        return R.ok();
    }
}
