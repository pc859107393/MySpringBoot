/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : ccdb

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 02/22/2018 01:02:51 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cc_banner`
-- ----------------------------
DROP TABLE IF EXISTS `cc_banner`;
CREATE TABLE `cc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_bin NOT NULL COMMENT '标题',
  `url` text COLLATE utf8_bin NOT NULL COMMENT '网址',
  `pic` text COLLATE utf8_bin NOT NULL COMMENT '图片地址',
  `other` text COLLATE utf8_bin COMMENT '其他描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_banner_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首页轮播图';

-- ----------------------------
--  Table structure for `cc_user`
-- ----------------------------
DROP TABLE IF EXISTS `cc_user`;
CREATE TABLE `cc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT '-1' COMMENT '用户登录名称',
  `password` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '-1' COMMENT '用户密码，建议算法：sha256(MD5(明文)+salt)',
  `duty` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户职位',
  `create_date` int(11) NOT NULL COMMENT '创建时间',
  `used` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
--  Records of `cc_user`
-- ----------------------------
BEGIN;
INSERT INTO `cc_user` VALUES ('14', '系统管理员-程', 'pc859107393', '1b4d2f7c7438009f6bb8154b96e3c75f6a161912fc7ca8b6eb095776499363f7', 'admin', '1503347744', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
