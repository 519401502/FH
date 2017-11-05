/*
Navicat MySQL Data Transfer

Source Server         : loc
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : numysql

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2017-08-03 18:17:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `INVITECODE` varchar(32) DEFAULT NULL,
  `REF_USERID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('212a6765fddc4430941469e1ec8c8e6c', '人事部', '001', '1', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_001');
INSERT INTO `sys_dictionaries` VALUES ('3cec73a7cc8a4cb79e3f6ccc7fc8858c', '行政部', '002', '2', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_002');
INSERT INTO `sys_dictionaries` VALUES ('48724375640341deb5ef01ac51a89c34', '北京', 'dq001', '1', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_dq001');
INSERT INTO `sys_dictionaries` VALUES ('5a1547632cca449db378fbb9a042b336', '研发部', '004', '4', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_004');
INSERT INTO `sys_dictionaries` VALUES ('7f9cd74e60a140b0aea5095faa95cda3', '财务部', '003', '3', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_003');
INSERT INTO `sys_dictionaries` VALUES ('b861bd1c3aba4934acdb5054dd0d0c6e', '科技不', 'kj', '7', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_kj');
INSERT INTO `sys_dictionaries` VALUES ('c067fdaf51a141aeaa56ed26b70de863', '部门', 'BM', '1', '0', '1', 'BM');
INSERT INTO `sys_dictionaries` VALUES ('cdba0b5ef20e4fc0a5231fa3e9ae246a', '地区', 'DQ', '2', '0', '1', 'DQ');
INSERT INTO `sys_dictionaries` VALUES ('f184bff5081d452489271a1bd57599ed', '上海', 'SH', '2', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_SH');
INSERT INTO `sys_dictionaries` VALUES ('f30bf95e216d4ebb8169ff0c86330b8f', '客服部', '006', '6', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_006');

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-desktop', '1');
INSERT INTO `sys_menu` VALUES ('2', '组织管理', 'role.do', '1', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('4', '会员管理', 'appusera0/list.do', '1', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', null, '1');
INSERT INTO `sys_menu` VALUES ('22', '应用管理', '#', '0', '5', 'icon-th', '1');
INSERT INTO `sys_menu` VALUES ('23', '首页管理', 'home/list.do', '22', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('24', '商品管理', 'goods/list.do', '22', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('25', '订单管理', 'order/list.do', '22', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '公告管理', 'notice/list.do', '22', '6', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '广播管理', 'broad/list.do', '22', '7', null, '1');
INSERT INTO `sys_menu` VALUES ('28', '排名管理', 'ranking/list.do', '22', '8', null, '1');
INSERT INTO `sys_menu` VALUES ('29', '提现管理', 'withdrawals/list.do', '22', '9', null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '1073741814', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '1073741814', '1', '31490022', '32505842', '34', '32505846', '2');
INSERT INTO `sys_role` VALUES ('4', '用户组', '118', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6');
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444');
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '管理员B', '1073741814', '1', '246', '0', '0', '0', '7dfd8d1f7b6245d283217b7e63eec9b2');
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '1073741814', '1', '54', '54', '0', '246', 'ac66961adaa2426da4470c72ffeec117');
INSERT INTO `sys_role` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3');
INSERT INTO `sys_role` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-08-03 18:08:55', '115.57.143.140', '0', '最高统治者', 'default', 'admin@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('1fd803493f5149318215a42a49e7a3d8', '齐海霞', 'b5e5693b78d45034206f3fb93407ca95a3ece6db', '齐海霞', '', 'e74f713314154c35bd7fc98897859fe3', '', '', '0', '我是会员', 'default', '377297160@qq.com', '4001', '13849190730');
INSERT INTO `sys_user` VALUES ('cd34d355487146d18b2f6db50ba2f4b1', '小白', 'e1c6632632cee7bcb00a4d80ff31ed5aec1d6bd6', '白居易', '', 'e74f713314154c35bd7fc98897859fe3', '', '', '0', '黄金用户', 'default', 'qihaixia030766@126.com', '4002', '15516984878');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_appuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_appuser`;
CREATE TABLE `tb_appuser` (
  `USER_ID` varchar(100) NOT NULL,
  `NICK_NAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `INVITECODE` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `REF_USERID` varchar(255) DEFAULT NULL COMMENT '上级邀请人',
  `BALANCE` varchar(255) DEFAULT NULL COMMENT '余额',
  `INVITE_NUM` int(11) DEFAULT '0' COMMENT '邀请人数量',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_appuser
-- ----------------------------
INSERT INTO `tb_appuser` VALUES ('153d23c6bfff4d2f86318a84f200d391', 'AML8318', '13938298318', '2017-08-03 17:14:05', '273808', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('18d9af4c8c8b4fcfa467d99ca9b23cfd', 'AML6884', '13783376884', '2017-08-03 17:19:10', '726313', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('1c45e7284d4a4a6bb898acb1b8992e63', 'AML0361', '15617560361', '2017-08-03 16:59:52', '714094', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('2cc14b620bb140b18b57259e88befe6d', 'AML0527', '18539960527', '2017-08-03 17:14:40', '775890', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('33a84151b5fc492f97210835c351aded', 'AML5802', '17737465802', '2017-08-03 16:46:36', '643002', null, '0', '1');
INSERT INTO `tb_appuser` VALUES ('39bc9e5bcaa74f14a95e2c25b1e82512', 'AML3064', '13592573064', '2017-08-03 17:15:56', '763316', 'c13de0ffb08d4886be79ed6483f3aa52', '0', '0');
INSERT INTO `tb_appuser` VALUES ('415e966228dd4fc7ac9cbb16c534f48b', 'AML2300', '13223032300', '2017-08-03 17:19:05', '714237', '5922c26fb2404ca8bf12e1ae9b271f34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('4f5d9bb9a9fb434aae76d6a72645fd34', 'AML3361', '15138933361', '2017-08-03 17:12:27', '370036', '5922c26fb2404ca8bf12e1ae9b271f34', '0', '2');
INSERT INTO `tb_appuser` VALUES ('577ad4284cf047b58be62c1a79f32556', 'AML8849', '17839918849', '2017-08-03 16:58:53', '541674', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('5922c26fb2404ca8bf12e1ae9b271f34', 'AML8099', '18639008099', '2017-08-03 16:57:27', '519415', '8fd393ef3e8b4702977939507d7630d0', '0', '4');
INSERT INTO `tb_appuser` VALUES ('5b5ac9b58a9b444ca7d905ac87a89496', '5356', '15839825356', '2017-08-03 16:47:33', '114334', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('619b3dc4509f4cbd80420979e70beac9', 'AML3779', '18336323779', '2017-08-03 16:49:01', '768670', '33a84151b5fc492f97210835c351aded', '0', '0');
INSERT INTO `tb_appuser` VALUES ('676650d042ed45aa84d21343657d6a17', 'AML3497', '13243233497', '2017-08-03 17:48:57', '', '5922c26fb2404ca8bf12e1ae9b271f34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('70f1f57fe3774bd885c6f0dadd0aee88', '小小马', '15607662257', '2017-08-03 18:09:05', '821981', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('744d7db5bdce42a0a304fd33cb20c482', 'AML6991', '18848956991', '2017-08-03 17:15:09', '560590', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('8b2e85e543b74d5095fae32b405bec07', '闲不住闲先生', '18037162577', '2017-08-03 17:05:31', '654651', 'c13de0ffb08d4886be79ed6483f3aa52', '0', '0');
INSERT INTO `tb_appuser` VALUES ('8fd393ef3e8b4702977939507d7630d0', 'AML5546', '15838805546', '2017-08-03 16:56:16', '278489', null, '0', '2');
INSERT INTO `tb_appuser` VALUES ('8fe26ef22b974baa83d990e99b5da87b', 'AML7505', '15824877505', '2017-08-03 17:05:44', '659371', '922faf7a722c4192b38ef46ba5076b73', '0', '0');
INSERT INTO `tb_appuser` VALUES ('913f3573cfc6491e86eea78300983c49', 'AML5003', '15637185003', '2017-08-03 17:02:05', '336847', '5922c26fb2404ca8bf12e1ae9b271f34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('922faf7a722c4192b38ef46ba5076b73', 'AML0199', '18003840199', '2017-08-03 16:54:12', '789136', null, '0', '1');
INSERT INTO `tb_appuser` VALUES ('9418e9e5d0f745c0812b878c04d03109', 'AML9982', '18039989982', '2017-08-03 17:29:55', '159093', '4f5d9bb9a9fb434aae76d6a72645fd34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('973fa5cce2cd47889d3ea9d09f7f3896', 'AML7695', '15903627695', '2017-08-03 17:18:56', '520537', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('aeae11097a8349998d44ce13b6d29efe', 'AML7617', '13353887617', '2017-08-03 16:59:20', '411396', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('af41fcf201ba4770bc7d7388c710de3c', 'AML7948', '18738037948', '2017-08-03 17:15:59', '577851', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('b3e18807b7214dd48c71361109650947', 'AML0575', '13283870575', '2017-08-03 17:17:41', '397304', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('b9cfe8a28273440eae0df6c8fcd377e5', 'AML3772', '18538533772', '2017-08-03 17:04:16', '840082', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('ba4012c5fd0a4762a372106dc09ca748', 'AML2510', '15139832510', '2017-08-03 17:15:25', '632570', '4f5d9bb9a9fb434aae76d6a72645fd34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('bc927d38c3e646bb910e8bf3da548254', 'AML1218', '15537151218', '2017-08-03 17:17:35', '633943', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('c13de0ffb08d4886be79ed6483f3aa52', '大奔', '18937118699', '2017-08-03 16:58:08', '897724', null, '0', '2');
INSERT INTO `tb_appuser` VALUES ('c5675d2a6cb74878824a6c5f8e016ca2', 'AML4866', '18639844866', '2017-08-03 17:05:33', '811941', '5922c26fb2404ca8bf12e1ae9b271f34', '0', '0');
INSERT INTO `tb_appuser` VALUES ('d8b7e117daec41ea995b47b06297d709', 'AML7151', '18337157151', '2017-08-03 17:02:57', '227327', null, '0', '0');
INSERT INTO `tb_appuser` VALUES ('fa786c0d727744c99624700b9000071f', '小马', '13203871318', '2017-08-03 18:04:31', '891956', null, '0', '0');

-- ----------------------------
-- Table structure for tb_broad
-- ----------------------------
DROP TABLE IF EXISTS `tb_broad`;
CREATE TABLE `tb_broad` (
  `BROAD_ID` varchar(100) NOT NULL,
  `BROAD_CONTENT` varchar(1000) DEFAULT NULL COMMENT '广播内容',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '广播建立时间',
  `CTYPE` int(11) NOT NULL COMMENT '广播类型',
  PRIMARY KEY (`BROAD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_broad
-- ----------------------------
INSERT INTO `tb_broad` VALUES ('2a12efe6679643bf908a3a10a05c6594', '大伙加油，在努力一下，将会产生2000元的幸运星奖金！！！！', '2017-07-31 18:06:28', '0');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `GOODS_ID` varchar(100) NOT NULL,
  `GNAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `GPRICE` varchar(255) DEFAULT NULL COMMENT '商品价格',
  `GNOW_PRICE` varchar(255) DEFAULT NULL COMMENT '现价',
  `GDESC` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `GPIC_PATH` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `GPIC_SALE` int(11) DEFAULT NULL COMMENT '商品销量',
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', '298', '198', '', '', null);

-- ----------------------------
-- Table structure for tb_home
-- ----------------------------
DROP TABLE IF EXISTS `tb_home`;
CREATE TABLE `tb_home` (
  `HOME_ID` varchar(100) NOT NULL,
  `PIC1` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `PIC2` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `PIC3` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`HOME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_home
-- ----------------------------
INSERT INTO `tb_home` VALUES ('5f2935b795b84536a89ff1640c583468', 'home/7a80b069b17d434f9a60963a3ce905d1.png', 'home/6006b1f380c14684a3a5673d8a89398d.jpg', '', '2017-08-03 18:07:06');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `NOTICE_ID` varchar(100) NOT NULL,
  `NOTICE_CONTENT` varchar(1000) DEFAULT NULL COMMENT '公告内容',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '建立日期',
  `CTYPE` int(11) NOT NULL COMMENT '公告类型',
  PRIMARY KEY (`NOTICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('61552b2970ba4e6491f349d7c5c926e2', '激情盛夏，热力绽放。米伦科技为回馈新老客户，特推出有奖销售活动：公司每销售25套产品，即拿出2000元作为奖金，奖励给对产品宣传推广做出突出贡献的客户。’\r\n详情见规则', '2017-07-31 18:06:13', '0');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ORDER_ID` varchar(100) NOT NULL,
  `ACCOUNT_ID` varchar(255) DEFAULT NULL COMMENT '账号ID',
  `PAY_TYPE` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `CARRY` varchar(255) DEFAULT NULL COMMENT '运送方式',
  `REBATE` varchar(255) DEFAULT NULL COMMENT '折扣',
  `CREATE_DATE` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '审核状态',
  `REFUND_STATUS` varchar(255) DEFAULT NULL COMMENT '退款状态',
  `PAY_STATUS` varchar(255) DEFAULT NULL COMMENT '支付状态',
  `LOW_STOCKS` varchar(255) DEFAULT NULL COMMENT '库存余量',
  `AMOUNT` varchar(255) DEFAULT NULL COMMENT '订单总金额',
  `AMOUNT_EXCHANGE_SCORE` int(11) DEFAULT NULL COMMENT '订单总兑换积分',
  `FEE` varchar(255) DEFAULT NULL COMMENT '运费总金额',
  `PTOTAL` varchar(255) DEFAULT NULL COMMENT '商品总金额',
  `QUANTITY` varchar(255) DEFAULT NULL COMMENT '商品总数量',
  `UPDATE_AMOUNT` varchar(255) DEFAULT NULL COMMENT '是否有过修改',
  `EXPRESS_CODE` varchar(255) DEFAULT NULL COMMENT '配送方式编码',
  `EXPRESS_NAME` varchar(255) DEFAULT NULL COMMENT '配送方式名称',
  `EXPRESS_NO` varchar(255) DEFAULT NULL COMMENT '快递运单号',
  `EXPRESS_COMPANY_NAME` varchar(255) DEFAULT NULL COMMENT '快递公司名称',
  `CONFIRM_SEND_PRODUCT_REMARK` varchar(255) DEFAULT NULL COMMENT '确认发货备注',
  `OTHER_REQUIREMENT` varchar(255) DEFAULT NULL COMMENT '客户的附加要求',
  `CLOSED_COMMENT` varchar(255) DEFAULT NULL COMMENT '是否已经评论',
  `SCORE` int(11) DEFAULT NULL COMMENT '订单获赠的积分',
  `GOODS_ID` char(100) DEFAULT NULL,
  `GNAME` char(255) DEFAULT NULL,
  `GOODS_ORDERNUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('01-98be-43c7-9f03-c7246b82719f', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:11:18', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('02-00ed-4c38-9049-25df3d59e796', 'b4cb838888454d7d9fdfca600fd519d5', 'ali', null, null, '2017-08-02 20:10:47', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('02-260b-463b-8f6e-8b6344fda2d7', '6a36a9bda5414c14a77e99485c4958ac', 'wx', null, null, '2017-08-02 19:57:54', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('03-10a5-4f7b-98bb-c226f28f5ad4', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:00', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('03-3cdb-42dc-9707-a299e0da9350', 'efa15c21c046497eb784c7e4bf33d4eb', 'ali', null, null, '2017-08-02 20:10:33', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('03-7f94-44bc-9b9f-1ee1cff0e878', 'd8b7e117daec41ea995b47b06297d709', 'wx', null, null, '2017-08-03 17:03:23', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('04-07c8-4991-a238-9e40d2f91c4e', '922faf7a722c4192b38ef46ba5076b73', 'wx', null, null, '2017-08-03 16:54:45', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('04-4421-407a-97fa-e06df3abd87b', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:07:56', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('04-5771-4ca8-995a-087f2c92c77f', '0b31c480d2af43f681eedbe632ca27ea', 'ali', null, null, '2017-08-02 21:18:19', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('04-76db-4df4-bb30-ad95335d6989', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:10:59', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('05-76f2-450a-aada-810357cbbf83', 'b21c97402ad64b6da5a04cf1c3e006ba', 'ali', null, null, '2017-08-02 19:28:24', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('06-0704-48db-817e-c55c2f222361', '731a29488bc54e80855be20312fff18f', 'wx', null, null, '2017-08-02 19:55:39', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('08-d4ef-4f47-891e-9461da57d48e', '1f6b47561fa048568bb3b9a9c6ae7ee8', 'ali', null, null, '2017-08-02 19:53:39', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('09-099c-42dd-85e9-49a59bbbea58', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:44', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('0d-aa9e-4687-9957-78fbaf35b0b5', 'd9de402a67c14810abc36ac7fb0a1bfe', 'ali', null, null, '2017-08-02 20:22:41', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('0d-f0cf-4094-ad8e-e77b0b4126db', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:10:21', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('0e-e50a-415d-a31d-34e5d69daf94', '65fc991bd2684337a4a4748e90fe77b8', 'wx', null, null, '2017-08-03 16:46:48', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('0f-10ec-4035-8d22-5af83d130552', '66073f46189b4fe8bf26b70c1a34e059', 'ali', null, null, '2017-08-02 19:43:17', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('0f-5ff7-4917-a878-af71042180ae', 'f8121ee083d744098cecf5c1a7d4c6de', 'ali', null, null, '2017-08-02 19:58:48', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('10-32e8-40b3-a8ef-108764f0acff', '731a29488bc54e80855be20312fff18f', 'wx', null, null, '2017-08-02 19:54:12', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('11-84b7-483c-bd1b-c9359f683760', '2f5ab5a925e94d598c861b92caf38d2f', 'wx', null, null, '2017-08-03 10:39:52', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('11-d630-4242-a7bb-d46e65dbf3dd', 'ca05649dadce4b36bd28d27635d198f0', 'wx', null, null, '2017-08-02 19:55:31', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('12-2ea7-4123-a60e-65fe553a3cea', 'f57f33c50741469793b9eb0b23980d56', 'ali', null, null, '2017-08-02 19:46:44', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('14-ae1d-41e2-a95e-dc18b4cc21a5', '2f5ab5a925e94d598c861b92caf38d2f', 'ali', null, null, '2017-08-03 10:39:56', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('16-0801-4956-9ee6-3fb43617e790', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:36', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('16-6595-4043-a685-c32f9b12f4c9', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:34', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('19-0641-4cb9-9763-1ff340100cc0', 'f25149f4bdea47dc98501a2f01c07a19', 'ali', null, null, '2017-08-02 20:04:26', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('19-8de0-4b5c-8528-027fdca04e2c', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:16', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('19-f2b3-4587-a78a-004f57529b7e', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:47', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('1c-568f-4079-ad98-0688d29e87bd', 'ba4012c5fd0a4762a372106dc09ca748', 'wx', null, null, '2017-08-03 17:16:57', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('1d-57bd-4d1a-ac39-480fe0436d43', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:07', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('1e-698a-484a-9261-412a4342e1cd', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:35', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('1e-c901-431a-9abf-8ff7a0bed464', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:22', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('1f-3c90-43db-b04a-e3c1403cfd42', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:10:08', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('20-0e3d-4f38-901b-0886ba33de3d', '65fc991bd2684337a4a4748e90fe77b8', 'ali', null, null, '2017-08-02 19:34:13', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('22-fa77-4eab-97b2-78b7c9f2024c', '0b31c480d2af43f681eedbe632ca27ea', 'ali', null, null, '2017-08-02 21:17:55', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('24-983e-4364-88df-6a87e36a53f6', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:18', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('24-f5aa-4ec9-b67d-f86683ce01e1', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:31:58', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('24-fa86-45bf-9e9a-94e2b0a5dc76', '65fc991bd2684337a4a4748e90fe77b8', 'wx', null, null, '2017-08-02 19:33:56', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('25-8f9c-4836-96a2-482ba791e689', 'cc092ba0885b4602942ebba7565bb41f', 'ali', null, null, '2017-08-02 20:08:15', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('26-f1d6-44bf-a3e8-f4d47c6b4a72', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:23', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('27-7553-4fd6-8200-0bf8cf444ff1', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:21', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('27-c181-4d0d-8564-528facb36703', '1137714cd3b9423aa4ebc03f985f3a9f', 'ali', null, null, '2017-08-02 20:08:57', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('28-bbe4-4b73-9e20-df9c257176f2', '18ee78b124de4752ad74404f185e0af2', 'ali', null, null, '2017-08-02 19:30:38', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('29-aa32-47b8-82cf-5bc014ebcaa7', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:03:07', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2a-00a0-4178-b539-e543708b9189', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:38:39', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2a-7527-4c33-9a0e-f21887db7c05', '39bc9e5bcaa74f14a95e2c25b1e82512', 'wx', null, null, '2017-08-03 17:17:08', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2a-8655-464a-9819-bf673aefe7c0', '8e21dc8ad8924cecafd65fc76c9cff3a', 'ali', null, null, '2017-08-02 19:48:58', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2b-1e8c-4494-8a8d-123364306ec7', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:02:56', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2c-109f-4702-96d5-d0ee4b2c4eb0', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:50', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2e-2988-48ef-894b-f4337d22ca37', '72564ff9286347c2981d3afecc8460fd', 'ali', null, null, '2017-08-02 19:50:06', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2e-dd42-4328-a92b-76f789f0d1ab', 'b92b12c1088943d48636aa1e11aa1f85', 'wx', null, null, '2017-08-02 19:28:37', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('2f-3e56-4de5-92a9-4149474f666d', '619b3dc4509f4cbd80420979e70beac9', 'wx', null, null, '2017-08-03 16:50:07', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('30-3750-4557-9464-60f6272d742f', 'b4cb838888454d7d9fdfca600fd519d5', 'wx', null, null, '2017-08-02 20:10:44', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('31-36d1-40a9-a047-09cd61439832', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:41', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('34-6f83-4501-a702-80bd9a62571a', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:58', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('34-8f4b-4297-80b2-79adaeb480f7', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:52', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('35-391d-4eae-958a-559048f3dace', '64417aa7e6604accac63ff22048ba0d4', 'ali', null, null, '2017-08-02 20:05:07', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('38-dd1b-40bf-9f6d-5ebc61b49112', 'bb574f2184d042b7b8f21505a1d322eb', 'wx', null, null, '2017-08-02 21:48:17', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3a-999a-4c5a-a2ac-234bf95d9edf', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:24', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3c-c061-4891-a5e1-75d8d1e66850', 'a81970e59eec40ef873e6fab211c23a3', 'ali', null, null, '2017-08-02 20:10:08', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3d-4bb8-4e83-9707-191b83a00b2b', '91607bde84a345298317949a4f406bd8', 'ali', null, null, '2017-08-02 19:57:57', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3d-9576-41dc-b71c-fe423176dcc8', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:59', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3e-a410-4e27-a0b6-93904c894547', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:04', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3e-bf06-44e5-a3eb-b0a7af4cbaa1', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:09:18', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('3f-7a49-4dac-b956-73358244a148', 'b53480d1193b4d6f947ce32a71c157b4', 'wx', null, null, '2017-08-02 20:30:58', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('40-8f90-48fc-9878-cd9965feb68f', '8fd393ef3e8b4702977939507d7630d0', 'ali', null, null, '2017-08-03 16:56:45', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('40-c60a-44b5-b19d-2161b38d6cef', '1d20da2a948d4073af83ef2461ae8864', 'ali', null, null, '2017-08-02 19:32:27', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('41-35dc-413d-90fc-0189604fab7b', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:51', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('41-d0b9-4ca3-afff-d1a23a15e966', '9f98738c43de4568990ee80246010d00', 'ali', null, null, '2017-08-02 19:36:53', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('42-2b1f-45fa-9d87-3d096d88057d', '8710c96d32f1466b9e0e871b2f8d55b8', 'ali', null, null, '2017-08-02 19:55:36', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('45-424a-4f2e-8a77-9716511c9c33', 'd8b7e117daec41ea995b47b06297d709', 'wx', null, null, '2017-08-03 17:03:29', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('45-e233-4669-b7cc-3c33a3563716', '6f8b1f908ce9463dbcc79047c6164884', 'ali', null, null, '2017-08-02 19:33:46', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('46-122d-4cf5-ad2c-98fd9cfc4da3', '415e966228dd4fc7ac9cbb16c534f48b', 'ali', null, null, '2017-08-03 17:27:38', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('47-6ceb-4759-b5bf-dd8b17135a1e', 'ca05649dadce4b36bd28d27635d198f0', 'ali', null, null, '2017-08-02 19:55:34', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('49-0033-4109-b89d-3164db14778d', 'b458506ee20f4ebca7e566c37a3af145', 'wx', null, null, '2017-08-02 19:28:54', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4a-e1d9-408a-b443-400405831f72', '88a994f0ad7d4135aaa13bf2d1921b34', 'wx', null, null, '2017-08-02 22:04:03', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4b-2b1a-4133-811c-7b7ca23a9c3c', 'a77dee005acd476f8441ab5f4a1e5370', 'ali', null, null, '2017-08-02 19:38:32', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4b-8328-4488-9794-43ea3fe032ff', '9125d0a80ef84485ada52310f40db9cf', 'ali', null, null, '2017-08-02 20:16:57', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4d-a50d-4801-9eed-e08d58d29ea2', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:57', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4d-dfd2-4f49-b601-dd513a04f092', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:41', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('4d-ea41-4de2-b3bd-892e36ff43c2', 'b98055cd0e3844dbb58a706e0d71c86b', 'ali', null, null, '2017-08-02 19:30:21', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('50-25d7-45d4-a73d-c3ed8ed424b1', '649ff85a25b847e4a75f2cf8d49d0d38', 'wx', null, null, '2017-08-02 22:01:52', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('50-4ba3-41fa-b9e3-f7f9b910e9b9', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:04', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('50-7dfc-47f0-b097-f917f6284772', '11b87c47355b44cd9f56575b6b7a2459', 'ali', null, null, '2017-08-02 19:56:26', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('50-96ec-4f7b-b80c-f2e2479705bc', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:02:53', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('53-5591-4fc3-8302-d8d38b408a5c', 'c597ed6b4b124a87abc021acd2844bb2', 'ali', null, null, '2017-08-02 23:55:43', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('53-e3c8-46bf-91c6-bc2d6a8f7360', 'aeae11097a8349998d44ce13b6d29efe', 'wx', null, null, '2017-08-03 16:59:42', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('54-456f-493f-96ed-707bce99ab83', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 16:59:20', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('55-5493-4282-938f-6d36d90050ff', '851914d104154a569a493df95783df4a', 'ali', null, null, '2017-08-02 20:06:15', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('55-ad7a-4eea-a7ae-c3563b55776f', '2d811013a1664ac58c4e700d9d3fadf4', 'ali', null, null, '2017-08-02 21:53:57', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('55-befc-4f8c-bc16-a3dbf87c1315', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:56', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('56-9373-403a-9be5-572c7cc09f0d', '14cec38bc08a46288e4ee6ee425f1b35', 'ali', null, null, '2017-08-02 19:34:56', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('56-dbf1-4992-9a6c-233d17c14c46', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 17:00:01', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('56-f7a3-414e-b31e-14b49316fb04', '70f1f57fe3774bd885c6f0dadd0aee88', 'ali', null, null, '2017-08-03 18:09:40', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('58-2b80-47b2-b4ed-129967e0cd84', 'cb825106442a41a99cef3834c765acd1', 'wx', null, null, '2017-08-02 20:28:06', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('58-ec4c-4a9c-aab7-15cec2f2febf', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:08', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('59-0ee5-411b-8605-f1f1be2390c1', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:06', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5a-565d-448f-9f42-4af5f24f420f', 'b92b12c1088943d48636aa1e11aa1f85', 'ali', null, null, '2017-08-02 19:28:42', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5a-6ad7-4054-b742-d432eff72333', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:49', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5b-029d-4bd9-b38e-c35eaa6db127', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:49', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5b-876e-41c0-bdc7-ee0d41c03b66', '0b31c480d2af43f681eedbe632ca27ea', 'ali', null, null, '2017-08-02 21:17:05', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5d-8659-43ad-90c9-86cbcdf313e9', '2d811013a1664ac58c4e700d9d3fadf4', 'wx', null, null, '2017-08-02 21:53:13', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5d-ed6a-4b0a-8a21-57ca39de9cbc', '7ff256b20c2b436b828f15db260d8731', 'ali', null, null, '2017-08-02 19:40:46', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5e-a2fc-4146-9a0f-838883684573', '1f6b47561fa048568bb3b9a9c6ae7ee8', 'ali', null, null, '2017-08-02 19:54:07', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5e-e7f1-4d32-a15d-e64f2250b47c', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:08:58', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5f-2d56-4461-86ab-18ef3e205a50', 'fa786c0d727744c99624700b9000071f', 'wx', null, null, '2017-08-03 18:05:24', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('5f-405a-40ea-90fa-aa9d7139908d', '9418e9e5d0f745c0812b878c04d03109', 'wx', null, null, '2017-08-03 17:33:48', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('60-08e2-407f-b315-7b6347528094', '922faf7a722c4192b38ef46ba5076b73', 'wx', null, null, '2017-08-03 16:56:32', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('60-f51b-4db3-b6d6-f7b571d36d5a', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:51', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('62-0af1-45d6-a7f3-bf5979773486', '8fdff11e80b44f238d03fc1d278d2683', 'wx', null, null, '2017-08-02 21:51:04', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('62-382e-40c9-be1d-a23654d1f1fd', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:09:32', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('63-ab12-4456-9d44-4896a5d0d47d', 'f969eecc1dfa4fd69cf7777563ad53e3', 'ali', null, null, '2017-08-02 20:09:48', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('65-d018-41af-988a-c3fd35d0e9cf', 'af41fcf201ba4770bc7d7388c710de3c', 'wx', null, null, '2017-08-03 17:16:06', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('66-3f81-4c72-b38b-3cb70a8d7346', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:32:01', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('67-df1c-403d-9e88-db38e7221aa9', 'fd63ac32db60474fbe27ae034817a2ed', 'ali', null, null, '2017-08-02 19:29:22', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6a-4167-4008-88f6-2d4cc9068e25', 'ee8e74184f1d4986a770ac6fa68b21d4', 'wx', null, null, '2017-08-02 21:59:11', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6b-98e6-4d1d-9913-6c1254d0b7c3', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:42', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6c-cf39-40c6-a80f-111dee262791', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:09', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6d-8231-466d-a2d0-187fb3f04a55', '88a994f0ad7d4135aaa13bf2d1921b34', 'wx', null, null, '2017-08-02 22:04:32', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6d-92a1-487a-b7ce-b315d9e5edc2', '1df00cb052be404d9b0f0874ea32ae58', 'ali', null, null, '2017-08-02 19:28:49', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('6d-d6a1-467c-9b81-5e055fdbd13a', '731a29488bc54e80855be20312fff18f', 'wx', null, null, '2017-08-02 19:54:23', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('71-18cd-4c42-a47c-7ad91b10ff8b', '744d7db5bdce42a0a304fd33cb20c482', 'ali', null, null, '2017-08-03 17:16:12', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('71-1a3c-45db-a67e-c523a9a905be', 'ba4012c5fd0a4762a372106dc09ca748', 'ali', null, null, '2017-08-03 17:17:16', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('71-2e8f-47da-885a-783d6067d137', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:58', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('72-20f2-4782-aca4-8c09722b68ac', '6ff40f4b6b7a4827955eb2c2e7e4dcb2', 'ali', null, null, '2017-08-02 20:19:54', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('74-b6ed-45a3-8a07-83a0960626c7', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:27', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('74-e569-4d59-af59-8dfee432e034', 'a6d0d8b7ea2e49b68f3bb6bb31dade80', 'ali', null, null, '2017-08-02 19:58:51', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('75-a105-4284-b2a9-f625aff90b1d', '3f41313ea6a24515a1f3b0d78c580a51', 'ali', null, null, '2017-08-02 20:02:58', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('75-c92e-41fe-9ebb-8faa487ff1b7', '153d23c6bfff4d2f86318a84f200d391', 'wx', null, null, '2017-08-03 17:14:26', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('77-87b4-4277-9c84-77d589150ece', '77bb1a09648b4bbc914d046ef9dbca82', 'ali', null, null, '2017-08-03 10:51:08', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('78-289b-4f8e-a527-9242882f63b2', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:40', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('78-3f0c-4a14-8330-7f2c9e233f30', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 16:59:36', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('78-b3d4-4bee-864c-1717b06b7773', '224446be47d84373bbecd29e21ee5b9b', 'ali', null, null, '2017-08-02 19:34:07', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('79-0175-4bec-9f3e-bc5c6fdf2e1b', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:38', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('79-0d8c-4c5e-a08e-c7fb28a7cc92', '649ff85a25b847e4a75f2cf8d49d0d38', 'wx', null, null, '2017-08-02 22:00:47', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('79-8a54-483b-b788-cbb9ad839f45', 'b21c97402ad64b6da5a04cf1c3e006ba', 'ali', null, null, '2017-08-02 19:47:21', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('7b-927b-4bdf-b684-d06d478a4949', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 17:00:16', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('7b-d5e0-4222-8cc3-d6857093d6ae', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:17:10', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('7c-0ed8-4d9b-a7c6-d427c47f492d', '633f41ddd30544409adff8b123c05eb0', 'ali', null, null, '2017-08-02 19:57:43', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('7d-c47f-4d42-8866-ce7b1eb1006b', '8b2e85e543b74d5095fae32b405bec07', 'ali', null, null, '2017-08-03 17:10:12', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('80-6451-4398-854a-1aa458592cc4', '744d2e04a57449a8819e35e018d7ff81', 'ali', null, null, '2017-08-02 19:33:04', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('83-a13d-4b31-9d5f-dcb6e5dab09e', '5fb32c39aa92479cbd4a4d166af7998b', 'ali', null, null, '2017-08-02 23:59:13', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('84-bef6-4ba8-9bbb-411565fe265f', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:16', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('86-89c7-41a3-9a8a-2709aed20c46', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:17:43', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('86-e988-4897-9c79-184cdb69a311', '33a84151b5fc492f97210835c351aded', 'wx', null, null, '2017-08-03 16:46:55', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('87-a3ec-4747-a8ed-0e0f122fe614', '8fe26ef22b974baa83d990e99b5da87b', 'ali', null, null, '2017-08-03 17:08:18', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('87-b64c-427f-8b17-36156b0cfc8a', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:52', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('88-493b-4cad-b75a-fbdd28175dac', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:02:51', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('88-d387-435c-9a5f-a8323835560c', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:44:51', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('88-f9e5-4595-8bec-2ee4a6a36a38', '2d811013a1664ac58c4e700d9d3fadf4', 'wx', null, null, '2017-08-02 21:54:39', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('89-26d7-4012-a8c7-bce3d7ab3bd0', '83b1a9a29d54431db347c9a7804a3307', 'wx', null, null, '2017-08-02 20:15:54', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('89-ad33-465d-8118-7130692825b9', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:10', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8a-22a7-4eef-b9db-b29817974bfa', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:09:54', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8c-f760-4573-80d5-85e678ac4c0b', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:09:14', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8d-034a-4dd2-981c-b484daf215ef', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:07', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8d-0b10-4f03-927d-efe2adbcc5b4', '5eaa0d705d1245fe8c3287f3b13a5144', 'ali', null, null, '2017-08-02 20:17:40', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8d-3d80-4104-8662-1f3495add0ff', '65fc991bd2684337a4a4748e90fe77b8', 'wx', null, null, '2017-08-02 19:33:13', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8d-65e2-4333-87f4-f0d2f5e1e1d0', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:44:59', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8f-4901-4e5c-984a-bd029e25abc6', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:34', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('8f-c097-45f8-b311-7571996d8ff3', 'b98055cd0e3844dbb58a706e0d71c86b', 'ali', null, null, '2017-08-02 19:29:26', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('90-1ded-43e7-a031-a670268c2693', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:12:38', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('90-d206-4152-ab31-e15bc0e71586', '9418e9e5d0f745c0812b878c04d03109', 'wx', null, null, '2017-08-03 17:35:56', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('91-4d9c-41a6-b711-76b1fba1ac31', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:59', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('92-ff94-4c83-8aff-189265985e3c', '6e365d0c91ad4881bd5684990b2b62c6', 'ali', null, null, '2017-08-02 19:39:57', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('93-2a24-405b-92b8-e5c7d5bc8f6c', 'cbcff25fa7694314b102ba5a780d95c3', 'ali', null, null, '2017-08-02 19:43:24', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('96-268f-420f-a2f9-e122c64af693', 'd1fc7df6e2fd4286b8c914bb722264ef', 'ali', null, null, '2017-08-02 20:02:05', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('96-5dd7-4121-b7de-18371bd10eb4', '2d811013a1664ac58c4e700d9d3fadf4', 'wx', null, null, '2017-08-02 21:55:13', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('96-6392-47fd-882b-ceee878152fb', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:16:59', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('97-4ce2-40ed-90cd-6bbbb63aef31', '922faf7a722c4192b38ef46ba5076b73', 'wx', null, null, '2017-08-03 16:54:41', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('99-3063-4750-876c-37e574e1898e', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:02:54', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('99-bc97-4feb-9ea7-fdac467ed571', 'c98b548eccfe41cfa7d2adee4746e6bf', 'ali', null, null, '2017-08-02 20:06:44', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('99-c711-4c50-8dbd-a394ac5d998c', 'e71ea58c2f454719a39e3bb8dd11ef08', 'ali', null, null, '2017-08-02 20:07:59', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9b-152c-4fe5-9f74-9d8da590c28e', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:46:23', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9c-c6ad-4b0f-a14e-dcde7df76949', 'db044d0f83fd4badb7ac25d28aa196d5', 'ali', null, null, '2017-08-02 19:31:08', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9d-312d-4c6c-aedf-d2bf45a6b0f0', 'f5f9c97c39b44ac7a6a0ca3422b807cf', 'ali', null, null, '2017-08-02 19:43:02', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9e-471e-4725-abac-fea986df1704', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:17', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9e-b591-4d33-9f98-765617c2a509', '88a994f0ad7d4135aaa13bf2d1921b34', 'wx', null, null, '2017-08-02 22:04:14', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9e-c605-4c76-997f-f580093ee432', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 17:22:06', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('9f-5991-4594-b03f-23657a67bb35', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:32:18', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a0-c776-48f7-97fa-c17f887a1a9b', 'fa786c0d727744c99624700b9000071f', 'wx', null, null, '2017-08-03 18:05:17', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a0-de87-42c0-9c62-a3569bdb286a', 'f8dad3c2f8094198ac0b02f0fae6c0c0', 'ali', null, null, '2017-08-02 19:43:08', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a4-c8dc-452b-9512-7301f8e4f769', '5b5ac9b58a9b444ca7d905ac87a89496', 'ali', null, null, '2017-08-03 16:47:52', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a4-e778-40ab-a170-059facd1ce90', '973fa5cce2cd47889d3ea9d09f7f3896', 'wx', null, null, '2017-08-03 17:19:06', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a4-ee3a-46ca-96d5-440107dada8a', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:09:56', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a5-1804-400c-8506-1f89abe62120', '2cc14b620bb140b18b57259e88befe6d', 'wx', null, null, '2017-08-03 17:14:51', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a5-ac7e-441e-9e9c-2f18d72dad7e', '626d1e62beeb4e52a04a66c814960a31', 'ali', null, null, '2017-08-02 20:01:31', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a5-e9f8-417b-8583-f3cf8bbf287e', 'b458506ee20f4ebca7e566c37a3af145', 'ali', null, null, '2017-08-02 19:28:58', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a6-66ba-4b00-b6d4-48bc61c1c012', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 17:00:02', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a6-a5be-4477-aad6-6df5b69dbe85', 'b458506ee20f4ebca7e566c37a3af145', 'wx', null, null, '2017-08-02 19:28:56', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a6-ed32-4561-98e2-3bb808406f54', '649ff85a25b847e4a75f2cf8d49d0d38', 'wx', null, null, '2017-08-02 22:01:45', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a7-284e-49e2-88d4-56c715d972fb', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:45:28', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a7-9370-4e3b-b8bb-8f5da3bf880e', '4f5d9bb9a9fb434aae76d6a72645fd34', 'wx', null, null, '2017-08-03 17:13:50', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a8-a86b-4694-87e9-274ca60144da', '6a0f0f1196fc40f6ac45b1167f4b1ce2', 'wx', null, null, '2017-08-02 21:01:00', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('a9-b369-4ac2-bb3f-8c23e38833e5', '1df00cb052be404d9b0f0874ea32ae58', 'wx', null, null, '2017-08-02 19:28:38', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ab-42fa-4842-b5d7-2e471bcf5990', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:38:30', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ae-ed62-4e4b-9203-2593a05bf0d4', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:17:25', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('af-4549-4f5e-8c12-9f323ac94c97', '7078fb494286466d9736410c18eb7c36', 'ali', null, null, '2017-08-02 20:12:57', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('af-976f-4395-bf87-f1151fe17c07', 'b3e18807b7214dd48c71361109650947', 'wx', null, null, '2017-08-03 17:17:48', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b0-49c4-4d28-94fc-e019637c4193', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:03:01', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b0-d17b-41ac-8260-7931dc42dc2a', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:18:07', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b2-37cd-4966-9187-12d80997ae3d', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:40:15', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b2-3b8d-43a4-9f84-063fede7b41a', '521ba2b765cb46ae8dec5bd2ac08709d', 'wx', null, null, '2017-08-02 19:31:48', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b2-4f6d-4f18-8fa8-dd8d7abdc405', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:08:09', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b3-4fb9-4e1f-a4f9-c2d49165d15f', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:01:13', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b4-59f4-417d-b9ce-b174944956f4', 'c5675d2a6cb74878824a6c5f8e016ca2', 'ali', null, null, '2017-08-03 17:06:19', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b4-d776-4f5a-ae26-7cc950e610d7', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 17:01:03', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b7-1a36-40d8-b64f-63e43d1fccaf', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:32:41', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b8-4d27-40cb-979b-2693cc58885e', '2d811013a1664ac58c4e700d9d3fadf4', 'ali', null, null, '2017-08-02 21:54:34', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b8-edba-4af4-b1ce-530a232e4b92', 'bc927d38c3e646bb910e8bf3da548254', 'wx', null, null, '2017-08-03 17:17:49', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('b9-518c-423b-890e-c42546adb0d6', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:39:21', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ba-0442-4f75-ad6d-9b80eef80cd0', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:19:26', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ba-2cae-4675-a7c8-716d65d49f8a', '8ed32b6d8a27487ca7c913dd36e3e92e', 'ali', null, null, '2017-08-02 20:00:02', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ba-4621-48a4-a141-9f6c2fcf54ad', 'b53480d1193b4d6f947ce32a71c157b4', 'wx', null, null, '2017-08-02 20:30:48', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('bc-d800-4dc3-98ed-ac6464938e09', '9795aced2d904fbc960618c800f139d1', 'ali', null, null, '2017-08-02 19:54:10', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('bd-f9c0-4579-add7-1c79700ae759', '4dfd070456bf4d4cbdc53d22bb5c73a4', 'ali', null, null, '2017-08-02 20:05:59', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('be-8a4e-47b7-9a98-afa06ccc736c', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:10:05', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('bf-1928-4485-9cb6-f32f9fb18a9a', 'fdc38b4360c04b0f9b7f45ed9579ac17', 'ali', null, null, '2017-08-02 19:37:20', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('bf-e85a-44c4-ad9b-1bca6bc3c4e1', '2d811013a1664ac58c4e700d9d3fadf4', 'wx', null, null, '2017-08-02 21:55:51', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('c2-8a38-4200-bf40-25377f8383f2', '922faf7a722c4192b38ef46ba5076b73', 'wx', null, null, '2017-08-03 16:54:48', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('c2-bb98-416d-809f-23797b3def7c', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:33:00', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('c3-61af-4846-a68c-ce08174e886c', '521ba2b765cb46ae8dec5bd2ac08709d', 'ali', null, null, '2017-08-02 19:31:52', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('c4-6191-4e1f-b514-6ad1f8181505', '0b31c480d2af43f681eedbe632ca27ea', 'wx', null, null, '2017-08-02 21:16:50', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('c6-1a42-4db8-a438-cb83c0e17f66', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 17:00:35', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('cb-42c1-4341-9bcb-c9407dde2e99', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:31:53', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('cd-0433-4827-871d-eb4075e87757', 'bd3810239158449f89b8ef3226653d2c', 'ali', null, null, '2017-08-02 19:36:02', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ce-1f54-45da-b34c-c456fda2a95a', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:42', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d0-3758-4154-8975-d6ce23a417f9', '412c5ec2749345428e92f7af110c79b7', 'wx', null, null, '2017-08-02 21:30:55', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d1-702c-4a29-b1e0-4a7d594bdc5c', '6a36a9bda5414c14a77e99485c4958ac', 'wx', null, null, '2017-08-02 19:38:31', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d2-bcba-4062-9dd7-306652d5923e', '4806a99b8fa54928b060dba1cc4425d2', 'wx', null, null, '2017-08-02 20:09:00', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d2-ce51-4d9b-996c-43c99022f916', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 16:59:30', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d2-d6e2-4417-ba3d-4dbe0bb76119', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 16:59:36', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d3-292b-4a56-9fea-9a40b15e5c15', '6f6ba741c3534dfcb80d65d3ef9c0915', 'ali', null, null, '2017-08-02 20:17:19', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d3-8811-4843-a432-f809d2cc199b', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:22', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d4-fa3d-4aaf-84b9-f1a47531d116', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:01:30', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d4-fb39-4743-b5ef-add3338830cc', 'cf56e438851c4af89a29daeecd8dd7b5', 'ali', null, null, '2017-08-02 20:03:43', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d5-a504-4b80-b56a-bbc3198110b2', '65fc991bd2684337a4a4748e90fe77b8', 'ali', null, null, '2017-08-03 16:46:52', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d6-c401-4966-8068-3c7c2efbcdf9', '6a36a9bda5414c14a77e99485c4958ac', 'wx', null, null, '2017-08-02 19:53:36', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d7-39c0-4a24-9034-19c1df5f9574', 'fd63ac32db60474fbe27ae034817a2ed', 'wx', null, null, '2017-08-02 19:29:17', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d8-1656-4475-b7b5-6356c43cd2e9', 'c597ed6b4b124a87abc021acd2844bb2', 'wx', null, null, '2017-08-02 23:55:40', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('d9-8b49-4ff5-ab0c-c260f218d573', 'ced3b7761b48456cb35a44176c286f67', 'ali', null, null, '2017-08-02 20:07:19', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('da-4f3b-4cd7-b000-310fd6117189', 'b9cfe8a28273440eae0df6c8fcd377e5', 'wx', null, null, '2017-08-03 17:11:35', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('db-b0ed-4da6-a838-18f1d85c7623', 'c5675d2a6cb74878824a6c5f8e016ca2', 'wx', null, null, '2017-08-03 17:06:13', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('db-cc87-4896-9c73-5b33e7566f69', 'fa786c0d727744c99624700b9000071f', 'ali', null, null, '2017-08-03 18:05:27', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('dc-24be-4719-afe2-1d1de3e1a28f', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:20', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('dc-5445-44ee-8ba7-248dc9b1e3e4', '913f3573cfc6491e86eea78300983c49', 'wx', null, null, '2017-08-03 17:02:55', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('dd-4db1-4119-a9a4-d73c3544e974', 'c13de0ffb08d4886be79ed6483f3aa52', 'ali', null, null, '2017-08-03 16:59:45', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('de-34bb-4a7e-8b53-d480ed209171', '4806a99b8fa54928b060dba1cc4425d2', 'wx', null, null, '2017-08-02 20:18:36', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('de-e761-4082-8b5f-bc41dc36177f', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:26', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('de-f5b3-4911-be0d-9b446ffca6cf', '88a994f0ad7d4135aaa13bf2d1921b34', 'ali', null, null, '2017-08-02 22:04:19', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e0-4021-4889-8308-534ba18d2924', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:40:08', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e0-c805-4570-a95c-d82cd61c7993', '0b31c480d2af43f681eedbe632ca27ea', 'ali', null, null, '2017-08-02 21:19:45', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e3-eec3-4894-be45-5fb1faae6a50', '1c45e7284d4a4a6bb898acb1b8992e63', 'wx', null, null, '2017-08-03 17:00:37', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e4-4d4d-4160-97ad-ebc49103d7ab', 'a50872056bf74ca29deb9f9c50a701a2', 'wx', null, null, '2017-08-02 22:10:04', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e5-87fc-42a1-8b3f-f37d06f90567', 'b21c97402ad64b6da5a04cf1c3e006ba', 'ali', null, null, '2017-08-02 20:07:06', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e5-c148-440e-8c0a-65f05b48f930', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:12', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e6-378c-476e-83d8-ae1e7f2e1f09', 'efa15c21c046497eb784c7e4bf33d4eb', 'wx', null, null, '2017-08-02 20:10:29', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e7-360c-4b99-a189-ebdd758fdf4a', '994a17e8898c4e8bb301c74d062db49f', 'ali', null, null, '2017-08-02 20:14:28', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e8-1998-442a-ab30-bb49467b4316', '3b65cd1c9cbd4b3c91ab640dd40a61b4', 'wx', null, null, '2017-08-02 19:39:52', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e8-37e4-49b8-851e-5a3599a82d86', '18d9af4c8c8b4fcfa467d99ca9b23cfd', 'wx', null, null, '2017-08-03 17:19:18', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e8-9767-4006-a2a6-7261f095ca45', 'ba4012c5fd0a4762a372106dc09ca748', 'wx', null, null, '2017-08-03 17:17:00', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('e9-4120-4612-a55b-17e4736adeeb', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 16:59:19', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('eb-f72b-4e08-9c1b-210855f0aa0d', 'ba4012c5fd0a4762a372106dc09ca748', 'wx', null, null, '2017-08-03 17:16:53', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ec-0e70-4a70-a092-77bbb0e14dd6', '626d1e62beeb4e52a04a66c814960a31', 'wx', null, null, '2017-08-02 20:01:28', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ed-ebdf-4fdc-9050-5506c1880fa6', 'a4123dc0f7ac490a9926a0bcf6a0a216', 'ali', null, null, '2017-08-02 19:58:07', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ef-2a3d-4391-a866-339e5a6b8688', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 16:59:39', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('ef-ac3a-4048-82b4-600ef3778d82', 'ba4012c5fd0a4762a372106dc09ca748', 'wx', null, null, '2017-08-03 17:17:06', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f0-f1c9-457b-9cd5-016ad0e3de06', 'b98055cd0e3844dbb58a706e0d71c86b', 'wx', null, null, '2017-08-02 19:29:20', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f1-5770-433e-a39f-903dde8b6d93', '577ad4284cf047b58be62c1a79f32556', 'wx', null, null, '2017-08-03 17:00:37', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f1-b02b-40c3-820e-7930871c0198', 'aaa8972219164d22acc0bdd834087ecc', 'wx', null, null, '2017-08-02 19:38:26', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f3-af2a-45a2-b0b4-170c63f7b0e8', '5922c26fb2404ca8bf12e1ae9b271f34', 'wx', null, null, '2017-08-03 16:59:16', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f4-128e-4ced-b79e-df12aaf1752f', '8b2e85e543b74d5095fae32b405bec07', 'wx', null, null, '2017-08-03 17:10:03', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f7-27b4-4a0a-8730-b0f1a2f8a749', '744d2e04a57449a8819e35e018d7ff81', 'wx', null, null, '2017-08-02 19:32:15', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f8-3e35-4781-aaaa-56e980fea7c8', 'd8b7e117daec41ea995b47b06297d709', 'ali', null, null, '2017-08-03 17:03:32', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('f8-45bc-4071-ae28-c1bee35f0b77', '3c91c84760394d2d954ff97a1adef9cf', 'ali', null, null, '2017-08-02 19:38:04', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('fa-51cc-46a7-8534-fda7f85502a3', '39bc9e5bcaa74f14a95e2c25b1e82512', 'wx', null, null, '2017-08-03 17:17:11', null, '1', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('fb-2769-4140-98c7-b1588d3265c3', '569cf426e7fb4ab9a452e1360ef067a5', 'wx', null, null, '2017-08-02 20:41:52', null, '未审核', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('fc-97cb-46aa-9f92-9567286ca309', 'bfb44db3c5174150b5b5ab75c399e682', 'ali', null, null, '2017-08-02 19:58:36', null, '未审核', null, 'y', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('fd-2c3c-42e3-b783-2faa2694ec73', '922faf7a722c4192b38ef46ba5076b73', 'wx', null, null, '2017-08-03 16:54:37', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);
INSERT INTO `tb_order` VALUES ('fd-e7c5-4519-a4b2-a2d76dc33918', 'c13de0ffb08d4886be79ed6483f3aa52', 'wx', null, null, '2017-08-03 17:00:07', null, '1', null, 'n', null, '298.00', null, null, null, '1', null, null, null, null, null, null, null, null, null, '744ef27ef7e64729b19033c07389ce97', '艾米伦防近视防驼背智能笔', null);

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ranking
-- ----------------------------
DROP TABLE IF EXISTS `tb_ranking`;
CREATE TABLE `tb_ranking` (
  `RANKING_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '账号',
  `NICK_NAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  `RANK_NUMBER` int(11) NOT NULL COMMENT '期数',
  `BUY_NUMBER` int(11) NOT NULL COMMENT '推荐购买量加真实购买量和',
  `BUY_REALNUMBER` int(11) NOT NULL COMMENT '购买量',
  `BUY_COUNT` int(11) NOT NULL COMMENT '总购买数',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `UPDATETIME` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`RANKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ranking
-- ----------------------------
INSERT INTO `tb_ranking` VALUES ('0173e1f171ae480cbc6282a7696382e6', '8b2e85e543b74d5095fae32b405bec07', '18037162577', '闲不住闲先生', '4', '1', '1', '1', '2017-08-03 17:12:52', '2017-08-03 17:12:52');
INSERT INTO `tb_ranking` VALUES ('061797541f1941ae80340836be3ab22a', 'c13de0ffb08d4886be79ed6483f3aa52', '18937118699', 'AML8699', '4', '3', '1', '3', '2017-08-03 17:01:29', '2017-08-03 17:17:19');
INSERT INTO `tb_ranking` VALUES ('08f691dd4cb44a8a8570d1cbc10acbd0', 'aeae11097a8349998d44ce13b6d29efe', '13353887617', 'AML7617', '4', '1', '1', '1', '2017-08-03 16:59:56', '2017-08-03 16:59:56');
INSERT INTO `tb_ranking` VALUES ('1032933a44cd44f5b928ddff2d29a051', '70f1f57fe3774bd885c6f0dadd0aee88', '15607662257', 'AML2257', '5', '1', '1', '1', '2017-08-03 18:09:49', '2017-08-03 18:09:49');
INSERT INTO `tb_ranking` VALUES ('15b022e863254985bc77f5c467cbe04d', '4f5d9bb9a9fb434aae76d6a72645fd34', '15138933361', 'AML3361', '4', '3', '1', '3', '2017-08-03 17:14:01', '2017-08-03 17:36:12');
INSERT INTO `tb_ranking` VALUES ('1c882a78048643b7b8cbf22a1ef0cc90', 'c5675d2a6cb74878824a6c5f8e016ca2', '18639844866', 'AML4866', '4', '1', '1', '1', '2017-08-03 17:06:27', '2017-08-03 17:06:27');
INSERT INTO `tb_ranking` VALUES ('2238298fb66a4b7c835a7f0fd5234cda', '415e966228dd4fc7ac9cbb16c534f48b', '13223032300', 'AML2300', '5', '1', '1', '1', '2017-08-03 17:27:55', '2017-08-03 17:27:55');
INSERT INTO `tb_ranking` VALUES ('468fe8436a444da38644a39e25a149a5', '2cc14b620bb140b18b57259e88befe6d', '18539960527', 'AML0527', '4', '1', '1', '1', '2017-08-03 17:15:03', '2017-08-03 17:15:03');
INSERT INTO `tb_ranking` VALUES ('4c68d79bf0f649d587dc539e202c9714', '153d23c6bfff4d2f86318a84f200d391', '13938298318', 'AML8318', '4', '1', '1', '1', '2017-08-03 17:14:38', '2017-08-03 17:14:38');
INSERT INTO `tb_ranking` VALUES ('4c83693f5efa4fdf8a8fbd81c7259130', '913f3573cfc6491e86eea78300983c49', '15637185003', 'AML5003', '4', '1', '1', '1', '2017-08-03 17:04:07', '2017-08-03 17:04:07');
INSERT INTO `tb_ranking` VALUES ('4d6e6f24cdae420bb070f7327212594c', '8fd393ef3e8b4702977939507d7630d0', '15838805546', 'AML5546', '4', '3', '1', '3', '2017-08-03 16:56:53', '2017-08-03 17:22:16');
INSERT INTO `tb_ranking` VALUES ('5f45867d47844e028546478594c53c37', '577ad4284cf047b58be62c1a79f32556', '17839918849', 'AML8849', '4', '1', '1', '1', '2017-08-03 17:01:27', '2017-08-03 17:01:27');
INSERT INTO `tb_ranking` VALUES ('680a531074d848c2afd02ea8925d9d47', '9418e9e5d0f745c0812b878c04d03109', '18039989982', 'AML9982', '5', '1', '1', '1', '2017-08-03 17:36:12', '2017-08-03 17:36:12');
INSERT INTO `tb_ranking` VALUES ('692457fa4e7441a4893d2fe9a5194cec', '8fe26ef22b974baa83d990e99b5da87b', '15824877505', 'AML7505', '4', '1', '1', '1', '2017-08-03 17:08:31', '2017-08-03 17:08:31');
INSERT INTO `tb_ranking` VALUES ('6e514f2bc5944e788f3475879bb2a62d', 'ba4012c5fd0a4762a372106dc09ca748', '15139832510', 'AML2510', '5', '1', '1', '1', '2017-08-03 17:18:44', '2017-08-03 17:18:44');
INSERT INTO `tb_ranking` VALUES ('6f8afc2f1da54bd1bc4a87da9d003bf6', '33a84151b5fc492f97210835c351aded', '17737465802', 'AML5802', '4', '2', '1', '2', '2017-08-03 16:47:03', '2017-08-03 16:50:14');
INSERT INTO `tb_ranking` VALUES ('6ff3fa26b0f9472f86d122a6cb2580b1', '5922c26fb2404ca8bf12e1ae9b271f34', '18639008099', 'AML8099', '5', '2', '1', '6', '2017-08-03 17:00:34', '2017-08-03 17:27:55');
INSERT INTO `tb_ranking` VALUES ('7737fa50c2da4474a2b28a3e2b36b156', '744d7db5bdce42a0a304fd33cb20c482', '18848956991', 'AML6991', '4', '1', '1', '1', '2017-08-03 17:16:22', '2017-08-03 17:16:22');
INSERT INTO `tb_ranking` VALUES ('78fa753ef2cc4374884d2ce864295c2a', 'd8b7e117daec41ea995b47b06297d709', '18337157151', 'AML7151', '4', '1', '1', '1', '2017-08-03 17:03:47', '2017-08-03 17:03:47');
INSERT INTO `tb_ranking` VALUES ('7e56bc43df764112b733fb3fa31f0e9a', '39bc9e5bcaa74f14a95e2c25b1e82512', '13592573064', 'AML3064', '4', '1', '1', '1', '2017-08-03 17:17:19', '2017-08-03 17:17:19');
INSERT INTO `tb_ranking` VALUES ('7ecd162e9b9644f2ab43efb1fa881b0b', '18d9af4c8c8b4fcfa467d99ca9b23cfd', '13783376884', 'AML6884', '5', '1', '1', '1', '2017-08-03 17:19:24', '2017-08-03 17:19:24');
INSERT INTO `tb_ranking` VALUES ('9e3efd720c584f7bbeeddd4657b4037a', 'af41fcf201ba4770bc7d7388c710de3c', '18738037948', 'AML7948', '4', '1', '1', '1', '2017-08-03 17:16:11', '2017-08-03 17:16:11');
INSERT INTO `tb_ranking` VALUES ('ab5dc95875304aedbdd91ee93eef15fd', 'bc927d38c3e646bb910e8bf3da548254', '15537151218', 'AML1218', '5', '1', '1', '1', '2017-08-03 17:18:03', '2017-08-03 17:18:03');
INSERT INTO `tb_ranking` VALUES ('b84ad08813f444d582f8d1561cd0b6d6', '973fa5cce2cd47889d3ea9d09f7f3896', '15903627695', 'AML7695', '5', '1', '1', '1', '2017-08-03 17:19:14', '2017-08-03 17:19:14');
INSERT INTO `tb_ranking` VALUES ('c083e5b470244dc8a55e6c1a9b1a25a9', '5b5ac9b58a9b444ca7d905ac87a89496', '15839825356', 'AML5356', '4', '1', '1', '1', '2017-08-03 16:48:06', '2017-08-03 16:48:06');
INSERT INTO `tb_ranking` VALUES ('d27fd328e808407394ae008a4bdcc2a3', 'fa786c0d727744c99624700b9000071f', '13203871318', 'AML1318', '5', '1', '1', '1', '2017-08-03 18:05:39', '2017-08-03 18:05:39');
INSERT INTO `tb_ranking` VALUES ('d2d946ec8a52417eb139161bf70d4666', '619b3dc4509f4cbd80420979e70beac9', '18336323779', 'AML3779', '4', '1', '1', '1', '2017-08-03 16:50:14', '2017-08-03 16:50:14');
INSERT INTO `tb_ranking` VALUES ('dbcb3ed13e6a4b6d944968a5874fad14', '1c45e7284d4a4a6bb898acb1b8992e63', '15617560361', 'AML0361', '4', '1', '1', '1', '2017-08-03 17:03:22', '2017-08-03 17:03:22');
INSERT INTO `tb_ranking` VALUES ('e446e5e8518048acbb1be63fdfaafb8c', '922faf7a722c4192b38ef46ba5076b73', '18003840199', 'AML0199', '4', '2', '1', '2', '2017-08-03 16:56:43', '2017-08-03 17:08:31');
INSERT INTO `tb_ranking` VALUES ('e4db56fa74d64019bf2d82f59fcc2eaf', 'b3e18807b7214dd48c71361109650947', '13283870575', 'AML0575', '4', '1', '1', '1', '2017-08-03 17:17:55', '2017-08-03 17:17:55');
INSERT INTO `tb_ranking` VALUES ('f573ec7be2b8402f8dc8f88eda2b7758', 'b9cfe8a28273440eae0df6c8fcd377e5', '18538533772', 'AML3772', '4', '1', '1', '1', '2017-08-03 17:11:43', '2017-08-03 17:11:43');

-- ----------------------------
-- Table structure for tb_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `tb_useraddress`;
CREATE TABLE `tb_useraddress` (
  `USERADDRESS_ID` varchar(100) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `USER_PHONE` varchar(255) DEFAULT NULL COMMENT '用户电话',
  `USER_ADDRESS` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `USER_ID` varchar(255) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`USERADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_useraddress
-- ----------------------------
INSERT INTO `tb_useraddress` VALUES ('09df589630ca4ec097d6fa2e6970fc03', '1', '1', '1', '2017-08-03 17:16:04', 'af41fcf201ba4770bc7d7388c710de3c');
INSERT INTO `tb_useraddress` VALUES ('0c5e453ebdd146bdaed3177aa15de3f1', '发v哥哥', '888888', '他刚刚', '2017-08-03 16:46:53', '33a84151b5fc492f97210835c351aded');
INSERT INTO `tb_useraddress` VALUES ('0cae7ee4401045dbb405c904796ad3b9', '1', '2', '啊', '2017-08-03 17:13:48', '4f5d9bb9a9fb434aae76d6a72645fd34');
INSERT INTO `tb_useraddress` VALUES ('16a902b146384ca9b435b492d1c88934', '1111', '旅途中', '呕吐', '2017-08-03 16:59:39', 'aeae11097a8349998d44ce13b6d29efe');
INSERT INTO `tb_useraddress` VALUES ('1a9c29d9ea2745aeabf6f639ab5ebf1e', '1', '1', '1', '2017-08-03 16:59:04', 'c13de0ffb08d4886be79ed6483f3aa52');
INSERT INTO `tb_useraddress` VALUES ('4b0b509e7525444889a3dd937f7cc31d', '1', '1', '1', '2017-08-03 17:19:16', '18d9af4c8c8b4fcfa467d99ca9b23cfd');
INSERT INTO `tb_useraddress` VALUES ('55a7671c94014844b27938e788b66504', '张瞮瞮', '13592573064', '郑州市金水区', '2017-08-03 17:17:06', '39bc9e5bcaa74f14a95e2c25b1e82512');
INSERT INTO `tb_useraddress` VALUES ('5c31f945481541748b80abcded94bb77', 'ajm', 't', 'v', '2017-08-03 17:03:18', 'd8b7e117daec41ea995b47b06297d709');
INSERT INTO `tb_useraddress` VALUES ('5f7e996d1be64187a809949018f0aad5', '1', '1', '1', '2017-08-03 17:17:47', 'b3e18807b7214dd48c71361109650947');
INSERT INTO `tb_useraddress` VALUES ('61543c0a1f7d46709f5db6fe632bcb5f', '1', '1', '1', '2017-08-03 17:11:33', 'b9cfe8a28273440eae0df6c8fcd377e5');
INSERT INTO `tb_useraddress` VALUES ('68c2c5c0a89842528f0e9a54a7c14b63', '方法', '对对对', '到底', '2017-08-03 17:17:45', 'bc927d38c3e646bb910e8bf3da548254');
INSERT INTO `tb_useraddress` VALUES ('6acc9691b34d415cbf286ffbefb09aff', 'a', 'b', 'c', '2017-08-03 16:59:33', '577ad4284cf047b58be62c1a79f32556');
INSERT INTO `tb_useraddress` VALUES ('6ef4bbe335b24782b870b9878c22e7a7', '1', '2', '9', '2017-08-03 17:33:46', '9418e9e5d0f745c0812b878c04d03109');
INSERT INTO `tb_useraddress` VALUES ('6f6620efac34448dbc3f36496a6250e5', '1', '15617560361', '111', '2017-08-03 17:00:21', '1c45e7284d4a4a6bb898acb1b8992e63');
INSERT INTO `tb_useraddress` VALUES ('7de97fc7ed6745c39256f00802f401ea', '了', '了', '了', '2017-08-03 17:06:10', 'c5675d2a6cb74878824a6c5f8e016ca2');
INSERT INTO `tb_useraddress` VALUES ('8019840cc25349248c1a4e68b35d9612', '方法', '地方的', '对对对', '2017-08-03 17:08:14', '8fe26ef22b974baa83d990e99b5da87b');
INSERT INTO `tb_useraddress` VALUES ('91d117f8a35440ae88f8804c11611909', '对对对', '小弟弟', '对对对', '2017-08-03 17:19:04', '973fa5cce2cd47889d3ea9d09f7f3896');
INSERT INTO `tb_useraddress` VALUES ('9ca67a6b850c46f6bc58aff259bf14d6', '1', '1', '啊', '2017-08-03 17:16:51', 'ba4012c5fd0a4762a372106dc09ca748');
INSERT INTO `tb_useraddress` VALUES ('ab3cb2aabe174b84849e7368a0820f2d', '小马', '13203871318', '啊咯女女童', '2017-08-03 18:05:13', 'fa786c0d727744c99624700b9000071f');
INSERT INTO `tb_useraddress` VALUES ('b95370f148d54d70b06af00efa13d203', '1', '1', '1', '2017-08-03 16:50:03', '619b3dc4509f4cbd80420979e70beac9');
INSERT INTO `tb_useraddress` VALUES ('c823452ef8c34a03896773adcd2e4683', '1', '158', '1', '2017-08-03 16:47:50', '5b5ac9b58a9b444ca7d905ac87a89496');
INSERT INTO `tb_useraddress` VALUES ('ca944a9556064fcdb4d0808e6f279b2e', '我问问', '谁说的', '对对对', '2017-08-03 16:54:34', '922faf7a722c4192b38ef46ba5076b73');
INSERT INTO `tb_useraddress` VALUES ('cbb557fa886641e78fe7869689daf595', '到底', '小心点', '大兄弟', '2017-08-03 17:14:49', '2cc14b620bb140b18b57259e88befe6d');
INSERT INTO `tb_useraddress` VALUES ('e2196fd85e6d45d29d08a7fe145152a5', '1', '1', '不', '2017-08-03 16:59:14', '5922c26fb2404ca8bf12e1ae9b271f34');
INSERT INTO `tb_useraddress` VALUES ('e86c4619b17549958813748ba543e349', '让人', '对对对', '对对对', '2017-08-03 17:16:07', '744d7db5bdce42a0a304fd33cb20c482');
INSERT INTO `tb_useraddress` VALUES ('eadb4d39040c4b88b5317781c806964e', '测试', '回家咯', '痛快淋漓9', '2017-08-03 17:14:24', '153d23c6bfff4d2f86318a84f200d391');
INSERT INTO `tb_useraddress` VALUES ('ecfef68647b042c6b6fc8a052761da61', '她', '了', '她', '2017-08-03 17:02:49', '913f3573cfc6491e86eea78300983c49');
INSERT INTO `tb_useraddress` VALUES ('eecf95a059a74896b756463b06c12d1b', '你具体', '15607662257', '杜相信我', '2017-08-03 18:09:37', '70f1f57fe3774bd885c6f0dadd0aee88');
INSERT INTO `tb_useraddress` VALUES ('efd22d1211dc432799bc1b0291cc157f', '李蕊', '18037118699', '河南省郑州市金水区西史赵', '2017-08-03 17:09:52', '8b2e85e543b74d5095fae32b405bec07');
INSERT INTO `tb_useraddress` VALUES ('f9d72fdaf61e4fc0b5269c33db90efb6', '艾米伦', '155555', '15888', '2017-08-03 16:56:41', '8fd393ef3e8b4702977939507d7630d0');
INSERT INTO `tb_useraddress` VALUES ('fa78bbd65eab4f66b4ea36f6177cf3a8', '聪慧', '13223032300', '估摸着具体', '2017-08-03 17:27:36', '415e966228dd4fc7ac9cbb16c534f48b');

-- ----------------------------
-- Table structure for tb_userbank
-- ----------------------------
DROP TABLE IF EXISTS `tb_userbank`;
CREATE TABLE `tb_userbank` (
  `USERBANK_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `OPEN_BANK` varchar(255) DEFAULT NULL COMMENT '开户行',
  `BANK_NUMBER` varchar(255) DEFAULT NULL COMMENT '账号',
  `BANK_NAME` varchar(255) DEFAULT NULL COMMENT '开户人',
  `BANK_PHONE` varchar(255) DEFAULT NULL COMMENT '预留手机号',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `ISDEFAULT` smallint(6) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`USERBANK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_userbank
-- ----------------------------
INSERT INTO `tb_userbank` VALUES ('20a13e4e2b3f4bfeada92948c57d0459', '5922c26fb2404ca8bf12e1ae9b271f34', '阿里', '1234567894561234567', '张然', '18639008099', '2017-08-03 17:21:29', '1');

-- ----------------------------
-- Table structure for tb_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `tb_withdrawals`;
CREATE TABLE `tb_withdrawals` (
  `WITHDRAWALS_ID` varchar(100) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL COMMENT '提现人id',
  `WMONEY` varchar(255) DEFAULT NULL COMMENT '提现金额',
  `BANK_CARID` varchar(255) DEFAULT NULL COMMENT '银行卡ID',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '发起时间',
  `STATUS` int(11) NOT NULL COMMENT '0 发起状态；1同意提现；2已完成提现；3余额不足',
  PRIMARY KEY (`WITHDRAWALS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_withdrawals
-- ----------------------------
INSERT INTO `tb_withdrawals` VALUES ('2b0de87661704f78ab1e7f50a1b03f34', '5922c26fb2404ca8bf12e1ae9b271f34', '2000', null, '2017-08-03 17:21:43', '0');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
