package com.xiliu.server.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.xiliu.common.constant.Constants;
import com.xiliu.common.constant.UserConstants;

import com.xiliu.server.common.domain.TreeSelect;
import com.xiliu.server.modules.system.entity.XlMenu;
import com.xiliu.server.modules.system.entity.XlRole;
import com.xiliu.server.modules.system.mapper.XlMenuMapper;
import com.xiliu.server.modules.system.mapper.XlRoleMapper;
import com.xiliu.server.modules.system.service.XlMenuService;
import com.xiliu.server.modules.system.vo.MetaVo;
import com.xiliu.server.modules.system.vo.RouterVo;
import com.xiliu.server.modules.system.vo.SimpleMenu;
import com.xiliu.server.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author xiliu
 * @since 2022-07-03
 */
@Service
public class XlMenuServiceImpl extends ServiceImpl<XlMenuMapper, XlMenu> implements XlMenuService {

    @Autowired
    private XlRoleMapper roleMapper;

    @Override
    public boolean create(XlMenu menu) {
        return save(menu);
    }

    @Override
    public boolean delete(List<Long> ids) {
        return removeByIds(ids);
    }

    @Override
    public Page<XlMenu> listPage(XlMenu menu, Long userId, Integer pageSize, Integer pageNum) {
        Page<XlMenu> page = new Page<>(pageNum,pageSize);
        // 超级管理员显示所有菜单信息
        if (SecurityUtils.isAdmin(userId)) {
            return baseMapper.selectPage(page,new LambdaQueryWrapper<XlMenu>().eq(XlMenu::getStatus,1));
        } else {
           List<XlMenu> menuList = baseMapper.selectMenuListByUserId(menu,userId,page);
            return page.setRecords(menuList);
        }
    }

    @Override
    public List<XlMenu> selectMenuList(XlMenu menu, Long userId) {
        List<XlMenu> menuList = null;
        // 超级管理员显示所有菜单信息
        if (SecurityUtils.isAdmin(userId)) {
            menuList = baseMapper.selectMenuList(menu);
        } else {
            menuList = baseMapper.selectMenuListByUserId(menu,userId);
        }
        return menuList;
    }

    @Override
    public List<XlMenu> selectMenuList(Long userId) {
        return selectMenuList(new XlMenu(), userId);
    }

