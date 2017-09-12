/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost
 Source Database       : ccdb

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : utf-8

 Date: 09/13/2017 05:15:49 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cc_food_type`
-- ----------------------------
DROP TABLE IF EXISTS `cc_food_type`;
CREATE TABLE `cc_food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜系id',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜系名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '菜系描述',
  `other` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `cc_food_type`
-- ----------------------------
BEGIN;
INSERT INTO `cc_food_type` VALUES ('1', '川菜', '川菜', '川菜'), ('2', '湘菜', '湘菜', '湘菜'), ('3', '粤菜', '粤菜', '据说广东人喜欢吃胡建人');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物品记录表';

-- ----------------------------
--  Records of `cc_res`
-- ----------------------------
BEGIN;
INSERT INTO `cc_res` VALUES ('1', '2018年计算机组成原理考研复习指导', 'B区13库房131货架A11', '489498', '48', '50000', '书籍-考研-计算机-王道论坛'), ('3', '2018年计算机组成原理考研复习指导', '9787121309762', 'B区13库房131货架A11', '48', '50000', '书籍-考研-计算机-王道论坛'), ('4', '考研政治马原专项突破', '9787121309789', null, null, null, null), ('5', '考研政治早知道——马原专项突破', '9787502278595', null, null, null, null), ('6', '考研政治早知道——西瓜皮', '9787502278595999', '', null, null, ''), ('7', '考研政治早知道——茄子', '9787502299999999', '', null, null, ''), ('8', '考研政治早知道——西瓜皮999', '9787502299999999999', '', null, null, ''), ('9', '考研政治早知道——西瓜皮888', '9787502299999999888', '没有位置不给吗？', null, null, ''), ('10', '就是要发发发', '888888', '', null, null, ''), ('11', '1111222', '9787502278595111', '男生宿舍1A216', '999', null, 'AAA');
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
  `value` text COLLATE utf8_bin COMMENT 'value',
  `key` varchar(256) COLLATE utf8_bin NOT NULL COMMENT 'key',
  UNIQUE KEY `cc_site_key_uindex` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点信息存储';

-- ----------------------------
--  Records of `cc_site`
-- ----------------------------
BEGIN;
INSERT INTO `cc_site` VALUES (0x736974655f6e616d65, '智能无线点餐系统'), (0x736974655f636f6465, '琼ICP备15002637号-1');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
--  Records of `cc_user`
-- ----------------------------
BEGIN;
INSERT INTO `cc_user` VALUES ('2', '糍粑', '228568859', 'aasdasdzxkclzklxckl', 'c测试张哈', '1703864036', '0'), ('3', '程', 'pc85', '623c3218d81612bc5b327339e25eeed21347f9e96c588babf352c27e3161515b', '炒鸡admin', '1502870091', '0'), ('4', '程', 'pc8599', 'ec3434245bad39ccb5d1bbc313a68e6cca26bd3fcbffd5ff160ef33422d099db', '炒鸡admin', '1502871057', '0'), ('5', '程', 'pc8599110', 'a70d700f0430bde923a25c0d6a1d09dde271345b23c07e239b94f204ac28d795', '炒鸡admin', '1502871222', '0'), ('6', '程', 'pc859922', '4eefba35cdfbc69a6d073d865ddbf33c40711da4bd1bc05b1489bc5a4867329c', '炒鸡admin', '1502871269', '0'), ('8', 'qqq', '228596321', '725a289793d69321bd786166ad7a8bc4fa0660573460d34b2f5e87e111d947e7', 'zxczxcz', '1502871659', '0'), ('9', 'qqq', '9564564', 'a2225de081c1da76160dd04d99de4a9439c9e1f31843ffd2f0bfbceda714b712', 'zxczxcz', '1502871724', '1'), ('10', 'qqq', '9564564120', 'c30d43afeba75f98af26cae7bfb628ca4e9dcc34a385127019dda28a352d885e', 'zxczxcz', '1502871826', '1'), ('11', 'qqq', '9564564110', '5c06478ca9ae9a61ead0bf921e3406bd4d2ce6fe7a8953cda58b6a131265c004', 'zxczxcz', '1502872562', '0'), ('14', '程打野', 'pc859107393', '1b4d2f7c7438009f6bb8154b96e3c75f6a161912fc7ca8b6eb095776499363f7', 'admin', '1503347744', '1'), ('15', '加快速度金坷垃', '123456789', '500f48637f4f3e081bd6a107eb8793dc9a556faeb60ce66a5c82a93321f68884', null, '1505153276', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
