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

 Date: 03/20/2018 15:26:53 PM
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
INSERT INTO `cc_banner` VALUES ('1', 0xe9a9b1e89a8ae599a8e7bf81, 0x7777772e71712e636f6d, 0x696d2e71712e636f6d, 0xe887aae8a18ce8bda6e694afe68c81e4b88b, '0'), ('2', 0xe6b58be8af95e695b0e68dae303032, 0x68747470733a2f2f7777772e62616964752e636f6d, 0x68747470733a2f2f7431302e62616964752e636f6d2f69742f753d313033303437343532312c34323037363736373326666d3d31373326733d424431374346313430373545353436333043373739434343303330304330424126773d35353026683d33393326696d672e4a504547, '', '0'), ('3', 0xe6b58be8af95414243, 0x68747470733a2f2f7777772e62616964752e636f6d, 0x68747470733a2f2f7431302e62616964752e636f6d2f69742f753d313037373831393031352c3131303239303839393826666d3d31373326733d373239353331433431373631423934443138453743443038303330304530384226773d36343026683d33343226696d672e4a504547, 0xe6b58be8af95e5ae83e5a4a7e788b7e79a84, '0'), ('4', 0xe6b58be8af95e6a087e9a2982de4b889e4ba9a2de5908de5b185, 0x68747470733a2f2f7777772e7a686968752e636f6d2f7175657374696f6e2f3538393534323333, 0x687474703a2f2f696d67332e7265646f636e2e636f6d2f74757069616e2f32303135303433302f6d616e74656e6768756177656e6d6f6469616e7368696c69616e676265696a696e675f333932343730342e6a7067, 0xe6b58be8af95e6a087e9a2982de4b889e4ba9a2de5908de5b185, '1');
COMMIT;

-- ----------------------------
--  Table structure for `cc_base_house`
-- ----------------------------
DROP TABLE IF EXISTS `cc_base_house`;
CREATE TABLE `cc_base_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` text NOT NULL COMMENT '房屋名字',
  `house_type` varchar(255) NOT NULL COMMENT '房屋类型',
  `live_num` int(11) DEFAULT NULL COMMENT '宜居人数',
  `address` text NOT NULL COMMENT '房屋地点',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '维度',
  `household_id` int(11) DEFAULT NULL COMMENT '户主ID',
  `used` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可用，默认不可用，需审核',
  `status` int(11) DEFAULT NULL COMMENT '房源状态',
  `rent_type` int(11) DEFAULT NULL COMMENT '租售类型，短租 1，长租 2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_base_house_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基本房源数据';

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='我们的保障';

