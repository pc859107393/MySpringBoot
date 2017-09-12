/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ccdb

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 09/12/2017 17:36:02 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cc_res`
-- ----------------------------
DROP TABLE IF EXISTS `cc_res`;
CREATE TABLE `cc_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物品ID',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物品名称',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物品编码，唯一编码',
  `position` text COLLATE utf8mb4_unicode_ci COMMENT '物品位置，可为空',
  `cost` float DEFAULT '0' COMMENT '物品单价',
  `sum` int(11) DEFAULT NULL COMMENT '总数',
  `type` text COLLATE utf8mb4_unicode_ci COMMENT '物品类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_res_code_uindex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物品记录表';

-- ----------------------------
--  Records of `cc_res`
-- ----------------------------
BEGIN;
INSERT INTO `cc_res` VALUES ('1', '清风牌纸手帕', '6922266448096', 'A区库房110货架', '48', '50000', '纸巾-纸手帕-清风'), ('12', '完美芦荟装40g 3支装', '1192475', '京东商城-京东热卖', '79', null, '芦荟-三支-京东热卖');
COMMIT;

-- ----------------------------
--  Table structure for `cc_res_in`
-- ----------------------------
DROP TABLE IF EXISTS `cc_res_in`;
CREATE TABLE `cc_res_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入库表自增主键',
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入库表单编号',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入库表单内容',
  `date` int(11) NOT NULL COMMENT '入库时间',
  `total_cost` decimal(10,0) NOT NULL COMMENT '入库总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `cc_site`
-- ----------------------------
DROP TABLE IF EXISTS `cc_site`;
CREATE TABLE `cc_site` (
  `name` text COLLATE utf8_bin COMMENT '站点名称',
  `code` text COLLATE utf8_bin COMMENT '站点备案号',
  `real_ip_v4` text COLLATE utf8_bin COMMENT '服务器IP地址v4',
  `real_ip_v6` text COLLATE utf8_bin COMMENT '服务器IP地址v6'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点信息存储';

-- ----------------------------
--  Table structure for `cc_user`
-- ----------------------------
DROP TABLE IF EXISTS `cc_user`;
CREATE TABLE `cc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1' COMMENT '用户登录名称',
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1' COMMENT '用户密码，建议算法：sha256(MD5(明文)+salt)',
  `duty` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户职位',
  `create_date` int(11) NOT NULL COMMENT '创建时间',
  `used` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
--  Records of `cc_user`
-- ----------------------------
BEGIN;
INSERT INTO `cc_user` VALUES ('2', '糍粑', '228568859', '6c0eaef14832a719fb5a083f8aea1f606aebbfae307693b3aa06f3c891a1785a', 'admin', '1703864036', '1'), ('3', '程', 'pc85', '00df69cb6798f4b4bc36e91707f61d4c2fc00eb7a7ede338934762a5537ae9a6', '炒鸡admin', '1502870091', '0'), ('4', '程', 'pc8599', '9ebd2c0f037a0fe2c09384d0ba0818f1c06c89907917a34d4a57d9a30bb4fec2', '炒鸡admin', '1502871057', '1'), ('5', '程', 'pc8599110', 'f18e32f677b49732fb3f07802bdd1d3e286e6a59d41e164c0dfdcdfbd6342d59', '炒鸡admin', '1502871222', '1'), ('6', '程', 'pc859922', '58ae777a0985219824059b85f35faf1b5b92b4f68b16e4b4a0772623a69b596d', '炒鸡admin', '1502871269', '1'), ('8', 'qqq', '228596321', '725a289793d69321bd786166ad7a8bc4fa0660573460d34b2f5e87e111d947e7', 'zxczxcz', '1502871659', '1'), ('9', 'qqq', '9564564', 'a2225de081c1da76160dd04d99de4a9439c9e1f31843ffd2f0bfbceda714b712', 'zxczxcz', '1502871724', '0'), ('10', 'qqq', '9564564120', 'c30d43afeba75f98af26cae7bfb628ca4e9dcc34a385127019dda28a352d885e', 'zxczxcz', '1502871826', '0'), ('11', 'qqq', '9564564110', '5c06478ca9ae9a61ead0bf921e3406bd4d2ce6fe7a8953cda58b6a131265c004', 'zxczxcz', '1502872562', '1'), ('14', '超级管理员', 'pc859107393', '1b4d2f7c7438009f6bb8154b96e3c75f6a161912fc7ca8b6eb095776499363f7', 'admin', '1503347744', '1'), ('17', '完美芦荟装40g 3支装', 'pc85910739310086', 'e5628505b6890d2ff87ad1f49d47771fcf120d2ae6f4b86fe8f4c12e6c4f67fd', null, '1505180651', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
