package com.xiliu.server.modules.system.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiliu.server.modules.system.entity.XlMenu;
import com.xiliu.server.modules.system.vo.SimpleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author xiliu
 * @since 2022-07-03
 */
public interface XlMenuMapper extends BaseMapper<XlMenu> {

    List<XlMenu> selectMenuListByUserId(@Param(value = "menu") XlMenu menu, @Param(value = "userId") Long userId, Page page);

    /**
     * 查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
    List<XlMenu> selectMenuList(XlMenu menu);

    List<XlMenu> selectMenuListByUserId(@Param(value = "menu") XlMenu menu, @Param(value = "userId") Long userId);

    /**
     * 根据角色ID查询菜单树信息
     * @param roleId 角色ID
     * @param menuCheckStrictly 菜单树选择项是否关联显示
     * @return 选中菜单列表
     */
     List<Long> selectMenuListByRoleId(@Param("roleId") Long roleId, @Param("menuCheckStrictly") boolean menuCheckStrictly);

    /**
     * 根据用户ID查询权限
     * @param userId 用户ID
     * @return 权限列表
     */
     @InterceptorIgnore(tenantLine = "1")
     List<String> selectMenuPermsByUserId(Long userId);

    /**
     * 查询菜单
     * @return 菜单列表
     */
     List<XlMenu> selectMenuTreeAll();

    /**
     * 根据用户ID查询菜单
     * @param userId 用户ID
     * @return 菜单列表
     */
     List<XlMenu> selectMenuTreeByUserId(Long userId);

    /**
     * 查询所有开启状态菜单精简信息
     * @return 菜单列表
     */
    List<SimpleMenu> selectSimpleMenuList();
}
