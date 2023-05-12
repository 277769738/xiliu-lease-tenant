package com.xiliu.common.constant;

/**
 * @author
 * @description 用户常量信息
 * @date 2022/7/4
 */
public class UserConstants {

    /** 校验返回结果码 0：唯一  1：不唯一*/
    public final static String UNIQUE = "0";
    public final static String NOT_UNIQUE = "1";

    /** 是否菜单外链（否） */
    public static final String NO_FRAME = "0";

    /** 是否菜单外链（是） */
    public static final String YES_FRAME = "1";

    /** 菜单类型（目录） */
    public static final String TYPE_DIR = "0";

    /** 菜单类型（菜单） */
    public static final String TYPE_MENU = "1";

    /** 菜单类型（按钮） */
    public static final String TYPE_BUTTON = "2";

    /** Layout组件标识 */
    public final static String LAYOUT = "Layout";

    /** InnerLink组件标识 */
    public final static String INNER_LINK = "InnerLink";

    /** ParentView组件标识 */
    public final static String PARENT_VIEW = "ParentView";

    /** 部门正常状态 */
    public static final String DEPT_NORMAL = "0";

    /** 部门停用状态 */
    public static final String DEPT_DISABLE = "1";

    /**
     * 用户名长度限制
     */
    public static final int USERNAME_MIN_LENGTH = 2;

    public static final int USERNAME_MAX_LENGTH = 20;

    /**
     * 密码长度限制
     */
    public static final int PASSWORD_MIN_LENGTH = 5;

    public static final int PASSWORD_MAX_LENGTH = 20;
}