-- ----------------------------
--  Records of `cc_guard`
-- ----------------------------
BEGIN;
INSERT INTO `cc_guard` VALUES ('1', 0xe68891e4bbace4bb8ae697a5e79a84e4bf9de99a9ce69c8de58aa1, '2018-03-17 17:14:29', 0x3c703ee8afb7e59ca8e6ada4e5a484203c623ee7bc96e8be91e58685e5aeb9e68891e4bbace69c89e5be88e5a49ae789b9e889b2e4bf9de99a9cefbc8ce4bda0e4bfa1e4b88de4bfa1efbc9f3c2f623e3c2f703e, '', ''), ('2', 0xe68891e4bbace79a84e789b9e889b2e4bf9de99a9ce69c8de58aa1, '2018-03-17 17:24:24', 0x3c703e233c62723e3c2f703e3c703ee694bee5bf83e585a5e4bd8f3c62723ee58d83e4b887e4bf9de99a9cefbc8ce8b594e4bb98e58588e8a18c3c62723e3c62723e30313c62723ee69c89e688bfe4bf9de99a9c3c62723ee588b0e5ba97e697a0e688bfe68896e588b0e5ba97e88194e7b3bbe4b88de4b88ae688bfe4b89cefbc8ce5afbce887b4e697a0e6b395e585a5e4bd8fe9a284e8aea2e688bfe6ba903c62723e3c62723ee7bb8fe6a0b8e5ae9ee58f8ae58d8fe8b083e4bb8de697a0e6b395e585a5e4bd8fe79a84efbc8ce68891e4bbace5b086e585a8e9a29de98080e6acbee5b9b6e9a29de5a496e8a1a5e581bfe58e9fe8aea2e58d95e9a696e6999ae688bfe8b4b9e380823c62723e3c62723e30323c62723ee79bb8e7aca6e4bf9de99a9c3c62723ee585a5e4bd8fe697b6e58f91e78eb0e688bfe997b4e6a0bce5b180e38081e99da2e7a7afe7ad89e4b88ee7bd91e4b88ae68f8fe8bfb0e4b8a5e9878de4b88de7aca6e68896e8aebee696bde68d9fe59d8fefbc8ce5bdb1e5938de585a5e4bd8f3c62723e3c62723ee7bb8fe6a0b8e5ae9ee58f8ae58d8fe8b083e4bb8de697a0e6b395e585a5e4bd8fe79a84efbc8ce68891e4bbace5b086e585a8e9a29de98080e6acbee5b9b6e9a29de5a496e8a1a5e581bfe58e9fe8aea2e58d95e9a696e6999ae688bfe8b4b9e380823c62723e3c62723e30333c62723ee694b6e8b4b9e4bf9de99a9c3c62723ee7a1aee8aea4e8aea2e58d95e5908ee5a682e688bfe4b89ce8a681e6b182e9a29de5a496e694b6e58f96e69caae4ba8be5898de7baa6e5ae9ae79a84e8b4b9e794a83c62723e3c62723ee7bb8fe6a0b8e5ae9ee58f8ae58d8fe8b083e697a0e6b395e981bfe5858de4b894e5bdb1e5938de585a5e4bd8fe79a84efbc8ce68891e4bbace5b086e98080e8bf98e6ada4e9a29de5a496e8b4b9e794a8e5b9b6e8a1a5e581bfe4b880e5808de8afa5e8b4b9e794a83c62723e3c62723e30343c62723ee58dabe7949fe4bf9de99a9c3c62723ee585a5e4bd8fe697b6e58f91e78eb0e688bfe997b4e8848fe4b9b1e68896e69caae8bf9be8a18ce68993e689ab3c62723e3c62723ee5a682e7bb8fe6a69be69e9ce5aea2e69c8de6a0b8e5ae9ee5b19ee5ae9eefbc8ce68891e4bbace5b086e585a8e9a29de98080e6acbe3c62723e3c62723e30353c62723ee4bd93e9aa8ce4bf9de99a9c3c62723ee585a5e4bd8fe697b6e58f91e78eb0e8a2abe4b8b4e697b6e68da2e688bfefbc8ce7bb8fe6a0b8e5ae9ee58f8ae58d8fe8b083e6ada3e5b8b8e585a5e4bd8fe5908ee4bb8de5bdb1e5938de585a5e4bd8fe4bd93e9aa8ce79a84efbc8ce68891e4bbace5b086e8a1a5e581bfe9a696e6999ae688bfe8b4b9efbc8ce69c80e9ab98e58fafe5be9731303030e585833c62723e3c62723ee585a5e4bd8fe5908ee58f97e588b0e4b8a5e9878de599aae99fb3e5b9b2e689b0e38081e688bfe4b89ce6b29fe9809ae697b6e68081e5baa6e681b6e58aa3efbc8ce7bb8fe6a0b8e5ae9ee58f8ae58d8fe8b083e6ada3e5b8b8e585a5e4bd8fe5908ee4bb8de5bdb1e5938de585a5e4bd8fe4bd93e9aa8ce79a84efbc8ce68891e4bbace5b086e8a1a5e581bf3130252d353025e79a84e9a696e6999ae688bfe8b4b9efbc8ce69c80e9ab98e58fafe5be97353030e585833c62723e3c62723e233c62723e3c62723ee8b4b4e5bf83e5aea2e69c8d3c62723ee4b88ae6b5b7e38081e58c97e4baace38081e9878de5ba86e5b7b2e5bc80e9809ae4b893e5b19ee7aea1e5aeb6e69c8de58aa1efbc8ce58d8fe58aa9e682a8e8a7a3e586b3e9a284e8aea2e4b98be5908ee79a84e4bbbbe4bd95e997aee9a2983c62723e3c62723ee585b6e4bb96e59f8ee5b882e88ba5e59ca8e9a284e8aea2e8bf87e7a88be4b8ade99c80e8a681e58d8fe58aa9efbc8ce58fafe68ba8e68993e6a69be69e9ce5aea2e69c8de783ade7babf203430302d3036362d303139303c62723e3c62723ee5a682e682a8e79a84e8aea2e58d95e5bd93e5a4a9e585a5e4bd8fefbc8ce68891e4bbace5b086e4ba8e31e5b08fe697b6e58685e7ad94e5a48d3c62723e3c62723ee5a682e682a8e79a84e8aea2e58d95e99d9ee5bd93e697a5e585a5e4bd8fefbc8ce68891e4bbace5b086e4ba8e32e5b08fe697b6e58685e7ad94e5a48d3c62723e3c62723e233c62723ee4bfa1e794a8e8aea4e8af813c62723ee5ae9ee5908de4bfa1e794a8efbc8ce5ae89e585a8e694bee5bf833c62723e3c62723e3c62723ee68f90e4be9be8baabe4bbbde4bfa1e681af3c62723ee59ca8e688bfe5aea2e9a284e8aea2e5928ce688bfe4b89ce4b88ae7babfe688bfe6ba90e697b6efbc8ce59d87e99c80e68f90e4be9be5ae9ee99985e79a84e5a793e5908de58f8ae8baabe4bbbde8af81e4bfa1e681af3c62723e3c62723e203c62723ee585ace5ae89e7b3bbe7bb9fe58cb9e9858d3c62723ee5b086e6a0b9e68daee68f90e4be9be79a84e4bfa1e681afe4b88ee585ace5ae89e7b3bbe7bb9fe8bf9be8a18ce58cb9e9858d3c62723e3c62723e203c62723ee9809ae8bf87e8aea4e8af813c62723ee6a0b8e9aa8ce9809ae8bf87e5908ee58db3e5ae8ce68890e5ae9ee5908de8aea4e8af81efbc8ce6898de58fafe7bba7e7bbade688bfe6ba90e79a84e9a284e8aea2e4b88ee594aee58d963c62723e3c62723e20e4ba86e8a7a3e88a9de9babbe4bfa1e794a83c62723e233c62723ee5ae89e585a8e697a0e5bfa73c62723ee688bfe5aea2e688bfe4b89ce4bf9de999a9e4bf9de99a9c3c62723e3c62723ee688bfe5aea2e9a284e8aea2e58db3e98081e3808ae688bfe5aea2e999a9e3808b3c62723ee6a69be69e9ce6b091e5aebfe28094e28094e8aea9e5b9b4e8bdbbe4babae4bd8fe79a84e69bb4e5a5bdefbc8ce4bd8fe79a84e69bb4e5ae89e5bf83efbc81e6a69be69e9ce88194e59088e4bc98e8b4a8e4bf9de999a9e69cbae69e84e4b8bae682a8e68f90e4be9be38082e9a284e8aea2e58db3e58fafe5858de8b4b9e8b5a0e98081e4bf9de9a29d3130e4b887e58583e79a84e4bd8fe5aebfe6848fe5a496e999a93c62723e3c62723ee69fa5e79c8be8afa6e683853c62723ee688bfe4b89ce5ae9ee5908de8aea4e8af81e58db3e4baabe3808ae688bfe4b89ce999a9e3808b3c62723ee9809ae8bf87e5ae9ee5908de8aea4e8af81e79a84e688bfe4b89cefbc8ce682a8e5b086e5858de8b4b9e4baabe58f97e2809ce688bfe5b18be8b4a2e4baa7e697a0e5bfa7e4bf9de99a9ce8aea1e58892e2809de79a84e59084e9a1b9e69d83e79b8ae380823c62723e3c62723ee99288e5afb9e682a8e79a84e6af8fe4b880e4b8aae8aea2e58d95efbc8ce59ca8e688bfe5aea2e585a5e4bd8fe69c9fe997b4efbc8ce6a69be69e9ce5b086e8b5a0e98081e9ab98e9a29de8b4a2e4baa7e4bf9de999a9efbc8ce8aea9e682a8e5afb9e7be8ee5b18be79a84e585b1e4baabe6afabe697a0e5908ee9a1bee4b98be5bfa7e380823c62723e3c62723e3c2f703e, '', '');
COMMIT;

-- ----------------------------
--  Table structure for `cc_user`
-- ----------------------------
DROP TABLE IF EXISTS `cc_user`;
CREATE TABLE `cc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(25) NOT NULL DEFAULT '-1' COMMENT '用户登录名称',
  `password` varchar(256) NOT NULL DEFAULT '-1' COMMENT '用户密码，建议算法：sha256(MD5(明文)+salt)',
  `duty` varchar(50) DEFAULT NULL COMMENT '用户职位',
  `create_date` int(11) NOT NULL COMMENT '创建时间',
  `used` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户是否可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `cc_user`
-- ----------------------------
BEGIN;
INSERT INTO `cc_user` VALUES ('14', '系统管理员-程', 'pc859107393', '1b4d2f7c7438009f6bb8154b96e3c75f6a161912fc7ca8b6eb095776499363f7', 'admin', '1503347744', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
