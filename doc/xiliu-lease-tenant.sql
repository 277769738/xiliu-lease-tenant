/*==============================================================*/
/* Table: gen_table                                             */
/*==============================================================*/
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '表名称',
  `table_comment` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实体类名称',
  `tpl_category` varchar(30) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_id` bigint DEFAULT NULL COMMENT '归属表id',
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '列名称',
  `column_comment` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '列描述',
  `column_type` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '是否查询字段（1是）',
  `query_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Table structure for xl_tenant
-- ----------------------------
DROP TABLE IF EXISTS `xl_tenant`;
CREATE TABLE `xl_tenant` (
  `tenant_id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户ID',
  `tenant_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '租户类型;0:公司;1:部门;2:个人;3:其他',
  `tenant_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '用户状态;0:正常,1:停用',
  `tenant_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `tenant_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `tenant_logo` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo图',
  `sort_order` int DEFAULT NULL COMMENT '显示顺序',
  `home_url` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '官方地址',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `fax` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `email` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `address` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `user_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员账号',
  `user_pwd` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码',
  `package_id` bigint DEFAULT NULL COMMENT '套餐id',
  `tenant_time` datetime DEFAULT NULL COMMENT '租赁到期时间',
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户表';

-- ----------------------------
-- Records of xl_tenant
-- ----------------------------
INSERT INTO `xl_tenant` VALUES ('4', '0', '0', '1000', '与之', 'https://xiliu-1259663924.cos.ap-guangzhou.myqcloud.com/upload/house/1678248195183_logo.jpg', '0', 'http://yzcms.xiliu.online', '13545678956', '020', '123', '广东省广州市海珠区', 'yz_admin', '123456', '3', '2024-03-07 08:00:00', '备注', '2023-04-19 18:23:13', '1', '2023-03-07 11:33:54', '1', '0', '10');
INSERT INTO `xl_tenant` VALUES ('6', '0', '0', '2000', '租户2', null, '2', null, '13546532356', null, null, null, 'test_admin', '123456', '2', '2023-03-31 08:00:00', null, null, null, '2023-03-09 15:07:43', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `xl_tenant_package`;
CREATE TABLE `xl_tenant_package` (
  `package_id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `package_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `menu_ids` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联菜单id',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:正常,1:停用',
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户套餐表';

-- ----------------------------
-- Records of xl_tenant_package
-- ----------------------------
INSERT INTO `xl_tenant_package` VALUES ('1', '基础套餐', '5,7,8,13,14,6,15,16,17,18,27,38,39,41,42,43,44,45,46,1', '0', null, null, null, '2023-03-05 15:37:23', '1', '0', '1');
INSERT INTO `xl_tenant_package` VALUES ('2', '系统监控套餐', '19,20,21,22,23,24,25', '0', null, '2023-03-05 16:05:32', '1', '2023-03-05 15:54:29', '1', '0', '1');
INSERT INTO `xl_tenant_package` VALUES ('3', '默认套餐', '1,28,29,31,32,33,34,30,35,36,37,19,20,21,22,57,58,61,62,63,64,65,66,67,68,77,79,81,82,83,84,85,80,59,60,69,70,71,72,73,74,75,76,78', '0', null, '2023-04-19 18:22:49', '1', '2023-03-13 14:21:31', '1', '0', '6');

-- ----------------------------
-- Table structure for xl_user
-- ----------------------------
DROP TABLE IF EXISTS `xl_user`;
CREATE TABLE `xl_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_code` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `real_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `user_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `user_email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `status` tinyint DEFAULT '0' COMMENT '状态 0:正常；1:停用 ',
  `user_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL COMMENT '入职时间',
  `user_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工编号',
  `id_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of xl_user
-- ----------------------------
INSERT INTO `xl_user` VALUES ('1', '1', '0', null, null, '', 'admin', '$2a$10$AtQatJCSY3L0qP07AlKf5OATykQ/OUAgNQMsd/IFoBXIY.1tJJE26', '超级管理员', null, '', '0', '', '', null, null, null, null, null, '9999', '2023-05-09 10:40:00', '2', null, null, '0', '1');
INSERT INTO `xl_user` VALUES ('2', '1', '0', null, null, '', 'test', '$2a$10$AtQatJCSY3L0qP07AlKf5OATykQ/OUAgNQMsd/IFoBXIY.1tJJE26', '测试', null, '', '0', '', '', null, null, null, null, '1', '9999', '2023-03-13 16:23:18', '1', null, null, '0', '1');
INSERT INTO `xl_user` VALUES ('3', '1', '0', null, null, '', 'yz_admin', '$2a$10$.4xl5ya.74siMqLy/KmHUu504ZvaFox6h7uVSFgt/vWQSzm4A8o/S', '与之', '与之', '', '0', '', '', '13545678956', null, null, null, '6', '4', null, null, '2023-03-07 11:34:10', '1', '0', '1');
INSERT INTO `xl_user` VALUES ('5', '1', '0', null, null, '', 'test_admin', '$2a$10$C0IoRQdGlhcqoOzkUPB3oO3qoO4HwkiK.ndalBDahRYEXl73tKeqq', '租户2', '租户2', '', '0', '', '', '13546532356', null, null, null, '8', '6', null, null, '2023-03-09 15:07:44', '1', '0', '1');
INSERT INTO `xl_user` VALUES ('6', '1', '0', null, null, '', '15562359845', '$2a$10$DCV6Rjc7Q5MfI3xTTVfOAuWpjkq16yto64upL2HXunF6d5Ks4So.u', '希留', null, '', '0', '', '', '15876519145', '2023-03-01 08:00:00', '001', '456123', null, '9999', '2023-03-29 17:01:37', '1', '2023-03-29 16:07:54', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_role
-- ----------------------------
DROP TABLE IF EXISTS `xl_role`;
CREATE TABLE `xl_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色权限字符串',
  `data_scope` tinyint DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:正常;1:禁用',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of xl_role
-- ----------------------------
INSERT INTO `xl_role` VALUES ('1', '超级管理员', '拥有系统最高权限', 'admin', '1', '1', '1', '0', '9999', '2023-03-04 18:01:35', '1', '2023-03-03 18:03:28', null, '0', '1');
INSERT INTO `xl_role` VALUES ('5', '与之管理员', '租户管理员', 'admin', '1', '1', '1', '0', '4', null, null, '2023-03-07 11:33:54', '1', '0', '1');
INSERT INTO `xl_role` VALUES ('7', '租户2管理员', '租户管理员', 'admin', '1', '1', '1', '0', '6', null, null, '2023-03-09 15:07:43', '1', '0', '1');
INSERT INTO `xl_role` VALUES ('8', '普通管理员', '普通管理员', 'common', '1', '0', '0', '0', '9999', '2023-03-10 15:28:44', '1', '2023-03-10 11:38:47', '1', '1', '1');
INSERT INTO `xl_role` VALUES ('14', '财务', '财务部', 'other', '1', '0', '0', '0', '9999', null, null, '2023-03-28 10:52:37', '1', '0', '1');
INSERT INTO `xl_role` VALUES ('15', '财务主管', '财务部', '财务主管', '1', '0', '0', '0', '4', null, null, '2023-03-30 10:55:13', '3', '0', '1');
INSERT INTO `xl_role` VALUES ('16', '店长', '运营部', '店长', '1', '0', '0', '0', '4', null, null, '2023-03-30 11:16:35', '3', '0', '1');
INSERT INTO `xl_role` VALUES ('17', '店长', '运营部', '店长', '1', '0', '0', '0', '9999', null, null, '2023-03-30 15:22:42', '1', '0', '1');
INSERT INTO `xl_role` VALUES ('21', '管家', '运营部', '管家', '1', '0', '0', '0', '4', null, null, '2023-03-30 17:13:05', '3', '0', '1');

-- ----------------------------
-- Table structure for xl_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `xl_role_dept`;
CREATE TABLE `xl_role_dept` (
  `role_dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色部门关联表';

-- ----------------------------
-- Table structure for xl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `xl_user_role`;
CREATE TABLE `xl_user_role` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户id',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色关联表';

-- ----------------------------
-- Records of xl_user_role
-- ----------------------------
INSERT INTO `xl_user_role` VALUES ('1', '1', '1', null, null, null, null, null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('2', '3', '5', '4', null, null, '2023-03-07 11:34:10', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('4', '5', '7', '6', null, null, '2023-03-09 15:07:44', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('8', '2', '11', '9999', null, null, '2023-03-13 17:14:46', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('9', '6', '14', '9999', null, null, '2023-03-29 16:07:54', null, '1', '1');
INSERT INTO `xl_user_role` VALUES ('10', '6', '14', '9999', null, null, '2023-03-29 17:01:37', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('11', '7', '15', '4', null, null, '2023-03-30 11:05:59', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('12', '8', '16', '4', null, null, '2023-03-30 17:15:38', null, '0', '1');
INSERT INTO `xl_user_role` VALUES ('13', '1', '11', '9999', null, null, '2023-05-09 10:40:00', null, '0', '1');

-- ----------------------------
-- Table structure for xl_menu
-- ----------------------------
DROP TABLE IF EXISTS `xl_menu`;
CREATE TABLE `xl_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `permission` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权标识',
  `menu_level` bigint DEFAULT NULL COMMENT '菜单级别',
  `sort` int DEFAULT NULL COMMENT '排序',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `menu_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '鐘舵€?1:鏄剧ず,0:涓嶆樉绀?',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `router_query` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '0' COMMENT '是否为外链（0否 1是）',
  `visible` int DEFAULT '1' COMMENT '菜单是否显示;0:隐藏 1:显示',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单表';

-- ----------------------------
-- Records of xl_menu
-- ----------------------------
INSERT INTO `xl_menu` VALUES ('1', '系统管理', null, 'system', null, null, '1', '0', '0', '0', null, '/sys', null, null, '0', '1', '2023-03-05 12:38:02', null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('2', '系统工具', null, 'email', null, null, '2', '0', '0', '0', null, '/tool', null, null, '0', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('3', '代码生成', null, 'code', null, null, '1', '2', '1', '0', null, 'gen', 'tool/gen/index', null, '0', '1', '2023-04-06 16:55:57', null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('4', '字典管理', null, 'dict', 'system:dict:list', null, '4', '1', '1', '0', null, 'dict', 'sys/dict/index', null, '0', '1', '2023-03-05 13:00:11', null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('5', '菜单管理', null, 'date-range', 'system:menu:list', null, '1', '1', '1', '0', null, 'menu', 'sys/menu/index', null, '0', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('6', '角色管理', null, 'dashboard', 'system:role:list', null, '2', '1', '1', '0', null, 'role', 'sys/role/index', null, '0', '1', '2023-03-05 12:59:54', null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('7', '菜单查询', null, '#', 'system:menu:query', null, '1', '5', '2', '0', null, null, null, null, '0', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('8', '菜单新增', null, '#', 'system:menu:create', null, '2', '5', '2', '0', null, null, null, null, '0', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_menu` VALUES ('9', '字典查询', null, '#', 'system:dict:query', null, '1', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:16:16', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('10', '字典新增', null, '#', 'system:dict:create', null, '2', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:16:59', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('11', '字典修改', null, '#', 'system:dict:edit', null, '3', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:17:21', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('12', '字典删除', null, '#', 'system:dict:remove', null, '4', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:17:53', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('13', '菜单修改', null, '#', 'system:menu:edit', null, '3', '5', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:20:27', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('14', '菜单删除', null, '#', 'system:menu:remove', null, '4', '5', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:21:09', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('15', '角色查询', null, '#', 'system:role:query', null, '1', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:26:41', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('16', '角色新增', null, '#', 'system:role:create', null, '2', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:30:45', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('17', '角色修改', null, '#', 'system:role:edit', null, '3', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:31:21', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('18', '角色删除', null, '#', 'system:role:remove', null, '4', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:31:48', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('19', '系统监控', null, 'monitor', null, null, '3', '0', '0', '0', null, '/monitor', null, null, '0', '1', null, null, '2023-03-05 12:30:45', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('20', '在线用户', null, 'online', 'monitor:online:list', null, '1', '19', '1', '0', null, 'online', 'monitor/online/index', null, '0', '1', null, null, '2023-03-05 12:32:17', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('21', '查询', null, '#', 'monitor:online:query', null, '1', '20', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:32:59', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('22', '强退', null, '#', 'monitor:online:batchLogout', null, '2', '20', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:33:27', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('23', '服务监控', null, 'server', 'monitor:server:list', null, '2', '19', '1', '0', null, 'server', 'monitor/server/index', null, '0', '1', null, null, '2023-03-05 12:34:40', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('24', '缓存监控', null, 'redis', 'monitor:cache:list', null, '3', '19', '1', '0', null, 'cache', 'monitor/cache/index', null, '0', '1', null, null, '2023-03-05 12:35:45', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('25', '缓存列表', null, 'redis-list', 'monitor:cache:list', null, '4', '19', '1', '0', null, 'cacheList', 'monitor/cache/list', null, '0', '1', null, null, '2023-03-05 12:36:31', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('26', '平台管理', null, 'auth', null, null, '0', '0', '0', '0', null, '/platform', null, null, '0', '1', null, null, '2023-03-05 12:39:11', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('27', '部门管理', null, 'tree-table', 'system:dept:list', null, '3', '1', '1', '0', null, 'dept', 'sys/dept/index', null, '0', '1', '2023-03-05 13:00:21', null, '2023-03-05 12:41:45', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('28', '日志管理', null, 'log', null, null, '5', '1', '0', '0', null, 'log', null, null, '0', '1', null, null, '2023-03-05 12:45:51', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('29', '登录日志', null, 'logininfor', 'system:loginlog:list', null, '1', '28', '1', '0', null, 'loginlog', 'sys/log/loginlog/index', null, '0', '1', null, null, '2023-03-05 12:47:21', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('30', '操作日志', null, 'form', 'system:operlog:list', null, '2', '28', '1', '0', null, 'operlog', 'sys/log/operlog/index', null, '0', '1', null, null, '2023-03-05 12:48:06', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('31', '登录查询', null, '#', 'system:loginlog:query', null, '1', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:49:48', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('32', '记录删除', null, '#', 'system:loginlog:remove', null, '2', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:14', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('33', '清空', null, '#', 'system:loginlog:clean', null, '3', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:40', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('34', '导出', null, '#', 'system:loginlog:export', null, '4', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:56', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('35', '操作查询', null, '#', 'system:operlog:query', null, '1', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:51:32', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('36', '操作删除', null, '#', 'system:operlog:remove', null, '2', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:51:55', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('37', '操作导出', null, '#', 'system:operlog:export', null, '3', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:52:09', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('38', '部门查询', null, '#', 'system:dept:query', null, '1', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:53:52', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('39', '部门新增', null, '#', 'system:dept:create', null, '2', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:54:33', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('40', '部门修改', null, '#', 'system:dept:edit', null, '3', '27', '2', '0', null, null, null, null, '0', '1', '2023-03-28 18:04:42', null, '2023-03-05 12:54:49', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('41', '部门删除', null, '#', 'system:dept:remove', null, '4', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:55:20', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('42', '用户管理', null, 'user', 'system:user:list', null, '0', '1', '1', '0', null, 'user', 'sys/user/index', null, '0', '1', null, null, '2023-03-05 12:57:51', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('43', '用户查询', null, '#', 'system:user:query', null, '1', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:01:52', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('44', '用户新增', null, '#', 'system:user:create', null, '2', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:18', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('45', '用户修改', null, '#', 'system:user:edit', null, '3', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:38', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('46', '用户删除', null, '#', 'system:user:delete', null, '4', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:56', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('47', '租户管理', null, 'tree', 'platform:tenant:list', null, '1', '26', '1', '0', null, 'tenant', 'platform/tenant/index', null, '0', '1', '2023-03-05 13:05:56', null, '2023-03-05 13:05:02', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('48', '套餐管理', null, 'shopping', 'platform:package:list', null, '2', '26', '1', '0', null, 'package', 'platform/tenantpackage/index', null, '0', '1', null, null, '2023-03-05 13:07:36', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('49', '套餐新增', null, '#', 'platform:package:create', null, '1', '48', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:27:58', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('50', '套餐修改', null, '#', 'platform:package:edit', null, '2', '48', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:28:26', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('51', '套餐删除', null, '#', 'platform:package:remove', null, '3', '48', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:28:54', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('52', '套餐查询', null, '#', 'platform:package:query', null, '4', '48', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:29:14', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('53', '租户查询', null, '#', 'platform:tenant:query', null, '1', '47', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:29:52', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('54', '租户新增', null, '#', 'platform:tenant:create', null, '2', '47', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:30:14', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('55', '租户修改', null, '#', 'platform:tenant:edit', null, '3', '47', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:32:37', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('56', '租户删除', null, '#', 'platform:tenant:remove', null, '4', '47', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 15:32:59', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('57', '房屋管理', null, 'house', null, null, '4', '0', '0', '0', null, '/house', null, null, '0', '1', '2023-03-31 16:30:41', null, '2023-03-17 14:45:29', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('58', '公寓管理', null, 'apartment', 'house:apartment:list', null, '1', '57', '1', '0', null, 'apartment', 'house/apartment/index', null, '0', '1', '2023-03-31 16:31:12', null, '2023-03-17 14:51:26', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('59', '服务调度', null, 'peoples', null, null, '5', '0', '0', '0', null, 'services', null, null, '0', '1', '2023-03-27 14:14:35', null, '2023-03-27 11:47:11', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('60', '员工管理', null, 'people', 'services:staff:list', null, '1', '59', '1', '0', null, '/services', 'services/staff/index', null, '0', '1', '2023-03-27 14:14:29', null, '2023-03-27 14:13:41', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('61', '公寓查询', null, '#', 'house:apartment:query', null, '1', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:09:58', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('62', '公寓添加', null, '#', 'house:apartment:create', null, '2', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:10:27', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('63', '公寓修改', null, '#', 'house:apartment:edit', null, '3', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:10:57', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('64', '公寓删除', null, '#', 'house:apartment:remove', null, '4', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:11:28', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('65', '公寓导入', null, '#', 'house:apartment:import', null, '5', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:12:01', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('66', '品牌项目添加', null, '#', 'house:brand:create', null, '6', '58', '2', '0', null, null, null, null, '0', '1', '2023-03-28 17:19:19', null, '2023-03-28 17:14:02', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('67', '品牌项目修改', null, '#', 'house:brand:edit', null, '7', '58', '2', '0', null, null, null, null, '0', '1', '2023-03-28 17:19:32', null, '2023-03-28 17:15:18', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('68', '品牌项目删除', null, '#', 'house:brand:remove', null, '8', '58', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:20:01', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('69', '员工添加', null, '#', 'services:staff:create', null, '1', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:41:25', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('70', '员工修改', null, '#', 'services:staff:edit', null, '2', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:53:43', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('71', '员工删除', null, '#', 'services:staff:remove', null, '3', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:54:09', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('72', '职务添加', null, '#', 'services:post:create', null, '4', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:54:49', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('73', '职务修改', null, '#', 'services:post:edit', null, '5', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:55:15', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('74', '职务删除', null, '#', 'services:post:remove', null, '6', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 17:55:36', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('75', '分配门店', null, '#', 'services:staff:authProject', null, '7', '60', '2', '0', null, null, null, null, '0', '1', '2023-03-30 14:49:21', null, '2023-03-28 17:56:04', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('76', '分配权限', null, '#', 'system:role:auth', null, '8', '60', '2', '0', null, null, null, null, '0', '1', '2023-03-30 17:07:42', null, '2023-03-28 17:56:22', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('77', '品牌项目列表', null, '#', 'house:brand:list', null, '9', '58', '2', '0', null, null, null, null, '0', '1', '2023-03-28 18:08:28', null, '2023-03-28 18:08:18', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('78', '职务列表', null, '#', 'services:post:list', null, '9', '60', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-28 18:16:32', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('79', '房源管理', null, 'room', 'house:room:list', null, '2', '57', '1', '0', null, 'room', 'house/room/index', null, '0', '1', '2023-03-31 16:31:29', null, '2023-03-31 16:28:13', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('80', '集中式独栋', null, 'table', 'house:single:list', null, '3', '57', '1', '0', null, 'single', 'house/single/index', null, '0', '1', '2023-04-12 17:28:41', null, '2023-04-12 17:28:17', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('81', '房源添加', null, '#', 'house:room:create', null, '1', '79', '2', '0', null, null, null, null, '0', '1', null, null, '2023-04-19 18:20:04', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('82', '房源修改', null, '#', 'house:room:edit', null, '2', '79', '2', '0', null, null, null, null, '0', '1', null, null, '2023-04-19 18:20:33', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('83', '房源删除', null, '#', 'house:room:remove', null, '3', '79', '2', '0', null, null, null, null, '0', '1', null, null, '2023-04-19 18:21:04', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('84', '房源查看', null, '#', 'house:room:query', null, '4', '79', '2', '0', null, null, null, null, '0', '1', null, null, '2023-04-19 18:21:28', null, '0', '1');
INSERT INTO `xl_menu` VALUES ('85', '房源导入', null, '#', 'house:room:import', null, '5', '79', '2', '0', null, null, null, null, '0', '1', null, null, '2023-04-19 18:21:53', null, '0', '1');

-- ----------------------------
-- Table structure for xl_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `xl_role_menu`;
CREATE TABLE `xl_role_menu` (
  `role_menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户id',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单角色关联表';

-- ----------------------------
-- Records of xl_role_menu
-- ----------------------------
INSERT INTO `xl_role_menu` VALUES ('1', '1', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('2', '2', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('3', '3', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('4', '4', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('5', '5', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('6', '6', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('7', '7', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('8', '8', '1', null, null, null, null, null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('9', '1', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('10', '4', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('11', '5', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('12', '7', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('13', '8', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('14', '6', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('15', '2', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('16', '3', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('17', '1', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('18', '4', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('19', '9', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('20', '10', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('21', '11', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('22', '12', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('23', '5', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('24', '7', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('25', '8', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('26', '13', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('27', '14', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('28', '6', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('29', '15', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('30', '16', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('31', '17', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('32', '18', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('33', '2', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('34', '3', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('35', '26', '1', null, null, null, '2023-03-05 13:14:22', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('36', '47', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('37', '48', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('38', '1', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('39', '42', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('40', '43', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('41', '44', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('42', '45', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('43', '46', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('44', '5', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('45', '7', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('46', '8', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('47', '13', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('48', '14', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('49', '6', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('50', '15', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('51', '16', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('52', '17', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('53', '18', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('54', '27', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('55', '38', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('56', '39', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('57', '41', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('58', '4', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('59', '9', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('60', '10', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('61', '11', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('62', '12', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('63', '28', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('64', '29', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('65', '31', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('66', '32', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('67', '33', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('68', '34', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('69', '30', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('70', '35', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('71', '36', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('72', '37', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('73', '40', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('74', '2', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('75', '3', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('76', '19', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('77', '20', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('78', '21', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('79', '22', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('80', '23', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('81', '24', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('82', '25', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `xl_role_menu` VALUES ('83', '26', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('84', '47', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('85', '53', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('86', '54', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('87', '55', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('88', '56', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('89', '48', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('90', '49', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('91', '50', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('92', '51', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('93', '52', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('94', '1', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('95', '42', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('96', '43', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('97', '44', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('98', '45', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('99', '46', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('100', '5', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('101', '7', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('102', '8', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('103', '13', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('104', '14', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('105', '6', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('106', '15', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('107', '16', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('108', '17', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('109', '18', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('110', '27', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('111', '38', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('112', '39', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('113', '41', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('114', '4', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('115', '9', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('116', '10', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('117', '11', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('118', '12', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('119', '28', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('120', '29', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('121', '31', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('122', '32', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('123', '33', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('124', '34', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('125', '30', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('126', '35', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('127', '36', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('128', '37', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('129', '40', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('130', '2', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('131', '3', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('132', '19', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('133', '20', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('134', '21', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('135', '22', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('136', '23', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('137', '24', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('138', '25', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('166', '19', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('167', '20', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('168', '21', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('169', '22', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('170', '23', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('171', '24', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('172', '25', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('173', '1', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('174', '42', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('175', '43', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('176', '44', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('177', '45', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('178', '46', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('179', '5', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('180', '7', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('181', '8', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('182', '13', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('183', '14', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('184', '6', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('185', '15', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('186', '16', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('187', '17', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('188', '18', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('189', '27', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('190', '38', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('191', '39', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('192', '41', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('193', '4', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('194', '9', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('195', '10', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('196', '11', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('197', '12', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('198', '28', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('199', '29', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('200', '31', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('201', '32', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('202', '33', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('203', '34', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('204', '30', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('205', '35', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('206', '36', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('207', '37', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('208', '40', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('209', '2', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('210', '3', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('211', '19', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('212', '20', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('213', '21', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('214', '22', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('215', '23', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('216', '24', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('217', '25', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('343', '19', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('344', '1', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('345', '42', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('346', '43', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('347', '44', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('348', '45', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('349', '46', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('350', '5', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('351', '7', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('352', '8', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('353', '13', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('354', '14', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('355', '6', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('356', '15', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('357', '16', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('358', '17', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('359', '18', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('360', '27', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('361', '38', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('362', '39', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('363', '41', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('364', '4', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('365', '9', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('366', '10', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('367', '11', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('368', '12', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('369', '28', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('370', '29', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('371', '31', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('372', '32', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('373', '33', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('374', '34', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('375', '30', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('376', '35', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('377', '36', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('378', '37', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('379', '40', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('380', '20', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('381', '21', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('382', '22', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('491', '57', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('492', '58', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('493', '59', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('494', '60', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('495', '61', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('496', '69', '14', '9999', null, null, '2023-03-29 10:33:48', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('631', '1', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('632', '28', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('633', '29', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('634', '31', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('635', '32', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('636', '33', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('637', '34', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('638', '30', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('639', '35', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('640', '36', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('641', '37', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('642', '19', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('643', '20', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('644', '21', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('645', '22', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('646', '57', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('647', '58', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('648', '61', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('649', '62', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('650', '63', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('651', '64', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('652', '65', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('653', '66', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('654', '67', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('655', '68', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('656', '77', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('657', '79', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('658', '81', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('659', '82', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('660', '83', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('661', '84', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('662', '85', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('663', '80', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('664', '59', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('665', '60', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('666', '69', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('667', '70', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('668', '71', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('669', '72', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('670', '73', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('671', '74', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('672', '75', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('673', '76', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');
INSERT INTO `xl_role_menu` VALUES ('674', '78', '5', '4', null, null, '2023-04-19 18:23:12', null, '0', '1');

-- ----------------------------
-- Table structure for xl_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `xl_oper_log`;
CREATE TABLE `xl_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块标题',
  `business_type` int NOT NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人员',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志表';

-- ----------------------------
-- Table structure for xl_login_log
-- ----------------------------
DROP TABLE IF EXISTS `xl_login_log`;
CREATE TABLE `xl_login_log` (
  `login_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提示消息',
  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问日志表';

-- ----------------------------
-- Table structure for xl_dict
-- ----------------------------
DROP TABLE IF EXISTS `xl_dict`;
CREATE TABLE `xl_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典表';

-- ----------------------------
-- Records of xl_dict
-- ----------------------------
INSERT INTO `xl_dict` VALUES ('1', 'sys_common_status', '系统状态', '0', '成功/失败', '2023-03-04 22:55:25', '1', '2023-03-04 22:47:15', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('2', 'sys_normal_disable', '默认状态', '0', '正常/停用', '2023-03-04 22:55:40', '1', '2023-03-04 22:50:21', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('3', 'sys_show_hide', '显示状态', '0', '显示/隐藏', null, null, '2023-03-05 09:36:34', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('4', 'sys_menu_status', '菜单状态', '0', '1正常/0禁用', null, null, '2023-03-05 10:57:35', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('5', 'sys_tenant_type', '租户类型', '0', '公司/部门/小组/其他', null, null, '2023-03-06 12:03:46', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('6', 'apartment_type', '公寓类型', '0', '集中式/分散式', null, null, '2023-03-23 14:13:55', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('7', 'is_lift_type', '是否电梯楼', '0', '是/否', null, null, '2023-03-23 14:17:03', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('8', 'house_hire_type', '出租方式', '0', '整租/合租', null, null, '2023-04-01 17:29:35', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('9', 'house_hire_status', '出租状态', '0', '未出租/装修中', null, null, '2023-04-03 11:31:48', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('10', 'house_deposit_num', '押几', '0', '押几个月租金', null, null, '2023-04-03 11:36:58', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('11', 'house_pay_num', '付几', '0', '付几个月租金', null, null, '2023-04-03 11:39:22', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('12', 'db_fee_type', '度表费用类型', '0', null, null, null, '2023-04-03 15:17:36', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('13', 'house_state', '房源状态', '0', null, null, null, '2023-04-06 10:38:14', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('14', 'qt_fee_type', '其他费用类型', '0', null, null, null, '2023-04-06 10:38:14', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('15', 'df_fee_type', '电费收费类型', '0', null, null, null, '2023-04-10 15:03:59', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('16', 'sf_fee_type', '水费收费类型', '0', null, null, null, '2023-04-10 15:04:34', '1', '0', '1');
INSERT INTO `xl_dict` VALUES ('17', 'sys_id_type', '证件类型', '0', null, null, null, '2023-04-17 15:59:14', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `xl_dict_data`;
CREATE TABLE `xl_dict_data` (
  `dict_data_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_label` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典值',
  `sort` int DEFAULT NULL COMMENT '显示顺序',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dict_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of xl_dict_data
-- ----------------------------
INSERT INTO `xl_dict_data` VALUES ('1', 'sys_common_status', '成功', '0', '0', 'N', 'success', '0', null, '2023-03-04 22:54:25', '1', '2023-03-04 22:48:45', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('2', 'sys_common_status', '失败', '1', '0', 'N', 'danger', '0', null, '2023-03-04 22:54:36', '1', '2023-03-04 22:49:52', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('3', 'sys_normal_disable', '正常', '0', '0', 'N', 'primary', '0', null, '2023-03-04 22:53:19', '1', '2023-03-04 22:50:40', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('4', 'sys_normal_disable', '停用', '1', '0', 'N', 'danger', '0', null, '2023-03-04 22:53:27', '1', '2023-03-04 22:50:53', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('5', 'sys_show_hide', '显示', '1', '0', 'N', 'primary', '0', null, null, null, '2023-03-05 09:37:02', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('6', 'sys_show_hide', '隐藏', '0', '1', 'N', 'warning', '0', null, null, null, '2023-03-05 09:37:16', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('7', 'sys_menu_status', '正常', '1', '0', 'N', 'primary', '0', null, null, null, '2023-03-05 10:58:49', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('8', 'sys_menu_status', '禁用', '0', '2', 'N', 'danger', '0', null, null, null, '2023-03-05 10:59:08', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('9', 'sys_tenant_type', '公司', '0', '0', 'N', 'primary', '0', null, null, null, '2023-03-06 14:12:49', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('10', 'sys_tenant_type', '部门', '1', '1', 'N', 'primary', '0', null, null, null, '2023-03-06 14:13:02', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('11', 'sys_tenant_type', '个人', '2', '2', 'N', 'primary', '0', null, null, null, '2023-03-06 14:13:21', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('12', 'sys_tenant_type', '其他', '3', '3', 'N', 'primary', '0', null, null, null, '2023-03-06 14:13:34', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('13', 'apartment_type', '集中式', 'jzs', '0', 'N', 'default', '0', null, null, null, '2023-03-23 14:14:21', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('14', 'apartment_type', '分散式', 'fss', '0', 'N', 'default', '0', null, null, null, '2023-03-23 14:14:39', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('15', 'is_lift_type', '是', 'Y', '0', 'N', 'default', '0', null, null, null, '2023-03-23 14:17:23', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('16', 'is_lift_type', '否', 'N', '0', 'N', 'default', '0', null, null, null, '2023-03-23 14:17:37', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('17', 'house_hire_type', '整租', 'zz', '0', 'N', 'default', '0', null, null, null, '2023-04-01 17:30:06', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('18', 'house_hire_type', '合租', 'hz', '0', 'N', 'default', '0', null, null, null, '2023-04-01 17:30:18', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('19', 'house_hire_status', '未出租', '1', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:32:14', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('20', 'house_hire_status', '装修中', '2', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:32:28', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('21', 'house_deposit_num', '押【自定】', '0', '0', 'N', 'default', '0', null, '2023-04-07 16:51:07', '1', '2023-04-03 11:37:55', '1', '0', '2');
INSERT INTO `xl_dict_data` VALUES ('22', 'house_deposit_num', '押【一】', '1', '0', 'N', 'default', '0', null, '2023-04-03 11:38:19', '1', '2023-04-03 11:38:11', '1', '0', '2');
INSERT INTO `xl_dict_data` VALUES ('23', 'house_deposit_num', '押【二】', '2', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:38:34', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('24', 'house_deposit_num', '押【三】', '3', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:38:51', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('25', 'house_pay_num', '付【一】', '1', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:39:47', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('26', 'house_pay_num', '付【二】', '2', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:40:00', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('27', 'house_pay_num', '付【三】', '3', '0', 'N', 'default', '0', null, null, null, '2023-04-03 11:40:12', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('28', 'db_fee_type', '电费（含公摊费）', 'df_gt', '0', 'N', 'default', '0', null, null, null, '2023-04-03 15:20:16', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('29', 'db_fee_type', '水费', 'sf', '1', 'N', 'default', '0', null, null, null, '2023-04-03 15:21:15', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('30', 'db_fee_type', '电费', 'df', '2', 'N', 'default', '0', null, null, null, '2023-04-03 15:21:34', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('31', 'db_fee_type', '暂定水费（含排污费）', 'zd_sf', '3', 'N', 'default', '0', null, null, null, '2023-04-03 15:22:33', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('32', 'db_fee_type', '暂定电费（含公摊费）', 'zd_df_gt', '4', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:16', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('33', 'db_fee_type', '水费（含排污费）', 'sf_pw', '5', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('34', 'house_state', '待出租', '1', '0', 'N', 'default', '0', null, null, null, '2023-04-06 10:38:31', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('35', 'house_state', '装修中', '2', '2', 'N', 'default', '0', null, null, null, '2023-04-06 10:38:47', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('36', 'house_state', '已出租', '3', '3', 'N', 'default', '0', null, null, null, '2023-04-06 10:40:07', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('37', 'house_state', '待确认', '4', '4', 'N', 'default', '0', null, null, null, '2023-04-06 10:40:32', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('38', 'house_state', '已预订', '5', '5', 'N', 'default', '0', null, null, null, '2023-04-06 10:40:53', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('39', 'qt_fee_type', '管理费', '1', '1', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('40', 'qt_fee_type', '租金优惠', '2', '2', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('41', 'qt_fee_type', '水电押金', '3', '3', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('42', 'qt_fee_type', '租金退回', '4', '4', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('43', 'qt_fee_type', '网费', '5', '5', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('44', 'qt_fee_type', '卫生费', '6', '6', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('45', 'qt_fee_type', '门卡押金', '7', '7', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('46', 'qt_fee_type', '公摊水电费', '8', '8', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('47', 'qt_fee_type', '家具赔偿', '9', '9', 'N', 'default', '0', null, null, null, '2023-04-03 15:23:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('48', 'df_fee_type', '统一收费 0.00元/度', '1', '1', 'N', 'default', '0', null, null, null, '2023-04-10 15:05:05', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('49', 'df_fee_type', '常规收费 1.50元/度', '2', '2', 'N', 'default', '0', null, null, null, '2023-04-10 15:05:23', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('50', 'df_fee_type', '阶梯收费', '3', '3', 'N', 'default', '0', null, null, null, '2023-04-10 15:05:39', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('51', 'df_fee_type', '自定义收费', '4', '4', 'N', 'default', '0', null, null, null, '2023-04-10 15:05:55', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('52', 'sf_fee_type', '统一收费 0.00元/吨', '1', '1', 'N', 'default', '0', null, null, null, '2023-04-10 15:06:21', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('53', 'sf_fee_type', '常规收费 5.00元/吨', '2', '2', 'N', 'default', '0', null, null, null, '2023-04-10 15:06:39', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('54', 'sf_fee_type', '阶梯收费', '3', '3', 'N', 'default', '0', null, null, null, '2023-04-10 15:06:56', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('55', 'sf_fee_type', '自定义收费', '4', '4', 'N', 'default', '0', null, null, null, '2023-04-10 15:07:09', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('56', 'sys_id_type', '身份证 ', '1', '1', 'N', 'default', '0', null, null, null, '2023-04-17 16:00:39', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('57', 'sys_id_type', '港澳台居民证件', '2', '2', 'N', 'default', '0', null, null, null, '2023-04-17 16:00:56', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('58', 'sys_id_type', '护照', '3', '3', 'N', 'default', '0', null, null, null, '2023-04-17 16:01:35', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('59', 'sys_id_type', '军官证', '4', '4', 'N', 'default', '0', null, null, null, '2023-04-17 16:02:18', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('60', 'sys_id_type', '营业执照', '5', '5', 'N', 'default', '0', null, null, null, '2023-04-17 16:02:47', '1', '0', '1');
INSERT INTO `xl_dict_data` VALUES ('61', 'sys_id_type', '其他证件', '6', '6', 'N', 'default', '0', null, null, null, '2023-04-17 16:03:06', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_dept
-- ----------------------------
DROP TABLE IF EXISTS `xl_dept`;
CREATE TABLE `xl_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `sort` int DEFAULT NULL COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `dept_level` int DEFAULT NULL COMMENT '部门级别',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

-- ----------------------------
-- Records of xl_dept
-- ----------------------------
INSERT INTO `xl_dept` VALUES ('1', '0', '1', '希留科技', null, null, null, null, '0', null, '9999', null, null, null, null, '0', '1');
INSERT INTO `xl_dept` VALUES ('2', '1', '1,1', '运营部', '1', null, null, null, '0', '0', '9999', null, null, '2023-03-05 14:33:40', null, '0', '1');
INSERT INTO `xl_dept` VALUES ('6', '0', '0', '与之', '0', '与之管理员', '13545678956', null, '0', null, '4', null, null, '2023-03-07 11:33:54', null, '0', '1');
INSERT INTO `xl_dept` VALUES ('8', '0', '0', '租户2', '0', '租户2管理员', '13546532356', null, '0', null, '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `xl_dept` VALUES ('9', '1', '1,1', '研发部', '2', '小王', '13245678956', '2554@163.com', '0', '0', '9999', '2023-03-13 17:21:27', '1', '2023-03-13 17:21:10', '1', '0', '2');

-- ----------------------------
-- Table structure for xl_user_project
-- ----------------------------
DROP TABLE IF EXISTS `xl_user_project`;
CREATE TABLE `xl_user_project` (
  `user_project_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint DEFAULT NULL COMMENT '角色id',
  `project_id` bigint DEFAULT NULL COMMENT '项目id',
  `apartment_id` bigint DEFAULT NULL COMMENT '公寓id',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`user_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户分配项目表';

-- ----------------------------
-- Records of xl_user_project
-- ----------------------------
INSERT INTO `xl_user_project` VALUES ('1', '6', null, '2', '9999', null, null, '2023-03-30 15:09:55', '1', '1', '1');
INSERT INTO `xl_user_project` VALUES ('2', '6', '1', '2', '9999', null, null, '2023-03-30 15:22:02', '1', '0', '1');
INSERT INTO `xl_user_project` VALUES ('3', '7', '2', '4', '4', null, null, '2023-03-30 17:14:53', '3', '0', '1');
INSERT INTO `xl_user_project` VALUES ('4', '7', '3', '5', '4', null, null, '2023-03-30 17:14:53', '3', '0', '1');
INSERT INTO `xl_user_project` VALUES ('5', '8', '3', '5', '4', null, null, '2023-03-30 17:15:45', '3', '0', '1');

-- ----------------------------
-- Table structure for xl_area
-- ----------------------------
DROP TABLE IF EXISTS `xl_area`;
CREATE TABLE `xl_area` (
  `area_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int DEFAULT NULL COMMENT '上级区域id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `type` int DEFAULT NULL COMMENT '区域类型：0 省 1 市 2 区',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='省市区表';

-- ----------------------------
-- Records of xl_area
-- ----------------------------
INSERT INTO `xl_area` VALUES ('1', null, '北京市', '0', null, null, '2022-08-11 16:29:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2', '1', '北京市', '1', null, null, '2022-08-11 16:29:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3', '2', '东城区', '2', null, null, '2022-08-11 16:29:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('4', '2', '西城区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('5', '2', '朝阳区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('6', '2', '丰台区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('7', '2', '石景山区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('8', '2', '海淀区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('9', '2', '门头沟区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('10', '2', '房山区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('11', '2', '通州区', '2', null, null, '2022-08-11 16:29:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('12', '2', '顺义区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('13', '2', '昌平区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('14', '2', '大兴区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('15', '2', '怀柔区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('16', '2', '平谷区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('17', '2', '密云区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('18', '2', '延庆区', '2', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('19', null, '天津市', '0', null, null, '2022-08-11 16:30:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('20', '19', '天津市', '1', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('21', '20', '和平区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('22', '20', '河东区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('23', '20', '河西区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('24', '20', '南开区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('25', '20', '河北区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('26', '20', '红桥区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('27', '20', '东丽区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('28', '20', '西青区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('29', '20', '津南区', '2', null, null, '2022-08-11 16:30:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('30', '20', '北辰区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('31', '20', '武清区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('32', '20', '宝坻区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('33', '20', '滨海新区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('34', '20', '宁河区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('35', '20', '静海区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('36', '20', '蓟州区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('37', null, '上海市', '0', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('38', '37', '上海市', '1', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('39', '38', '黄浦区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('40', '38', '徐汇区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('41', '38', '长宁区', '2', null, null, '2022-08-11 16:30:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('42', '38', '静安区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('43', '38', '普陀区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('44', '38', '虹口区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('45', '38', '杨浦区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('46', '38', '闵行区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('47', '38', '宝山区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('48', '38', '嘉定区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('49', '38', '浦东新区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('50', '38', '金山区', '2', null, null, '2022-08-11 16:30:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('51', '38', '松江区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('52', '38', '青浦区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('53', '38', '奉贤区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('54', '38', '崇明区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('55', null, '重庆市', '0', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('56', '55', '重庆市', '1', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('57', '56', '万州区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('58', '56', '涪陵区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('59', '56', '渝中区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('60', '56', '大渡口区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('61', '56', '江北区', '2', null, null, '2022-08-11 16:30:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('62', '56', '沙坪坝区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('63', '56', '九龙坡区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('64', '56', '南岸区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('65', '56', '北碚区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('66', '56', '綦江区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('67', '56', '大足区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('68', '56', '渝北区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('69', '56', '巴南区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('70', '56', '黔江区', '2', null, null, '2022-08-11 16:30:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('71', '56', '长寿区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('72', '56', '江津区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('73', '56', '合川区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('74', '56', '永川区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('75', '56', '南川区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('76', '56', '璧山区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('77', '56', '铜梁区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('78', '56', '潼南区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('79', '56', '荣昌区', '2', null, null, '2022-08-11 16:30:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('80', '56', '开州区', '2', null, null, '2022-08-11 16:30:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('81', '56', '梁平区', '2', null, null, '2022-08-11 16:30:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('82', '56', '武隆区', '2', null, null, '2022-08-11 16:30:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('83', '56', '城口县', '2', null, null, '2022-08-11 16:30:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('84', '56', '丰都县', '2', null, null, '2022-08-11 16:30:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('85', '56', '垫江县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('86', '56', '忠县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('87', '56', '云阳县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('88', '56', '奉节县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('89', '56', '巫山县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('90', '56', '巫溪县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('91', '56', '石柱土家族自治县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('92', '56', '秀山土家族苗族自治县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('93', '56', '酉阳土家族苗族自治县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('94', '56', '彭水苗族土家族自治县', '2', null, null, '2022-08-11 16:30:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('95', null, '河北省', '0', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('96', '95', '石家庄市', '1', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('97', '96', '长安区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('98', '96', '桥西区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('99', '96', '新华区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('100', '96', '井陉矿区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('101', '96', '裕华区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('102', '96', '藁城区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('103', '96', '鹿泉区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('104', '96', '栾城区', '2', null, null, '2022-08-11 16:30:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('105', '96', '井陉县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('106', '96', '正定县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('107', '96', '行唐县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('108', '96', '灵寿县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('109', '96', '高邑县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('110', '96', '深泽县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('111', '96', '赞皇县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('112', '96', '无极县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('113', '96', '平山县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('114', '96', '元氏县', '2', null, null, '2022-08-11 16:30:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('115', '96', '赵县', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('116', '96', '辛集市', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('117', '96', '晋州市', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('118', '96', '新乐市', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('119', '95', '唐山市', '1', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('120', '119', '路南区', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('121', '119', '路北区', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('122', '119', '古冶区', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('123', '119', '开平区', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('124', '119', '丰南区', '2', null, null, '2022-08-11 16:30:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('125', '119', '丰润区', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('126', '119', '曹妃甸区', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('127', '119', '滦南县', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('128', '119', '乐亭县', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('129', '119', '迁西县', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('130', '119', '玉田县', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('131', '119', '遵化市', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('132', '119', '迁安市', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('133', '119', '滦州市', '2', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('134', '95', '秦皇岛市', '1', null, null, '2022-08-11 16:30:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('135', '134', '海港区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('136', '134', '山海关区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('137', '134', '北戴河区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('138', '134', '抚宁区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('139', '134', '青龙满族自治县', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('140', '134', '昌黎县', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('141', '134', '卢龙县', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('142', '95', '邯郸市', '1', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('143', '142', '邯山区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('144', '142', '丛台区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('145', '142', '复兴区', '2', null, null, '2022-08-11 16:30:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('146', '142', '峰峰矿区', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('147', '142', '肥乡区', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('148', '142', '永年区', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('149', '142', '临漳县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('150', '142', '成安县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('151', '142', '大名县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('152', '142', '涉县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('153', '142', '磁县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('154', '142', '邱县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('155', '142', '鸡泽县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('156', '142', '广平县', '2', null, null, '2022-08-11 16:30:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('157', '142', '馆陶县', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('158', '142', '魏县', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('159', '142', '曲周县', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('160', '142', '武安市', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('161', '95', '邢台市', '1', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('162', '161', '襄都区', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('163', '161', '信都区', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('164', '161', '任泽区', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('165', '161', '南和区', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('166', '161', '临城县', '2', null, null, '2022-08-11 16:30:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('167', '161', '内丘县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('168', '161', '柏乡县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('169', '161', '隆尧县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('170', '161', '宁晋县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('171', '161', '巨鹿县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('172', '161', '新河县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('173', '161', '广宗县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('174', '161', '平乡县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('175', '161', '威县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('176', '161', '清河县', '2', null, null, '2022-08-11 16:30:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('177', '161', '临西县', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('178', '161', '南宫市', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('179', '161', '沙河市', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('180', '95', '保定市', '1', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('181', '180', '竞秀区', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('182', '180', '莲池区', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('183', '180', '满城区', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('184', '180', '清苑区', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('185', '180', '徐水区', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('186', '180', '涞水县', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('187', '180', '阜平县', '2', null, null, '2022-08-11 16:30:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('188', '180', '定兴县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('189', '180', '唐县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('190', '180', '高阳县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('191', '180', '容城县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('192', '180', '涞源县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('193', '180', '望都县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('194', '180', '安新县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('195', '180', '易县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('196', '180', '曲阳县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('197', '180', '蠡县', '2', null, null, '2022-08-11 16:30:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('198', '180', '顺平县', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('199', '180', '博野县', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('200', '180', '雄县', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('201', '180', '涿州市', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('202', '180', '定州市', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('203', '180', '安国市', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('204', '180', '高碑店市', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('205', '95', '张家口市', '1', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('206', '205', '桥东区', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('207', '205', '桥西区', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('208', '205', '宣化区', '2', null, null, '2022-08-11 16:30:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('209', '205', '下花园区', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('210', '205', '万全区', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('211', '205', '崇礼区', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('212', '205', '张北县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('213', '205', '康保县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('214', '205', '沽源县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('215', '205', '尚义县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('216', '205', '蔚县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('217', '205', '阳原县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('218', '205', '怀安县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('219', '205', '怀来县', '2', null, null, '2022-08-11 16:30:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('220', '205', '涿鹿县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('221', '205', '赤城县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('222', '95', '承德市', '1', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('223', '222', '双桥区', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('224', '222', '双滦区', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('225', '222', '鹰手营子矿区', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('226', '222', '承德县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('227', '222', '兴隆县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('228', '222', '滦平县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('229', '222', '隆化县', '2', null, null, '2022-08-11 16:30:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('230', '222', '丰宁满族自治县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('231', '222', '宽城满族自治县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('232', '222', '围场满族蒙古族自治县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('233', '222', '平泉市', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('234', '95', '沧州市', '1', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('235', '234', '新华区', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('236', '234', '运河区', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('237', '234', '沧县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('238', '234', '青县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('239', '234', '东光县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('240', '234', '海兴县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('241', '234', '盐山县', '2', null, null, '2022-08-11 16:30:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('242', '234', '肃宁县', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('243', '234', '南皮县', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('244', '234', '吴桥县', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('245', '234', '献县', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('246', '234', '孟村回族自治县', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('247', '234', '泊头市', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('248', '234', '任丘市', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('249', '234', '黄骅市', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('250', '234', '河间市', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('251', '95', '廊坊市', '1', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('252', '251', '安次区', '2', null, null, '2022-08-11 16:30:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('253', '251', '广阳区', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('254', '251', '固安县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('255', '251', '永清县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('256', '251', '香河县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('257', '251', '大城县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('258', '251', '文安县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('259', '251', '大厂回族自治县', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('260', '251', '霸州市', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('261', '251', '三河市', '2', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('262', '95', '衡水市', '1', null, null, '2022-08-11 16:30:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('263', '262', '桃城区', '2', null, null, '2022-08-11 16:30:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('264', '262', '冀州区', '2', null, null, '2022-08-11 16:30:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('265', '262', '枣强县', '2', null, null, '2022-08-11 16:30:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('266', '262', '武邑县', '2', null, null, '2022-08-11 16:30:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('267', '262', '武强县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('268', '262', '饶阳县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('269', '262', '安平县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('270', '262', '故城县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('271', '262', '景县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('272', '262', '阜城县', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('273', '262', '深州市', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('274', null, '山西省', '0', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('275', '274', '太原市', '1', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('276', '275', '小店区', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('277', '275', '迎泽区', '2', null, null, '2022-08-11 16:30:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('278', '275', '杏花岭区', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('279', '275', '尖草坪区', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('280', '275', '万柏林区', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('281', '275', '晋源区', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('282', '275', '清徐县', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('283', '275', '阳曲县', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('284', '275', '娄烦县', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('285', '275', '古交市', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('286', '274', '大同市', '1', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('287', '286', '新荣区', '2', null, null, '2022-08-11 16:30:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('288', '286', '平城区', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('289', '286', '云冈区', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('290', '286', '云州区', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('291', '286', '阳高县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('292', '286', '天镇县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('293', '286', '广灵县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('294', '286', '灵丘县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('295', '286', '浑源县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('296', '286', '左云县', '2', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('297', '274', '阳泉市', '1', null, null, '2022-08-11 16:30:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('298', '297', '城区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('299', '297', '矿区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('300', '297', '郊区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('301', '297', '平定县', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('302', '297', '盂县', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('303', '274', '长治市', '1', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('304', '303', '潞州区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('305', '303', '上党区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('306', '303', '屯留区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('307', '303', '潞城区', '2', null, null, '2022-08-11 16:30:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('308', '303', '襄垣县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('309', '303', '平顺县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('310', '303', '黎城县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('311', '303', '壶关县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('312', '303', '长子县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('313', '303', '武乡县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('314', '303', '沁县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('315', '303', '沁源县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('316', '274', '晋城市', '1', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('317', '316', '城区', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('318', '316', '沁水县', '2', null, null, '2022-08-11 16:30:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('319', '316', '阳城县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('320', '316', '陵川县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('321', '316', '泽州县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('322', '316', '高平市', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('323', '274', '朔州市', '1', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('324', '323', '朔城区', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('325', '323', '平鲁区', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('326', '323', '山阴县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('327', '323', '应县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('328', '323', '右玉县', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('329', '323', '怀仁市', '2', null, null, '2022-08-11 16:30:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('330', '274', '晋中市', '1', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('331', '330', '榆次区', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('332', '330', '太谷区', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('333', '330', '榆社县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('334', '330', '左权县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('335', '330', '和顺县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('336', '330', '昔阳县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('337', '330', '寿阳县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('338', '330', '祁县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('339', '330', '平遥县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('340', '330', '灵石县', '2', null, null, '2022-08-11 16:30:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('341', '330', '介休市', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('342', '274', '运城市', '1', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('343', '342', '盐湖区', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('344', '342', '临猗县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('345', '342', '万荣县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('346', '342', '闻喜县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('347', '342', '稷山县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('348', '342', '新绛县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('349', '342', '绛县', '2', null, null, '2022-08-11 16:30:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('350', '342', '垣曲县', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('351', '342', '夏县', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('352', '342', '平陆县', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('353', '342', '芮城县', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('354', '342', '永济市', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('355', '342', '河津市', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('356', '274', '忻州市', '1', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('357', '356', '忻府区', '2', null, null, '2022-08-11 16:30:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('358', '356', '定襄县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('359', '356', '五台县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('360', '356', '代县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('361', '356', '繁峙县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('362', '356', '宁武县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('363', '356', '静乐县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('364', '356', '神池县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('365', '356', '五寨县', '2', null, null, '2022-08-11 16:30:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('366', '356', '岢岚县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('367', '356', '河曲县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('368', '356', '保德县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('369', '356', '偏关县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('370', '356', '原平市', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('371', '274', '临汾市', '1', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('372', '371', '尧都区', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('373', '371', '曲沃县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('374', '371', '翼城县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('375', '371', '襄汾县', '2', null, null, '2022-08-11 16:30:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('376', '371', '洪洞县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('377', '371', '古县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('378', '371', '安泽县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('379', '371', '浮山县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('380', '371', '吉县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('381', '371', '乡宁县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('382', '371', '大宁县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('383', '371', '隰县', '2', null, null, '2022-08-11 16:30:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('384', '371', '永和县', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('385', '371', '蒲县', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('386', '371', '汾西县', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('387', '371', '侯马市', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('388', '371', '霍州市', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('389', '274', '吕梁市', '1', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('390', '389', '离石区', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('391', '389', '文水县', '2', null, null, '2022-08-11 16:30:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('392', '389', '交城县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('393', '389', '兴县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('394', '389', '临县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('395', '389', '柳林县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('396', '389', '石楼县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('397', '389', '岚县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('398', '389', '方山县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('399', '389', '中阳县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('400', '389', '交口县', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('401', '389', '孝义市', '2', null, null, '2022-08-11 16:30:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('402', '389', '汾阳市', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('403', null, '内蒙古自治区', '0', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('404', '403', '呼和浩特市', '1', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('405', '404', '新城区', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('406', '404', '回民区', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('407', '404', '玉泉区', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('408', '404', '赛罕区', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('409', '404', '土默特左旗', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('410', '404', '托克托县', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('411', '404', '和林格尔县', '2', null, null, '2022-08-11 16:30:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('412', '404', '清水河县', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('413', '404', '武川县', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('414', '403', '包头市', '1', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('415', '414', '东河区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('416', '414', '昆都仑区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('417', '414', '青山区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('418', '414', '石拐区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('419', '414', '白云鄂博矿区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('420', '414', '九原区', '2', null, null, '2022-08-11 16:30:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('421', '414', '土默特右旗', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('422', '414', '固阳县', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('423', '414', '达尔罕茂明安联合旗', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('424', '403', '乌海市', '1', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('425', '424', '海勃湾区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('426', '424', '海南区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('427', '424', '乌达区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('428', '403', '赤峰市', '1', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('429', '428', '红山区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('430', '428', '元宝山区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('431', '428', '松山区', '2', null, null, '2022-08-11 16:30:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('432', '428', '阿鲁科尔沁旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('433', '428', '巴林左旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('434', '428', '巴林右旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('435', '428', '林西县', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('436', '428', '克什克腾旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('437', '428', '翁牛特旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('438', '428', '喀喇沁旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('439', '428', '宁城县', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('440', '428', '敖汉旗', '2', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('441', '403', '通辽市', '1', null, null, '2022-08-11 16:30:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('442', '441', '科尔沁区', '2', null, null, '2022-08-11 16:30:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('443', '441', '科尔沁左翼中旗', '2', null, null, '2022-08-11 16:30:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('444', '441', '科尔沁左翼后旗', '2', null, null, '2022-08-11 16:30:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('445', '441', '开鲁县', '2', null, null, '2022-08-11 16:30:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('446', '441', '库伦旗', '2', null, null, '2022-08-11 16:30:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('447', '441', '奈曼旗', '2', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('448', '441', '扎鲁特旗', '2', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('449', '441', '霍林郭勒市', '2', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('450', '403', '鄂尔多斯市', '1', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('451', '450', '东胜区', '2', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('452', '450', '康巴什区', '2', null, null, '2022-08-11 16:30:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('453', '450', '达拉特旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('454', '450', '准格尔旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('455', '450', '鄂托克前旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('456', '450', '鄂托克旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('457', '450', '杭锦旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('458', '450', '乌审旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('459', '450', '伊金霍洛旗', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('460', '403', '呼伦贝尔市', '1', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('461', '460', '海拉尔区', '2', null, null, '2022-08-11 16:30:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('462', '460', '扎赉诺尔区', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('463', '460', '阿荣旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('464', '460', '莫力达瓦达斡尔族自治旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('465', '460', '鄂伦春自治旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('466', '460', '鄂温克族自治旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('467', '460', '陈巴尔虎旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('468', '460', '新巴尔虎左旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('469', '460', '新巴尔虎右旗', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('470', '460', '满洲里市', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('471', '460', '牙克石市', '2', null, null, '2022-08-11 16:30:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('472', '460', '扎兰屯市', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('473', '460', '额尔古纳市', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('474', '460', '根河市', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('475', '403', '巴彦淖尔市', '1', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('476', '475', '临河区', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('477', '475', '五原县', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('478', '475', '磴口县', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('479', '475', '乌拉特前旗', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('480', '475', '乌拉特中旗', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('481', '475', '乌拉特后旗', '2', null, null, '2022-08-11 16:30:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('482', '475', '杭锦后旗', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('483', '403', '乌兰察布市', '1', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('484', '483', '集宁区', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('485', '483', '卓资县', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('486', '483', '化德县', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('487', '483', '商都县', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('488', '483', '兴和县', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('489', '483', '凉城县', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('490', '483', '察哈尔右翼前旗', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('491', '483', '察哈尔右翼中旗', '2', null, null, '2022-08-11 16:30:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('492', '483', '察哈尔右翼后旗', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('493', '483', '四子王旗', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('494', '483', '丰镇市', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('495', '403', '兴安盟', '1', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('496', '495', '乌兰浩特市', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('497', '495', '阿尔山市', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('498', '495', '科尔沁右翼前旗', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('499', '495', '科尔沁右翼中旗', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('500', '495', '扎赉特旗', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('501', '495', '突泉县', '2', null, null, '2022-08-11 16:30:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('502', '403', '锡林郭勒盟', '1', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('503', '502', '二连浩特市', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('504', '502', '锡林浩特市', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('505', '502', '阿巴嘎旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('506', '502', '苏尼特左旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('507', '502', '苏尼特右旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('508', '502', '东乌珠穆沁旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('509', '502', '西乌珠穆沁旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('510', '502', '太仆寺旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('511', '502', '镶黄旗', '2', null, null, '2022-08-11 16:30:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('512', '502', '正镶白旗', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('513', '502', '正蓝旗', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('514', '502', '多伦县', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('515', '403', '阿拉善盟', '1', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('516', '515', '阿拉善左旗', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('517', '515', '阿拉善右旗', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('518', '515', '额济纳旗', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('519', null, '辽宁省', '0', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('520', '519', '沈阳市', '1', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('521', '520', '和平区', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('522', '520', '沈河区', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('523', '520', '大东区', '2', null, null, '2022-08-11 16:30:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('524', '520', '皇姑区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('525', '520', '铁西区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('526', '520', '苏家屯区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('527', '520', '浑南区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('528', '520', '沈北新区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('529', '520', '于洪区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('530', '520', '辽中区', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('531', '520', '康平县', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('532', '520', '法库县', '2', null, null, '2022-08-11 16:30:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('533', '520', '新民市', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('534', '519', '大连市', '1', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('535', '534', '中山区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('536', '534', '西岗区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('537', '534', '沙河口区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('538', '534', '甘井子区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('539', '534', '旅顺口区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('540', '534', '金州区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('541', '534', '普兰店区', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('542', '534', '长海县', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('543', '534', '瓦房店市', '2', null, null, '2022-08-11 16:30:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('544', '534', '庄河市', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('545', '519', '鞍山市', '1', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('546', '545', '铁东区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('547', '545', '铁西区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('548', '545', '立山区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('549', '545', '千山区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('550', '545', '台安县', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('551', '545', '岫岩满族自治县', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('552', '545', '海城市', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('553', '519', '抚顺市', '1', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('554', '553', '新抚区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('555', '553', '东洲区', '2', null, null, '2022-08-11 16:30:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('556', '553', '望花区', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('557', '553', '顺城区', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('558', '553', '抚顺县', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('559', '553', '新宾满族自治县', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('560', '553', '清原满族自治县', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('561', '519', '本溪市', '1', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('562', '561', '平山区', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('563', '561', '溪湖区', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('564', '561', '明山区', '2', null, null, '2022-08-11 16:30:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('565', '561', '南芬区', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('566', '561', '本溪满族自治县', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('567', '561', '桓仁满族自治县', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('568', '519', '丹东市', '1', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('569', '568', '元宝区', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('570', '568', '振兴区', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('571', '568', '振安区', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('572', '568', '宽甸满族自治县', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('573', '568', '东港市', '2', null, null, '2022-08-11 16:31:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('574', '568', '凤城市', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('575', '519', '锦州市', '1', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('576', '575', '古塔区', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('577', '575', '凌河区', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('578', '575', '太和区', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('579', '575', '黑山县', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('580', '575', '义县', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('581', '575', '凌海市', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('582', '575', '北镇市', '2', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('583', '519', '营口市', '1', null, null, '2022-08-11 16:31:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('584', '583', '站前区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('585', '583', '西市区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('586', '583', '鲅鱼圈区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('587', '583', '老边区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('588', '583', '盖州市', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('589', '583', '大石桥市', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('590', '519', '阜新市', '1', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('591', '590', '海州区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('592', '590', '新邱区', '2', null, null, '2022-08-11 16:31:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('593', '590', '太平区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('594', '590', '清河门区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('595', '590', '细河区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('596', '590', '阜新蒙古族自治县', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('597', '590', '彰武县', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('598', '519', '辽阳市', '1', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('599', '598', '白塔区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('600', '598', '文圣区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('601', '598', '宏伟区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('602', '598', '弓长岭区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('603', '598', '太子河区', '2', null, null, '2022-08-11 16:31:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('604', '598', '辽阳县', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('605', '598', '灯塔市', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('606', '519', '盘锦市', '1', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('607', '606', '双台子区', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('608', '606', '兴隆台区', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('609', '606', '大洼区', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('610', '606', '盘山县', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('611', '519', '铁岭市', '1', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('612', '611', '银州区', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('613', '611', '清河区', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('614', '611', '铁岭县', '2', null, null, '2022-08-11 16:31:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('615', '611', '西丰县', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('616', '611', '昌图县', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('617', '611', '调兵山市', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('618', '611', '开原市', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('619', '519', '朝阳市', '1', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('620', '619', '双塔区', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('621', '619', '龙城区', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('622', '619', '朝阳县', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('623', '619', '建平县', '2', null, null, '2022-08-11 16:31:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('624', '619', '喀喇沁左翼蒙古族自治县', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('625', '619', '北票市', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('626', '619', '凌源市', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('627', '519', '葫芦岛市', '1', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('628', '627', '连山区', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('629', '627', '龙港区', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('630', '627', '南票区', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('631', '627', '绥中县', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('632', '627', '建昌县', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('633', '627', '兴城市', '2', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('634', null, '吉林省', '0', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('635', '634', '长春市', '1', null, null, '2022-08-11 16:31:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('636', '635', '南关区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('637', '635', '宽城区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('638', '635', '朝阳区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('639', '635', '二道区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('640', '635', '绿园区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('641', '635', '双阳区', '2', null, null, '2022-08-11 16:31:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('642', '635', '九台区', '2', null, null, '2022-08-11 16:31:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('643', '635', '农安县', '2', null, null, '2022-08-11 16:31:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('644', '635', '榆树市', '2', null, null, '2022-08-11 16:31:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('645', '635', '德惠市', '2', null, null, '2022-08-11 16:31:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('646', '635', '公主岭市', '2', null, null, '2022-08-11 16:31:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('647', '634', '吉林市', '1', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('648', '647', '昌邑区', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('649', '647', '龙潭区', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('650', '647', '船营区', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('651', '647', '丰满区', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('652', '647', '永吉县', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('653', '647', '蛟河市', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('654', '647', '桦甸市', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('655', '647', '舒兰市', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('656', '647', '磐石市', '2', null, null, '2022-08-11 16:31:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('657', '634', '四平市', '1', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('658', '657', '铁西区', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('659', '657', '铁东区', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('660', '657', '梨树县', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('661', '657', '伊通满族自治县', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('662', '657', '双辽市', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('663', '634', '辽源市', '1', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('664', '663', '龙山区', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('665', '663', '西安区', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('666', '663', '东丰县', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('667', '663', '东辽县', '2', null, null, '2022-08-11 16:31:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('668', '634', '通化市', '1', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('669', '668', '东昌区', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('670', '668', '二道江区', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('671', '668', '通化县', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('672', '668', '辉南县', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('673', '668', '柳河县', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('674', '668', '梅河口市', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('675', '668', '集安市', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('676', '634', '白山市', '1', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('677', '676', '浑江区', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('678', '676', '江源区', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('679', '676', '抚松县', '2', null, null, '2022-08-11 16:31:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('680', '676', '靖宇县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('681', '676', '长白朝鲜族自治县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('682', '676', '临江市', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('683', '634', '松原市', '1', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('684', '683', '宁江区', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('685', '683', '前郭尔罗斯蒙古族自治县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('686', '683', '长岭县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('687', '683', '乾安县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('688', '683', '扶余市', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('689', '634', '白城市', '1', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('690', '689', '洮北区', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('691', '689', '镇赉县', '2', null, null, '2022-08-11 16:31:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('692', '689', '通榆县', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('693', '689', '洮南市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('694', '689', '大安市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('695', '634', '延边朝鲜族自治州', '1', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('696', '695', '延吉市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('697', '695', '图们市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('698', '695', '敦化市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('699', '695', '珲春市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('700', '695', '龙井市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('701', '695', '和龙市', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('702', '695', '汪清县', '2', null, null, '2022-08-11 16:31:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('703', '695', '安图县', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('704', null, '黑龙江省', '0', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('705', '704', '哈尔滨市', '1', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('706', '705', '道里区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('707', '705', '南岗区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('708', '705', '道外区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('709', '705', '平房区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('710', '705', '松北区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('711', '705', '香坊区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('712', '705', '呼兰区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('713', '705', '阿城区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('714', '705', '双城区', '2', null, null, '2022-08-11 16:31:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('715', '705', '依兰县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('716', '705', '方正县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('717', '705', '宾县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('718', '705', '巴彦县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('719', '705', '木兰县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('720', '705', '通河县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('721', '705', '延寿县', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('722', '705', '尚志市', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('723', '705', '五常市', '2', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('724', '704', '齐齐哈尔市', '1', null, null, '2022-08-11 16:31:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('725', '724', '龙沙区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('726', '724', '建华区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('727', '724', '铁锋区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('728', '724', '昂昂溪区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('729', '724', '富拉尔基区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('730', '724', '碾子山区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('731', '724', '梅里斯达斡尔族区', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('732', '724', '龙江县', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('733', '724', '依安县', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('734', '724', '泰来县', '2', null, null, '2022-08-11 16:31:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('735', '724', '甘南县', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('736', '724', '富裕县', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('737', '724', '克山县', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('738', '724', '克东县', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('739', '724', '拜泉县', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('740', '724', '讷河市', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('741', '704', '鸡西市', '1', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('742', '741', '鸡冠区', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('743', '741', '恒山区', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('744', '741', '滴道区', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('745', '741', '梨树区', '2', null, null, '2022-08-11 16:31:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('746', '741', '城子河区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('747', '741', '麻山区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('748', '741', '鸡东县', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('749', '741', '虎林市', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('750', '741', '密山市', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('751', '704', '鹤岗市', '1', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('752', '751', '向阳区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('753', '751', '工农区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('754', '751', '南山区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('755', '751', '兴安区', '2', null, null, '2022-08-11 16:31:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('756', '751', '东山区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('757', '751', '兴山区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('758', '751', '萝北县', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('759', '751', '绥滨县', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('760', '704', '双鸭山市', '1', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('761', '760', '尖山区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('762', '760', '岭东区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('763', '760', '四方台区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('764', '760', '宝山区', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('765', '760', '集贤县', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('766', '760', '友谊县', '2', null, null, '2022-08-11 16:31:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('767', '760', '宝清县', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('768', '760', '饶河县', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('769', '704', '大庆市', '1', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('770', '769', '萨尔图区', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('771', '769', '龙凤区', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('772', '769', '让胡路区', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('773', '769', '红岗区', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('774', '769', '大同区', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('775', '769', '肇州县', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('776', '769', '肇源县', '2', null, null, '2022-08-11 16:31:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('777', '769', '林甸县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('778', '769', '杜尔伯特蒙古族自治县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('779', '704', '伊春市', '1', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('780', '779', '伊美区', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('781', '779', '乌翠区', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('782', '779', '友好区', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('783', '779', '嘉荫县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('784', '779', '汤旺县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('785', '779', '丰林县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('786', '779', '大箐山县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('787', '779', '南岔县', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('788', '779', '金林区', '2', null, null, '2022-08-11 16:31:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('789', '779', '铁力市', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('790', '704', '佳木斯市', '1', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('791', '790', '向阳区', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('792', '790', '前进区', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('793', '790', '东风区', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('794', '790', '郊区', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('795', '790', '桦南县', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('796', '790', '桦川县', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('797', '790', '汤原县', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('798', '790', '同江市', '2', null, null, '2022-08-11 16:31:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('799', '790', '富锦市', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('800', '790', '抚远市', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('801', '704', '七台河市', '1', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('802', '801', '新兴区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('803', '801', '桃山区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('804', '801', '茄子河区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('805', '801', '勃利县', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('806', '704', '牡丹江市', '1', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('807', '806', '东安区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('808', '806', '阳明区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('809', '806', '爱民区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('810', '806', '西安区', '2', null, null, '2022-08-11 16:31:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('811', '806', '林口县', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('812', '806', '绥芬河市', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('813', '806', '海林市', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('814', '806', '宁安市', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('815', '806', '穆棱市', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('816', '806', '东宁市', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('817', '704', '黑河市', '1', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('818', '817', '爱辉区', '2', null, null, '2022-08-11 16:31:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('819', '817', '逊克县', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('820', '817', '孙吴县', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('821', '817', '北安市', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('822', '817', '五大连池市', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('823', '817', '嫩江市', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('824', '704', '绥化市', '1', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('825', '824', '北林区', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('826', '824', '望奎县', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('827', '824', '兰西县', '2', null, null, '2022-08-11 16:31:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('828', '824', '青冈县', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('829', '824', '庆安县', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('830', '824', '明水县', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('831', '824', '绥棱县', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('832', '824', '安达市', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('833', '824', '肇东市', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('834', '824', '海伦市', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('835', '704', '大兴安岭地区', '1', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('836', '835', '漠河市', '2', null, null, '2022-08-11 16:31:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('837', '835', '呼玛县', '2', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('838', '835', '塔河县', '2', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('839', null, '江苏省', '0', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('840', '839', '南京市', '1', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('841', '840', '玄武区', '2', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('842', '840', '秦淮区', '2', null, null, '2022-08-11 16:31:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('843', '840', '建邺区', '2', null, null, '2022-08-11 16:31:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('844', '840', '鼓楼区', '2', null, null, '2022-08-11 16:31:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('845', '840', '浦口区', '2', null, null, '2022-08-11 16:31:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('846', '840', '栖霞区', '2', null, null, '2022-08-11 16:31:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('847', '840', '雨花台区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('848', '840', '江宁区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('849', '840', '六合区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('850', '840', '溧水区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('851', '840', '高淳区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('852', '839', '无锡市', '1', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('853', '852', '锡山区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('854', '852', '惠山区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('855', '852', '滨湖区', '2', null, null, '2022-08-11 16:31:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('856', '852', '梁溪区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('857', '852', '新吴区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('858', '852', '江阴市', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('859', '852', '宜兴市', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('860', '839', '徐州市', '1', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('861', '860', '鼓楼区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('862', '860', '云龙区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('863', '860', '贾汪区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('864', '860', '泉山区', '2', null, null, '2022-08-11 16:31:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('865', '860', '铜山区', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('866', '860', '丰县', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('867', '860', '沛县', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('868', '860', '睢宁县', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('869', '860', '新沂市', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('870', '860', '邳州市', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('871', '839', '常州市', '1', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('872', '871', '天宁区', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('873', '871', '钟楼区', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('874', '871', '新北区', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('875', '871', '武进区', '2', null, null, '2022-08-11 16:31:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('876', '871', '金坛区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('877', '871', '溧阳市', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('878', '839', '苏州市', '1', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('879', '878', '虎丘区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('880', '878', '吴中区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('881', '878', '相城区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('882', '878', '姑苏区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('883', '878', '吴江区', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('884', '878', '常熟市', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('885', '878', '张家港市', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('886', '878', '昆山市', '2', null, null, '2022-08-11 16:31:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('887', '878', '太仓市', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('888', '839', '南通市', '1', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('889', '888', '通州区', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('890', '888', '崇川区', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('891', '888', '海门区', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('892', '888', '如东县', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('893', '888', '启东市', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('894', '888', '如皋市', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('895', '888', '海安市', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('896', '839', '连云港市', '1', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('897', '896', '连云区', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('898', '896', '海州区', '2', null, null, '2022-08-11 16:31:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('899', '896', '赣榆区', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('900', '896', '东海县', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('901', '896', '灌云县', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('902', '896', '灌南县', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('903', '839', '淮安市', '1', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('904', '903', '淮安区', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('905', '903', '淮阴区', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('906', '903', '清江浦区', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('907', '903', '洪泽区', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('908', '903', '涟水县', '2', null, null, '2022-08-11 16:31:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('909', '903', '盱眙县', '2', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('910', '903', '金湖县', '2', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('911', '839', '盐城市', '1', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('912', '911', '亭湖区', '2', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('913', '911', '盐都区', '2', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('914', '911', '大丰区', '2', null, null, '2022-08-11 16:31:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('915', '911', '响水县', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('916', '911', '滨海县', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('917', '911', '阜宁县', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('918', '911', '射阳县', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('919', '911', '建湖县', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('920', '911', '东台市', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('921', '839', '扬州市', '1', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('922', '921', '广陵区', '2', null, null, '2022-08-11 16:31:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('923', '921', '邗江区', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('924', '921', '江都区', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('925', '921', '宝应县', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('926', '921', '仪征市', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('927', '921', '高邮市', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('928', '839', '镇江市', '1', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('929', '928', '京口区', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('930', '928', '润州区', '2', null, null, '2022-08-11 16:31:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('931', '928', '丹徒区', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('932', '928', '丹阳市', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('933', '928', '扬中市', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('934', '928', '句容市', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('935', '839', '泰州市', '1', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('936', '935', '海陵区', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('937', '935', '高港区', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('938', '935', '姜堰区', '2', null, null, '2022-08-11 16:31:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('939', '935', '兴化市', '2', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('940', '935', '靖江市', '2', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('941', '935', '泰兴市', '2', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('942', '839', '宿迁市', '1', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('943', '942', '宿城区', '2', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('944', '942', '宿豫区', '2', null, null, '2022-08-11 16:31:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('945', '942', '沭阳县', '2', null, null, '2022-08-11 16:31:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('946', '942', '泗阳县', '2', null, null, '2022-08-11 16:31:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('947', '942', '泗洪县', '2', null, null, '2022-08-11 16:31:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('948', null, '浙江省', '0', null, null, '2022-08-11 16:31:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('949', '948', '杭州市', '1', null, null, '2022-08-11 16:31:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('950', '949', '上城区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('951', '949', '下城区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('952', '949', '江干区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('953', '949', '拱墅区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('954', '949', '西湖区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('955', '949', '滨江区', '2', null, null, '2022-08-11 16:31:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('956', '949', '萧山区', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('957', '949', '余杭区', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('958', '949', '富阳区', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('959', '949', '临安区', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('960', '949', '桐庐县', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('961', '949', '淳安县', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('962', '949', '建德市', '2', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('963', '948', '宁波市', '1', null, null, '2022-08-11 16:31:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('964', '963', '海曙区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('965', '963', '江北区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('966', '963', '北仑区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('967', '963', '镇海区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('968', '963', '鄞州区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('969', '963', '奉化区', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('970', '963', '象山县', '2', null, null, '2022-08-11 16:31:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('971', '963', '宁海县', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('972', '963', '余姚市', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('973', '963', '慈溪市', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('974', '948', '温州市', '1', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('975', '974', '鹿城区', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('976', '974', '龙湾区', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('977', '974', '瓯海区', '2', null, null, '2022-08-11 16:31:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('978', '974', '洞头区', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('979', '974', '永嘉县', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('980', '974', '平阳县', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('981', '974', '苍南县', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('982', '974', '文成县', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('983', '974', '泰顺县', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('984', '974', '瑞安市', '2', null, null, '2022-08-11 16:31:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('985', '974', '乐清市', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('986', '974', '龙港市', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('987', '948', '嘉兴市', '1', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('988', '987', '南湖区', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('989', '987', '秀洲区', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('990', '987', '嘉善县', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('991', '987', '海盐县', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('992', '987', '海宁市', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('993', '987', '平湖市', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('994', '987', '桐乡市', '2', null, null, '2022-08-11 16:31:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('995', '948', '湖州市', '1', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('996', '995', '吴兴区', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('997', '995', '南浔区', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('998', '995', '德清县', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('999', '995', '长兴县', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1000', '995', '安吉县', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1001', '948', '绍兴市', '1', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1002', '1001', '越城区', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1003', '1001', '柯桥区', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1004', '1001', '上虞区', '2', null, null, '2022-08-11 16:31:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1005', '1001', '新昌县', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1006', '1001', '诸暨市', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1007', '1001', '嵊州市', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1008', '948', '金华市', '1', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1009', '1008', '婺城区', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1010', '1008', '金东区', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1011', '1008', '武义县', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1012', '1008', '浦江县', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1013', '1008', '磐安县', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1014', '1008', '兰溪市', '2', null, null, '2022-08-11 16:31:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1015', '1008', '义乌市', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1016', '1008', '东阳市', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1017', '1008', '永康市', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1018', '948', '衢州市', '1', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1019', '1018', '柯城区', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1020', '1018', '衢江区', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1021', '1018', '常山县', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1022', '1018', '开化县', '2', null, null, '2022-08-11 16:31:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1023', '1018', '龙游县', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1024', '1018', '江山市', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1025', '948', '舟山市', '1', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1026', '1025', '定海区', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1027', '1025', '普陀区', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1028', '1025', '岱山县', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1029', '1025', '嵊泗县', '2', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1030', '948', '台州市', '1', null, null, '2022-08-11 16:31:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1031', '1030', '椒江区', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1032', '1030', '黄岩区', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1033', '1030', '路桥区', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1034', '1030', '三门县', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1035', '1030', '天台县', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1036', '1030', '仙居县', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1037', '1030', '温岭市', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1038', '1030', '临海市', '2', null, null, '2022-08-11 16:31:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1039', '1030', '玉环市', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1040', '948', '丽水市', '1', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1041', '1040', '莲都区', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1042', '1040', '青田县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1043', '1040', '缙云县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1044', '1040', '遂昌县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1045', '1040', '松阳县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1046', '1040', '云和县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1047', '1040', '庆元县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1048', '1040', '景宁畲族自治县', '2', null, null, '2022-08-11 16:31:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1049', '1040', '龙泉市', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1050', null, '安徽省', '0', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1051', '1050', '合肥市', '1', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1052', '1051', '瑶海区', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1053', '1051', '庐阳区', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1054', '1051', '蜀山区', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1055', '1051', '包河区', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1056', '1051', '长丰县', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1057', '1051', '肥东县', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1058', '1051', '肥西县', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1059', '1051', '庐江县', '2', null, null, '2022-08-11 16:31:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1060', '1051', '巢湖市', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1061', '1050', '芜湖市', '1', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1062', '1061', '镜湖区', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1063', '1061', '鸠江区', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1064', '1061', '弋江区', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1065', '1061', '湾沚区', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1066', '1061', '繁昌区', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1067', '1061', '南陵县', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1068', '1061', '无为市', '2', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1069', '1050', '蚌埠市', '1', null, null, '2022-08-11 16:31:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1070', '1069', '龙子湖区', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1071', '1069', '蚌山区', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1072', '1069', '禹会区', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1073', '1069', '淮上区', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1074', '1069', '怀远县', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1075', '1069', '五河县', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1076', '1069', '固镇县', '2', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1077', '1050', '淮南市', '1', null, null, '2022-08-11 16:31:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1078', '1077', '大通区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1079', '1077', '田家庵区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1080', '1077', '谢家集区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1081', '1077', '八公山区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1082', '1077', '潘集区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1083', '1077', '凤台县', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1084', '1077', '寿县', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1085', '1050', '马鞍山市', '1', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1086', '1085', '花山区', '2', null, null, '2022-08-11 16:31:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1087', '1085', '雨山区', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1088', '1085', '博望区', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1089', '1085', '当涂县', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1090', '1085', '含山县', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1091', '1085', '和县', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1092', '1050', '淮北市', '1', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1093', '1092', '杜集区', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1094', '1092', '相山区', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1095', '1092', '烈山区', '2', null, null, '2022-08-11 16:31:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1096', '1092', '濉溪县', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1097', '1050', '铜陵市', '1', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1098', '1097', '铜官区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1099', '1097', '义安区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1100', '1097', '郊区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1101', '1097', '枞阳县', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1102', '1050', '安庆市', '1', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1103', '1102', '迎江区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1104', '1102', '大观区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1105', '1102', '宜秀区', '2', null, null, '2022-08-11 16:31:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1106', '1102', '怀宁县', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1107', '1102', '太湖县', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1108', '1102', '宿松县', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1109', '1102', '望江县', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1110', '1102', '岳西县', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1111', '1102', '桐城市', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1112', '1102', '潜山市', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1113', '1050', '黄山市', '1', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1114', '1113', '屯溪区', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1115', '1113', '黄山区', '2', null, null, '2022-08-11 16:31:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1116', '1113', '徽州区', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1117', '1113', '歙县', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1118', '1113', '休宁县', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1119', '1113', '黟县', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1120', '1113', '祁门县', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1121', '1050', '滁州市', '1', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1122', '1121', '琅琊区', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1123', '1121', '南谯区', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1124', '1121', '来安县', '2', null, null, '2022-08-11 16:32:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1125', '1121', '全椒县', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1126', '1121', '定远县', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1127', '1121', '凤阳县', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1128', '1121', '天长市', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1129', '1121', '明光市', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1130', '1050', '阜阳市', '1', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1131', '1130', '颍州区', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1132', '1130', '颍东区', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1133', '1130', '颍泉区', '2', null, null, '2022-08-11 16:32:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1134', '1130', '临泉县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1135', '1130', '太和县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1136', '1130', '阜南县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1137', '1130', '颍上县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1138', '1130', '界首市', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1139', '1050', '宿州市', '1', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1140', '1139', '埇桥区', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1141', '1139', '砀山县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1142', '1139', '萧县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1143', '1139', '灵璧县', '2', null, null, '2022-08-11 16:32:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1144', '1139', '泗县', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1145', '1050', '六安市', '1', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1146', '1145', '金安区', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1147', '1145', '裕安区', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1148', '1145', '叶集区', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1149', '1145', '霍邱县', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1150', '1145', '舒城县', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1151', '1145', '金寨县', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1152', '1145', '霍山县', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1153', '1050', '亳州市', '1', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1154', '1153', '谯城区', '2', null, null, '2022-08-11 16:32:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1155', '1153', '涡阳县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1156', '1153', '蒙城县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1157', '1153', '利辛县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1158', '1050', '池州市', '1', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1159', '1158', '贵池区', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1160', '1158', '东至县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1161', '1158', '石台县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1162', '1158', '青阳县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1163', '1050', '宣城市', '1', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1164', '1163', '宣州区', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1165', '1163', '郎溪县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1166', '1163', '泾县', '2', null, null, '2022-08-11 16:32:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1167', '1163', '绩溪县', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1168', '1163', '旌德县', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1169', '1163', '宁国市', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1170', '1163', '广德市', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1171', null, '福建省', '0', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1172', '1171', '福州市', '1', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1173', '1172', '鼓楼区', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1174', '1172', '台江区', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1175', '1172', '仓山区', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1176', '1172', '马尾区', '2', null, null, '2022-08-11 16:32:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1177', '1172', '晋安区', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1178', '1172', '长乐区', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1179', '1172', '闽侯县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1180', '1172', '连江县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1181', '1172', '罗源县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1182', '1172', '闽清县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1183', '1172', '永泰县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1184', '1172', '平潭县', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1185', '1172', '福清市', '2', null, null, '2022-08-11 16:32:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1186', '1171', '厦门市', '1', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1187', '1186', '思明区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1188', '1186', '海沧区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1189', '1186', '湖里区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1190', '1186', '集美区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1191', '1186', '同安区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1192', '1186', '翔安区', '2', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1193', '1171', '莆田市', '1', null, null, '2022-08-11 16:32:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1194', '1193', '城厢区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1195', '1193', '涵江区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1196', '1193', '荔城区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1197', '1193', '秀屿区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1198', '1193', '仙游县', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1199', '1171', '三明市', '1', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1200', '1199', '梅列区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1201', '1199', '三元区', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1202', '1199', '明溪县', '2', null, null, '2022-08-11 16:32:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1203', '1199', '清流县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1204', '1199', '宁化县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1205', '1199', '大田县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1206', '1199', '尤溪县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1207', '1199', '沙县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1208', '1199', '将乐县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1209', '1199', '泰宁县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1210', '1199', '建宁县', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1211', '1199', '永安市', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1212', '1171', '泉州市', '1', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1213', '1212', '鲤城区', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1214', '1212', '丰泽区', '2', null, null, '2022-08-11 16:32:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1215', '1212', '洛江区', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1216', '1212', '泉港区', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1217', '1212', '惠安县', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1218', '1212', '安溪县', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1219', '1212', '永春县', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1220', '1212', '德化县', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1221', '1212', '金门县', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1222', '1212', '石狮市', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1223', '1212', '晋江市', '2', null, null, '2022-08-11 16:32:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1224', '1212', '南安市', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1225', '1171', '漳州市', '1', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1226', '1225', '芗城区', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1227', '1225', '龙文区', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1228', '1225', '云霄县', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1229', '1225', '漳浦县', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1230', '1225', '诏安县', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1231', '1225', '长泰县', '2', null, null, '2022-08-11 16:32:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1232', '1225', '东山县', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1233', '1225', '南靖县', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1234', '1225', '平和县', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1235', '1225', '华安县', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1236', '1225', '龙海市', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1237', '1171', '南平市', '1', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1238', '1237', '延平区', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1239', '1237', '建阳区', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1240', '1237', '顺昌县', '2', null, null, '2022-08-11 16:32:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1241', '1237', '浦城县', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1242', '1237', '光泽县', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1243', '1237', '松溪县', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1244', '1237', '政和县', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1245', '1237', '邵武市', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1246', '1237', '武夷山市', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1247', '1237', '建瓯市', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1248', '1171', '龙岩市', '1', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1249', '1248', '新罗区', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1250', '1248', '永定区', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1251', '1248', '长汀县', '2', null, null, '2022-08-11 16:32:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1252', '1248', '上杭县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1253', '1248', '武平县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1254', '1248', '连城县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1255', '1248', '漳平市', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1256', '1171', '宁德市', '1', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1257', '1256', '蕉城区', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1258', '1256', '霞浦县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1259', '1256', '古田县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1260', '1256', '屏南县', '2', null, null, '2022-08-11 16:32:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1261', '1256', '寿宁县', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1262', '1256', '周宁县', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1263', '1256', '柘荣县', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1264', '1256', '福安市', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1265', '1256', '福鼎市', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1266', null, '江西省', '0', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1267', '1266', '南昌市', '1', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1268', '1267', '东湖区', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1269', '1267', '西湖区', '2', null, null, '2022-08-11 16:32:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1270', '1267', '青云谱区', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1271', '1267', '青山湖区', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1272', '1267', '新建区', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1273', '1267', '红谷滩区', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1274', '1267', '南昌县', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1275', '1267', '安义县', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1276', '1267', '进贤县', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1277', '1266', '景德镇市', '1', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1278', '1277', '昌江区', '2', null, null, '2022-08-11 16:32:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1279', '1277', '珠山区', '2', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1280', '1277', '浮梁县', '2', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1281', '1277', '乐平市', '2', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1282', '1266', '萍乡市', '1', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1283', '1282', '安源区', '2', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1284', '1282', '湘东区', '2', null, null, '2022-08-11 16:32:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1285', '1282', '莲花县', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1286', '1282', '上栗县', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1287', '1282', '芦溪县', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1288', '1266', '九江市', '1', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1289', '1288', '濂溪区', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1290', '1288', '浔阳区', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1291', '1288', '柴桑区', '2', null, null, '2022-08-11 16:32:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1292', '1288', '武宁县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1293', '1288', '修水县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1294', '1288', '永修县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1295', '1288', '德安县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1296', '1288', '都昌县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1297', '1288', '湖口县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1298', '1288', '彭泽县', '2', null, null, '2022-08-11 16:32:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1299', '1288', '瑞昌市', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1300', '1288', '共青城市', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1301', '1288', '庐山市', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1302', '1266', '新余市', '1', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1303', '1302', '渝水区', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1304', '1302', '分宜县', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1305', '1266', '鹰潭市', '1', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1306', '1305', '月湖区', '2', null, null, '2022-08-11 16:32:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1307', '1305', '余江区', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1308', '1305', '贵溪市', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1309', '1266', '赣州市', '1', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1310', '1309', '章贡区', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1311', '1309', '南康区', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1312', '1309', '赣县区', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1313', '1309', '信丰县', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1314', '1309', '大余县', '2', null, null, '2022-08-11 16:32:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1315', '1309', '上犹县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1316', '1309', '崇义县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1317', '1309', '安远县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1318', '1309', '定南县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1319', '1309', '全南县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1320', '1309', '宁都县', '2', null, null, '2022-08-11 16:32:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1321', '1309', '于都县', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1322', '1309', '兴国县', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1323', '1309', '会昌县', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1324', '1309', '寻乌县', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1325', '1309', '石城县', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1326', '1309', '瑞金市', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1327', '1309', '龙南市', '2', null, null, '2022-08-11 16:32:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1328', '1266', '吉安市', '1', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1329', '1328', '吉州区', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1330', '1328', '青原区', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1331', '1328', '吉安县', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1332', '1328', '吉水县', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1333', '1328', '峡江县', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1334', '1328', '新干县', '2', null, null, '2022-08-11 16:32:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1335', '1328', '永丰县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1336', '1328', '泰和县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1337', '1328', '遂川县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1338', '1328', '万安县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1339', '1328', '安福县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1340', '1328', '永新县', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1341', '1328', '井冈山市', '2', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1342', '1266', '宜春市', '1', null, null, '2022-08-11 16:32:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1343', '1342', '袁州区', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1344', '1342', '奉新县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1345', '1342', '万载县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1346', '1342', '上高县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1347', '1342', '宜丰县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1348', '1342', '靖安县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1349', '1342', '铜鼓县', '2', null, null, '2022-08-11 16:32:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1350', '1342', '丰城市', '2', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1351', '1342', '樟树市', '2', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1352', '1342', '高安市', '2', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1353', '1266', '抚州市', '1', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1354', '1353', '临川区', '2', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1355', '1353', '东乡区', '2', null, null, '2022-08-11 16:32:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1356', '1353', '南城县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1357', '1353', '黎川县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1358', '1353', '南丰县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1359', '1353', '崇仁县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1360', '1353', '乐安县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1361', '1353', '宜黄县', '2', null, null, '2022-08-11 16:32:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1362', '1353', '金溪县', '2', null, null, '2022-08-11 16:32:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1363', '1353', '资溪县', '2', null, null, '2022-08-11 16:32:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1364', '1353', '广昌县', '2', null, null, '2022-08-11 16:32:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1365', '1266', '上饶市', '1', null, null, '2022-08-11 16:32:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1366', '1365', '信州区', '2', null, null, '2022-08-11 16:32:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1367', '1365', '广丰区', '2', null, null, '2022-08-11 16:32:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1368', '1365', '广信区', '2', null, null, '2022-08-11 16:32:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1369', '1365', '玉山县', '2', null, null, '2022-08-11 16:32:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1370', '1365', '铅山县', '2', null, null, '2022-08-11 16:32:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1371', '1365', '横峰县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1372', '1365', '弋阳县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1373', '1365', '余干县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1374', '1365', '鄱阳县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1375', '1365', '万年县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1376', '1365', '婺源县', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1377', '1365', '德兴市', '2', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1378', null, '山东省', '0', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1379', '1378', '济南市', '1', null, null, '2022-08-11 16:32:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1380', '1379', '历下区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1381', '1379', '市中区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1382', '1379', '槐荫区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1383', '1379', '天桥区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1384', '1379', '历城区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1385', '1379', '长清区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1386', '1379', '章丘区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1387', '1379', '济阳区', '2', null, null, '2022-08-11 16:32:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1388', '1379', '莱芜区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1389', '1379', '钢城区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1390', '1379', '平阴县', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1391', '1379', '商河县', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1392', '1378', '青岛市', '1', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1393', '1392', '市南区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1394', '1392', '市北区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1395', '1392', '黄岛区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1396', '1392', '崂山区', '2', null, null, '2022-08-11 16:32:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1397', '1392', '李沧区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1398', '1392', '城阳区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1399', '1392', '即墨区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1400', '1392', '胶州市', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1401', '1392', '平度市', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1402', '1392', '莱西市', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1403', '1378', '淄博市', '1', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1404', '1403', '淄川区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1405', '1403', '张店区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1406', '1403', '博山区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1407', '1403', '临淄区', '2', null, null, '2022-08-11 16:32:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1408', '1403', '周村区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1409', '1403', '桓台县', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1410', '1403', '高青县', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1411', '1403', '沂源县', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1412', '1378', '枣庄市', '1', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1413', '1412', '市中区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1414', '1412', '薛城区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1415', '1412', '峄城区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1416', '1412', '台儿庄区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1417', '1412', '山亭区', '2', null, null, '2022-08-11 16:32:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1418', '1412', '滕州市', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1419', '1378', '东营市', '1', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1420', '1419', '东营区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1421', '1419', '河口区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1422', '1419', '垦利区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1423', '1419', '利津县', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1424', '1419', '广饶县', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1425', '1378', '烟台市', '1', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1426', '1425', '芝罘区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1427', '1425', '福山区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1428', '1425', '牟平区', '2', null, null, '2022-08-11 16:32:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1429', '1425', '莱山区', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1430', '1425', '蓬莱区', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1431', '1425', '龙口市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1432', '1425', '莱阳市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1433', '1425', '莱州市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1434', '1425', '招远市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1435', '1425', '栖霞市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1436', '1425', '海阳市', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1437', '1378', '潍坊市', '1', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1438', '1437', '潍城区', '2', null, null, '2022-08-11 16:32:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1439', '1437', '寒亭区', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1440', '1437', '坊子区', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1441', '1437', '奎文区', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1442', '1437', '临朐县', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1443', '1437', '昌乐县', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1444', '1437', '青州市', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1445', '1437', '诸城市', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1446', '1437', '寿光市', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1447', '1437', '安丘市', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1448', '1437', '高密市', '2', null, null, '2022-08-11 16:32:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1449', '1437', '昌邑市', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1450', '1378', '济宁市', '1', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1451', '1450', '任城区', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1452', '1450', '兖州区', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1453', '1450', '微山县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1454', '1450', '鱼台县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1455', '1450', '金乡县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1456', '1450', '嘉祥县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1457', '1450', '汶上县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1458', '1450', '泗水县', '2', null, null, '2022-08-11 16:32:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1459', '1450', '梁山县', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1460', '1450', '曲阜市', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1461', '1450', '邹城市', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1462', '1378', '泰安市', '1', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1463', '1462', '泰山区', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1464', '1462', '岱岳区', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1465', '1462', '宁阳县', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1466', '1462', '东平县', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1467', '1462', '新泰市', '2', null, null, '2022-08-11 16:32:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1468', '1462', '肥城市', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1469', '1378', '威海市', '1', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1470', '1469', '环翠区', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1471', '1469', '文登区', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1472', '1469', '荣成市', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1473', '1469', '乳山市', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1474', '1378', '日照市', '1', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1475', '1474', '东港区', '2', null, null, '2022-08-11 16:32:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1476', '1474', '岚山区', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1477', '1474', '五莲县', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1478', '1474', '莒县', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1479', '1378', '临沂市', '1', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1480', '1479', '兰山区', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1481', '1479', '罗庄区', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1482', '1479', '河东区', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1483', '1479', '沂南县', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1484', '1479', '郯城县', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1485', '1479', '沂水县', '2', null, null, '2022-08-11 16:32:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1486', '1479', '兰陵县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1487', '1479', '费县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1488', '1479', '平邑县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1489', '1479', '莒南县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1490', '1479', '蒙阴县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1491', '1479', '临沭县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1492', '1378', '德州市', '1', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1493', '1492', '德城区', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1494', '1492', '陵城区', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1495', '1492', '宁津县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1496', '1492', '庆云县', '2', null, null, '2022-08-11 16:32:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1497', '1492', '临邑县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1498', '1492', '齐河县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1499', '1492', '平原县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1500', '1492', '夏津县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1501', '1492', '武城县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1502', '1492', '乐陵市', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1503', '1492', '禹城市', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1504', '1378', '聊城市', '1', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1505', '1504', '东昌府区', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1506', '1504', '茌平区', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1507', '1504', '阳谷县', '2', null, null, '2022-08-11 16:32:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1508', '1504', '莘县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1509', '1504', '东阿县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1510', '1504', '冠县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1511', '1504', '高唐县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1512', '1504', '临清市', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1513', '1378', '滨州市', '1', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1514', '1513', '滨城区', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1515', '1513', '沾化区', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1516', '1513', '惠民县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1517', '1513', '阳信县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1518', '1513', '无棣县', '2', null, null, '2022-08-11 16:32:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1519', '1513', '博兴县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1520', '1513', '邹平市', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1521', '1378', '菏泽市', '1', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1522', '1521', '牡丹区', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1523', '1521', '定陶区', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1524', '1521', '曹县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1525', '1521', '单县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1526', '1521', '成武县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1527', '1521', '巨野县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1528', '1521', '郓城县', '2', null, null, '2022-08-11 16:32:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1529', '1521', '鄄城县', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1530', '1521', '东明县', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1531', null, '河南省', '0', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1532', '1531', '郑州市', '1', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1533', '1532', '中原区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1534', '1532', '二七区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1535', '1532', '管城回族区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1536', '1532', '金水区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1537', '1532', '上街区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1538', '1532', '惠济区', '2', null, null, '2022-08-11 16:32:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1539', '1532', '中牟县', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1540', '1532', '巩义市', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1541', '1532', '荥阳市', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1542', '1532', '新密市', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1543', '1532', '新郑市', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1544', '1532', '登封市', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1545', '1531', '开封市', '1', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1546', '1545', '龙亭区', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1547', '1545', '顺河回族区', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1548', '1545', '鼓楼区', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1549', '1545', '禹王台区', '2', null, null, '2022-08-11 16:32:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1550', '1545', '祥符区', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1551', '1545', '杞县', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1552', '1545', '通许县', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1553', '1545', '尉氏县', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1554', '1545', '兰考县', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1555', '1531', '洛阳市', '1', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1556', '1555', '老城区', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1557', '1555', '西工区', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1558', '1555', '瀍河回族区', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1559', '1555', '涧西区', '2', null, null, '2022-08-11 16:32:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1560', '1555', '吉利区', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1561', '1555', '洛龙区', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1562', '1555', '孟津县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1563', '1555', '新安县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1564', '1555', '栾川县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1565', '1555', '嵩县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1566', '1555', '汝阳县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1567', '1555', '宜阳县', '2', null, null, '2022-08-11 16:32:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1568', '1555', '洛宁县', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1569', '1555', '伊川县', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1570', '1555', '偃师市', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1571', '1531', '平顶山市', '1', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1572', '1571', '新华区', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1573', '1571', '卫东区', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1574', '1571', '石龙区', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1575', '1571', '湛河区', '2', null, null, '2022-08-11 16:32:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1576', '1571', '宝丰县', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1577', '1571', '叶县', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1578', '1571', '鲁山县', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1579', '1571', '郏县', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1580', '1571', '舞钢市', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1581', '1571', '汝州市', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1582', '1531', '安阳市', '1', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1583', '1582', '文峰区', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1584', '1582', '北关区', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1585', '1582', '殷都区', '2', null, null, '2022-08-11 16:32:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1586', '1582', '龙安区', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1587', '1582', '安阳县', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1588', '1582', '汤阴县', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1589', '1582', '滑县', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1590', '1582', '内黄县', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1591', '1582', '林州市', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1592', '1531', '鹤壁市', '1', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1593', '1592', '鹤山区', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1594', '1592', '山城区', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1595', '1592', '淇滨区', '2', null, null, '2022-08-11 16:32:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1596', '1592', '浚县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1597', '1592', '淇县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1598', '1531', '新乡市', '1', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1599', '1598', '红旗区', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1600', '1598', '卫滨区', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1601', '1598', '凤泉区', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1602', '1598', '牧野区', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1603', '1598', '新乡县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1604', '1598', '获嘉县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1605', '1598', '原阳县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1606', '1598', '延津县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1607', '1598', '封丘县', '2', null, null, '2022-08-11 16:32:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1608', '1598', '卫辉市', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1609', '1598', '辉县市', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1610', '1598', '长垣市', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1611', '1531', '焦作市', '1', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1612', '1611', '解放区', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1613', '1611', '中站区', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1614', '1611', '马村区', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1615', '1611', '山阳区', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1616', '1611', '修武县', '2', null, null, '2022-08-11 16:32:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1617', '1611', '博爱县', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1618', '1611', '武陟县', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1619', '1611', '温县', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1620', '1611', '沁阳市', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1621', '1611', '孟州市', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1622', '1531', '濮阳市', '1', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1623', '1622', '华龙区', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1624', '1622', '清丰县', '2', null, null, '2022-08-11 16:32:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1625', '1622', '南乐县', '2', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1626', '1622', '范县', '2', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1627', '1622', '台前县', '2', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1628', '1622', '濮阳县', '2', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1629', '1531', '许昌市', '1', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1630', '1629', '魏都区', '2', null, null, '2022-08-11 16:32:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1631', '1629', '建安区', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1632', '1629', '鄢陵县', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1633', '1629', '襄城县', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1634', '1629', '禹州市', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1635', '1629', '长葛市', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1636', '1531', '漯河市', '1', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1637', '1636', '源汇区', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1638', '1636', '郾城区', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1639', '1636', '召陵区', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1640', '1636', '舞阳县', '2', null, null, '2022-08-11 16:32:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1641', '1636', '临颍县', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1642', '1531', '三门峡市', '1', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1643', '1642', '湖滨区', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1644', '1642', '陕州区', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1645', '1642', '渑池县', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1646', '1642', '卢氏县', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1647', '1642', '义马市', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1648', '1642', '灵宝市', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1649', '1531', '南阳市', '1', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1650', '1649', '宛城区', '2', null, null, '2022-08-11 16:32:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1651', '1649', '卧龙区', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1652', '1649', '南召县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1653', '1649', '方城县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1654', '1649', '西峡县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1655', '1649', '镇平县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1656', '1649', '内乡县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1657', '1649', '淅川县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1658', '1649', '社旗县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1659', '1649', '唐河县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1660', '1649', '新野县', '2', null, null, '2022-08-11 16:33:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1661', '1649', '桐柏县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1662', '1649', '邓州市', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1663', '1531', '商丘市', '1', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1664', '1663', '梁园区', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1665', '1663', '睢阳区', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1666', '1663', '民权县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1667', '1663', '睢县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1668', '1663', '宁陵县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1669', '1663', '柘城县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1670', '1663', '虞城县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1671', '1663', '夏邑县', '2', null, null, '2022-08-11 16:33:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1672', '1663', '永城市', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1673', '1531', '信阳市', '1', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1674', '1673', '浉河区', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1675', '1673', '平桥区', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1676', '1673', '罗山县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1677', '1673', '光山县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1678', '1673', '新县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1679', '1673', '商城县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1680', '1673', '固始县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1681', '1673', '潢川县', '2', null, null, '2022-08-11 16:33:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1682', '1673', '淮滨县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1683', '1673', '息县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1684', '1531', '周口市', '1', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1685', '1684', '川汇区', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1686', '1684', '淮阳区', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1687', '1684', '扶沟县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1688', '1684', '西华县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1689', '1684', '商水县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1690', '1684', '沈丘县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1691', '1684', '郸城县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1692', '1684', '太康县', '2', null, null, '2022-08-11 16:33:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1693', '1684', '鹿邑县', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1694', '1684', '项城市', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1695', '1531', '驻马店市', '1', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1696', '1695', '驿城区', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1697', '1695', '西平县', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1698', '1695', '上蔡县', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1699', '1695', '平舆县', '2', null, null, '2022-08-11 16:33:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1700', '1695', '正阳县', '2', null, null, '2022-08-11 16:33:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1701', '1695', '确山县', '2', null, null, '2022-08-11 16:33:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1702', '1695', '泌阳县', '2', null, null, '2022-08-11 16:33:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1703', '1695', '汝南县', '2', null, null, '2022-08-11 16:33:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1704', '1695', '遂平县', '2', null, null, '2022-08-11 16:33:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1705', '1695', '新蔡县', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1706', null, '湖北省', '0', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1707', '1706', '武汉市', '1', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1708', '1707', '江岸区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1709', '1707', '江汉区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1710', '1707', '硚口区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1711', '1707', '汉阳区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1712', '1707', '武昌区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1713', '1707', '青山区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1714', '1707', '洪山区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1715', '1707', '东西湖区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1716', '1707', '汉南区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1717', '1707', '蔡甸区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1718', '1707', '江夏区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1719', '1707', '黄陂区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1720', '1707', '新洲区', '2', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1721', '1706', '黄石市', '1', null, null, '2022-08-11 16:33:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1722', '1721', '黄石港区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1723', '1721', '西塞山区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1724', '1721', '下陆区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1725', '1721', '铁山区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1726', '1721', '阳新县', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1727', '1721', '大冶市', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1728', '1706', '十堰市', '1', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1729', '1728', '茅箭区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1730', '1728', '张湾区', '2', null, null, '2022-08-11 16:33:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1731', '1728', '郧阳区', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1732', '1728', '郧西县', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1733', '1728', '竹山县', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1734', '1728', '竹溪县', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1735', '1728', '房县', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1736', '1728', '丹江口市', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1737', '1706', '宜昌市', '1', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1738', '1737', '西陵区', '2', null, null, '2022-08-11 16:33:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1739', '1737', '伍家岗区', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1740', '1737', '点军区', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1741', '1737', '猇亭区', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1742', '1737', '夷陵区', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1743', '1737', '远安县', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1744', '1737', '兴山县', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1745', '1737', '秭归县', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1746', '1737', '长阳土家族自治县', '2', null, null, '2022-08-11 16:33:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1747', '1737', '五峰土家族自治县', '2', null, null, '2022-08-11 16:33:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1748', '1737', '宜都市', '2', null, null, '2022-08-11 16:33:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1749', '1737', '当阳市', '2', null, null, '2022-08-11 16:33:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1750', '1737', '枝江市', '2', null, null, '2022-08-11 16:33:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1751', '1706', '襄阳市', '1', null, null, '2022-08-11 16:33:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1752', '1751', '襄城区', '2', null, null, '2022-08-11 16:33:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1753', '1751', '樊城区', '2', null, null, '2022-08-11 16:33:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1754', '1751', '襄州区', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1755', '1751', '南漳县', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1756', '1751', '谷城县', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1757', '1751', '保康县', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1758', '1751', '老河口市', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1759', '1751', '枣阳市', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1760', '1751', '宜城市', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1761', '1706', '鄂州市', '1', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1762', '1761', '梁子湖区', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1763', '1761', '华容区', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1764', '1761', '鄂城区', '2', null, null, '2022-08-11 16:33:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1765', '1706', '荆门市', '1', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1766', '1765', '东宝区', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1767', '1765', '掇刀区', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1768', '1765', '沙洋县', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1769', '1765', '钟祥市', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1770', '1765', '京山市', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1771', '1706', '孝感市', '1', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1772', '1771', '孝南区', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1773', '1771', '孝昌县', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1774', '1771', '大悟县', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1775', '1771', '云梦县', '2', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1776', '1771', '应城市', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1777', '1771', '安陆市', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1778', '1771', '汉川市', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1779', '1706', '荆州市', '1', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1780', '1779', '沙市区', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1781', '1779', '荆州区', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1782', '1779', '公安县', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1783', '1779', '江陵县', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1784', '1779', '石首市', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1785', '1779', '洪湖市', '2', null, null, '2022-08-11 16:33:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1786', '1779', '松滋市', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1787', '1779', '监利市', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1788', '1706', '黄冈市', '1', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1789', '1788', '黄州区', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1790', '1788', '团风县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1791', '1788', '红安县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1792', '1788', '罗田县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1793', '1788', '英山县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1794', '1788', '浠水县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1795', '1788', '蕲春县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1796', '1788', '黄梅县', '2', null, null, '2022-08-11 16:33:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1797', '1788', '麻城市', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1798', '1788', '武穴市', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1799', '1706', '咸宁市', '1', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1800', '1799', '咸安区', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1801', '1799', '嘉鱼县', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1802', '1799', '通城县', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1803', '1799', '崇阳县', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1804', '1799', '通山县', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1805', '1799', '赤壁市', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1806', '1706', '随州市', '1', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1807', '1806', '曾都区', '2', null, null, '2022-08-11 16:33:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1808', '1806', '随县', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1809', '1806', '广水市', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1810', '1706', '恩施土家族苗族自治州', '1', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1811', '1810', '恩施市', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1812', '1810', '利川市', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1813', '1810', '建始县', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1814', '1810', '巴东县', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1815', '1810', '宣恩县', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1816', '1810', '咸丰县', '2', null, null, '2022-08-11 16:33:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1817', '1810', '来凤县', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1818', '1810', '鹤峰县', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1819', null, '湖南省', '0', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1820', '1819', '长沙市', '1', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1821', '1820', '芙蓉区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1822', '1820', '天心区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1823', '1820', '岳麓区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1824', '1820', '开福区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1825', '1820', '雨花区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1826', '1820', '望城区', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1827', '1820', '长沙县', '2', null, null, '2022-08-11 16:33:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1828', '1820', '浏阳市', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1829', '1820', '宁乡市', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1830', '1819', '株洲市', '1', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1831', '1830', '荷塘区', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1832', '1830', '芦淞区', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1833', '1830', '石峰区', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1834', '1830', '天元区', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1835', '1830', '渌口区', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1836', '1830', '攸县', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1837', '1830', '茶陵县', '2', null, null, '2022-08-11 16:33:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1838', '1830', '炎陵县', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1839', '1830', '醴陵市', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1840', '1819', '湘潭市', '1', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1841', '1840', '雨湖区', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1842', '1840', '岳塘区', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1843', '1840', '湘潭县', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1844', '1840', '湘乡市', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1845', '1840', '韶山市', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1846', '1819', '衡阳市', '1', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1847', '1846', '珠晖区', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1848', '1846', '雁峰区', '2', null, null, '2022-08-11 16:33:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1849', '1846', '石鼓区', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1850', '1846', '蒸湘区', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1851', '1846', '南岳区', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1852', '1846', '衡阳县', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1853', '1846', '衡南县', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1854', '1846', '衡山县', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1855', '1846', '衡东县', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1856', '1846', '祁东县', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1857', '1846', '耒阳市', '2', null, null, '2022-08-11 16:33:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1858', '1846', '常宁市', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1859', '1819', '邵阳市', '1', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1860', '1859', '双清区', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1861', '1859', '大祥区', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1862', '1859', '北塔区', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1863', '1859', '新邵县', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1864', '1859', '邵阳县', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1865', '1859', '隆回县', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1866', '1859', '洞口县', '2', null, null, '2022-08-11 16:33:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1867', '1859', '绥宁县', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1868', '1859', '新宁县', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1869', '1859', '城步苗族自治县', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1870', '1859', '武冈市', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1871', '1859', '邵东市', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1872', '1819', '岳阳市', '1', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1873', '1872', '岳阳楼区', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1874', '1872', '云溪区', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1875', '1872', '君山区', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1876', '1872', '岳阳县', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1877', '1872', '华容县', '2', null, null, '2022-08-11 16:33:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1878', '1872', '湘阴县', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1879', '1872', '平江县', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1880', '1872', '汨罗市', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1881', '1872', '临湘市', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1882', '1819', '常德市', '1', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1883', '1882', '武陵区', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1884', '1882', '鼎城区', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1885', '1882', '安乡县', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1886', '1882', '汉寿县', '2', null, null, '2022-08-11 16:33:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1887', '1882', '澧县', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1888', '1882', '临澧县', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1889', '1882', '桃源县', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1890', '1882', '石门县', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1891', '1882', '津市市', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1892', '1819', '张家界市', '1', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1893', '1892', '永定区', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1894', '1892', '武陵源区', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1895', '1892', '慈利县', '2', null, null, '2022-08-11 16:33:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1896', '1892', '桑植县', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1897', '1819', '益阳市', '1', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1898', '1897', '资阳区', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1899', '1897', '赫山区', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1900', '1897', '南县', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1901', '1897', '桃江县', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1902', '1897', '安化县', '2', null, null, '2022-08-11 16:33:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1903', '1897', '沅江市', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1904', '1819', '郴州市', '1', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1905', '1904', '北湖区', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1906', '1904', '苏仙区', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1907', '1904', '桂阳县', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1908', '1904', '宜章县', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1909', '1904', '永兴县', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1910', '1904', '嘉禾县', '2', null, null, '2022-08-11 16:33:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1911', '1904', '临武县', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1912', '1904', '汝城县', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1913', '1904', '桂东县', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1914', '1904', '安仁县', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1915', '1904', '资兴市', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1916', '1819', '永州市', '1', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1917', '1916', '零陵区', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1918', '1916', '冷水滩区', '2', null, null, '2022-08-11 16:33:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1919', '1916', '祁阳县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1920', '1916', '东安县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1921', '1916', '双牌县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1922', '1916', '道县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1923', '1916', '江永县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1924', '1916', '宁远县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1925', '1916', '蓝山县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1926', '1916', '新田县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1927', '1916', '江华瑶族自治县', '2', null, null, '2022-08-11 16:33:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1928', '1819', '怀化市', '1', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1929', '1928', '鹤城区', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1930', '1928', '中方县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1931', '1928', '沅陵县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1932', '1928', '辰溪县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1933', '1928', '溆浦县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1934', '1928', '会同县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1935', '1928', '麻阳苗族自治县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1936', '1928', '新晃侗族自治县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1937', '1928', '芷江侗族自治县', '2', null, null, '2022-08-11 16:33:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1938', '1928', '靖州苗族侗族自治县', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1939', '1928', '通道侗族自治县', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1940', '1928', '洪江市', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1941', '1819', '娄底市', '1', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1942', '1941', '娄星区', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1943', '1941', '双峰县', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1944', '1941', '新化县', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1945', '1941', '冷水江市', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1946', '1941', '涟源市', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1947', '1819', '湘西土家族苗族自治州', '1', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1948', '1947', '吉首市', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1949', '1947', '泸溪县', '2', null, null, '2022-08-11 16:33:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1950', '1947', '凤凰县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1951', '1947', '花垣县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1952', '1947', '保靖县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1953', '1947', '古丈县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1954', '1947', '永顺县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1955', '1947', '龙山县', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1956', null, '广东省', '0', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1957', '1956', '广州市', '1', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1958', '1957', '荔湾区', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1959', '1957', '越秀区', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1960', '1957', '海珠区', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1961', '1957', '天河区', '2', null, null, '2022-08-11 16:33:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1962', '1957', '白云区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1963', '1957', '黄埔区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1964', '1957', '番禺区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1965', '1957', '花都区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1966', '1957', '南沙区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1967', '1957', '从化区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1968', '1957', '增城区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1969', '1956', '韶关市', '1', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1970', '1969', '武江区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1971', '1969', '浈江区', '2', null, null, '2022-08-11 16:33:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1972', '1969', '曲江区', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1973', '1969', '始兴县', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1974', '1969', '仁化县', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1975', '1969', '翁源县', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1976', '1969', '乳源瑶族自治县', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1977', '1969', '新丰县', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1978', '1969', '乐昌市', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1979', '1969', '南雄市', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1980', '1956', '深圳市', '1', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1981', '1980', '罗湖区', '2', null, null, '2022-08-11 16:33:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1982', '1980', '福田区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1983', '1980', '南山区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1984', '1980', '宝安区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1985', '1980', '龙岗区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1986', '1980', '盐田区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1987', '1980', '龙华区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1988', '1980', '坪山区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1989', '1980', '光明区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1990', '1956', '珠海市', '1', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1991', '1990', '香洲区', '2', null, null, '2022-08-11 16:33:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1992', '1990', '斗门区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1993', '1990', '金湾区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1994', '1956', '汕头市', '1', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1995', '1994', '龙湖区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1996', '1994', '金平区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1997', '1994', '濠江区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1998', '1994', '潮阳区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('1999', '1994', '潮南区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2000', '1994', '澄海区', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2001', '1994', '南澳县', '2', null, null, '2022-08-11 16:33:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2002', '1956', '佛山市', '1', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2003', '2002', '禅城区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2004', '2002', '南海区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2005', '2002', '顺德区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2006', '2002', '三水区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2007', '2002', '高明区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2008', '1956', '江门市', '1', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2009', '2008', '蓬江区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2010', '2008', '江海区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2011', '2008', '新会区', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2012', '2008', '台山市', '2', null, null, '2022-08-11 16:33:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2013', '2008', '开平市', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2014', '2008', '鹤山市', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2015', '2008', '恩平市', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2016', '1956', '湛江市', '1', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2017', '2016', '赤坎区', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2018', '2016', '霞山区', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2019', '2016', '坡头区', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2020', '2016', '麻章区', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2021', '2016', '遂溪县', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2022', '2016', '徐闻县', '2', null, null, '2022-08-11 16:33:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2023', '2016', '廉江市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2024', '2016', '雷州市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2025', '2016', '吴川市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2026', '1956', '茂名市', '1', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2027', '2026', '茂南区', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2028', '2026', '电白区', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2029', '2026', '高州市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2030', '2026', '化州市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2031', '2026', '信宜市', '2', null, null, '2022-08-11 16:33:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2032', '1956', '肇庆市', '1', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2033', '2032', '端州区', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2034', '2032', '鼎湖区', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2035', '2032', '高要区', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2036', '2032', '广宁县', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2037', '2032', '怀集县', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2038', '2032', '封开县', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2039', '2032', '德庆县', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2040', '2032', '四会市', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2041', '1956', '惠州市', '1', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2042', '2041', '惠城区', '2', null, null, '2022-08-11 16:33:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2043', '2041', '惠阳区', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2044', '2041', '博罗县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2045', '2041', '惠东县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2046', '2041', '龙门县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2047', '1956', '梅州市', '1', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2048', '2047', '梅江区', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2049', '2047', '梅县区', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2050', '2047', '大埔县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2051', '2047', '丰顺县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2052', '2047', '五华县', '2', null, null, '2022-08-11 16:33:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2053', '2047', '平远县', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2054', '2047', '蕉岭县', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2055', '2047', '兴宁市', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2056', '1956', '汕尾市', '1', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2057', '2056', '城区', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2058', '2056', '海丰县', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2059', '2056', '陆河县', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2060', '2056', '陆丰市', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2061', '1956', '河源市', '1', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2062', '2061', '源城区', '2', null, null, '2022-08-11 16:33:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2063', '2061', '紫金县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2064', '2061', '龙川县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2065', '2061', '连平县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2066', '2061', '和平县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2067', '2061', '东源县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2068', '1956', '阳江市', '1', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2069', '2068', '江城区', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2070', '2068', '阳东区', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2071', '2068', '阳西县', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2072', '2068', '阳春市', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2073', '1956', '清远市', '1', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2074', '2073', '清城区', '2', null, null, '2022-08-11 16:33:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2075', '2073', '清新区', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2076', '2073', '佛冈县', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2077', '2073', '阳山县', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2078', '2073', '连山壮族瑶族自治县', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2079', '2073', '连南瑶族自治县', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2080', '2073', '英德市', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2081', '2073', '连州市', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2082', '1956', '潮州市', '1', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2083', '2082', '湘桥区', '2', null, null, '2022-08-11 16:33:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2084', '2082', '潮安区', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2085', '2082', '饶平县', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2086', '1956', '揭阳市', '1', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2087', '2086', '榕城区', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2088', '2086', '揭东区', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2089', '2086', '揭西县', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2090', '2086', '惠来县', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2091', '2086', '普宁市', '2', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2092', '1956', '云浮市', '1', null, null, '2022-08-11 16:33:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2093', '2092', '云城区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2094', '2092', '云安区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2095', '2092', '新兴县', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2096', '2092', '郁南县', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2097', '2092', '罗定市', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2098', null, '广西壮族自治区', '0', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2099', '2098', '南宁市', '1', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2100', '2099', '兴宁区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2101', '2099', '青秀区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2102', '2099', '江南区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2103', '2099', '西乡塘区', '2', null, null, '2022-08-11 16:33:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2104', '2099', '良庆区', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2105', '2099', '邕宁区', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2106', '2099', '武鸣区', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2107', '2099', '隆安县', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2108', '2099', '马山县', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2109', '2099', '上林县', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2110', '2099', '宾阳县', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2111', '2099', '横县', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2112', '2098', '柳州市', '1', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2113', '2112', '城中区', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2114', '2112', '鱼峰区', '2', null, null, '2022-08-11 16:33:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2115', '2112', '柳南区', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2116', '2112', '柳北区', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2117', '2112', '柳江区', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2118', '2112', '柳城县', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2119', '2112', '鹿寨县', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2120', '2112', '融安县', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2121', '2112', '融水苗族自治县', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2122', '2112', '三江侗族自治县', '2', null, null, '2022-08-11 16:33:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2123', '2098', '桂林市', '1', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2124', '2123', '秀峰区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2125', '2123', '叠彩区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2126', '2123', '象山区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2127', '2123', '七星区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2128', '2123', '雁山区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2129', '2123', '临桂区', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2130', '2123', '阳朔县', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2131', '2123', '灵川县', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2132', '2123', '全州县', '2', null, null, '2022-08-11 16:33:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2133', '2123', '兴安县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2134', '2123', '永福县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2135', '2123', '灌阳县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2136', '2123', '龙胜各族自治县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2137', '2123', '资源县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2138', '2123', '平乐县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2139', '2123', '恭城瑶族自治县', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2140', '2123', '荔浦市', '2', null, null, '2022-08-11 16:33:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2141', '2098', '梧州市', '1', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2142', '2141', '万秀区', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2143', '2141', '长洲区', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2144', '2141', '龙圩区', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2145', '2141', '苍梧县', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2146', '2141', '藤县', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2147', '2141', '蒙山县', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2148', '2141', '岑溪市', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2149', '2098', '北海市', '1', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2150', '2149', '海城区', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2151', '2149', '银海区', '2', null, null, '2022-08-11 16:33:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2152', '2149', '铁山港区', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2153', '2149', '合浦县', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2154', '2098', '防城港市', '1', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2155', '2154', '港口区', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2156', '2154', '防城区', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2157', '2154', '上思县', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2158', '2154', '东兴市', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2159', '2098', '钦州市', '1', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2160', '2159', '钦南区', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2161', '2159', '钦北区', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2162', '2159', '灵山县', '2', null, null, '2022-08-11 16:33:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2163', '2159', '浦北县', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2164', '2098', '贵港市', '1', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2165', '2164', '港北区', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2166', '2164', '港南区', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2167', '2164', '覃塘区', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2168', '2164', '平南县', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2169', '2164', '桂平市', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2170', '2098', '玉林市', '1', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2171', '2170', '玉州区', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2172', '2170', '福绵区', '2', null, null, '2022-08-11 16:33:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2173', '2170', '容县', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2174', '2170', '陆川县', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2175', '2170', '博白县', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2176', '2170', '兴业县', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2177', '2170', '北流市', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2178', '2098', '百色市', '1', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2179', '2178', '右江区', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2180', '2178', '田阳区', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2181', '2178', '田东县', '2', null, null, '2022-08-11 16:33:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2182', '2178', '德保县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2183', '2178', '那坡县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2184', '2178', '凌云县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2185', '2178', '乐业县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2186', '2178', '田林县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2187', '2178', '西林县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2188', '2178', '隆林各族自治县', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2189', '2178', '靖西市', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2190', '2178', '平果市', '2', null, null, '2022-08-11 16:33:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2191', '2098', '贺州市', '1', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2192', '2191', '八步区', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2193', '2191', '平桂区', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2194', '2191', '昭平县', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2195', '2191', '钟山县', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2196', '2191', '富川瑶族自治县', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2197', '2098', '河池市', '1', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2198', '2197', '金城江区', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2199', '2197', '宜州区', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2200', '2197', '南丹县', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2201', '2197', '天峨县', '2', null, null, '2022-08-11 16:33:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2202', '2197', '凤山县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2203', '2197', '东兰县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2204', '2197', '罗城仫佬族自治县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2205', '2197', '环江毛南族自治县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2206', '2197', '巴马瑶族自治县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2207', '2197', '都安瑶族自治县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2208', '2197', '大化瑶族自治县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2209', '2098', '来宾市', '1', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2210', '2209', '兴宾区', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2211', '2209', '忻城县', '2', null, null, '2022-08-11 16:33:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2212', '2209', '象州县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2213', '2209', '武宣县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2214', '2209', '金秀瑶族自治县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2215', '2209', '合山市', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2216', '2098', '崇左市', '1', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2217', '2216', '江州区', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2218', '2216', '扶绥县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2219', '2216', '宁明县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2220', '2216', '龙州县', '2', null, null, '2022-08-11 16:34:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2221', '2216', '大新县', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2222', '2216', '天等县', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2223', '2216', '凭祥市', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2224', null, '海南省', '0', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2225', '2224', '海口市', '1', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2226', '2225', '秀英区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2227', '2225', '龙华区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2228', '2225', '琼山区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2229', '2225', '美兰区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2230', '2224', '三亚市', '1', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2231', '2230', '海棠区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2232', '2230', '吉阳区', '2', null, null, '2022-08-11 16:34:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2233', '2230', '天涯区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2234', '2230', '崖州区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2235', '2224', '三沙市', '1', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2236', '2235', '西沙区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2237', '2235', '南沙区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2238', null, '四川省', '0', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2239', '2238', '成都市', '1', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2240', '2239', '锦江区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2241', '2239', '青羊区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2242', '2239', '金牛区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2243', '2239', '武侯区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2244', '2239', '成华区', '2', null, null, '2022-08-11 16:34:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2245', '2239', '龙泉驿区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2246', '2239', '青白江区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2247', '2239', '新都区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2248', '2239', '温江区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2249', '2239', '双流区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2250', '2239', '郫都区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2251', '2239', '新津区', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2252', '2239', '金堂县', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2253', '2239', '大邑县', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2254', '2239', '蒲江县', '2', null, null, '2022-08-11 16:34:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2255', '2239', '都江堰市', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2256', '2239', '彭州市', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2257', '2239', '邛崃市', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2258', '2239', '崇州市', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2259', '2239', '简阳市', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2260', '2238', '自贡市', '1', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2261', '2260', '自流井区', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2262', '2260', '贡井区', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2263', '2260', '大安区', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2264', '2260', '沿滩区', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2265', '2260', '荣县', '2', null, null, '2022-08-11 16:34:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2266', '2260', '富顺县', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2267', '2238', '攀枝花市', '1', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2268', '2267', '东区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2269', '2267', '西区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2270', '2267', '仁和区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2271', '2267', '米易县', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2272', '2267', '盐边县', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2273', '2238', '泸州市', '1', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2274', '2273', '江阳区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2275', '2273', '纳溪区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2276', '2273', '龙马潭区', '2', null, null, '2022-08-11 16:34:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2277', '2273', '泸县', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2278', '2273', '合江县', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2279', '2273', '叙永县', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2280', '2273', '古蔺县', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2281', '2238', '德阳市', '1', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2282', '2281', '旌阳区', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2283', '2281', '罗江区', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2284', '2281', '中江县', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2285', '2281', '广汉市', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2286', '2281', '什邡市', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2287', '2281', '绵竹市', '2', null, null, '2022-08-11 16:34:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2288', '2238', '绵阳市', '1', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2289', '2288', '涪城区', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2290', '2288', '游仙区', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2291', '2288', '安州区', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2292', '2288', '三台县', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2293', '2288', '盐亭县', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2294', '2288', '梓潼县', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2295', '2288', '北川羌族自治县', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2296', '2288', '平武县', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2297', '2288', '江油市', '2', null, null, '2022-08-11 16:34:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2298', '2238', '广元市', '1', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2299', '2298', '利州区', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2300', '2298', '昭化区', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2301', '2298', '朝天区', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2302', '2298', '旺苍县', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2303', '2298', '青川县', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2304', '2298', '剑阁县', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2305', '2298', '苍溪县', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2306', '2238', '遂宁市', '1', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2307', '2306', '船山区', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2308', '2306', '安居区', '2', null, null, '2022-08-11 16:34:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2309', '2306', '蓬溪县', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2310', '2306', '大英县', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2311', '2306', '射洪市', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2312', '2238', '内江市', '1', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2313', '2312', '市中区', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2314', '2312', '东兴区', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2315', '2312', '威远县', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2316', '2312', '资中县', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2317', '2312', '隆昌市', '2', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2318', '2238', '乐山市', '1', null, null, '2022-08-11 16:34:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2319', '2318', '市中区', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2320', '2318', '沙湾区', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2321', '2318', '五通桥区', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2322', '2318', '金口河区', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2323', '2318', '犍为县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2324', '2318', '井研县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2325', '2318', '夹江县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2326', '2318', '沐川县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2327', '2318', '峨边彝族自治县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2328', '2318', '马边彝族自治县', '2', null, null, '2022-08-11 16:34:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2329', '2318', '峨眉山市', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2330', '2238', '南充市', '1', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2331', '2330', '顺庆区', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2332', '2330', '高坪区', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2333', '2330', '嘉陵区', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2334', '2330', '南部县', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2335', '2330', '营山县', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2336', '2330', '蓬安县', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2337', '2330', '仪陇县', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2338', '2330', '西充县', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2339', '2330', '阆中市', '2', null, null, '2022-08-11 16:34:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2340', '2238', '眉山市', '1', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2341', '2340', '东坡区', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2342', '2340', '彭山区', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2343', '2340', '仁寿县', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2344', '2340', '洪雅县', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2345', '2340', '丹棱县', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2346', '2340', '青神县', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2347', '2238', '宜宾市', '1', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2348', '2347', '翠屏区', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2349', '2347', '南溪区', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2350', '2347', '叙州区', '2', null, null, '2022-08-11 16:34:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2351', '2347', '江安县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2352', '2347', '长宁县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2353', '2347', '高县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2354', '2347', '珙县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2355', '2347', '筠连县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2356', '2347', '兴文县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2357', '2347', '屏山县', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2358', '2238', '广安市', '1', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2359', '2358', '广安区', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2360', '2358', '前锋区', '2', null, null, '2022-08-11 16:34:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2361', '2358', '岳池县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2362', '2358', '武胜县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2363', '2358', '邻水县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2364', '2358', '华蓥市', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2365', '2238', '达州市', '1', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2366', '2365', '通川区', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2367', '2365', '达川区', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2368', '2365', '宣汉县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2369', '2365', '开江县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2370', '2365', '大竹县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2371', '2365', '渠县', '2', null, null, '2022-08-11 16:34:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2372', '2365', '万源市', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2373', '2238', '雅安市', '1', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2374', '2373', '雨城区', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2375', '2373', '名山区', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2376', '2373', '荥经县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2377', '2373', '汉源县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2378', '2373', '石棉县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2379', '2373', '天全县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2380', '2373', '芦山县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2381', '2373', '宝兴县', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2382', '2238', '巴中市', '1', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2383', '2382', '巴州区', '2', null, null, '2022-08-11 16:34:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2384', '2382', '恩阳区', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2385', '2382', '通江县', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2386', '2382', '南江县', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2387', '2382', '平昌县', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2388', '2238', '资阳市', '1', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2389', '2388', '雁江区', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2390', '2388', '安岳县', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2391', '2388', '乐至县', '2', null, null, '2022-08-11 16:34:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2392', '2238', '阿坝藏族羌族自治州', '1', null, null, '2022-08-11 16:34:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2393', '2392', '马尔康市', '2', null, null, '2022-08-11 16:34:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2394', '2392', '汶川县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2395', '2392', '理县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2396', '2392', '茂县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2397', '2392', '松潘县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2398', '2392', '九寨沟县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2399', '2392', '金川县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2400', '2392', '小金县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2401', '2392', '黑水县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2402', '2392', '壤塘县', '2', null, null, '2022-08-11 16:34:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2403', '2392', '阿坝县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2404', '2392', '若尔盖县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2405', '2392', '红原县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2406', '2238', '甘孜藏族自治州', '1', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2407', '2406', '康定市', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2408', '2406', '泸定县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2409', '2406', '丹巴县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2410', '2406', '九龙县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2411', '2406', '雅江县', '2', null, null, '2022-08-11 16:34:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2412', '2406', '道孚县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2413', '2406', '炉霍县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2414', '2406', '甘孜县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2415', '2406', '新龙县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2416', '2406', '德格县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2417', '2406', '白玉县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2418', '2406', '石渠县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2419', '2406', '色达县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2420', '2406', '理塘县', '2', null, null, '2022-08-11 16:34:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2421', '2406', '巴塘县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2422', '2406', '乡城县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2423', '2406', '稻城县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2424', '2406', '得荣县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2425', '2238', '凉山彝族自治州', '1', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2426', '2425', '西昌市', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2427', '2425', '木里藏族自治县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2428', '2425', '盐源县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2429', '2425', '德昌县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2430', '2425', '会理县', '2', null, null, '2022-08-11 16:34:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2431', '2425', '会东县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2432', '2425', '宁南县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2433', '2425', '普格县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2434', '2425', '布拖县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2435', '2425', '金阳县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2436', '2425', '昭觉县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2437', '2425', '喜德县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2438', '2425', '冕宁县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2439', '2425', '越西县', '2', null, null, '2022-08-11 16:34:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2440', '2425', '甘洛县', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2441', '2425', '美姑县', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2442', '2425', '雷波县', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2443', null, '贵州省', '0', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2444', '2443', '贵阳市', '1', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2445', '2444', '南明区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2446', '2444', '云岩区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2447', '2444', '花溪区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2448', '2444', '乌当区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2449', '2444', '白云区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2450', '2444', '观山湖区', '2', null, null, '2022-08-11 16:34:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2451', '2444', '开阳县', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2452', '2444', '息烽县', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2453', '2444', '修文县', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2454', '2444', '清镇市', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2455', '2443', '六盘水市', '1', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2456', '2455', '钟山区', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2457', '2455', '六枝特区', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2458', '2455', '水城区', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2459', '2455', '盘州市', '2', null, null, '2022-08-11 16:34:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2460', '2443', '遵义市', '1', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2461', '2460', '红花岗区', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2462', '2460', '汇川区', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2463', '2460', '播州区', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2464', '2460', '桐梓县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2465', '2460', '绥阳县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2466', '2460', '正安县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2467', '2460', '道真仡佬族苗族自治县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2468', '2460', '务川仡佬族苗族自治县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2469', '2460', '凤冈县', '2', null, null, '2022-08-11 16:34:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2470', '2460', '湄潭县', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2471', '2460', '余庆县', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2472', '2460', '习水县', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2473', '2460', '赤水市', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2474', '2460', '仁怀市', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2475', '2443', '安顺市', '1', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2476', '2475', '西秀区', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2477', '2475', '平坝区', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2478', '2475', '普定县', '2', null, null, '2022-08-11 16:34:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2479', '2475', '镇宁布依族苗族自治县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2480', '2475', '关岭布依族苗族自治县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2481', '2475', '紫云苗族布依族自治县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2482', '2443', '毕节市', '1', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2483', '2482', '七星关区', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2484', '2482', '大方县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2485', '2482', '黔西县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2486', '2482', '金沙县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2487', '2482', '织金县', '2', null, null, '2022-08-11 16:34:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2488', '2482', '纳雍县', '2', null, null, '2022-08-11 16:34:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2489', '2482', '威宁彝族回族苗族自治县', '2', null, null, '2022-08-11 16:34:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2490', '2482', '赫章县', '2', null, null, '2022-08-11 16:34:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2491', '2443', '铜仁市', '1', null, null, '2022-08-11 16:34:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2492', '2491', '碧江区', '2', null, null, '2022-08-11 16:34:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2493', '2491', '万山区', '2', null, null, '2022-08-11 16:34:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2494', '2491', '江口县', '2', null, null, '2022-08-11 16:34:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2495', '2491', '玉屏侗族自治县', '2', null, null, '2022-08-11 16:34:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2496', '2491', '石阡县', '2', null, null, '2022-08-11 16:34:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2497', '2491', '思南县', '2', null, null, '2022-08-11 16:34:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2498', '2491', '印江土家族苗族自治县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2499', '2491', '德江县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2500', '2491', '沿河土家族自治县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2501', '2491', '松桃苗族自治县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2502', '2443', '黔西南布依族苗族自治州', '1', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2503', '2502', '兴义市', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2504', '2502', '兴仁市', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2505', '2502', '普安县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2506', '2502', '晴隆县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2507', '2502', '贞丰县', '2', null, null, '2022-08-11 16:34:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2508', '2502', '望谟县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2509', '2502', '册亨县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2510', '2502', '安龙县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2511', '2443', '黔东南苗族侗族自治州', '1', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2512', '2511', '凯里市', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2513', '2511', '黄平县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2514', '2511', '施秉县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2515', '2511', '三穗县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2516', '2511', '镇远县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2517', '2511', '岑巩县', '2', null, null, '2022-08-11 16:34:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2518', '2511', '天柱县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2519', '2511', '锦屏县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2520', '2511', '剑河县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2521', '2511', '台江县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2522', '2511', '黎平县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2523', '2511', '榕江县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2524', '2511', '从江县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2525', '2511', '雷山县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2526', '2511', '麻江县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2527', '2511', '丹寨县', '2', null, null, '2022-08-11 16:34:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2528', '2443', '黔南布依族苗族自治州', '1', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2529', '2528', '都匀市', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2530', '2528', '福泉市', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2531', '2528', '荔波县', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2532', '2528', '贵定县', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2533', '2528', '瓮安县', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2534', '2528', '独山县', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2535', '2528', '平塘县', '2', null, null, '2022-08-11 16:34:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2536', '2528', '罗甸县', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2537', '2528', '长顺县', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2538', '2528', '龙里县', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2539', '2528', '惠水县', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2540', '2528', '三都水族自治县', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2541', null, '云南省', '0', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2542', '2541', '昆明市', '1', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2543', '2542', '五华区', '2', null, null, '2022-08-11 16:34:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2544', '2542', '盘龙区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2545', '2542', '官渡区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2546', '2542', '西山区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2547', '2542', '东川区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2548', '2542', '呈贡区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2549', '2542', '晋宁区', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2550', '2542', '富民县', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2551', '2542', '宜良县', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2552', '2542', '石林彝族自治县', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2553', '2542', '嵩明县', '2', null, null, '2022-08-11 16:34:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2554', '2542', '禄劝彝族苗族自治县', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2555', '2542', '寻甸回族彝族自治县', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2556', '2542', '安宁市', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2557', '2541', '曲靖市', '1', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2558', '2557', '麒麟区', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2559', '2557', '沾益区', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2560', '2557', '马龙区', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2561', '2557', '陆良县', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2562', '2557', '师宗县', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2563', '2557', '罗平县', '2', null, null, '2022-08-11 16:34:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2564', '2557', '富源县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2565', '2557', '会泽县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2566', '2557', '宣威市', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2567', '2541', '玉溪市', '1', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2568', '2567', '红塔区', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2569', '2567', '江川区', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2570', '2567', '通海县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2571', '2567', '华宁县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2572', '2567', '易门县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2573', '2567', '峨山彝族自治县', '2', null, null, '2022-08-11 16:34:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2574', '2567', '新平彝族傣族自治县', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2575', '2567', '元江哈尼族彝族傣族自治县', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2576', '2567', '澄江市', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2577', '2541', '保山市', '1', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2578', '2577', '隆阳区', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2579', '2577', '施甸县', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2580', '2577', '龙陵县', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2581', '2577', '昌宁县', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2582', '2577', '腾冲市', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2583', '2541', '昭通市', '1', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2584', '2583', '昭阳区', '2', null, null, '2022-08-11 16:34:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2585', '2583', '鲁甸县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2586', '2583', '巧家县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2587', '2583', '盐津县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2588', '2583', '大关县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2589', '2583', '永善县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2590', '2583', '绥江县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2591', '2583', '镇雄县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2592', '2583', '彝良县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2593', '2583', '威信县', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2594', '2583', '水富市', '2', null, null, '2022-08-11 16:34:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2595', '2541', '丽江市', '1', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2596', '2595', '古城区', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2597', '2595', '玉龙纳西族自治县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2598', '2595', '永胜县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2599', '2595', '华坪县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2600', '2595', '宁蒗彝族自治县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2601', '2541', '普洱市', '1', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2602', '2601', '思茅区', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2603', '2601', '宁洱哈尼族彝族自治县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2604', '2601', '墨江哈尼族自治县', '2', null, null, '2022-08-11 16:34:40', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2605', '2601', '景东彝族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2606', '2601', '景谷傣族彝族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2607', '2601', '镇沅彝族哈尼族拉祜族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2608', '2601', '江城哈尼族彝族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2609', '2601', '孟连傣族拉祜族佤族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2610', '2601', '澜沧拉祜族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2611', '2601', '西盟佤族自治县', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2612', '2541', '临沧市', '1', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2613', '2612', '临翔区', '2', null, null, '2022-08-11 16:34:41', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2614', '2612', '凤庆县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2615', '2612', '云县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2616', '2612', '永德县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2617', '2612', '镇康县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2618', '2612', '双江拉祜族佤族布朗族傣族自治县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2619', '2612', '耿马傣族佤族自治县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2620', '2612', '沧源佤族自治县', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2621', '2541', '楚雄彝族自治州', '1', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2622', '2621', '楚雄市', '2', null, null, '2022-08-11 16:34:42', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2623', '2621', '双柏县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2624', '2621', '牟定县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2625', '2621', '南华县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2626', '2621', '姚安县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2627', '2621', '大姚县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2628', '2621', '永仁县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2629', '2621', '元谋县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2630', '2621', '武定县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2631', '2621', '禄丰县', '2', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2632', '2541', '红河哈尼族彝族自治州', '1', null, null, '2022-08-11 16:34:43', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2633', '2632', '个旧市', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2634', '2632', '开远市', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2635', '2632', '蒙自市', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2636', '2632', '弥勒市', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2637', '2632', '屏边苗族自治县', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2638', '2632', '建水县', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2639', '2632', '石屏县', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2640', '2632', '泸西县', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2641', '2632', '元阳县', '2', null, null, '2022-08-11 16:34:44', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2642', '2632', '红河县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2643', '2632', '金平苗族瑶族傣族自治县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2644', '2632', '绿春县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2645', '2632', '河口瑶族自治县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2646', '2541', '文山壮族苗族自治州', '1', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2647', '2646', '文山市', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2648', '2646', '砚山县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2649', '2646', '西畴县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2650', '2646', '麻栗坡县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2651', '2646', '马关县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2652', '2646', '丘北县', '2', null, null, '2022-08-11 16:34:45', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2653', '2646', '广南县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2654', '2646', '富宁县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2655', '2541', '西双版纳傣族自治州', '1', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2656', '2655', '景洪市', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2657', '2655', '勐海县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2658', '2655', '勐腊县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2659', '2541', '大理白族自治州', '1', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2660', '2659', '大理市', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2661', '2659', '漾濞彝族自治县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2662', '2659', '祥云县', '2', null, null, '2022-08-11 16:34:46', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2663', '2659', '宾川县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2664', '2659', '弥渡县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2665', '2659', '南涧彝族自治县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2666', '2659', '巍山彝族回族自治县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2667', '2659', '永平县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2668', '2659', '云龙县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2669', '2659', '洱源县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2670', '2659', '剑川县', '2', null, null, '2022-08-11 16:34:47', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2671', '2659', '鹤庆县', '2', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2672', '2541', '德宏傣族景颇族自治州', '1', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2673', '2672', '瑞丽市', '2', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2674', '2672', '芒市', '2', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2675', '2672', '梁河县', '2', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2676', '2672', '盈江县', '2', null, null, '2022-08-11 16:34:48', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2677', '2672', '陇川县', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2678', '2541', '怒江傈僳族自治州', '1', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2679', '2678', '泸水市', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2680', '2678', '福贡县', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2681', '2678', '贡山独龙族怒族自治县', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2682', '2678', '兰坪白族普米族自治县', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2683', '2541', '迪庆藏族自治州', '1', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2684', '2683', '香格里拉市', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2685', '2683', '德钦县', '2', null, null, '2022-08-11 16:34:49', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2686', '2683', '维西傈僳族自治县', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2687', null, '西藏自治区', '0', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2688', '2687', '拉萨市', '1', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2689', '2688', '城关区', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2690', '2688', '堆龙德庆区', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2691', '2688', '达孜区', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2692', '2688', '林周县', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2693', '2688', '当雄县', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2694', '2688', '尼木县', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2695', '2688', '曲水县', '2', null, null, '2022-08-11 16:34:50', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2696', '2688', '墨竹工卡县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2697', '2687', '日喀则市', '1', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2698', '2697', '桑珠孜区', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2699', '2697', '南木林县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2700', '2697', '江孜县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2701', '2697', '定日县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2702', '2697', '萨迦县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2703', '2697', '拉孜县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2704', '2697', '昂仁县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2705', '2697', '谢通门县', '2', null, null, '2022-08-11 16:34:51', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2706', '2697', '白朗县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2707', '2697', '仁布县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2708', '2697', '康马县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2709', '2697', '定结县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2710', '2697', '仲巴县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2711', '2697', '亚东县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2712', '2697', '吉隆县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2713', '2697', '聂拉木县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2714', '2697', '萨嘎县', '2', null, null, '2022-08-11 16:34:52', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2715', '2697', '岗巴县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2716', '2687', '昌都市', '1', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2717', '2716', '卡若区', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2718', '2716', '江达县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2719', '2716', '贡觉县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2720', '2716', '类乌齐县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2721', '2716', '丁青县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2722', '2716', '察雅县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2723', '2716', '八宿县', '2', null, null, '2022-08-11 16:34:53', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2724', '2716', '左贡县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2725', '2716', '芒康县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2726', '2716', '洛隆县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2727', '2716', '边坝县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2728', '2687', '林芝市', '1', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2729', '2728', '巴宜区', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2730', '2728', '工布江达县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2731', '2728', '米林县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2732', '2728', '墨脱县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2733', '2728', '波密县', '2', null, null, '2022-08-11 16:34:54', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2734', '2728', '察隅县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2735', '2728', '朗县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2736', '2687', '山南市', '1', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2737', '2736', '乃东区', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2738', '2736', '扎囊县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2739', '2736', '贡嘎县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2740', '2736', '桑日县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2741', '2736', '琼结县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2742', '2736', '曲松县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2743', '2736', '措美县', '2', null, null, '2022-08-11 16:34:55', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2744', '2736', '洛扎县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2745', '2736', '加查县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2746', '2736', '隆子县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2747', '2736', '错那县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2748', '2736', '浪卡子县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2749', '2687', '那曲市', '1', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2750', '2749', '色尼区', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2751', '2749', '嘉黎县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2752', '2749', '比如县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2753', '2749', '聂荣县', '2', null, null, '2022-08-11 16:34:56', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2754', '2749', '安多县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2755', '2749', '申扎县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2756', '2749', '索县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2757', '2749', '班戈县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2758', '2749', '巴青县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2759', '2749', '尼玛县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2760', '2749', '双湖县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2761', '2687', '阿里地区', '1', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2762', '2761', '普兰县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2763', '2761', '札达县', '2', null, null, '2022-08-11 16:34:57', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2764', '2761', '噶尔县', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2765', '2761', '日土县', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2766', '2761', '革吉县', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2767', '2761', '改则县', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2768', '2761', '措勤县', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2769', null, '陕西省', '0', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2770', '2769', '西安市', '1', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2771', '2770', '新城区', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2772', '2770', '碑林区', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2773', '2770', '莲湖区', '2', null, null, '2022-08-11 16:34:58', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2774', '2770', '灞桥区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2775', '2770', '未央区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2776', '2770', '雁塔区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2777', '2770', '阎良区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2778', '2770', '临潼区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2779', '2770', '长安区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2780', '2770', '高陵区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2781', '2770', '鄠邑区', '2', null, null, '2022-08-11 16:34:59', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2782', '2770', '蓝田县', '2', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2783', '2770', '周至县', '2', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2784', '2769', '铜川市', '1', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2785', '2784', '王益区', '2', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2786', '2784', '印台区', '2', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2787', '2784', '耀州区', '2', null, null, '2022-08-11 16:35:00', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2788', '2784', '宜君县', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2789', '2769', '宝鸡市', '1', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2790', '2789', '渭滨区', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2791', '2789', '金台区', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2792', '2789', '陈仓区', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2793', '2789', '凤翔县', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2794', '2789', '岐山县', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2795', '2789', '扶风县', '2', null, null, '2022-08-11 16:35:01', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2796', '2789', '眉县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2797', '2789', '陇县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2798', '2789', '千阳县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2799', '2789', '麟游县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2800', '2789', '凤县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2801', '2789', '太白县', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2802', '2769', '咸阳市', '1', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2803', '2802', '秦都区', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2804', '2802', '杨陵区', '2', null, null, '2022-08-11 16:35:02', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2805', '2802', '渭城区', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2806', '2802', '三原县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2807', '2802', '泾阳县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2808', '2802', '乾县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2809', '2802', '礼泉县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2810', '2802', '永寿县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2811', '2802', '长武县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2812', '2802', '旬邑县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2813', '2802', '淳化县', '2', null, null, '2022-08-11 16:35:03', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2814', '2802', '武功县', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2815', '2802', '兴平市', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2816', '2802', '彬州市', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2817', '2769', '渭南市', '1', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2818', '2817', '临渭区', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2819', '2817', '华州区', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2820', '2817', '潼关县', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2821', '2817', '大荔县', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2822', '2817', '合阳县', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2823', '2817', '澄城县', '2', null, null, '2022-08-11 16:35:04', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2824', '2817', '蒲城县', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2825', '2817', '白水县', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2826', '2817', '富平县', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2827', '2817', '韩城市', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2828', '2817', '华阴市', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2829', '2769', '延安市', '1', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2830', '2829', '宝塔区', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2831', '2829', '安塞区', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2832', '2829', '延长县', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2833', '2829', '延川县', '2', null, null, '2022-08-11 16:35:05', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2834', '2829', '志丹县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2835', '2829', '吴起县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2836', '2829', '甘泉县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2837', '2829', '富县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2838', '2829', '洛川县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2839', '2829', '宜川县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2840', '2829', '黄龙县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2841', '2829', '黄陵县', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2842', '2829', '子长市', '2', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2843', '2769', '汉中市', '1', null, null, '2022-08-11 16:35:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2844', '2843', '汉台区', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2845', '2843', '南郑区', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2846', '2843', '城固县', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2847', '2843', '洋县', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2848', '2843', '西乡县', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2849', '2843', '勉县', '2', null, null, '2022-08-11 16:35:07', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2850', '2843', '宁强县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2851', '2843', '略阳县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2852', '2843', '镇巴县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2853', '2843', '留坝县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2854', '2843', '佛坪县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2855', '2769', '榆林市', '1', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2856', '2855', '榆阳区', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2857', '2855', '横山区', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2858', '2855', '府谷县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2859', '2855', '靖边县', '2', null, null, '2022-08-11 16:35:08', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2860', '2855', '定边县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2861', '2855', '绥德县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2862', '2855', '米脂县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2863', '2855', '佳县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2864', '2855', '吴堡县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2865', '2855', '清涧县', '2', null, null, '2022-08-11 16:35:09', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2866', '2855', '子洲县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2867', '2855', '神木市', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2868', '2769', '安康市', '1', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2869', '2868', '汉滨区', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2870', '2868', '汉阴县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2871', '2868', '石泉县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2872', '2868', '宁陕县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2873', '2868', '紫阳县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2874', '2868', '岚皋县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2875', '2868', '平利县', '2', null, null, '2022-08-11 16:35:10', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2876', '2868', '镇坪县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2877', '2868', '旬阳县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2878', '2868', '白河县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2879', '2769', '商洛市', '1', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2880', '2879', '商州区', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2881', '2879', '洛南县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2882', '2879', '丹凤县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2883', '2879', '商南县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2884', '2879', '山阳县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2885', '2879', '镇安县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2886', '2879', '柞水县', '2', null, null, '2022-08-11 16:35:11', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2887', null, '甘肃省', '0', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2888', '2887', '兰州市', '1', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2889', '2888', '城关区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2890', '2888', '七里河区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2891', '2888', '西固区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2892', '2888', '安宁区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2893', '2888', '红古区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2894', '2888', '永登县', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2895', '2888', '皋兰县', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2896', '2888', '榆中县', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2897', '2887', '金昌市', '1', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2898', '2897', '金川区', '2', null, null, '2022-08-11 16:35:12', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2899', '2897', '永昌县', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2900', '2887', '白银市', '1', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2901', '2900', '白银区', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2902', '2900', '平川区', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2903', '2900', '靖远县', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2904', '2900', '会宁县', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2905', '2900', '景泰县', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2906', '2887', '天水市', '1', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2907', '2906', '秦州区', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2908', '2906', '麦积区', '2', null, null, '2022-08-11 16:35:13', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2909', '2906', '清水县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2910', '2906', '秦安县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2911', '2906', '甘谷县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2912', '2906', '武山县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2913', '2906', '张家川回族自治县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2914', '2887', '武威市', '1', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2915', '2914', '凉州区', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2916', '2914', '民勤县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2917', '2914', '古浪县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2918', '2914', '天祝藏族自治县', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2919', '2887', '张掖市', '1', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2920', '2919', '甘州区', '2', null, null, '2022-08-11 16:35:14', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2921', '2919', '肃南裕固族自治县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2922', '2919', '民乐县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2923', '2919', '临泽县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2924', '2919', '高台县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2925', '2919', '山丹县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2926', '2887', '平凉市', '1', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2927', '2926', '崆峒区', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2928', '2926', '泾川县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2929', '2926', '灵台县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2930', '2926', '崇信县', '2', null, null, '2022-08-11 16:35:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2931', '2926', '庄浪县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2932', '2926', '静宁县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2933', '2926', '华亭市', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2934', '2887', '酒泉市', '1', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2935', '2934', '肃州区', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2936', '2934', '金塔县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2937', '2934', '瓜州县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2938', '2934', '肃北蒙古族自治县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2939', '2934', '阿克塞哈萨克族自治县', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2940', '2934', '玉门市', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2941', '2934', '敦煌市', '2', null, null, '2022-08-11 16:35:16', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2942', '2887', '庆阳市', '1', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2943', '2942', '西峰区', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2944', '2942', '庆城县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2945', '2942', '环县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2946', '2942', '华池县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2947', '2942', '合水县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2948', '2942', '正宁县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2949', '2942', '宁县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2950', '2942', '镇原县', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2951', '2887', '定西市', '1', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2952', '2951', '安定区', '2', null, null, '2022-08-11 16:35:17', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2953', '2951', '通渭县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2954', '2951', '陇西县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2955', '2951', '渭源县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2956', '2951', '临洮县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2957', '2951', '漳县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2958', '2951', '岷县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2959', '2887', '陇南市', '1', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2960', '2959', '武都区', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2961', '2959', '成县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2962', '2959', '文县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2963', '2959', '宕昌县', '2', null, null, '2022-08-11 16:35:18', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2964', '2959', '康县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2965', '2959', '西和县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2966', '2959', '礼县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2967', '2959', '徽县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2968', '2959', '两当县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2969', '2887', '临夏回族自治州', '1', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2970', '2969', '临夏市', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2971', '2969', '临夏县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2972', '2969', '康乐县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2973', '2969', '永靖县', '2', null, null, '2022-08-11 16:35:19', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2974', '2969', '广河县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2975', '2969', '和政县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2976', '2969', '东乡族自治县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2977', '2969', '积石山保安族东乡族撒拉族自治县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2978', '2887', '甘南藏族自治州', '1', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2979', '2978', '合作市', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2980', '2978', '临潭县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2981', '2978', '卓尼县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2982', '2978', '舟曲县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2983', '2978', '迭部县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2984', '2978', '玛曲县', '2', null, null, '2022-08-11 16:35:20', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2985', '2978', '碌曲县', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2986', '2978', '夏河县', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2987', null, '青海省', '0', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2988', '2987', '西宁市', '1', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2989', '2988', '城东区', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2990', '2988', '城中区', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2991', '2988', '城西区', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2992', '2988', '城北区', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2993', '2988', '湟中区', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2994', '2988', '大通回族土族自治县', '2', null, null, '2022-08-11 16:35:21', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2995', '2988', '湟源县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2996', '2987', '海东市', '1', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2997', '2996', '乐都区', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2998', '2996', '平安区', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('2999', '2996', '民和回族土族自治县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3000', '2996', '互助土族自治县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3001', '2996', '化隆回族自治县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3002', '2996', '循化撒拉族自治县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3003', '2987', '海北藏族自治州', '1', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3004', '3003', '门源回族自治县', '2', null, null, '2022-08-11 16:35:22', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3005', '3003', '祁连县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3006', '3003', '海晏县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3007', '3003', '刚察县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3008', '2987', '黄南藏族自治州', '1', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3009', '3008', '同仁市', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3010', '3008', '尖扎县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3011', '3008', '泽库县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3012', '3008', '河南蒙古族自治县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3013', '2987', '海南藏族自治州', '1', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3014', '3013', '共和县', '2', null, null, '2022-08-11 16:35:23', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3015', '3013', '同德县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3016', '3013', '贵德县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3017', '3013', '兴海县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3018', '3013', '贵南县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3019', '2987', '果洛藏族自治州', '1', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3020', '3019', '玛沁县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3021', '3019', '班玛县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3022', '3019', '甘德县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3023', '3019', '达日县', '2', null, null, '2022-08-11 16:35:24', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3024', '3019', '久治县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3025', '3019', '玛多县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3026', '2987', '玉树藏族自治州', '1', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3027', '3026', '玉树市', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3028', '3026', '杂多县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3029', '3026', '称多县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3030', '3026', '治多县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3031', '3026', '囊谦县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3032', '3026', '曲麻莱县', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3033', '2987', '海西蒙古族藏族自治州', '1', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3034', '3033', '格尔木市', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3035', '3033', '德令哈市', '2', null, null, '2022-08-11 16:35:25', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3036', '3033', '茫崖市', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3037', '3033', '乌兰县', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3038', '3033', '都兰县', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3039', '3033', '天峻县', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3040', null, '宁夏回族自治区', '0', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3041', '3040', '银川市', '1', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3042', '3041', '兴庆区', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3043', '3041', '西夏区', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3044', '3041', '金凤区', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3045', '3041', '永宁县', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3046', '3041', '贺兰县', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3047', '3041', '灵武市', '2', null, null, '2022-08-11 16:35:26', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3048', '3040', '石嘴山市', '1', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3049', '3048', '大武口区', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3050', '3048', '惠农区', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3051', '3048', '平罗县', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3052', '3040', '吴忠市', '1', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3053', '3052', '利通区', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3054', '3052', '红寺堡区', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3055', '3052', '盐池县', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3056', '3052', '同心县', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3057', '3052', '青铜峡市', '2', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3058', '3040', '固原市', '1', null, null, '2022-08-11 16:35:27', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3059', '3058', '原州区', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3060', '3058', '西吉县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3061', '3058', '隆德县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3062', '3058', '泾源县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3063', '3058', '彭阳县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3064', '3040', '中卫市', '1', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3065', '3064', '沙坡头区', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3066', '3064', '中宁县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3067', '3064', '海原县', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3068', null, '新疆维吾尔自治区', '0', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3069', '3068', '乌鲁木齐市', '1', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3070', '3069', '天山区', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3071', '3069', '沙依巴克区', '2', null, null, '2022-08-11 16:35:28', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3072', '3069', '新市区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3073', '3069', '水磨沟区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3074', '3069', '头屯河区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3075', '3069', '达坂城区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3076', '3069', '米东区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3077', '3069', '乌鲁木齐县', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3078', '3068', '克拉玛依市', '1', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3079', '3078', '独山子区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3080', '3078', '克拉玛依区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3081', '3078', '白碱滩区', '2', null, null, '2022-08-11 16:35:29', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3082', '3078', '乌尔禾区', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3083', '3068', '吐鲁番市', '1', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3084', '3083', '高昌区', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3085', '3083', '鄯善县', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3086', '3083', '托克逊县', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3087', '3068', '哈密市', '1', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3088', '3087', '伊州区', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3089', '3087', '巴里坤哈萨克自治县', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3090', '3087', '伊吾县', '2', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3091', '3068', '昌吉回族自治州', '1', null, null, '2022-08-11 16:35:30', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3092', '3091', '昌吉市', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3093', '3091', '阜康市', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3094', '3091', '呼图壁县', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3095', '3091', '玛纳斯县', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3096', '3091', '奇台县', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3097', '3091', '吉木萨尔县', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3098', '3091', '木垒哈萨克自治县', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3099', '3068', '博尔塔拉蒙古自治州', '1', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3100', '3099', '博乐市', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3101', '3099', '阿拉山口市', '2', null, null, '2022-08-11 16:35:31', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3102', '3099', '精河县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3103', '3099', '温泉县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3104', '3068', '巴音郭楞蒙古自治州', '1', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3105', '3104', '库尔勒市', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3106', '3104', '轮台县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3107', '3104', '尉犁县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3108', '3104', '若羌县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3109', '3104', '且末县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3110', '3104', '焉耆回族自治县', '2', null, null, '2022-08-11 16:35:32', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3111', '3104', '和静县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3112', '3104', '和硕县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3113', '3104', '博湖县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3114', '3068', '阿克苏地区', '1', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3115', '3114', '阿克苏市', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3116', '3114', '库车市', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3117', '3114', '温宿县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3118', '3114', '沙雅县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3119', '3114', '新和县', '2', null, null, '2022-08-11 16:35:33', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3120', '3114', '拜城县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3121', '3114', '乌什县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3122', '3114', '阿瓦提县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3123', '3114', '柯坪县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3124', '3068', '克孜勒苏柯尔克孜自治州', '1', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3125', '3124', '阿图什市', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3126', '3124', '阿克陶县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3127', '3124', '阿合奇县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3128', '3124', '乌恰县', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3129', '3068', '喀什地区', '1', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3130', '3129', '喀什市', '2', null, null, '2022-08-11 16:35:34', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3131', '3129', '疏附县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3132', '3129', '疏勒县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3133', '3129', '英吉沙县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3134', '3129', '泽普县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3135', '3129', '莎车县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3136', '3129', '叶城县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3137', '3129', '麦盖提县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3138', '3129', '岳普湖县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3139', '3129', '伽师县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3140', '3129', '巴楚县', '2', null, null, '2022-08-11 16:35:35', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3141', '3129', '塔什库尔干塔吉克自治县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3142', '3068', '和田地区', '1', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3143', '3142', '和田市', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3144', '3142', '和田县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3145', '3142', '墨玉县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3146', '3142', '皮山县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3147', '3142', '洛浦县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3148', '3142', '策勒县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3149', '3142', '于田县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3150', '3142', '民丰县', '2', null, null, '2022-08-11 16:35:36', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3151', '3068', '伊犁哈萨克自治州', '1', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3152', '3151', '伊宁市', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3153', '3151', '奎屯市', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3154', '3151', '霍尔果斯市', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3155', '3151', '伊宁县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3156', '3151', '察布查尔锡伯自治县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3157', '3151', '霍城县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3158', '3151', '巩留县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3159', '3151', '新源县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3160', '3151', '昭苏县', '2', null, null, '2022-08-11 16:35:37', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3161', '3151', '特克斯县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3162', '3151', '尼勒克县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3163', '3068', '塔城地区', '1', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3164', '3163', '塔城市', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3165', '3163', '乌苏市', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3166', '3163', '额敏县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3167', '3163', '沙湾县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3168', '3163', '托里县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3169', '3163', '裕民县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3170', '3163', '和布克赛尔蒙古自治县', '2', null, null, '2022-08-11 16:35:38', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3171', '3068', '阿勒泰地区', '1', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3172', '3171', '阿勒泰市', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3173', '3171', '布尔津县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3174', '3171', '富蕴县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3175', '3171', '福海县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3176', '3171', '哈巴河县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3177', '3171', '青河县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3178', '3171', '吉木乃县', '2', null, null, '2022-08-11 16:35:39', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3179', '1956', '中山市', '1', null, null, '2022-08-18 15:31:39', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3180', '3179', '石岐街道', '2', null, null, '2022-08-18 15:31:39', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3181', '3179', '东区街道', '2', null, null, '2022-08-18 15:31:39', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3182', '3179', '西区街道', '2', null, null, '2022-08-18 15:31:39', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3183', '3179', '南区街道', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3184', '3179', '五桂山街道', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3185', '3179', '火炬开发区街道', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3186', '3179', '民众街道', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3187', '3179', '南朗街道', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3188', '3179', '黄圃镇', '2', null, null, '2022-08-18 15:31:40', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3189', '3179', '南头镇', '2', null, null, '2022-08-18 15:31:41', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3190', '3179', '东凤镇', '2', null, null, '2022-08-18 15:31:41', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3191', '3179', '阜沙镇', '2', null, null, '2022-08-18 15:31:41', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3192', '3179', '小榄镇', '2', null, null, '2022-08-18 15:31:41', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3193', '3179', '古镇镇', '2', null, null, '2022-08-18 15:31:41', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3194', '3179', '横栏镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3195', '3179', '三角镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3196', '3179', '港口镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3197', '3179', '大涌镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3198', '3179', '沙溪镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3199', '3179', '三乡镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3200', '3179', '板芙镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3201', '3179', '神湾镇', '2', null, null, '2022-08-18 15:31:42', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3202', '3179', '坦洲镇', '2', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3203', '1956', '东莞市', '1', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3204', '3203', '东城街道', '2', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3205', '3203', '南城街道', '2', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3206', '3203', '万江街道', '2', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3207', '3203', '莞城街道', '2', null, null, '2022-08-18 15:31:43', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3208', '3203', '石碣镇', '2', null, null, '2022-08-18 15:31:44', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3209', '3203', '石龙镇', '2', null, null, '2022-08-18 15:31:44', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3210', '3203', '茶山镇', '2', null, null, '2022-08-18 15:31:44', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3211', '3203', '石排镇', '2', null, null, '2022-08-18 15:31:44', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3212', '3203', '企石镇', '2', null, null, '2022-08-18 15:31:44', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3213', '3203', '横沥镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3214', '3203', '桥头镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3215', '3203', '谢岗镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3216', '3203', '东坑镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3217', '3203', '常平镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3218', '3203', '寮步镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3219', '3203', '樟木头镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3220', '3203', '大朗镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3221', '3203', '黄江镇', '2', null, null, '2022-08-18 15:31:45', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3222', '3203', '清溪镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3223', '3203', '塘厦镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3224', '3203', '凤岗镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3225', '3203', '大岭山镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3226', '3203', '长安镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3227', '3203', '虎门镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3228', '3203', '厚街镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3229', '3203', '沙田镇', '2', null, null, '2022-08-18 15:31:46', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3230', '3203', '道滘镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3231', '3203', '洪梅镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3232', '3203', '麻涌镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3233', '3203', '望牛墩镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3234', '3203', '中堂镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3235', '3203', '高埗镇', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3236', '3203', '松山湖高新区', '2', null, null, '2022-08-18 15:31:47', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3237', '2224', '儋州市', '1', null, null, '2022-08-24 10:51:13', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3238', '3237', '儋州市', '2', null, null, '2022-08-24 10:51:13', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3239', '2224', '省直辖县级行政区划', '1', null, null, '2022-08-24 10:51:13', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3240', '3239', '五指山市', '2', null, null, '2022-08-24 10:51:13', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3241', '3239', '文昌市', '2', null, null, '2022-08-24 10:51:13', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3242', '3239', '琼海市', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3243', '3239', '万宁市', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3244', '3239', '东方市', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3245', '3239', '定安县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3246', '3239', '屯昌县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3247', '3239', '澄迈县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3248', '3239', '临高县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3249', '3239', '白沙黎族自治县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3250', '3239', '昌江黎族自治县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3251', '3239', '乐东黎族自治县', '2', null, null, '2022-08-24 10:51:14', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3252', '3239', '陵水黎族自治县', '2', null, null, '2022-08-24 10:51:15', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3253', '3239', '保亭黎族苗族自治县', '2', null, null, '2022-08-24 10:51:15', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3254', '3239', '琼中黎族苗族自治县', '2', null, null, '2022-08-24 10:51:15', '1', '0', '1');
INSERT INTO `xl_area` VALUES ('3255', '1706', '省直辖县级行政区划', '1', null, null, '2022-08-11 16:33:15', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3256', '3255', '仙桃市', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3257', '3255', '潜江市', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3258', '3255', '天门市', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3259', '3255', '神农架林区', '2', null, null, '2022-08-11 16:33:06', '520', '0', '1');
INSERT INTO `xl_area` VALUES ('3260', '1531', '省直辖县级行政区划', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3261', '3260', '济源市', '2', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3262', '3068', '自治区直辖县级行政区划', '1', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3263', '3262', '石河子市', '2', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3264', '3262', '阿拉尔市', '2', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3265', '3262', '图木舒克市', '2', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3266', '3262', '五家渠市', '2', null, null, null, null, '0', '1');
INSERT INTO `xl_area` VALUES ('3267', '3262', '铁门关市', '2', null, null, null, null, '0', '1');

-- ----------------------------
-- Table structure for xl_brand_classify
-- ----------------------------
DROP TABLE IF EXISTS `xl_brand_classify`;
CREATE TABLE `xl_brand_classify` (
  `brand_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `brand_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌分类名称',
  `remarks` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌分类简介',
  `apartment_id` bigint DEFAULT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='品牌分类表';

-- ----------------------------
-- Records of xl_brand_classify
-- ----------------------------
INSERT INTO `xl_brand_classify` VALUES ('1', '与之城市青年之家', '介绍', null, '9999', '2023-03-17 18:35:31', '1', '2023-03-17 17:31:09', '1', '0', '1');
INSERT INTO `xl_brand_classify` VALUES ('2', '与之城市青年之家', null, null, '4', null, null, '2023-03-30 10:51:49', '3', '0', '1');

-- ----------------------------
-- Table structure for xl_project_classify
-- ----------------------------
DROP TABLE IF EXISTS `xl_project_classify`;
CREATE TABLE `xl_project_classify` (
  `classify_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `classify_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目分类名称',
  `remarks` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目分类简介',
  `apartment_id` bigint DEFAULT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目分类表';

-- ----------------------------
-- Records of xl_project_classify
-- ----------------------------
INSERT INTO `xl_project_classify` VALUES ('1', '市二宫店', '吖', null, '9999', null, null, '2023-03-17 18:38:04', '1', '0', '1');
INSERT INTO `xl_project_classify` VALUES ('2', '棠下店', '', null, '4', null, null, '2023-03-30 10:51:36', '3', '0', '1');
INSERT INTO `xl_project_classify` VALUES ('3', '上社店', null, null, '4', null, null, '2023-03-30 11:00:57', '3', '0', '1');

-- ----------------------------
-- Table structure for xl_apartment
-- ----------------------------
DROP TABLE IF EXISTS `xl_apartment`;
CREATE TABLE `xl_apartment` (
  `apartment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公寓ID',
  `apartment_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `apartment_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公寓类型 jzsdd:集中式独栋;fsszz:分散式整租;fsshz:分散式合租',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌分类id',
  `project_id` bigint DEFAULT NULL COMMENT '项目分类id',
  `province` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
  `county` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区县',
  `detail_address` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `floor_num` int DEFAULT NULL COMMENT '楼层数',
  `house_num` int DEFAULT NULL COMMENT '房源数',
  `is_lift` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否电梯楼 N:否;Y:是',
  `contact` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `map_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地图所在地址',
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
  `apartment_status` tinyint unsigned DEFAULT '0' COMMENT '状态;0:正常,1:停用',
  `apartment_logo` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo图',
  `sort_order` int DEFAULT NULL COMMENT '显示顺序',
  `cover_img` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '封面图',
  `first_party_name` varchar(48) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '甲方名称',
  `first_party_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '甲方客服电话',
  `first_party_address` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '甲方联系地址',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`apartment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公寓信息表';

-- ----------------------------
-- Records of xl_apartment
-- ----------------------------
INSERT INTO `xl_apartment` VALUES ('1', '宽之域', 'jzs', '1', '1', '广东省', '广州市', '海珠区', '滨江路', '1', '1', 'Y', '姚', '1371933967', '113.27654117569047', '23.112378165056025', '广东省广州市海珠区江南大道中75号金城国际', null, '0', null, null, null, null, null, null, '9999', '2023-04-18 18:22:16', '1', '2023-03-23 16:45:38', '1', '0', '1');
INSERT INTO `xl_apartment` VALUES ('2', '蛋壳', 'fss', '1', '1', '广东省', '广州市', '海珠区', '滨江中路', null, null, null, '姚', '1371933967', '113.27142900886543', '23.13533647285972', '广东省广州市越秀区吉祥路79号广州市人民政府', '123', '0', null, null, null, null, null, null, '9999', '2023-04-19 14:53:00', '1', '2023-03-23 16:45:39', '1', '0', '1');
INSERT INTO `xl_apartment` VALUES ('4', '与之城市青年之家棠下店', 'jzs', '2', '2', '广东省', '广州市', '天河区', '棠下街大片路', '5', '10', 'Y', '小梅', '155555555', '113.3865367090788', '23.136034695178267', '广东省广州市天河区大片路162号新居', '天河旗舰店', '0', null, null, null, null, null, null, '4', '2023-03-30 17:16:28', '3', '2023-03-30 10:58:02', '3', '0', '1');
INSERT INTO `xl_apartment` VALUES ('5', '与之城市青年之家上社店', 'jzs', '2', '3', '广东省', '广州市', '天河区', '上社大街', '5', '8', 'Y', '姚', '13777777777', '113.3782394204081', '23.139922456751304', '广东省广州市天河区乐泰大街5号唐顺小区', null, '0', null, null, null, null, null, null, '4', '2023-03-30 17:16:51', '3', '2023-03-30 11:01:09', '3', '0', '1');

-- ----------------------------
-- Table structure for xl_house
-- ----------------------------
DROP TABLE IF EXISTS `xl_house`;
CREATE TABLE `xl_house` (
  `house_id` bigint NOT NULL AUTO_INCREMENT COMMENT '房源ID',
  `floor` int DEFAULT NULL COMMENT '楼层',
  `house_no` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房间号',
  `hire_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出租方式 zz:整租; hz:合租',
  `house_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房源类型 jzs:集中式; sss分散式',
  `hall` int DEFAULT '0' COMMENT '厅室',
  `room` int DEFAULT '0' COMMENT '房间',
  `toilet` int DEFAULT '0' COMMENT '卫生间',
  `area` decimal(18,2) DEFAULT NULL COMMENT '面积',
  `orienta` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房屋朝向',
  `state` int DEFAULT NULL COMMENT '房源状态',
  `money` decimal(18,2) DEFAULT NULL COMMENT '原租金',
  `deposit` decimal(18,2) DEFAULT NULL COMMENT '押金',
  `reality_money` decimal(18,2) DEFAULT NULL COMMENT '实际租金',
  `external_money` decimal(18,2) DEFAULT NULL COMMENT '对外租金',
  `week_money` decimal(18,2) DEFAULT NULL COMMENT '周付价',
  `deposit_num` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '押金方式',
  `pay_num` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '付款方式',
  `charging_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计费模式 1:按自然月 2:按周期',
  `order_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房源编号',
  `tags` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '房屋亮点',
  `apartment_id` bigint NOT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房源表';

-- ----------------------------
-- Records of xl_house
-- ----------------------------
INSERT INTO `xl_house` VALUES ('7', '1', '101', 'zz', 'jzs', '0', '1', '1', '50.00', null, '5', '2000.00', '4000.00', null, null, null, '1', '1', null, null, null, '1', '9999', '2023-04-07 17:34:39', '1', '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('8', '1', '102', 'zz', 'jzs', '0', '1', '1', '50.00', null, '1', '1800.00', '4000.00', null, null, null, null, null, null, null, null, '1', '9999', null, null, '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('9', '1', '103', 'zz', 'jzs', '1', '1', '1', '11.00', null, '1', '1000.00', '2000.00', null, null, null, '0', '1', null, null, null, '1', '9999', null, null, '2023-04-10 10:44:52', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('10', '1', '104', 'zz', 'jzs', '0', '1', '1', '20.00', null, '1', '2000.00', '4000.00', null, null, null, '0', '1', null, null, null, '1', '9999', '2023-04-18 17:46:59', '1', '2023-04-18 10:46:05', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('11', '2', '201', 'zz', 'jzs', '0', '1', '1', '20.00', null, '2', '2000.00', '4000.00', null, null, null, '0', '1', null, null, null, '1', '9999', '2023-04-18 16:34:07', '1', '2023-04-18 15:54:10', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('12', '2', '202', 'zz', 'jzs', '0', '1', '1', '20.00', null, '1', '1500.00', '3000.00', null, null, null, '2', '1', null, null, null, '1', '9999', '2023-04-18 16:33:38', '1', '2023-04-18 15:54:10', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('13', '1', '101', 'zz', 'jzs', '0', '1', '1', '20.00', null, '1', '2000.00', '2000.00', null, null, null, '1', '1', null, null, null, '2', '9999', null, null, '2023-04-19 14:54:35', '1', '0', '1');
INSERT INTO `xl_house` VALUES ('14', '1', '102', 'zz', 'jzs', '1', '1', '1', '30.00', null, '1', '3000.00', '3000.00', null, null, null, '1', '1', null, null, null, '2', '9999', null, null, '2023-04-19 14:54:35', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_house_fee
-- ----------------------------
DROP TABLE IF EXISTS `xl_house_fee`;
CREATE TABLE `xl_house_fee` (
  `fee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` bigint NOT NULL COMMENT '房源ID',
  `fee_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '费用类型 db:度表费用; qt:其他费用',
  `fee_db_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '度表费用类型',
  `fee_qt_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其他费用类型',
  `fee_collect_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '费用收取类型',
  `fee_amount` decimal(18,2) DEFAULT '0.00' COMMENT '价格',
  `apartment_id` bigint NOT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房源其他费用表';

-- ----------------------------
-- Records of xl_house_fee
-- ----------------------------
INSERT INTO `xl_house_fee` VALUES ('17', '7', 'db', 'df', null, null, '1.50', '1', '9999', null, null, '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('18', '7', 'db', 'sf', null, null, '5.00', '1', '9999', null, null, '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('19', '7', 'qt', '5', null, null, '30.00', '1', '9999', null, null, '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('20', '7', 'qt', '6', null, null, '20.00', '1', '9999', null, null, '2023-04-07 16:45:58', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('21', '8', 'db', 'df', null, null, '1.50', '1', '9999', null, null, '2023-04-07 16:45:59', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('22', '8', 'db', 'sf', null, null, '5.00', '1', '9999', null, null, '2023-04-07 16:45:59', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('23', '8', 'qt', '5', null, null, '30.00', '1', '9999', null, null, '2023-04-07 16:45:59', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('24', '8', 'qt', '6', null, null, '20.00', '1', '9999', null, null, '2023-04-07 16:45:59', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('25', '10', 'db', 'df', null, '2', '0.00', '1', '9999', null, null, '2023-04-10 10:46:05', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('26', '11', 'db', 'sf', null, '2', '0.00', '1', '9999', null, null, '2023-04-18 15:54:10', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('27', '12', 'db', 'sf', null, '2', '0.00', '1', '9999', null, null, '2023-04-18 15:54:10', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('28', '13', 'db', 'sf', null, '2', '0.00', '2', '9999', null, null, '2023-04-19 14:54:35', '1', '0', '1');
INSERT INTO `xl_house_fee` VALUES ('29', '14', 'db', 'sf', null, '2', '0.00', '2', '9999', null, null, '2023-04-19 14:54:35', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_house_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `xl_house_subscribe`;
CREATE TABLE `xl_house_subscribe` (
  `subscribe_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` bigint NOT NULL COMMENT '房源ID',
  `real_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下定人',
  `phone_number` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `sex` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别（1男 2女）',
  `id_type` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件类型（1身份证 2军人证 3护照 4港澳台居民证件）',
  `id_no` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `down_date` datetime DEFAULT NULL COMMENT '下定日期',
  `expire_date` datetime DEFAULT NULL COMMENT '失效日期',
  `contract_start_date` datetime DEFAULT NULL COMMENT '合同开始时间',
  `contract_end_date` datetime DEFAULT NULL COMMENT '合同结束时间',
  `month_money` decimal(18,2) DEFAULT NULL COMMENT '约定月租金',
  `deposit` decimal(18,2) DEFAULT NULL COMMENT '约定押金',
  `front_money` decimal(18,2) DEFAULT NULL COMMENT '下定金额',
  `from_date` datetime DEFAULT NULL COMMENT '入账时间',
  `fee_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收费方式（1现金 2结清费用 3银行卡转账支付）',
  `remarks` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `apartment_id` bigint DEFAULT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房间预订表';

-- ----------------------------
-- Records of xl_house_subscribe
-- ----------------------------
INSERT INTO `xl_house_subscribe` VALUES ('1', '7', '小张', '132', null, '1', '4430265', '2023-04-20 14:25:32', '2023-04-25 00:00:00', '2023-04-20 00:00:00', '2023-04-26 00:00:00', '2000.00', '4000.00', '1000.00', '2023-04-20 14:25:32', '1', '123', null, '9999', null, null, '2023-04-20 14:27:00', '1', '0', '1');

-- ----------------------------
-- Table structure for xl_house_lessee
-- ----------------------------
DROP TABLE IF EXISTS `xl_house_lessee`;
CREATE TABLE `xl_house_lessee` (
  `lessee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` bigint NOT NULL COMMENT '房源ID',
  `lessee_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '承租性质',
  `real_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别（1男 2女）',
  `id_type` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件类型（1身份证 2军人证 3护照 4港澳台居民证件）',
  `id_no` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `phone_number` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `nation_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '民族',
  `home_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家庭地址',
  `id_img_front` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证正面照片',
  `id_img_opposite` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证反面照片',
  `punter_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户类型',
  `source_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源渠道',
  `urgent_contact` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '紧急联系人',
  `urgent_contact_number` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '紧急联系电话',
  `lessee_status` int DEFAULT NULL COMMENT '租客状态 1:在约 2:退租',
  `apartment_id` bigint NOT NULL COMMENT '公寓ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`lessee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房源承租信息表';