    @Override
    public String checkMenuNameUnique(XlMenu menu) {
        Long menuId = menu.getMenuId() == null ? -1L : menu.getMenuId();
        List<XlMenu> menus = baseMapper.selectList(new LambdaQueryWrapper<XlMenu>()
                .eq(XlMenu::getMenuName, menu.getMenuName())
                .eq(XlMenu::getParentId, menu.getParentId()));
        if (CollectionUtil.isNotEmpty(menus) && menus.get(0).getMenuId().longValue() != menuId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    @Override
    public boolean hasChildByMenuId(Long menuId) {
        Long result = baseMapper.selectCount(new LambdaQueryWrapper<XlMenu>().eq(XlMenu::getParentId,menuId));
        return result > 0;
    }

    @Override
    public List<TreeSelect> buildMenuTreeSelect(List<XlMenu> menus) {
        List<XlMenu> returnList = new ArrayList<>();
        List<Long> tempList = new ArrayList<>();
        for (XlMenu menu : menus) {
            tempList.add(menu.getMenuId());
        }
        for (Iterator<XlMenu> iterator = menus.iterator(); iterator.hasNext(); ) {
           XlMenu menu = iterator.next();
           // 如果是顶级节点，遍历该父节点所有的子节点
           if (!tempList.contains(menu.getParentId())) {
               recursionList(menus,menu);
               returnList.add(menu);
           }
        }
        if (CollectionUtil.isEmpty(returnList)) {
            returnList = menus;
        }
        return returnList.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    @Override
    public XlMenu selectMenuById(Long menuId) {
        return baseMapper.selectById(menuId);
    }

    @Override
    public List<Long> selectMenuListByRoleId(Long roleId) {
        XlRole role = roleMapper.selectRoleById(roleId);
        return baseMapper.selectMenuListByRoleId(roleId, role.isMenuCheckStrictly());
    }

    @Override
    public Set<String> selectMenuPermsByUserId(Long userId) {
        // 获取菜单权限集合
        List<String> perms = baseMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms) {
            if (StrUtil.isNotEmpty(perm)) {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    @Override
    public List<XlMenu> selectMenuTreeByUserId(Long userId) {
        List<XlMenu> menus = null;
        if (SecurityUtils.isAdmin(userId)){
            menus = baseMapper.selectMenuTreeAll();
        } else {
            menus = baseMapper.selectMenuTreeByUserId(userId);
        }
        return getChildPerms(menus, 0);
    }

    @Override
    public List<RouterVo> buildMenus(List<XlMenu> menus) {
        List<RouterVo> routers = new LinkedList<>();
        for (XlMenu menu : menus) {
            RouterVo router = new RouterVo();
            //0:隐藏
            router.setHidden("0".equals(menu.getVisible()));
            router.setName(getRouteName(menu));
            router.setPath(getRouterPath(menu));
            router.setComponent(getComponent(menu));
            router.setRouterQuery(menu.getRouterQuery());
            router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(),false, menu.getPath()));
            List<XlMenu> cMenus = menu.getChildren();
            // 有子路由
            if (CollectionUtil.isNotEmpty(cMenus) && UserConstants.TYPE_DIR.equals(String.valueOf(menu.getMenuType()))) {
                router.setAlwaysShow(true);
                router.setRedirect("noRedirect");
                router.setChildren(buildMenus(cMenus));
            } else if (isMenuFrame(menu)) {
                // 菜单内部跳转
                router.setMeta(null);
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                children.setPath(menu.getPath());
                children.setComponent(menu.getComponent());
                children.setName(StringUtils.capitalize(menu.getPath()));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), false, menu.getPath()));
                children.setRouterQuery(menu.getRouterQuery());
                childrenList.add(children);
                router.setChildren(childrenList);
            } else if (menu.getParentId().intValue() == 0 && isInnerLink(menu)) {
                router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon()));
                router.setPath("/");
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                String routerPath = innerLinkReplaceEach(menu.getPath());
                children.setPath(routerPath);
                children.setComponent(UserConstants.INNER_LINK);
                children.setName(StringUtils.capitalize(routerPath));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), menu.getPath()));
                childrenList.add(children);
                router.setChildren(childrenList);
            }
            routers.add(router);
        }
        return routers;
    }

    @Override
    public List<SimpleMenu> selectSimpleMenuList() {
        return baseMapper.selectSimpleMenuList();
    }

    /**
     * 递归列表
     * @param menus
     * @param t
     */
    private void recursionList(List<XlMenu> menus, XlMenu t) {
        // 得到子节点
        List<XlMenu> childList = getChildList(menus,t);
        t.setChildren(childList);
        for (XlMenu tChild : childList) {
            if (hasChild(menus,tChild)) {
                recursionList(menus, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<XlMenu> getChildList(List<XlMenu> list, XlMenu t) {
        List<XlMenu> tList = new ArrayList<>();
        Iterator<XlMenu> it = list.iterator();
        while (it.hasNext()) {
            XlMenu n = it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue()) {
                tList.add(n);
            }
        }
        return tList;
    }
    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<XlMenu> list, XlMenu t) {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 获取路由名称
     */
    private String getRouteName(XlMenu menu) {
        // 首字母大写
        String routerName = StringUtils.capitalize(menu.getPath());
        // 非外链并且是一级目录（类型为菜单）
        if (isMenuFrame(menu)){
            routerName = StringUtils.EMPTY;
        }
        return routerName;
    }
    /**
     * 获取路由地址
     */
    private String getRouterPath(XlMenu menu) {
        String routerPath = menu.getPath();
        // 内链打开外网方式
        if (menu.getParentId().intValue() != 0 && isInnerLink(menu)) {
            // 内链域名特殊字符替换
            routerPath = innerLinkReplaceEach(routerPath);
        }
        // 非外链并且是一级目录（类型为目录）
        if (menu.getParentId().intValue() == 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType())
                && UserConstants.NO_FRAME.equals(menu.getIsFrame()) ) {
            routerPath = "/" + menu.getPath();
        } else if (isMenuFrame(menu)) {
            routerPath = "/";
        }
        return routerPath;
    }

    /**
     * 是否为菜单内部跳转
     */
    private boolean isMenuFrame(XlMenu menu) {
        return menu.getParentId().intValue() == 0 && UserConstants.TYPE_MENU.equals(menu.getMenuType())
                && menu.getIsFrame().equals(UserConstants.NO_FRAME);
    }
    /**
     * 是否为内链组件
     */
    private boolean isInnerLink(XlMenu menu) {
        // 判断是否为http(s)://开头
        return menu.getIsFrame().equals(UserConstants.NO_FRAME) && StringUtils.startsWithAny(menu.getPath(),Constants.HTTP, Constants.HTTPS);
    }
    /**
     * 是否为parent_view组件 (有多级的菜单)
     */
    private boolean isParentView(XlMenu menu) {
       return menu.getParentId().intValue() != 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType());
    }
    /**
     * 内链域名特殊字符替换
     */
    private String innerLinkReplaceEach(String path) {
        return StringUtils.replaceEach(path, new String[] { Constants.HTTP, Constants.HTTPS },
                new String[] { "", "" });
    }

    private List<XlMenu> getChildPerms(List<XlMenu> list, int parentId) {
        List<XlMenu> returnList = new ArrayList<XlMenu>();
        for (Iterator<XlMenu> iterator = list.iterator(); iterator.hasNext();) {
            XlMenu menu = iterator.next();
            if (menu.getParentId() == parentId) {
                recursionList(list, menu);
                returnList.add(menu);
            }
        }
        return returnList;
    }
    /**
     * 获取组件信息
     * @param menu 菜单信息
     * @return 组件信息
     */
    public String getComponent(XlMenu menu) {
        String component = UserConstants.LAYOUT;
        if (StringUtils.isNotEmpty(menu.getComponent()) && !isMenuFrame(menu)) {
            component = menu.getComponent();
        } else if (StringUtils.isEmpty(menu.getComponent()) && menu.getParentId().intValue() != 0 && isInnerLink(menu)) {
            component = UserConstants.INNER_LINK;
        } else if (StringUtils.isEmpty(menu.getComponent()) && isParentView(menu)) {
            component = UserConstants.PARENT_VIEW;
        }
        return component;
    }
}
