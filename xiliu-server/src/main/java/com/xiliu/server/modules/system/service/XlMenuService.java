package com.xiliu.server.modules.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlMenu;
import com.xiliu.server.modules.system.vo.RouterVo;
import com.xiliu.server.modules.system.vo.SimpleMenu;


import java.util.List;
import java.util.Set;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-03
 */
public interface XlMenuService extends IService<XlMenu> {

    /**
     * 添加菜单
     * @param menu
     * @return boolean
     **/
    boolean create(XlMenu menu);

    /**
     * 批量删除菜单
     * @param ids
     * @return boolean
     **/
    boolean delete(List<Long> ids);

    /**
     * 根据用户查询系统菜单列表
     * @param menu 菜单
     * @param userId 用户ID
     * @param pageSize 页大小
     * @param pageNum 页数
     * @return 分页菜单列表
     */
    Page<XlMenu> listPage(XlMenu menu, Long userId, Integer pageSize, Integer pageNum);

    /**
     * 根据用户查询系统菜单列表
     * @param menu 菜单
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<XlMenu> selectMenuList(XlMenu menu, Long userId);

    /**
     * 根据用户查询系统菜单列表
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<XlMenu> selectMenuList(Long userId);

    /**
     * 校验菜单名称是否唯一
     * @param menu 菜单信息
     * @return 结果
     */
    String checkMenuNameUnique(XlMenu menu);

    /**
     * 是否存在菜单子节点
     * @param menuId 菜单ID
     * @return 结果 true 存在 false 不存在
     */
    boolean hasChildByMenuId(Long menuId);

    /**
     * 构建前端所需要下拉树结构
     * @param menus 菜单列表
     * @return 下拉树结构列表
     */
    List<TreeSelect> buildMenuTreeSelect(List<XlMenu> menus);

    /**
     * 根据菜单ID查询信息
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    XlMenu selectMenuById(Long menuId);

    /**
     * 根据角色ID查询菜单树信息
     * @param roleId 角色ID
     * @return 选中菜单列表
     */
     List<Long> selectMenuListByRoleId(Long roleId);

    /**
     * 根据用户ID查询权限
     * @param userId 用户ID
     * @return 权限列表
     */
     Set<String> selectMenuPermsByUserId(Long userId);

    /**
     * 根据用户ID查询菜单树信息
     * @param userId 用户ID
     * @return 菜单列表
     */
     List<XlMenu> selectMenuTreeByUserId(Long userId);

    /**
     * 构建前端路由所需要的菜单
     * @param menus 菜单列表
     * @return 路由列表
     */
    List<RouterVo> buildMenus(List<XlMenu> menus);

    /**
     * 查询所有开启状态菜单精简信息
     * @return 菜单列表
     */
    List<SimpleMenu> selectSimpleMenuList();

}
