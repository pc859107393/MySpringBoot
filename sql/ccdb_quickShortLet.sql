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

 Date: 03/15/2018 00:10:54 AM
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
  `used` tinyint(4) NOT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_banner_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首页轮播图';

-- ----------------------------
--  Records of `cc_banner`
-- ----------------------------
BEGIN;
INSERT INTO `cc_banner` VALUES ('1', 0xe68891e58ebbefbc8ce587bae997aee9a298e4ba86, 0x7777772e676f6f676c652e636f6d, 0x687474703a2f2f7777772e736f736f6274742e636f6d2f696d616765732f46494c452e706e67, null, '1'), ('2', 0xe5ba8ae6b58be8af95303032, 0x7777772e676f6f676c652e636e, 0x687474703a2f2f7777772e736f736f6274742e636f6d2f696d616765732f46494c452e706e67, 0xe6b58be8af95e695b0e68dae, '0'), ('3', 0x6365736869303033, 0x7777772e676f6f676c652e636f6d2e686b, 0x687474703a2f2f7777772e736f736f6274742e636f6d2f696d616765732f46494c452e706e67, null, '1'), ('4', 0x6365736869303034, 0x7777772e676f6f676c652e636f6d2e686b, 0x687474703a2f2f7777772e736f736f6274742e636f6d2f696d616765732f46494c452e706e67, 0xe68891e59ca8e6b58be8af95e595a6, '0');
COMMIT;

-- ----------------------------
--  Table structure for `cc_guard`
-- ----------------------------
DROP TABLE IF EXISTS `cc_guard`;
CREATE TABLE `cc_guard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` text COLLATE utf8_bin NOT NULL COMMENT '标题',
  `date` datetime NOT NULL COMMENT '创建时间',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '内容',
  `cover` text COLLATE utf8_bin COMMENT '特色图片地址，用,分割',
  `description` text COLLATE utf8_bin COMMENT '特色的文字描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='我们的保障';

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
--  Records of `cc_user`
-- ----------------------------
BEGIN;
INSERT INTO `cc_user` VALUES ('14', '系统管理员-程', 'pc859107393', '1b4d2f7c7438009f6bb8154b96e3c75f6a161912fc7ca8b6eb095776499363f7', 'admin', '1503347744', '1'), ('15', '程', 'pc859922', '2ced6abaf710a3b9cc73c52244eb1d70f8e395398eef5f5d24e77d9b1e2372ef', '炒鸡admin', '1519297565', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
