SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `#table#admin`
-- ----------------------------

DROP TABLE IF EXISTS `#table#admin`;
CREATE TABLE IF NOT EXISTS `#table#admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) NOT NULL,
  `lastloginip` varchar(15) DEFAULT '',
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `mobile` varchar(11) DEFAULT '',
  `email` varchar(40) DEFAULT '',
  `realname` varchar(50) DEFAULT '',
  PRIMARY KEY (`userid`),
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `#table#admin_log`;
CREATE TABLE `#table#admin_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(15) NOT NULL,
  `controller` varchar(20) NOT NULL,
  `action` varchar(30) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `username` (`username`,`action`) USING BTREE,
  KEY `application` (`application`,`controller`,`action`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `#table#admin_menu`;
CREATE TABLE `#table#admin_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `application` char(20) NOT NULL DEFAULT '',
  `controller` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `application` (`application`,`controller`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=247;

-- ----------------------------
-- Table structure for `#table#admin_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `#table#linkage`;
CREATE TABLE `#table#linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#admin_menu
-- ----------------------------
INSERT INTO `#table#admin_menu` VALUES ('1', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('2', 'sys_setting', '0', 'admin', 'setting', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('3', 'application', '0', 'admin', 'application', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('5', 'member', '0', 'member', 'member', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('8', 'admininfo', '1', 'admin', 'Private', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('9', 'editpwd', '8', 'admin', 'Private', 'public_edit_pwd', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('10', 'editinfo', '8', 'admin', 'Private', 'public_edit_info', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('11', 'create_html_quick', '1', 'content', 'create_html', 'index', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('12', 'create_index', '11', 'content', 'create_html', 'public_index', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('13', 'correlative_setting', '2', 'admin', 'admin', 'admin', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('14', 'admin_setting', '2', 'admin', 'Admin', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('15', 'basic_config', '13', 'admin', 'setting', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('16', 'site_config', '13', 'admin', 'setting', 'init', 'tab=2', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('17', 'safe_config', '13', 'admin', 'setting', 'init', 'tab=3', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('18', 'attachment_config', '13', 'admin', 'setting', 'init', 'tab=4', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('19', 'sms_config', '13', 'admin', 'setting', 'init', 'tab=5', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('20', 'contactus_config', '13', 'admin', 'setting', 'init', 'tab=6', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('21', 'connect_config', '13', 'admin', 'setting', 'init', 'tab=7', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('22', 'mail_config', '13', 'admin', 'setting', 'init', 'tab=8', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('23', 'admin_manage', '14', 'admin', 'admin', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('24', 'admin_add', '23', 'admin', 'admin', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('25', 'admin_edit', '23', 'admin', 'admin', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('26', 'admin_delete', '23', 'admin', 'admin', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('27', 'role_manage', '14', 'admin', 'role', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('28', 'role_add', '27', 'admin', 'role', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('29', 'priv_setting', '27', 'admin', 'role', 'priv_setting', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('30', 'role_priv', '27', 'admin', 'role', 'role_priv', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('31', 'role_edit', '27', 'admin', 'role', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('32', 'rolemember_manage', '27', 'admin', 'role', 'member_manage', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('33', 'role_delete', '27', 'admin', 'role', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('34', 'application_manage', '3', 'admin', 'application', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('35', 'application_manage', '34', 'admin', 'application', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('36', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('37', 'create_manage', '4', 'content', 'html', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('38', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('39', 'manage_member', '5', 'member', 'member', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('40', 'manage_member', '39', 'member', 'member', 'manage', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('41', 'member_add', '40', 'member', 'member', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('42', 'member_lock', '40', 'member', 'member', 'lock', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('43', 'member_unlock', '40', 'member', 'member', 'unlock', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('44', 'member_move', '40', 'member', 'member', 'move', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('45', 'member_delete', '40', 'member', 'member', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('46', 'member_search', '40', 'member', 'member', 'search', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('47', 'member_edit', '40', 'member', 'member', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('48', 'view_memberlinfo', '40', 'member', 'member', 'memberinfo', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('49', 'member_verify', '39', 'member', 'member_verify', 'manage', 's=0', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('50', 'verify_pass', '49', 'member', 'member_verify', 'manage', 's=1', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('51', 'verify_ignore', '49', 'member', 'member_verify', 'manage', 's=2', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('52', 'verify_delete', '49', 'member', 'member_verify', 'manage', 's=3', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('53', 'verify_deny', '49', 'member', 'member_verify', 'manage', 's=4', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('54', 'never_pass', '49', 'member', 'member_verify', 'manage', 's=5', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('55', 'operation_pass', '49', 'member', 'member_verify', 'pass', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('56', 'operation_delete', '49', 'member', 'member_verify', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('57', 'operation_ignore', '49', 'member', 'member_verify', 'ignore', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('58', 'operation_reject', '49', 'member', 'member_verify', 'reject', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('59', 'view_modelinfo', '49', 'member', 'member_verify', 'modelinfo', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('60', 'manage_member_group', '244', 'member', 'member_group', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('61', 'member_group_add', '60', 'member', 'member_group', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('62', 'member_group_edit', '60', 'member', 'member_group', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('63', 'member_group_delete', '60', 'member', 'member_group', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('64', 'listorder', '60', 'member', 'member_group', 'sort', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('65', 'manage_member_model', '39', 'member', 'member_model', 'manage', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('66', 'member_model_import', '65', 'member', 'member_model', 'import', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('67', 'member_model_add', '65', 'member', 'member_model', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('68', 'member_model_delete', '65', 'member', 'member_model', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('69', 'member_model_edit', '65', 'member', 'member_model', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('70', 'member_modelfield_add', '65', 'member', 'member_modelfield', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('71', 'member_modelfield_edit', '65', 'member', 'member_modelfield', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('72', 'member_modelfield_delete', '65', 'member', 'member_modelfield', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('73', 'member_modelfield_manage', '65', 'member', 'member_modelfield', 'manage', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('74', 'member_model_export', '65', 'member', 'member_model', 'export', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('75', 'member_model_sort', '65', 'member', 'member_model', 'sort', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('76', 'member_model_move', '65', 'member', 'member_model', 'move', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('77', 'template_manager', '6', '', '', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('78', 'template_style', '77', 'template', 'style', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('79', 'import_style', '78', 'template', 'style', 'import', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('80', 'template_export', '78', 'template', 'style', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('81', 'template_onoff', '78', 'template', 'style', 'export', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('82', 'template_updatename', '78', 'template', 'style', 'disable', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('83', 'template_file_list', '78', 'template', 'file', 'updatename', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('84', 'template_file_edit', '78', 'template', 'file', 'edit_file', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('85', 'file_add_file', '78', 'template', 'file', 'add_file', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('86', 'template_visualization', '78', 'template', 'file', 'visualization', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('87', 'yuncms_tag_edit', '78', 'template', 'file', 'edit_yuncms_tag', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('88', 'history_version', '78', 'template', 'template_bak', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('89', 'restore_version', '78', 'template', 'template_bak', 'restore', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('90', 'del_history_version', '78', 'template', 'template_bak', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('96', 'extend_all', '7', 'admin', 'extend', '', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('97', 'menu_manage', '96', 'admin', 'menu', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('98', 'menu_add', '97', 'admin', 'menu', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('99', 'edit_menu', '97', 'admin', 'menu', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('100', 'delete_menu', '97', 'admin', 'menu', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('101', 'admin_log', '96', 'admin', 'log', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('102', 'delete_log', '101', 'admin', 'log', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('103', 'send_sms', '8', 'admin', 'sms', 'send', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('104', 'area_manage', '96', 'admin', 'area', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('105', 'delete_log', '104', 'admin', 'sms', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('106', 'workflow', '96', 'content', 'workflow', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('107', 'add_workflow', '106', 'content', 'workflow', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('108', 'edit_workflow', '106', 'content', 'workflow', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('109', 'delete_workflow', '106', 'content', 'workflow', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('110', 'database_toos', '96', 'admin', 'database', 'export', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('111', 'database_export', '110', 'admin', 'database', 'export', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('112', 'database_import', '110', 'admin', 'database', 'import', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('113', 'cache_all', '96', 'admin', 'cache_all', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('114', 'ipbanned', '96', 'admin', 'ipbanned', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('115', 'add_ipbanned', '114', 'admin', 'ipbanned', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('116', 'delete_ip', '114', 'admin', 'ipbanned', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('117', 'badword_manage', '96', 'admin', 'badword', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('118', 'badword_export', '117', 'admin', 'badword', 'export', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('119', 'badword_import', '117', 'admin', 'badword', 'import', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('120', 'badword_add', '117', 'admin', 'badword', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('121', 'badword_edit', '117', 'admin', 'badword', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('122', 'badword_delete', '117', 'admin', 'badword', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('123', 'downsite', '96', 'admin', 'downserver', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('124', 'urlrule_manage', '96', 'admin', 'urlrule', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('125', 'add_urlrule', '124', 'admin', 'urlrule', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('126', 'edit_urlrule', '124', 'admin', 'urlrule', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('127', 'delete_urlrule', '124', 'admin', 'urlrule', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('128', 'category_manage', '38', 'admin', 'category', 'init', 'app=admin', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('129', 'add_category', '128', 'admin', 'category', 'add', 's=0', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('130', 'add_cat_link', '128', 'admin', 'category', 'add', 's=2', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('131', 'add_page', '128', 'admin', 'category', 'add', 's=1', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('132', 'category_cache', '128', 'admin', 'category', 'public_cache', 'app=admin', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('133', 'count_items', '128', 'admin', 'category', 'count_items', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('134', 'category_batch_edit', '128', 'admin', 'category', 'batch_edit', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('135', 'model_manage', '38', 'content', 'model', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('136', 'add_model', '135', 'content', 'model', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('137', 'sitemodel_import', '135', 'content', 'model', 'import', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('138', 'fields_manage', '135', 'content', 'model_field', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('139', 'edit_model_content', '135', 'content', 'model', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('140', 'disabled_model', '135', 'content', 'model', 'disabled', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('141', 'delete_model', '135', 'content', 'model', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('142', 'export_model', '135', 'content', 'model', 'export', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('143', 'type_manage', '38', 'content', 'type', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('144', 'add_type', '143', 'content', 'type', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('145', 'delete_type', '143', 'content', 'type', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('146', 'edit_type', '143', 'content', 'type', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('147', 'posid_manage', '38', 'admin', 'position', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('148', 'posid_add', '147', 'admin', 'position', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('149', 'position_edit', '147', 'admin', 'position', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('150', 'cnzz', '96', 'admin', 'cnzz', 'init', '1', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('151', 'attachment_manage', '36', 'attachment', 'manage', 'init', '', '1', '1');
INSERT INTO `#table#admin_menu` VALUES ('152', 'attachment_address_update', '151', 'attachment', 'address', 'update', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('153', 'attachment_manager_db', '151', 'attachment', 'manage', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('154', 'attachment_manager_dir', '151', 'attachment', 'manage', 'dir', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('155', 'attachment_address_replace', '151', 'attachment', 'address', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('156', 'member_setting', '244', 'member', 'Member_setting', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('157', 'ucenter_config', '244', 'member', 'ucenter_setting', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('158', 'keylink', '96', 'admin', 'keylink', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('159', 'edit_keylink', '158', 'admin', 'keylink', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('160', 'delete_keylink', '158', 'admin', 'keylink', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('161', 'add_keylink', '158', 'admin', 'keylink', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('162', 'copyfrom_manage', '96', 'admin', 'copyfrom', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('163', 'add_copyfrom', '162', 'admin', 'copyfrom', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('164', 'linkage', '96', 'admin', 'linkage', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('165', 'linkageadd', '164', 'admin', 'linkage', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('166', 'googlesitemap', '96', 'admin', 'googlesitemap', 'set', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('167', 'member_menu_manage', '96', 'member', 'member_menu', 'manage', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('168', 'member_menu_add', '167', 'member', 'member_menu', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('169', 'member_menu_edit', '167', 'member', 'member_menu', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('170', 'member_menu_delete', '167', 'member', 'member_menu', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('171', 'fulltext_search', '34', 'search', 'search_type', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('172', 'manage_type', '171', 'search', 'search_type', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('173', 'search_setting', '171', 'search', 'search_admin', 'setting', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('174', 'createindex', '171', 'search', 'search_admin', 'createindex', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('175', 'add_search_type', '171', 'search', 'search_type', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('176', 'content_manage', '36', 'content', 'content', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('177', 'add_content', '176', 'content', 'content', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('178', 'check_content', '176', 'content', 'content', 'pass', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('179', 'edit_content', '176', 'content', 'content', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('180', 'push_to_special', '176', 'content', 'push', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('181', 'move_content', '176', 'content', 'content', 'move', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('182', 'add_othors', '176', 'content', 'content', 'add_othors', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('183', 'delete_content', '176', 'content', 'content', 'delete', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('184', 'batch_show', '176', 'content', 'content', 'batch_show', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('185', 'special', '36', 'special', 'special', 'init', '', '2', '1');
INSERT INTO `#table#admin_menu` VALUES ('186', 'add_special', '185', 'special', 'special', 'add', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('187', 'edit_special', '185', 'special', 'special', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('188', 'special_list', '185', 'special', 'special', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('189', 'special_elite', '185', 'special', 'special', 'elite', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('190', 'delete_special', '185', 'special', 'special', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('191', 'special_listorder', '185', 'special', 'special', 'listorder', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('192', 'special_content_list', '185', 'special', 'content', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('193', 'special_content_add', '192', 'special', 'content', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('194', 'special_content_list', '192', 'special', 'content', 'init', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('195', 'special_content_edit', '192', 'special', 'content', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('196', 'special_content_delete', '192', 'special', 'content', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('197', 'special_content_listorder', '192', 'special', 'content', 'listorder', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('198', 'special_content_import', '192', 'special', 'special', 'import', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('199', 'creat_html', '185', 'special', 'special', 'html', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('200', 'create_special_list', '185', 'special', 'special', 'create_special_list', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('201', 'block', '36', 'block', 'admin', 'init', '', '3', '1');
INSERT INTO `#table#admin_menu` VALUES ('202', 'block_add', '201', 'block', 'admin', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('203', 'block_edit', '201', 'block', 'admin', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('204', 'block_del', '201', 'block', 'admin', 'del', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('205', 'block_update', '201', 'block', 'admin', 'block_update', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('206', 'block_restore', '201', 'block', 'admin', 'history_restore', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('207', 'history_del', '201', 'block', 'admin', 'history_del', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('208', 'pay', '34', 'pay', 'payment', 'pay_list', 's=3', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('209', 'payments', '208', 'pay', 'payment', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('210', 'payment_add', '209', 'pay', 'payment', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('211', 'payment_delete', '209', 'pay', 'payment', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('212', 'payment_edit', '209', 'pay', 'payment', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('213', 'paylist', '208', 'pay', 'payment', 'pay_list', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('214', 'discount', '213', 'pay', 'payment', 'discount', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('215', 'pay_cancel', '213', 'pay', 'payment', 'pay_cancel', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('216', 'pay_delete', '208', 'pay', 'payment', 'pay_del', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('217', 'modify_deposit', '208', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('218', 'spend_record', '208', 'pay', 'spend', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('219', 'pay_stat', '208', 'pay', 'payment', 'pay_stat', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('220', 'create_index', '37', 'content', 'create_html', 'public_index', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('221', 'create_list_html', '37', 'content', 'create_html', 'category', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('222', 'update_urls', '37', 'content', 'create_html', 'update_urls', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('223', 'create_content_html', '37', 'content', 'create_html', 'show', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('224', 'dbsource', '34', 'dbsource', 'data', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('225', 'external_data_sources', '224', 'dbsource', 'dbsource_admin', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('226', 'dbsource_add', '224', 'dbsource', 'dbsource_admin', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('227', 'dbsource_edit', '224', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('228', 'dbsource_del', '224', 'dbsource', 'dbsource_admin', 'del', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('229', 'dbsource_data_add', '224', 'dbsource', 'data', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('230', 'dbsource_data_edit', '224', 'dbsource', 'data', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('231', 'dbsource_data_del', '224', 'dbsource', 'data', 'del', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('232', 'scan', '96', 'scan', 'index', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('233', 'scan_report', '232', 'scan', 'index', 'scan_report', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('234', 'md5_creat', '232', 'scan', 'index', 'md5_creat', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('235', 'player_manage', '96', 'admin', 'player', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('236', 'add_player', '235', 'admin', 'player', 'add', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('237', 'edit_player', '235', 'admin', 'player', 'edit', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('238', 'del_player', '235', 'admin', 'player', 'delete', '', '0', '0');
INSERT INTO `#table#admin_menu` VALUES ('239', 'member_setting', '5', 'member', 'member_setting', 'manage', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('240', 'queue_manage', '5', 'admin', 'queue', 'init', '', '0', '1');
INSERT INTO `#table#admin_menu` VALUES ('241', 'queue_delete', '241', 'admin', 'queue', 'delete', '', '0', '0');
-- ----------------------------
-- Table structure for `#table#admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `#table#admin_panel`;
CREATE TABLE `#table#admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `#table#admin_role`;
CREATE TABLE `#table#admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`) USING BTREE,
  KEY `disabled` (`disabled`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6;

-- ----------------------------
-- Records of #table#player
-- ----------------------------
CREATE TABLE IF NOT EXISTS `#table#player` (
  `playerid` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` char(20) NOT NULL,
  `code` mediumtext NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#admin_role
-- ----------------------------
INSERT INTO `#table#admin_role` VALUES ('1', '上帝', '', '0', '0');
INSERT INTO `#table#admin_role` VALUES ('2', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `#table#admin_role` VALUES ('3', '运营总监', '', '0', '0');
INSERT INTO `#table#admin_role` VALUES ('4', '总编', '', '0', '0');
INSERT INTO `#table#admin_role` VALUES ('5', '编辑', '', '0', '0');

-- ----------------------------
-- Table structure for `#table#admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `#table#admin_role_priv`;
CREATE TABLE `#table#admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `application` char(20) NOT NULL,
  `controller` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  KEY `roleid` (`roleid`,`application`,`controller`,`action`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#announce`
-- ----------------------------
DROP TABLE IF EXISTS `#table#announce`;
CREATE TABLE `#table#announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `passed` (`passed`,`endtime`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#announce
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#application`
-- ----------------------------
DROP TABLE IF EXISTS `#table#application`;
CREATE TABLE `#table#application` (
  `application` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`application`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#application
-- ----------------------------
INSERT INTO `#table#application` VALUES ('admin', '管理核心', '', '1', '', '', 'array (\n  \'site_name\' => \'云CMS\',\n  \'site_title\' => \'CMS云计算\',\n  \'keywords\' => \'CMS云计算\',\n  \'description\' => \'CMS云计算\',\n  \'copyrights\' => \'CMS云计算\',\n  \'icp\' => \'鲁ICP备09088162号\',\n  \'maxloginfailedtimes\' => \'10\',\n  \'setting_qq\' => \'85825770\',\n  \'setting_msn\' => \'xutongle@msn.com\',\n  \'setting_aliwangwang\' => \'讯腾网络科技\',\n  \'setting_skype\' => \'xutongle\',\n)', '0', '0', '2012-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('content', '内容', '', '1', '1.0', '', '', '0', '0', '2012-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('member', '会员', '', '1', '1.0', '会员', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'0\',\n  \'enablemailcheck\' => \'1\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'1\',\n  \'regprotocol\' => \'      欢迎您注册成为YUNCMS用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　YUNCMS用户服务的所有权和运作权归YUNCMS拥有。YUNCMS所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与YUNCMS达成协议并接受所有的服务条款。\r\n2． YUNCMS服务简介\r\n　　YUNCMS通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，YUNCMS合理地认为用户的行为可能违反上述法律、法规，YUNCMS可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　YUNCMS会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　YUNCMS保留随时修改或中断服务而不需知照用户的权利。YUNCMS行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是YUNCMS的 基本政策。YUNCMS不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或YUNCMS在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护YUNCMS的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为YUNCMS用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知YUNCMS。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　YUNCMS不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过YUNCMS服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　YUNCMS对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经YUNCMS同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，YUNCMS将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　YUNCMS定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；YUNCMS为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在YUNCMS和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用YUNCMS提供的免费服务的同时，同意接受YUNCMS提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归YUNCMS所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \'欢迎您注册成为YUNCMS用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \'YUNCMS密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'denyusername\' => \n  array (\n    0 => \'xuchao\',\n  ),\n  \'denyemail\' => \n  array (\n    0 => \'xuchao@admin.com\',\n  ),\n)', '0', '0', '2011-05-05', '2011-05-05');
INSERT INTO `#table#application` VALUES ('search', '搜索', '', '1', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'\',\n  \'sphinxport\' => \'\',\n)', '0', '0', '2012-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('attachment', '附件', '', '1', '1.0', '', '', '0', '0', '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('block', '碎片', 'block', '1', '1.0', '', '', '0', '0', '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('scan', '木马查杀', 'scan', '1', '1.0', '', '', '0', '0', '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('special', '专题', 'special', 1, '1.0', '', '', 0, 0, '2010-05-18', '2012-05-18');
INSERT INTO `#table#application` VALUES ('dbsource', '数据源', 'dbsource', 1, '1.0', '', '', 0, 0, '2010-05-18', '2012-05-18');

-- ----------------------------
-- Table structure for `#table#area`
-- ----------------------------
DROP TABLE IF EXISTS `#table#area`;
CREATE TABLE IF NOT EXISTS `#table#area` (
  `areaid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` mediumtext,
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `arrchildid` mediumtext,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`areaid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM ;

-- ----------------------------
-- Table structure for `#table#attachment`
-- ----------------------------
DROP TABLE IF EXISTS `#table#attachment`;
CREATE TABLE `#table#attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `storage` char(15) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `#table#attachment_index`;
CREATE TABLE `#table#attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#attachment_index
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#badword`
-- ----------------------------
DROP TABLE IF EXISTS `#table#badword`;
CREATE TABLE `#table#badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#badword
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#block`
-- ----------------------------
DROP TABLE IF EXISTS `#table#block`;
CREATE TABLE `#table#block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#block
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#block_history`
-- ----------------------------
DROP TABLE IF EXISTS `#table#block_history`;
CREATE TABLE `#table#block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#block_history
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `#table#block_priv`;
CREATE TABLE `#table#block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`) USING BTREE,
  KEY `roleid` (`roleid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#cache`
-- ----------------------------
DROP TABLE IF EXISTS `#table#cache`;
CREATE TABLE `#table#cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#cache
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#category`
-- ----------------------------
DROP TABLE IF EXISTS `#table#category`;
CREATE TABLE `#table#category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL,
  `description` mediumtext,
  `parentdir` varchar(100) NOT NULL DEFAULT '',
  `catdir` varchar(30) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`catid`),
  KEY `module` (`application`,`parentid`,`listorder`,`catid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `#table#category_priv`;
CREATE TABLE `#table#category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#comment`
-- ----------------------------
DROP TABLE IF EXISTS `#table#comment`;
CREATE TABLE `#table#comment` (
  `commentid` char(30) NOT NULL,
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#comment_check`
-- ----------------------------
DROP TABLE IF EXISTS `#table#comment_check`;
CREATE TABLE `#table#comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `comment_data_id` (`comment_data_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10;

-- ----------------------------
-- Table structure for `#table#comment_data_1`
-- ----------------------------
DROP TABLE IF EXISTS `#table#comment_data_1`;
CREATE TABLE `#table#comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`) USING BTREE,
  KEY `support` (`support`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#comment_table`
-- ----------------------------
DROP TABLE IF EXISTS `#table#comment_table`;
CREATE TABLE `#table#comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#content_check`
-- ----------------------------
DROP TABLE IF EXISTS `#table#content_check`;
CREATE TABLE `#table#content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`) USING BTREE,
  KEY `checkid` (`checkid`) USING BTREE,
  KEY `status` (`status`,`inputtime`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#copyfrom`
-- ----------------------------
DROP TABLE IF EXISTS `#table#copyfrom`;
CREATE TABLE `#table#copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#copyfrom
-- ----------------------------
INSERT INTO `#table#copyfrom` (`id`, `sitename`, `siteurl`, `thumb`, `listorder`) VALUES (1, 'YUNCMS', 'http://www.yuncms.net', '', 0);
INSERT INTO `#table#copyfrom` (`id`, `sitename`, `siteurl`, `thumb`, `listorder`) VALUES (2, '天智软件', 'http://www.tintsoft.com', '', 0);
-- ----------------------------
-- Table structure for `#table#datacall`
-- ----------------------------
DROP TABLE IF EXISTS `#table#datacall`;
CREATE TABLE `#table#datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `application` char(20) DEFAULT NULL,
  `do` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#datacall
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `#table#dbsource`;
CREATE TABLE `#table#dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#downserver`
-- ----------------------------
DROP TABLE IF EXISTS `#table#downserver`;
CREATE TABLE `#table#downserver` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#downserver
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#favorite`
-- ----------------------------
DROP TABLE IF EXISTS `#table#favorite`;
CREATE TABLE `#table#favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#hits`
-- ----------------------------
DROP TABLE IF EXISTS `#table#hits`;
CREATE TABLE `#table#hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `#table#ipbanned`;
CREATE TABLE `#table#ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#keylink`
-- ----------------------------
DROP TABLE IF EXISTS `#table#keylink`;
CREATE TABLE `#table#keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#keylink
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#link`
-- ----------------------------
DROP TABLE IF EXISTS `#table#link`;
CREATE TABLE `#table#link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#linkage`
-- ----------------------------
DROP TABLE IF EXISTS `#table#linkage`;
CREATE TABLE `#table#linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#member`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member`;
CREATE TABLE `#table#member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ucenterid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `mobile` char(11) DEFAULT '',
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`(20)) USING BTREE,
  KEY `ucenterid` (`ucenterid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#member_bind`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member_bind`;
CREATE TABLE `#table#member_bind` (
  `userid` mediumint(8) unsigned NOT NULL,
  `connectid` char(32) NOT NULL,
  `token` char(50) NOT NULL,
  `token_secret` char(50) NOT NULL,
  `name` char(50) NOT NULL,
  `form` char(10) NOT NULL,
  `addtime` int(10) NOT NULL,
  KEY `userid` (`userid`) USING BTREE,
  KEY `connectid` (`connectid`,`form`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member_detail`;
CREATE TABLE `#table#member_detail` (
  `userid` mediumint(8) unsigned NOT NULL,
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#member_group`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member_group`;
CREATE TABLE `#table#member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `total` mediumint(8) NOT NULL DEFAULT '0',
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=8;

-- ----------------------------
-- Records of #table#member_group
-- ----------------------------
INSERT INTO `#table#member_group` VALUES ('1', '游客', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('2', '禁止访问', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('3', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('4', '新手上路', '1', '1', '50', '0', '100', '0', '1', '0', '1', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('5', '注册会员', '1', '2', '100', '0', '150', '0', '1', '0', '1', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('6', '中级会员', '1', '3', '150', '0', '500', '0', '1', '0', '1', '1', '1', '0', '1', '500.00', '60.00', '1.00', '', '', '', '0', '0');
INSERT INTO `#table#member_group` VALUES ('7', '高级会员', '1', '4', '300', '0', '999', '0', '1', '0', '1', '1', '1', '0', '1', '360.00', '90.00', '5.00', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `#table#member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member_menu`;
CREATE TABLE `#table#member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `application` char(20) NOT NULL DEFAULT '',
  `controller` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `module` (`application`,`controller`,`action`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4;

-- ----------------------------
-- Records of #table#member_menu
-- ----------------------------
INSERT INTO `#table#member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '0', '');
INSERT INTO `#table#member_menu` VALUES ('2', 'account_manage', '0', 'member', 'account', 'init', 't=1', '0', '1', '0', '');
INSERT INTO `#table#member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `#table#member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `#table#member_verify`;
CREATE TABLE `#table#member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` char(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`(20)) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#message`
-- ----------------------------
DROP TABLE IF EXISTS `#table#message`;
CREATE TABLE `#table#message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`) USING BTREE,
  KEY `replyid` (`replyid`) USING BTREE,
  KEY `folder` (`send_from_id`,`folder`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#message
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#message_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#message_data`;
CREATE TABLE `#table#message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#message_data
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#message_group`
-- ----------------------------
DROP TABLE IF EXISTS `#table#message_group`;
CREATE TABLE `#table#message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#message_group
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#model`
-- ----------------------------
DROP TABLE IF EXISTS `#table#model`;
CREATE TABLE `#table#model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) DEFAULT NULL,
  `category_template` char(30) DEFAULT NULL,
  `list_template` char(30) DEFAULT NULL,
  `show_template` char(30) DEFAULT NULL,
  `js_template` varchar(30) DEFAULT '',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=2;

-- ----------------------------
-- Records of #table#model
-- ----------------------------
INSERT INTO `#table#model` VALUES(1, '文章模型', '文章模型', 'news', '', 0, 0, 1, 0, 'default', 'category', 'list', 'show', '', 0, 0);
INSERT INTO `#table#model` VALUES(2, '下载模型', '下载模型', 'download', '', 0, 0, 1, 0, 'default', 'category_download', 'list_download', 'show_download', '', 0, 0);
INSERT INTO `#table#model` VALUES(3, '图片模型', '图片模型', 'picture', '', 0, 0, 1, 0, 'default', 'category_picture', 'list_picture', 'show_picture', '', 0, 0);
INSERT INTO `#table#model` VALUES(4, '产品模型', '产品模型', 'product', null, '0', '0', '1', '0', 'default', 'category_product', 'list_product', 'show_product', '', '0', '0');
INSERT INTO `#table#model` VALUES(5, '注册会员', '注册会员', 'member_detail', null, '0', '0', '1', '0', null, null, null, null, '', '0', '2');
-- ----------------------------
-- Table structure for `#table#model_field`
-- ----------------------------
DROP TABLE IF EXISTS `#table#model_field`;
CREATE TABLE `#table#model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`) USING BTREE,
  KEY `field` (`field`,`modelid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=98;

-- ----------------------------
-- Records of #table#model_field
-- ----------------------------
INSERT INTO `#table#model_field` VALUES ('1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `#table#model_field` VALUES ('2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `#table#model_field` VALUES ('3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `#table#model_field` VALUES ('4', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('5', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `#table#model_field` VALUES ('6', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `#table#model_field` VALUES ('7', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `#table#model_field` VALUES ('8', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('9', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?app=vote&controller=vote&action=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?app=vote&controller=vote&action=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n \'defaultvalue\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '0', '0');
INSERT INTO `#table#model_field` VALUES ('10', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `#table#model_field` VALUES ('11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('12', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `#table#model_field` VALUES ('13', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `#table#model_field` VALUES ('14', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `#table#model_field` VALUES ('15', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('16', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `#table#model_field` VALUES ('17', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `#table#model_field` VALUES ('18', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('19', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?app=content&controller=content&action=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n \'defaultvalue\' => \'0\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `#table#model_field` VALUES ('20', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `#table#model_field` VALUES ('21', '1', 'copyfrom', '来源', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `#table#model_field` VALUES ('22', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `#table#model_field` VALUES ('23', '2', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `#table#model_field` VALUES ('24', '2', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `#table#model_field` VALUES ('25', '2', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `#table#model_field` VALUES ('26', '2', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `#table#model_field` VALUES ('27', '2', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `#table#model_field` VALUES ('28', '2', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `#table#model_field` VALUES ('29', '2', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('30', '2', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('31', '2', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?app=content&controller=content&action=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `#table#model_field` VALUES ('32', '2', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `#table#model_field` VALUES ('33', '2', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('34', '2', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `#table#model_field` VALUES ('35', '2', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `#table#model_field` VALUES ('36', '2', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `#table#model_field` VALUES ('37', '2', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `#table#model_field` VALUES ('38', '2', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `#table#model_field` VALUES ('39', '2', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `#table#model_field` VALUES ('40', '2', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('41', '2', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('42', '2', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `#table#model_field` VALUES ('43', '2', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `#table#model_field` VALUES ('44', '2', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `#table#model_field` VALUES ('45', '2', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n    <option value=\'WinXP\'>WinXP</option>\r\n  <option value=\'Vista\'>Windows 7</option>\r\n  <option value=\'Win2000\'>Win2000</option>\r\n  <option value=\'Win2003\'>Win2003</option>\r\n  <option value=\'Unix\'>Unix</option>\r\n    <option value=\'Linux\'>Linux</option>\r\n  <option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('46', '2', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `#table#model_field` VALUES ('47', '2', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('48', '2', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('49', '2', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('50', '2', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('51', '2', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('52', '3', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `#table#model_field` VALUES ('53', '3', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `#table#model_field` VALUES ('54', '3', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `#table#model_field` VALUES ('55', '3', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `#table#model_field` VALUES ('56', '3', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `#table#model_field` VALUES ('57', '3', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `#table#model_field` VALUES ('58', '3', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('59', '3', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `#table#model_field` VALUES ('60', '3', 'relation', '相关组图', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?app=content&controller=content&action=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `#table#model_field` VALUES ('61', '3', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('62', '3', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('63', '3', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `#table#model_field` VALUES ('64', '3', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `#table#model_field` VALUES ('65', '3', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `#table#model_field` VALUES ('66', '3', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `#table#model_field` VALUES ('67', '3', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `#table#model_field` VALUES ('68', '3', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `#table#model_field` VALUES ('69', '3', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('70', '3', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('71', '3', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `#table#model_field` VALUES ('72', '3', 'pictureurls', '组图', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `#table#model_field` VALUES ('73', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `#table#model_field` VALUES ('74', '2', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `#table#model_field` VALUES ('75', '3', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `#table#model_field` VALUES ('76', '4', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '4', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `#table#model_field` VALUES ('77', '4', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `#table#model_field` VALUES ('78', '4', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '4', '1', '4', '1', '1', '4', '0', '0');
INSERT INTO `#table#model_field` VALUES ('79', '4', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '4', '1', '4', '1', '0', '7', '0', '0');
INSERT INTO `#table#model_field` VALUES ('80', '4', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '4', '1', '1', '10', '0', '0');
INSERT INTO `#table#model_field` VALUES ('81', '4', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '4', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `#table#model_field` VALUES ('82', '4', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '4', '1', '0', '13', '0', '0');
INSERT INTO `#table#model_field` VALUES ('83', '4', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `#table#model_field` VALUES ('84', '4', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?app=content&controller=content&action=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `#table#model_field` VALUES ('85', '4', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `#table#model_field` VALUES ('86', '4', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `#table#model_field` VALUES ('87', '4', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `#table#model_field` VALUES ('88', '4', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `#table#model_field` VALUES ('89', '4', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '4', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `#table#model_field` VALUES ('90', '4', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '4', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `#table#model_field` VALUES ('91', '4', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `#table#model_field` VALUES ('92', '4', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `#table#model_field` VALUES ('93', '4', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '4', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('94', '4', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `#table#model_field` VALUES ('95', '4', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '4', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `#table#model_field` VALUES ('96', '4', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `#table#model_field` VALUES ('97', '5', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
-- ----------------------------
-- Table structure for `#table#mood`
-- ----------------------------
DROP TABLE IF EXISTS `#table#mood`;
CREATE TABLE `#table#mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`) USING BTREE,
  KEY `lastupdate` (`lastupdate`) USING BTREE,
  KEY `catid` (`catid`,`contentid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#mood
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#news`
-- ----------------------------
DROP TABLE IF EXISTS `#table#news`;
CREATE TABLE `#table#news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) DEFAULT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#news_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#news_data`;
CREATE TABLE `#table#news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) DEFAULT NULL,
  `paginationtype` tinyint(1) DEFAULT NULL,
  `maxcharperpage` mediumint(6) DEFAULT NULL,
  `template` varchar(30) DEFAULT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` int(10) unsigned NOT NULL DEFAULT '0',
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `#table#picture`;
CREATE TABLE IF NOT EXISTS `#table#picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned DEFAULT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) DEFAULT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `#table#picture_data`;
CREATE TABLE IF NOT EXISTS `#table#picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) DEFAULT NULL,
  `paginationtype` tinyint(1) DEFAULT NULL,
  `maxcharperpage` mediumint(6) DEFAULT NULL,
  `template` varchar(30) DEFAULT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `#table#download`;
CREATE TABLE `#table#download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) DEFAULT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `#table#download_data`;
CREATE TABLE `#table#download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) DEFAULT NULL,
  `paginationtype` tinyint(1) DEFAULT '0',
  `maxcharperpage` mediumint(6) DEFAULT '5000',
  `template` varchar(30) DEFAULT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `yun_product`
-- ----------------------------

DROP TABLE IF EXISTS `#table#product`;
CREATE TABLE `#table#product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) DEFAULT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `yun_product_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#product_data`;
CREATE TABLE `#table#product_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) DEFAULT NULL,
  `paginationtype` tinyint(1) DEFAULT NULL,
  `maxcharperpage` mediumint(6) DEFAULT NULL,
  `template` varchar(30) DEFAULT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for `#table#page`
-- ----------------------------
DROP TABLE IF EXISTS `#table#page`;
CREATE TABLE `#table#page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `#table#pay_account`;
CREATE TABLE `#table#pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `#table#pay_payment`;
CREATE TABLE `#table#pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `#table#pay_spend`;
CREATE TABLE `#table#pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `creat_at` (`creat_at`) USING BTREE,
  KEY `logo` (`logo`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#position`
-- ----------------------------
DROP TABLE IF EXISTS `#table#position`;
CREATE TABLE `#table#position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#position
-- ----------------------------
INSERT INTO `#table#position` VALUES ('1', '0', '0', '首页焦点图推荐', '20', '', '1');
INSERT INTO `#table#position` VALUES ('2', '0', '0', '首页头条推荐', '20', '', '2');
INSERT INTO `#table#position` VALUES ('3', '0', '0', '网站顶部推荐', '20', '', '0');
-- ----------------------------
-- Table structure for `#table#position_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#position_data`;
CREATE TABLE `#table#position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `application` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#position_data
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#poster`
-- ----------------------------
DROP TABLE IF EXISTS `#table#poster`;
CREATE TABLE `#table#poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`disabled`,`listorder`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#poster
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#poster_space`
-- ----------------------------
DROP TABLE IF EXISTS `#table#poster_space`;
CREATE TABLE `#table#poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#poster_space
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#search`
-- ----------------------------
DROP TABLE IF EXISTS `#table#search`;
CREATE TABLE `#table#search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`) USING BTREE,
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `#table#search_keyword`;
CREATE TABLE `#table#search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`) USING BTREE,
  UNIQUE KEY `pinyin` (`pinyin`) USING BTREE,
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#session`
-- ----------------------------
DROP TABLE IF EXISTS `#table#session`;
CREATE TABLE `#table#session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `application` char(20) NOT NULL,
  `controller` char(20) NOT NULL,
  `action` char(30) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY;

-- ----------------------------
-- Table structure for `#table#special`
-- ----------------------------
DROP TABLE IF EXISTS `#table#special`;
CREATE TABLE `#table#special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#special
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#special_content`
-- ----------------------------
DROP TABLE IF EXISTS `#table#special_content`;
CREATE TABLE `#table#special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`) USING BTREE,
  KEY `typeid` (`typeid`,`isdata`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#special_content
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#special_c_data`;
CREATE TABLE `#table#special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `#table#sphinx_counter`;
CREATE TABLE `#table#sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#tag`
-- ----------------------------
DROP TABLE IF EXISTS `#table#tag`;
CREATE TABLE `#table#tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `application` char(20) NOT NULL,
  `do` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `#table#template_bak`;
CREATE TABLE `#table#template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#times`
-- ----------------------------
DROP TABLE IF EXISTS `#table#times`;
CREATE TABLE `#table#times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY;

-- ----------------------------
-- Records of #table#times
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#type`
-- ----------------------------
DROP TABLE IF EXISTS `#table#type`;
CREATE TABLE `#table#type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `application` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL DEFAULT '',
  `url` char(100) NOT NULL DEFAULT '',
  `template` char(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`),
  KEY `application` (`application`,`parentid`,`listorder`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#type
-- ----------------------------
INSERT INTO `#table#type` VALUES ('1', 'search', '1', '资讯', '0', '', '', '', '0', '');
INSERT INTO `#table#type` VALUES ('2', 'search', '3', '图片', '0', '', '', '', '0', '');
INSERT INTO `#table#type` VALUES ('3', 'search', '4', '产品', '0', '', '', '', '0', '');
INSERT INTO `#table#type` VALUES ('4', 'search', '2', '下载', '0', '', '', '', '0', '');
-- ----------------------------
-- Table structure for `#table#urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `#table#urlrule`;
CREATE TABLE `#table#urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=11;

-- ----------------------------
-- Records of #table#urlrule
-- ----------------------------
INSERT INTO `#table#urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `#table#urlrule` VALUES ('2', 'content', 'category', '0', 'index.php?app=content&controller=index&action=lists&catid={$catid}|index.php?app=content&controller=index&action=lists&catid={$catid}&page={$page}', 'index.php?app=content&controller=index&action=lists&catid=1&page=1');
INSERT INTO `#table#urlrule` VALUES ('3', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `#table#urlrule` VALUES ('4', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `#table#urlrule` VALUES ('5', 'content', 'show', '0', 'index.php?app=content&controller=index&action=show&catid={$catid}&id={$id}|index.php?app=content&controller=index&action=show&catid={$catid}&id={$id}&page={$page}', 'index.php?app=content&controller=index&action=show&catid=1&id=1');
INSERT INTO `#table#urlrule` VALUES ('6', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `#table#urlrule` VALUES ('7', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `#table#urlrule` VALUES ('8', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');
INSERT INTO `#table#urlrule` VALUES ('9', 'content', 'category', 0, 'content/index/lists?catid={$catid}|content/index/lists?catid={$catid}&page={$page}', 'content/index/lists?catid=1&page=1');
INSERT INTO `#table#urlrule` VALUES ('10', 'content', 'show', 0, 'content/index/show?catid={$catid}&id={$id}|content/index/show?catid={$catid}&id={$id}&page={$page}', 'content/index/show?catid=1&id=1');

-- ----------------------------
-- Table structure for `#table#vote_data`
-- ----------------------------
DROP TABLE IF EXISTS `#table#vote_data`;
CREATE TABLE `#table#vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#vote_data
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `#table#vote_option`;
CREATE TABLE `#table#vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#vote_subject`
-- ----------------------------
DROP TABLE IF EXISTS `#table#vote_subject`;
CREATE TABLE `#table#vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`) USING BTREE,
  KEY `fromdate` (`fromdate`,`todate`) USING BTREE,
  KEY `todate` (`todate`) USING BTREE
) ENGINE=MyISAM;

-- ----------------------------
-- Records of #table#vote_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `#table#wap_type`
-- ----------------------------
DROP TABLE IF EXISTS `#table#wap_type`;
CREATE TABLE `#table#wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for `#table#queue`
-- ----------------------------
DROP TABLE IF EXISTS `#table#queue`;
CREATE TABLE IF NOT EXISTS `#table#queue` (
  `queueid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`queueid`)
) ENGINE=MEMORY;

-- ----------------------------
-- Table structure for `#table#workflow`
-- ----------------------------
DROP TABLE IF EXISTS `#table#workflow`;
CREATE TABLE `#table#workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5;

-- ----------------------------
-- Records of #table#workflow
-- ----------------------------
INSERT INTO `#table#workflow` VALUES ('1', '1', '一级审核', '一级审核', 'array (\n  1 => \'\',\n  2 => \'\',\n  3 => \'\',\n  4 => \'\',\n  \'nocheck_users\' => \'\',\n)', '0');
INSERT INTO `#table#workflow` VALUES ('2', '2', '二级审核', '二级审核', 'array (\n  1 => \'\',\n  2 => \'\',\n  3 => \'\',\n  4 => \'\',\n  \'nocheck_users\' => \'\',\n)', '0');
INSERT INTO `#table#workflow` VALUES ('3', '3', '三级审核', '三级审核', 'array (\n  1 => \'\',\n  2 => \'\',\n  3 => \'\',\n  4 => \'\',\n  \'nocheck_users\' => \'\',\n)', '0');
INSERT INTO `#table#workflow` VALUES ('4', '4', '四级审核', '四级审核', 'array (\n  1 => \'\',\n  2 => \'\',\n  3 => \'\',\n  4 => \'\',\n  \'nocheck_users\' => \'\',\n)', '0');