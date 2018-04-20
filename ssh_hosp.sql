/*
Navicat MySQL Data Transfer

Source Server         : mvn
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : ssh_hosp

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-11-23 19:53:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hosp_authority
-- ----------------------------
DROP TABLE IF EXISTS `hosp_authority`;
CREATE TABLE `hosp_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(255) DEFAULT NULL,
  `authority_url` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_authority
-- ----------------------------
INSERT INTO `hosp_authority` VALUES ('1', '挂号信息管理', 'regis/index.action', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('2', '门诊医生管理', 'doctor/index.action', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('3', '药品管理', 'drug/index.action', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('4', '住院办理', null, '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('7', '住院结算', '55454', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('8', '月营业额统计', null, '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('9', '年营业额统计', null, '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('10', '用户管理', 'user/index.action', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('11', '角色管理', 'role/index.action', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('12', '资源管理', 'authority/index.action', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('13', '密码设置', null, '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('14', 'dsf', null, '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('15', '发给', 'dfgdf', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('17', '在线发药', '454545454', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('18', '主会但是', 'dskhki', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('20', '66677', '66677', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('21', 'aaaaa', 'a', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('22', 'df', 'hg', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('23', 'juhk', '6', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('24', 'kjgh1', '2jhjuih', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('25', 'HJGHJ', '2HJGHJ', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('26', 'JHLJK', 'HBJKJB', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('27', 'HJG', 'HJGHJ', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('28', 'JHKJ', 'KJO;', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('29', 'HGHJ', 'HJGJ', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('30', 'JHKJH', 'JUHKU', '1', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('31', '8HOI', 'TYDYGH', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('32', 'YUHJ', 'HJG', '0', null, null, null, null);
INSERT INTO `hosp_authority` VALUES ('33', '0DKJH', 'UIGY', '1', null, null, null, null);

-- ----------------------------
-- Table structure for hosp_doctor
-- ----------------------------
DROP TABLE IF EXISTS `hosp_doctor`;
CREATE TABLE `hosp_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `doctor_num` varchar(255) DEFAULT NULL,
  `doctor_papers_num` varchar(255) DEFAULT NULL,
  `doctor_papers_type` int(11) DEFAULT NULL,
  `education` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `pass_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `special_plane` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt2lhaskv5vqg691k6asi0fbv` (`office_id`),
  CONSTRAINT `FKt2lhaskv5vqg691k6asi0fbv` FOREIGN KEY (`office_id`) REFERENCES `hosp_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_doctor
-- ----------------------------
INSERT INTO `hosp_doctor` VALUES ('1', '2017-10-11 21:23:18', '2017-10-03 21:23:48', null, '程军', 'y11111', '111111', '0', '1', '53545@sdkji', '54454', '1995-06-12 21:26:04', '	工作热情积极表现非常的优异', '1', '5656', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('2', '2017-10-10 21:23:21', '2017-11-04 21:23:44', null, '王博', 'w11112', '111112', '1', '2', '@kjd', '56544', '2017-10-18 21:25:27', '	工作热情积极表现非常的优异', '1', '1545', null, null, '3');
INSERT INTO `hosp_doctor` VALUES ('3', '2017-10-25 21:23:27', '2017-10-24 21:23:41', null, '欧阳露露', 'o11113', '111113', '2', '1', 'kdjs@kd', '9897468458', '2016-02-03 21:25:32', '	工作热情积极表现非常的优异', '0', '545684', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('4', '2017-10-04 21:23:24', null, null, '谢科ss', null, '4sdf a', '0', '0', 'aajhjh@163.com', 'ddd', null, '	工作热情积极表现非常的优异', '1', '544asdss', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('5', '2017-10-17 21:23:30', '2017-10-18 21:23:34', null, '张华', 'z11115', '111115', '2', '1', '1', '251564', '2015-11-12 21:25:41', '	工作热情积极表现非常的优异', '0', '48865', null, null, '6');
INSERT INTO `hosp_doctor` VALUES ('6', '2017-04-10 21:24:28', '2018-01-23 21:24:35', null, '小小呵', 'x11116', '111116', '1', '2', 'xiaoxioahe@qq.com', '3323251', '2016-11-23 21:25:48', '	工作热情积极表现非常的优异', '1', '56456', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('7', '2017-10-16 15:18:00', null, null, '金科', null, '123456jin', '1', '1', 'hyc@qq.com', '1522', null, '水电费', '1', '54565', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('8', '1971-05-10 15:20:00', null, null, '德玛西亚', null, 'de99999', '1', '0', 'de@qq.com', '9999', null, '饿吗活动时间好', '1', '000000', null, null, '7');
INSERT INTO `hosp_doctor` VALUES ('9', '1987-02-18 21:23:24', null, null, '谢南', null, 'x111114', '0', '2', 'ajhjh@163.com', 'x564564568', null, '	x工作热情积极表现非常的优异', '1', 'x544', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('10', null, null, null, '', null, '', '0', '0', '', '', null, '', '1', '', null, null, '1');

-- ----------------------------
-- Table structure for hosp_drug
-- ----------------------------
DROP TABLE IF EXISTS `hosp_drug`;
CREATE TABLE `hosp_drug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Taking_instructions` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `detail_desc` varchar(255) DEFAULT NULL,
  `drug_desc` varchar(255) DEFAULT NULL,
  `drug_image_url` varchar(255) DEFAULT NULL,
  `drug_name` varchar(255) DEFAULT NULL,
  `drug_num` varchar(20) DEFAULT NULL,
  `drug_type` int(11) DEFAULT NULL,
  `gross_purchases` int(11) DEFAULT NULL,
  `produced_time` datetime DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `shelf_time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `surplus` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qdbumuy384g162wgmq3hyv6am` (`drug_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_drug
-- ----------------------------
INSERT INTO `hosp_drug` VALUES ('1', '生病了', '2017-10-03 16:34:05', null, '富含维生素', '一天一次，一次一片', null, '感冒药', '15454545', '1', null, '2017-10-03 16:32:12', '10.5', '感冒的人使用', '25', '23', '1', '100', null, null, '药膳');
INSERT INTO `hosp_drug` VALUES ('2', '吃吧', '2017-10-02 16:35:27', null, '高钙片，吃了能让你长高', '一天一次', null, '高钙片', '54454548', '0', null, '2017-10-10 16:36:20', '56', '咀嚼使用', '89', '100', '0', '35', null, null, '同仁');
INSERT INTO `hosp_drug` VALUES ('3', '视野变得更亮了', '2017-10-04 16:37:57', null, '眼睛不酸了', '滴一滴', null, '眼药水', '54548875', '2', null, '2017-10-18 16:38:42', '18.9', '清洁眼睛', '52', '15', '1', '65', null, null, '宝视达');

-- ----------------------------
-- Table structure for hosp_office
-- ----------------------------
DROP TABLE IF EXISTS `hosp_office`;
CREATE TABLE `hosp_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `office_desc` varchar(255) DEFAULT NULL,
  `office_name` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_office
-- ----------------------------
INSERT INTO `hosp_office` VALUES ('1', null, 'dsf', '身强力壮', '骨科', null, null);
INSERT INTO `hosp_office` VALUES ('2', null, '小明啊', '啊啊啊', '口腔科', null, null);
INSERT INTO `hosp_office` VALUES ('3', null, 'hh', '看你的血型', '血液科', null, null);
INSERT INTO `hosp_office` VALUES ('4', null, 'aa', '小朋友，快看这个', '儿科', null, null);
INSERT INTO `hosp_office` VALUES ('5', null, '小爱下', '心跳的节奏', '内科', null, null);
INSERT INTO `hosp_office` VALUES ('6', null, '小明', '想要有一口美丽健康的牙齿', '牙科', null, null);
INSERT INTO `hosp_office` VALUES ('7', null, '小英', '神奇的', '神经科', null, null);

-- ----------------------------
-- Table structure for hosp_registinfo
-- ----------------------------
DROP TABLE IF EXISTS `hosp_registinfo`;
CREATE TABLE `hosp_registinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `early_appointment` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `regist_name` varchar(255) DEFAULT NULL,
  `regist_num` varchar(255) DEFAULT NULL,
  `regist_papers_num` varchar(255) DEFAULT NULL,
  `regist_papers_type` varchar(255) DEFAULT NULL,
  `regist_social_num` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `self_paying` int(11) DEFAULT NULL,
  `fee_money` double DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sbhp2rpy068tw0qx4bxgocfiv` (`regist_num`),
  KEY `FK5maf0pdw1b3wdu2k82bb1neru` (`doctor_id`),
  KEY `FK9lftglgi4x97viqwh68kr6vty` (`office_id`),
  CONSTRAINT `FK5maf0pdw1b3wdu2k82bb1neru` FOREIGN KEY (`doctor_id`) REFERENCES `hosp_doctor` (`id`),
  CONSTRAINT `FK9lftglgi4x97viqwh68kr6vty` FOREIGN KEY (`office_id`) REFERENCES `hosp_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_registinfo
-- ----------------------------
INSERT INTO `hosp_registinfo` VALUES ('1', '5', '2017-10-18 21:03:55', null, '1', 'IT', '4547581', '王璐', 'b1103', '54545452', '2', '8455454', '此人脑袋不舒服', '0', '56.2', '0', '1', null, null, '1', '3');
INSERT INTO `hosp_registinfo` VALUES ('2', '45', '2011-10-21 21:03:59', null, '0', null, '5545447', '张珊', 'b1104', '35456456', '1', null, '此人牙疼', '1', '100', '1', '2', null, null, '2', '6');
INSERT INTO `hosp_registinfo` VALUES ('3', '25', '2017-07-21 21:04:04', null, '1', null, '5436457', '小黑', 'b1105', '45545465', '2', null, '此人心塞', '1', '50', '0', '3', null, null, '3', '4');
INSERT INTO `hosp_registinfo` VALUES ('4', '63', '2015-10-17 21:04:08', null, '0', null, '8254555', '阿珂', 'b1106', '56465465', '1', null, '此人上火', '0', '40.9', '0', '0', null, null, '2', '7');
INSERT INTO `hosp_registinfo` VALUES ('5', '9', '2017-04-21 21:04:15', null, '0', null, '4545546', '艾克', 'b1107', '87987987', '0', null, '此人傻了', '1', '56.67', '1', '0', null, null, '5', '1');
INSERT INTO `hosp_registinfo` VALUES ('6', '3', '2017-10-03 21:13:52', null, '1', null, '5656566', '田志芳', 'x1656', '97894684', '2', null, null, '1', '152', '2', '3', null, null, '3', '2');
INSERT INTO `hosp_registinfo` VALUES ('8', '12', null, null, '0', '销售', '1545454', '含河a', null, '12545454z', '0', '45454878', ' 此人头疼', '0', '24.62', '1', '0', '2017-10-22 14:49:40', null, '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('9', null, '2017-10-25 14:22:17', null, '0', '', '5463566', '金额', 'j55648', '54658445', '0', '', '', '0', '874.6', '1', '3', null, null, '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('10', '3', '2017-10-21 22:34:19', null, '0', 'dfg ', '4535754', '地方', 'd8996', '78749879', '1', 'dfg', 'sdf sdfdsf', '0', '43', '0', '0', null, null, '2', '3');
INSERT INTO `hosp_registinfo` VALUES ('11', '2', '2017-10-22 15:56:31', null, '0', '吃饭', '2323', 'hah', null, '4ewe', '0', 'sdfds', '牙疼', '1', '23', '1', '0', null, null, '3', '2');
INSERT INTO `hosp_registinfo` VALUES ('12', '2', '2017-10-22 16:04:32', null, '0', '发', '23424', '但是', '28179034', '收到', '0', '234', '收到', '0', '23', '1', '0', null, null, null, '1');
INSERT INTO `hosp_registinfo` VALUES ('13', null, '2017-10-22 17:05:29', null, '0', '', '', '和A计划', '21488549', 'dfg df', '0', 'dfgdf', '', '0', '3', '1', '0', null, null, '1', '1');

-- ----------------------------
-- Table structure for hosp_role
-- ----------------------------
DROP TABLE IF EXISTS `hosp_role`;
CREATE TABLE `hosp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_num` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role
-- ----------------------------
INSERT INTO `hosp_role` VALUES ('1', '超级管理员', '111111', '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('2', '用户管理员', '222222', '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('3', '一般用户', '333333', '0', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('4', '黑客黑进去', null, '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('5', '你进不去', '256565', '0', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('6', '闲杂用户啊', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for hosp_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `hosp_role_authority`;
CREATE TABLE `hosp_role_authority` (
  `role_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  PRIMARY KEY (`authority_id`,`role_id`),
  KEY `FKtowon8uaoo8ut0d49vlvymug` (`role_id`),
  CONSTRAINT `FKtamlj7dg53dryimq9s5wdwqdo` FOREIGN KEY (`authority_id`) REFERENCES `hosp_authority` (`id`),
  CONSTRAINT `FKtowon8uaoo8ut0d49vlvymug` FOREIGN KEY (`role_id`) REFERENCES `hosp_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role_authority
-- ----------------------------
INSERT INTO `hosp_role_authority` VALUES ('1', '1');
INSERT INTO `hosp_role_authority` VALUES ('1', '2');
INSERT INTO `hosp_role_authority` VALUES ('1', '3');
INSERT INTO `hosp_role_authority` VALUES ('1', '4');
INSERT INTO `hosp_role_authority` VALUES ('1', '8');
INSERT INTO `hosp_role_authority` VALUES ('1', '9');
INSERT INTO `hosp_role_authority` VALUES ('1', '10');
INSERT INTO `hosp_role_authority` VALUES ('1', '11');
INSERT INTO `hosp_role_authority` VALUES ('1', '12');
INSERT INTO `hosp_role_authority` VALUES ('1', '13');
INSERT INTO `hosp_role_authority` VALUES ('2', '8');
INSERT INTO `hosp_role_authority` VALUES ('2', '9');
INSERT INTO `hosp_role_authority` VALUES ('2', '10');
INSERT INTO `hosp_role_authority` VALUES ('2', '11');
INSERT INTO `hosp_role_authority` VALUES ('2', '12');
INSERT INTO `hosp_role_authority` VALUES ('2', '13');
INSERT INTO `hosp_role_authority` VALUES ('3', '1');
INSERT INTO `hosp_role_authority` VALUES ('3', '2');
INSERT INTO `hosp_role_authority` VALUES ('3', '3');
INSERT INTO `hosp_role_authority` VALUES ('3', '4');
INSERT INTO `hosp_role_authority` VALUES ('6', '1');
INSERT INTO `hosp_role_authority` VALUES ('6', '10');
INSERT INTO `hosp_role_authority` VALUES ('6', '13');

-- ----------------------------
-- Table structure for hosp_user
-- ----------------------------
DROP TABLE IF EXISTS `hosp_user`;
CREATE TABLE `hosp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_620wsjgp6dmwct9ycoyw4rlsb` (`username`),
  KEY `FKcd615691nv3hn3pv88eok3oqv` (`role_id`),
  CONSTRAINT `FKcd615691nv3hn3pv88eok3oqv` FOREIGN KEY (`role_id`) REFERENCES `hosp_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_user
-- ----------------------------
INSERT INTO `hosp_user` VALUES ('1', 'aa', 'aa', '1', null, '阿珂', '3', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('2', 'admin', '123456', '1', 'admin@qq.com', 'HYC', '1', '小小', '2017-10-10 11:58:56', null, null);
INSERT INTO `hosp_user` VALUES ('3', '小小', '123456', '1', 'xiaoxiao@qq.com', '郑爽', '2', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('4', 'hh', '123456', '1', 'hh@126.c', '韩寒', '3', 'dfg', '2017-10-16 10:38:32', 'd', null);
INSERT INTO `hosp_user` VALUES ('10', 'bcvf', 'cvbcv', '0', 'cvbcv@gfh', 'cvbcvbc', '3', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('11', '韩燕超fgh gfhgfc', 'ghxdfgh', '0', 'fghf', 'gfhfg', '2', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('12', '你好呀', '56565', '1', 'hanxin@qq.com', '韩欣', '3', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('14', 'sdfdsfs', 'sdfds', '1', 'sdfds@dfs.com', 'sdfsd', '3', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('15', '潮痕', 'chaohen', '1', 'chaohen@126.com', 'HYC', '2', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('16', 'ssad', 'aaa', '1', 'aa', 'aa', '3', null, null, null, null);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
