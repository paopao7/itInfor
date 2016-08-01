/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : localhost
 Source Database       : itInfor

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 08/02/2016 00:38:23 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `uc_message`
-- ----------------------------
DROP TABLE IF EXISTS `uc_message`;
CREATE TABLE `uc_message` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `image` varchar(500) CHARACTER SET latin1 DEFAULT NULL COMMENT '消息图标路径',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL,
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `uc_message`
-- ----------------------------
BEGIN;
INSERT INTO `uc_message` VALUES ('1', 'http://api.itinfor.cn/Public/images/add_friend_icon_offical@3x.png', '语文', '语文语文语文语文语文语文语文语文', '1470062445');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
