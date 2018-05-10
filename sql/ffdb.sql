/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : ffdb

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 05/11/2018 03:15:09 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID\n',
  `title` text CHARACTER SET utf8 NOT NULL COMMENT '培训课程标题',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '课程介绍',
  `user_id` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '教师ID，对应user表type类型为设计师',
  `password` text CHARACTER SET utf8 COMMENT '访问密码',
  `video` longtext COLLATE utf8_bin NOT NULL COMMENT '视频资源',
  `type` text COLLATE utf8_bin COMMENT '课程类别',
  `date` datetime NOT NULL COMMENT '创建时间/修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='培训课程详情';

-- ----------------------------
--  Records of `class`
-- ----------------------------
BEGIN;
INSERT INTO `class` VALUES ('1', 'PS基础入门-快捷键的使用', 0x3c703ee8afb7e59ca8e6ada4e5a484203c623ee7bc96e8be91e8afbee7a88be58685e5aeb93c2f623e3c2f703e3c703e3c696d67207372633d22687474703a2f2f6c6f63616c686f73743a383138312f6363537072696e67426f6f742f75706c6f616446696c65732f32303138303531302f61396236383861393032326334613936613131356266363134323631336163392e6a706722207374796c653d226d61782d77696474683a313030253b223e3c62723e3c2f703e, '3', '', 0x687474703a2f2f6c6f63616c686f73743a383138312f6363537072696e67426f6f742f75706c6f616446696c65732f32303138303531302f39643736333735643435633234336530396137346239396635343364383137392e706e67, 0xe59fbae7a180, '2018-05-10 11:54:33'), ('2', '基础屏幕截图', 0x3c703ee5b18fe5b995e688aae59bbee6b2a1e6af9be797853c2f703e3c703e3c62723e3c2f703e, '3', '', 0x687474703a2f2f6c6f63616c686f73743a383138312f6363537072696e67426f6f742f75706c6f616446696c65732f32303138303531302f66333039393337336362646434353339623636353165366336393065313334362e6d7034, 0xe59fbae7a180, '2018-05-10 12:03:09');
COMMIT;

-- ----------------------------
--  Table structure for `duty`
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` text CHARACTER SET utf8 NOT NULL COMMENT '权限描述文字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `duty_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='职责';

-- ----------------------------
--  Records of `duty`
-- ----------------------------
BEGIN;
INSERT INTO `duty` VALUES ('1', '用户管理'), ('2', '添加用户'), ('3', '修改用户'), ('4', '用户列表'), ('5', '课程管理'), ('6', '添加课程'), ('7', '所有课程'), ('8', '资源管理'), ('9', '添加资源'), ('10', '资源列表'), ('11', '作品管理'), ('12', '添加作品'), ('13', '作品列表'), ('14', '审阅作品'), ('15', '未审阅'), ('16', '已审阅');
COMMIT;

-- ----------------------------
--  Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` text CHARACTER SET utf8 COMMENT '原文件名',
  `user_id` int(11) NOT NULL COMMENT '上传者ID',
  `date` datetime NOT NULL COMMENT '创建日期',
  `password` text CHARACTER SET utf8 COMMENT '访问密码',
  `desc` text COLLATE utf8_bin COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上传资源记录表';

-- ----------------------------
--  Records of `resource`
-- ----------------------------
BEGIN;
INSERT INTO `resource` VALUES ('1', 'http://localhost:8181/ccSpringBoot/uploadFiles/20180424/642e0ac26cf24968bb371b16ec225a7f.dmg', '1', '2018-04-24 22:29:13', '', null);
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员的ID信息，自增主键',
  `name` text CHARACTER SET utf8 NOT NULL COMMENT '用户姓名',
  `tel` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` text CHARACTER SET utf8 NOT NULL COMMENT '性别',
  `duty` text CHARACTER SET utf8 NOT NULL COMMENT '职务，对应权限的ID列表',
  `password` text CHARACTER SET utf8 NOT NULL COMMENT '用户密码',
  `type` text CHARACTER SET utf8 NOT NULL COMMENT '设计师、学徒、管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_uindex` (`id`),
  UNIQUE KEY `user_tel_uindex` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人员信息表';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('3', '系统管理员', '18889408337', '女', '用户管理|添加用户|修改用户|用户列表|课程管理|添加课程|所有课程|资源管理|添加资源|资源列表|作品管理|添加作品|作品列表|审阅作品|未审阅|已审阅|', '1d67b5efe38554a461196532afb745f55b3f368702c8c5e630d4172e5e454e54', 'admin');
COMMIT;

-- ----------------------------
--  Table structure for `works`
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学徒作品ID',
  `user_id` int(11) NOT NULL COMMENT '学徒ID，对应用户表的type为学徒',
  `date` datetime NOT NULL COMMENT '上传时间',
  `name` text CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `comment` text CHARACTER SET utf8 COMMENT '评语',
  `score` int(11) DEFAULT NULL COMMENT '设计师评分',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容描述',
  `url` longtext COLLATE utf8_bin NOT NULL COMMENT '作品地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `works_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='作品';

-- ----------------------------
--  Records of `works`
-- ----------------------------
BEGIN;
INSERT INTO `works` VALUES ('1', '3', '2018-05-10 12:29:51', '我的作品', '<null>', null, 0x3c703ee88081e5b888e8bf99e698afe68891e79a84e4bd9ce59381efbc8ce9babbe783a6e682a8e79c8be4b88b3c2f703e3c703e3c62723e3c2f703e, 0x687474703a2f2f6c6f63616c686f73743a383138312f6363537072696e67426f6f742f75706c6f616446696c65732f32303138303531302f33616465643365366436346234373436383236623966333035633235653537372e6d7034), ('2', '3', '2018-05-11 01:09:45', '我的测试作品', '<p>该同学擅长学习，临摹效果不错</p><p><br></p>', '99', 0x3c703ee6b58be8af95e4bd9ce59381e4b88ae4bca03c2f703e3c703e3c62723e3c2f703e, 0x687474703a2f2f6c6f63616c686f73743a383138312f6363537072696e67426f6f742f75706c6f616446696c65732f32303138303531312f66653862366236643066323434333731383737333735616266636432343362352e6d7034);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
