/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ffdb

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 04/19/2018 17:16:02 PM
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
  `location` text CHARACTER SET utf8 NOT NULL COMMENT '地点',
  `type` text COLLATE utf8_bin COMMENT '课程类别',
  `date` datetime NOT NULL COMMENT '创建时间/修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='培训课程详情';

-- ----------------------------
--  Table structure for `duty`
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` text CHARACTER SET utf8 NOT NULL COMMENT '权限描述文字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `duty_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='职责';

-- ----------------------------
--  Records of `duty`
-- ----------------------------
BEGIN;
INSERT INTO `duty` VALUES ('1', '用户管理'), ('2', '添加用户'), ('3', '修改用户'), ('4', '用户列表');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上传资源记录表';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员的ID信息，自增主键',
  `name` text CHARACTER SET utf8 NOT NULL COMMENT '用户姓名',
  `tel` text CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `sex` text CHARACTER SET utf8 NOT NULL COMMENT '性别',
  `duty` text CHARACTER SET utf8 NOT NULL COMMENT '职务，对应权限的ID列表',
  `password` text CHARACTER SET utf8 NOT NULL COMMENT '用户密码',
  `type` text CHARACTER SET utf8 NOT NULL COMMENT '设计师、学徒、管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人员信息表';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '系统管理员', '18889408337', '男', '1|2|3', '1d67b5efe38554a461196532afb745f55b3f368702c8c5e630d4172e5e454e54', 'admin');
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
  `score` int(11) NOT NULL COMMENT '设计师评分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `works_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='作品';

SET FOREIGN_KEY_CHECKS = 1;
