/*
Navicat MySQL Data Transfer

Source Server         : xi
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-25 15:40:01
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
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `hosp_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `hosp_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_authority
-- ----------------------------
INSERT INTO `hosp_authority` VALUES ('1', '挂号信息管理', 'reg/regIndex.do', '1', null, null, null, null, '3');
INSERT INTO `hosp_authority` VALUES ('2', '门诊医生管理', 'doctor/index.do', '1', null, null, null, null, '1');
INSERT INTO `hosp_authority` VALUES ('3', '药品管理', 'drug/drugIndex.do', '0', null, null, null, null, '1');
INSERT INTO `hosp_authority` VALUES ('4', '住院办理', 'inhosp/inhospIndex.do', '1', null, null, '小小', '2018-04-18 15:58:53', '1');
INSERT INTO `hosp_authority` VALUES ('7', '住院结算', '55454', '1', null, null, null, null, '3');
INSERT INTO `hosp_authority` VALUES ('8', '在线发药', 'pills/pillsIndex.do', '1', null, null, null, null, '2');
INSERT INTO `hosp_authority` VALUES ('9', '医生开药', 'pres/presIndex.do', '1', null, null, null, null, '2');
INSERT INTO `hosp_authority` VALUES ('10', '用户管理', 'user/userIndex.do', '1', null, null, null, null, '2');
INSERT INTO `hosp_authority` VALUES ('11', '角色管理', 'role/roleIndex.do', '1', null, null, null, null, '1');
INSERT INTO `hosp_authority` VALUES ('12', '资源管理', 'resource/authoIndex.do', '1', null, null, null, null, '3');
INSERT INTO `hosp_authority` VALUES ('13', '密码设置', 'user/editUserPwd.do', '1', null, null, null, null, '4');
INSERT INTO `hosp_authority` VALUES ('32', 'YUHJ', 'HJG', '0', null, null, null, null, '4');
INSERT INTO `hosp_authority` VALUES ('33', '0DKJH', 'UIGY', '1', null, null, null, null, '2');
INSERT INTO `hosp_authority` VALUES ('35', 'jshd', 'jhaj哈11', '0', '小小', '2018-04-18 15:41:22', '小小', '2018-04-24 11:16:27', '4');
INSERT INTO `hosp_authority` VALUES ('44', '阿达', '324', '0', '小小', '2018-04-24 11:16:46', null, null, null);

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
  `doctor_num` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_doctor
-- ----------------------------
INSERT INTO `hosp_doctor` VALUES ('1', '2017-10-11 21:23:18', '2017-10-03 21:23:48', 'aa', '程军', 'y11111', '111111', '0', '1', '53545@sdkji', '54454', '1995-06-12 21:26:04', '	工作热情积极表现非常的优异', '1', '5656', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('2', '2017-10-10 00:00:00', '2017-11-04 21:23:44', 'aa', '王博', 'w11112', '111112498', '1', '2', '@kjd', '56544', '2017-10-18 21:25:27', '	工作热情积极表现非常的优异', '1', '1545', '2018-04-09 11:18:45', '小小', '1');
INSERT INTO `hosp_doctor` VALUES ('3', '2017-10-25 21:23:27', '2017-10-24 21:23:41', 'aa', '欧阳露露', 'o11113', '111113', '2', '1', 'kdjs@kd', '9897468458', '2016-02-03 21:25:32', '	工作热情积极表现非常的优异', '0', '545684', null, null, '1');
INSERT INTO `hosp_doctor` VALUES ('4', '2017-10-25 00:00:00', '2018-06-20 11:16:30', 'admin', '谢科ss', 'x53544', '410258199806072016', '0', '1', 'aajhjh@163.com', '18634597853', '2018-04-02 15:54:12', '	工作热情积极表现非常的优异', '1', '544asdssddd', '2018-03-27 13:33:41', 'aa', '2');
INSERT INTO `hosp_doctor` VALUES ('5', '2017-10-17 21:23:30', '2017-10-18 21:23:34', 'admin', '张华', 'z11115', '111115', '2', '1', '1@yeah.net', '251564', '2015-11-12 21:25:41', '	工作热情积极表现非常的优异', '0', '48865', null, null, '6');
INSERT INTO `hosp_doctor` VALUES ('6', '2017-04-10 21:24:28', '2018-01-23 21:24:35', 'aa', '小小呵', 'x11116', '111116', '1', '2', 'xiaoxioahe@qq.com', '3323251', '2016-11-23 21:25:48', '	工作热情积极表现非常的优异', '1', '56456', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('7', '2017-10-16 15:18:00', '2018-04-04 15:53:31', '小小', '金科', 'h45455', '123456jin', '1', '1', 'hyc@qq.com', '1522', '2018-03-25 15:54:15', '水电费', '1', '54565', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('8', '1971-05-10 15:20:00', '2018-04-09 15:53:34', '小小', '德玛西亚', 'u42422', 'de99999', '1', '0', 'de@qq.com', '9999', '2018-03-19 15:54:18', '饿吗活动时间好', '1', '000000', null, null, '7');
INSERT INTO `hosp_doctor` VALUES ('9', '1987-02-20 00:00:00', '2018-04-01 15:53:37', 'adim', '谢南', 'g73452', 'x111114', '0', '1', 'xienana@163.com', 'x564564568', '2018-01-12 15:54:22', '谢楠工作认真 踏实 负责啊asdf', '1', 'x544', '2018-03-27 14:45:33', 'aa', '1');
INSERT INTO `hosp_doctor` VALUES ('10', '1995-10-12 00:00:00', '2018-03-27 15:13:50', 'aa', '张丹', 'Do3h0X', '410258199806072016', '0', '3', 'tidetrace@yeah.net', 'ddd1664', '2018-05-14 15:54:26', '生殖细胞', '1', '544asdss55555555', null, null, '3');
INSERT INTO `hosp_doctor` VALUES ('11', '1995-06-08 00:00:00', '2018-03-27 15:41:24', 'admin', '小小', 'OV72Xy', '410236199506082016', '0', '2', 'xiaoxiao@126.com', '15987456125', '2017-05-12 15:54:31', '聪明伶俐 笑容动人', '0', '456456', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('12', '1999-10-15 00:00:00', '2018-03-27 15:44:11', 'admin', 'tocy', 'cJ94JU', '15684554', '2', '2', 'toc@foxmail.com', '15978456321', '2018-05-08 15:54:36', '美国女孩 是一个很好的护士', '1', '154545', '2018-03-27 15:45:13', 'admin', '1');
INSERT INTO `hosp_doctor` VALUES ('13', '1996-02-06 00:00:00', '2018-03-29 09:29:36', 'admin', '王艳', '372b28', '452696199602061026', '0', '2', '5456464@qq.com', '17598456123', '2018-04-01 15:54:45', '美女医生 热情服务', '0', '56589891', null, null, '3');

-- ----------------------------
-- Table structure for hosp_drug
-- ----------------------------
DROP TABLE IF EXISTS `hosp_drug`;
CREATE TABLE `hosp_drug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_num` varchar(255) DEFAULT NULL,
  `taking_instructions` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `detail_desc` varchar(255) DEFAULT NULL,
  `drug_desc` varchar(255) DEFAULT NULL,
  `drug_image_url` varchar(255) DEFAULT NULL,
  `drug_name` varchar(255) DEFAULT NULL,
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
  KEY `drug_num` (`drug_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_drug
-- ----------------------------
INSERT INTO `hosp_drug` VALUES ('1', '15454545', '生病了', '2017-10-03 16:34:05', null, '富含维生素', '一天一次，一次一片', null, '感冒药', '1', '45', null, '10.5', '感冒的人使用', '25', '23', '1', '100', null, null, '药膳');
INSERT INTO `hosp_drug` VALUES ('2', '54454548', '吃吧', '2017-10-02 16:35:27', null, '高钙片，吃了能让你长高', '一天一次', null, '高钙片', '0', '566', null, '56', '咀嚼使用', '89', '100', '0', '35', null, null, '同仁');
INSERT INTO `hosp_drug` VALUES ('3', '54548875', '视野变得更亮了', '2017-10-04 16:37:57', null, '眼睛不酸了', '滴一滴', null, '眼药水', '2', '666', null, '18.9', '清洁眼睛', '52', '15', '3', '65', null, null, '宝视达');
INSERT INTO `hosp_drug` VALUES ('4', '15454546', '腰不疼', '2018-03-13 19:30:32', null, '啦啦啦', '一一aa', null, '海士兰', '3', '666', '2016-09-05 00:00:00', '45.6', '不知道', '89', '45', '1', '54', null, null, '同得');
INSERT INTO `hosp_drug` VALUES ('16', 'I833BFQA', null, '2018-04-02 16:43:58', 'admin', '吗丁啉(多潘立酮片)，1.由胃排空延缓、胃食道反流、食道炎引起的消化不良症。-上腹部胀闷感、腹胀、上腹疼痛；-暧气、肠胃胀气；-恶心、呕吐；-口中带有或不带有反流胃内容物的胃烧灼感。2.功能性、器质性、感染性、饮食性、放射性治疗或化疗所引起的恶心、呕吐。用多巴胺受体激动剂（如左旋多巴、溴隐亭等）治疗帕金森氏症 所引起的恶心和呕吐，为本品的特效适应症。', '有毒的药品', null, '吗丁啉', '0', '1000', '2017-09-06 00:00:00', '39', '内分泌：\r\n　　罕见：催乳素水平升高 \r\n　　精神系统：\r\n　　罕见：兴奋、神经过敏 \r\n　　神经系统：\r\n　　非常罕见：锥体外系副作用、惊厥、嗜睡、头痛\r\n　　胃肠道：', '99.9', '365', '1', '232', null, null, '多潘立酮片');
INSERT INTO `hosp_drug` VALUES ('17', 'C3TIY85U', null, '2018-04-02 16:48:09', 'admin', '本品是以烟酰胺、泛酸钙、生物素、维生素B1、维生素B2、维生素B6、维生素B12、叶酸、碳酸钙、玉米淀粉、糊精、硬脂酸镁为主要原料制成的保健食品，具有补充B族维生素的保健功能。', '本品不能代替药物；不宜超过推荐量或与同类营养素补充剂同时食用。', null, '维生素B族片', '1', '9999', '2017-09-15 00:00:00', '36.9', '需要补充B族维生素的成人', '76.5', '96', '1', '4569', null, null, '汤臣倍健股份有限公司');

-- ----------------------------
-- Table structure for hosp_inhospital_message
-- ----------------------------
DROP TABLE IF EXISTS `hosp_inhospital_message`;
CREATE TABLE `hosp_inhospital_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regist_num` varchar(255) DEFAULT NULL,
  `nurse` varchar(255) DEFAULT NULL,
  `bed_num` varchar(255) DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `illness` varchar(255) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reg_num` (`regist_num`),
  CONSTRAINT `hosp_inhospital_message_ibfk_1` FOREIGN KEY (`regist_num`) REFERENCES `hosp_registinfo` (`regist_num`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_inhospital_message
-- ----------------------------
INSERT INTO `hosp_inhospital_message` VALUES ('1', 'b1104', 'we', '5645', '66', '生病', 'aa', '2018-04-11 17:06:53', null, '2018-04-11 17:06:53', '1', '突然一天水电费');
INSERT INTO `hosp_inhospital_message` VALUES ('2', 'j55648', 'sd', 'sdfs', '65', '头疼', '小小', '2018-04-11 17:07:28', 'aa', '2018-04-11 17:07:28', '2', '人体与他人');
INSERT INTO `hosp_inhospital_message` VALUES ('3', 'x1656', 'sdf', 'sadfc', '56', '牙龈肿胀', 'aa', '2018-04-11 16:42:07', 'admin', '2018-04-11 16:42:07', '0', '额人体');
INSERT INTO `hosp_inhospital_message` VALUES ('4', 'd8996', '说的', 'jsdh', '98', '神经大条', 'admin', '2018-04-11 17:06:57', 'aa', '2018-04-11 17:06:57', '1', '玩儿');
INSERT INTO `hosp_inhospital_message` VALUES ('5', 'rdtdfgd', '想到', 'sf', '98.3', '骨折', 'admin', '2018-04-11 16:42:38', '小小', '2018-04-11 16:42:38', '2', '二热热');
INSERT INTO `hosp_inhospital_message` VALUES ('6', '21488549', 'jsh ', 'hagh', '8.9', '脑袋大', 'aa', '2018-04-11 16:42:09', 'aa', '2018-04-11 16:42:09', '1', '突然一天');
INSERT INTO `hosp_inhospital_message` VALUES ('8', 'b1105', 'hha', '56', '121', '12', 'aa', '2018-04-11 17:07:02', null, '2018-04-11 17:07:02', '2', '玩儿');
INSERT INTO `hosp_inhospital_message` VALUES ('10', 'b1106', '二级', '5656', '1000', '可能得了白血病..', 'admin', '2018-04-11 16:42:11', null, '2018-04-11 16:42:11', '1', '水电费');
INSERT INTO `hosp_inhospital_message` VALUES ('13', 'O326c71c', '几乎都是', '878', '100', '病情加重需要住院治疗', '小小', '2018-04-11 16:42:25', null, '2018-04-11 16:42:25', '1', '腿骨折了');
INSERT INTO `hosp_inhospital_message` VALUES ('16', '135071cJ', '特级的', '8989', '1200', '需要住院查看治疗', 'admin', '2018-04-11 16:42:12', null, '2018-04-11 16:42:12', '0', '啦啦啦啦啦');
INSERT INTO `hosp_inhospital_message` VALUES ('17', '27BU85Z7', '一级', '1245', '1000', '需要拍照查看', '小小', '2018-04-11 16:42:22', null, '2018-04-11 16:42:22', '1', '腰酸腿疼...');
INSERT INTO `hosp_inhospital_message` VALUES ('18', '28179034', '特级', '565', '100', '代查勘', '小小', '2018-04-11 16:50:05', null, null, '1', '收到');
INSERT INTO `hosp_inhospital_message` VALUES ('19', '28179034', null, null, null, null, '小小', '2018-04-14 14:55:22', null, null, '1', null);

-- ----------------------------
-- Table structure for hosp_inhostipal_settle
-- ----------------------------
DROP TABLE IF EXISTS `hosp_inhostipal_settle`;
CREATE TABLE `hosp_inhostipal_settle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inho_finall_status` int(11) DEFAULT NULL,
  `inho_total_case` double DEFAULT NULL,
  `inho_cash` double DEFAULT NULL,
  `inho_end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `inho_medical_pay` double DEFAULT NULL,
  `inho_drug_pay` double DEFAULT NULL,
  `regist_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reg_num` (`regist_num`),
  CONSTRAINT `hosp_inhostipal_settle_ibfk_1` FOREIGN KEY (`regist_num`) REFERENCES `hosp_registinfo` (`regist_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_inhostipal_settle
-- ----------------------------
INSERT INTO `hosp_inhostipal_settle` VALUES ('1', '1', '569.6', '360', '2018-03-29 15:43:51', '65.9', '45.9', 'BMv161i0');
INSERT INTO `hosp_inhostipal_settle` VALUES ('2', '0', '895', '64', '2018-03-30 10:33:35', '895', '15.6', 'x1656');
INSERT INTO `hosp_inhostipal_settle` VALUES ('3', '1', '1000', '956.6', '2018-03-30 10:33:37', '451.6', '564.8', 'd8996');
INSERT INTO `hosp_inhostipal_settle` VALUES ('4', '0', '100', '36.5', '2018-04-02 16:09:19', '98.6', '78.2', 'b1104');
INSERT INTO `hosp_inhostipal_settle` VALUES ('5', '1', '56', '12.3', '2018-04-02 16:10:29', '56.6', '15.2', 'b1106');

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
  `regist_num` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `early_appointment` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `regist_name` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_registinfo
-- ----------------------------
INSERT INTO `hosp_registinfo` VALUES ('1', 'jsdhjj', '5', '2017-10-18 21:03:55', null, '1', 'IT', '4547581', '王璐', '54545452', '2', '8455454', '此人脑袋不舒服', '0', '56.2', '0', '1', null, null, '1', '3');
INSERT INTO `hosp_registinfo` VALUES ('2', 'b1104', '45', '2011-10-21 21:03:59', null, '0', null, '5545447', '张珊', '35456456', '1', '5455454', '此人牙疼', '1', '100', '1', '2', null, null, '2', '6');
INSERT INTO `hosp_registinfo` VALUES ('3', 'b1105', '25', '2017-07-21 21:04:04', null, '1', null, '5436457', '小黑', '45545465', '2', '4534536', '此人心塞', '1', '50', '0', '0', null, null, '3', '4');
INSERT INTO `hosp_registinfo` VALUES ('4', 'b1106', '63', '2015-10-17 21:04:08', null, '0', null, '8254555', '阿珂', '56465465', '1', '4343543', '此人上火', '0', '40.9', '0', '0', null, null, '2', '7');
INSERT INTO `hosp_registinfo` VALUES ('5', 'b1107', '9', '2017-04-21 21:04:15', null, '0', null, '4545546', '艾克', 'dfsdsdsfdsfsddsf', '2', '4312556', '此人傻了', '1', '56.67', '1', '0', '2018-03-29 10:05:08', 'admin', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('6', 'x1656', '3', '2017-10-03 21:13:52', null, '0', '', '5656566', '田志芳', '97894684', '1', '6666664', '不知道具体是什么原因 需要进一步检查', '1', '152', '0', '0', '2018-04-09 11:18:27', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('9', 'j55648', null, '2017-10-25 14:22:17', null, '0', '', '5463566', '金额', '54658445', '1', '4545454', '', '0', '874.6', '0', '0', '2018-04-09 11:18:19', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('10', 'd8996', '3', '2017-10-21 22:34:19', null, '0', 'dfg ', '4535754', '地方', '78749879', '1', '5665655', 'sdf sdfdsf', '0', '43', '0', '0', null, null, '2', '3');
INSERT INTO `hosp_registinfo` VALUES ('11', 'rdtdfgd', '2', '2017-10-22 15:56:31', null, '0', '吃饭', '2323', 'hah', '4ewe', '0', 'sdfds', '牙疼', '1', '23', '1', '0', null, null, '3', '2');
INSERT INTO `hosp_registinfo` VALUES ('12', '28179034', '2', '2017-10-22 16:04:32', null, '0', '发', '23424', '但是', '收到', '0', '234', '收到', '0', '23', '1', '0', null, null, '3', '1');
INSERT INTO `hosp_registinfo` VALUES ('13', '21488549', null, '2017-10-22 17:05:29', null, '0', '科技', '5454545', '和A计划', 'dfg df', '1', 'dfgdf', '', '0', '3', '1', '0', '2018-03-28 17:15:08', '小小', '4', '3');
INSERT INTO `hosp_registinfo` VALUES ('23', 'BMv161i0', '3', null, 'admin', '0', '保护深林', '15977845454', '小老虎', '645454845545454', '0', '4545454', '吃不了肉啊', null, '5', '1', '1', null, null, '4', '7');
INSERT INTO `hosp_registinfo` VALUES ('24', '4Y274jo0', '5', null, 'aa', '1', '游泳', '15987456125', '白豚', '4545454', '1', '454545488', '身上的鳍受伤。。。', null, '4', '0', '1', null, null, '9', '5');
INSERT INTO `hosp_registinfo` VALUES ('30', '0fa361d0', '3', null, 'aa', '0', '吃泥巴', '15874563963', '小鱼', '4569874561236963', '0', '46464797', '牙掉了', null, '45', '1', '1', null, null, '5', '3');
INSERT INTO `hosp_registinfo` VALUES ('31', 'iqO3Zc6u', '2', null, 'admin', '1', '吸血', '15481154782', '蚊子', '45dfadzdfsd', '0', '15454545', '口器断了', null, '1', '1', '1', '2018-03-28 17:14:19', '小小', '5', '4');
INSERT INTO `hosp_registinfo` VALUES ('32', '135071cJ', '3', null, '小小', '0', '吐司', '23423423432', '金蝶', '234234324234', '0', '234543sada', '啦啦啦啦啦', null, '3.3', '0', '1', null, null, '3', '4');
INSERT INTO `hosp_registinfo` VALUES ('33', 'O326c71c', '6', null, '小小', '0', '跑呀跑', '549321515', '狮子', '551545454', '0', '121545', '腿骨折了', null, '12', '1', '1', null, null, '3', '2');
INSERT INTO `hosp_registinfo` VALUES ('34', 'HSCGY729', '18', '2018-04-09 10:29:33', 'admin', '1', '记者', '15978645234', '小蚊子', '412025200002102106', '1', '5697845', '应该吃坏肚子了', null, '10.9', '1', '1', '2018-04-09 11:11:22', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('35', '27BU85Z7', '12', '2018-04-11 16:37:08', '小小', '0', 'IT技术人才', '15698745623', '小米', '412345678945125458', '0', '56565', '腰酸腿疼...', null, '12', '0', '1', null, null, '3', '3');
INSERT INTO `hosp_registinfo` VALUES ('36', 'B3K3W8T7', '45', '2018-04-16 11:11:47', '小小', '0', '21sdnhj', '45544', 'sdg', '654564', '0', '545454', 'dsfds', null, '454', '1', '1', null, null, '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('37', 'IH74962H', null, '2018-04-20 10:04:24', 'aa', '0', '', '', 'sdf', '', '0', '', '', null, null, '1', '1', null, null, '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('38', 'H2C47LR0', null, '2018-04-20 10:04:47', 'aa', '0', '', '', '啊啊', '', '0', '', '', null, null, '1', '0', null, null, '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role
-- ----------------------------
INSERT INTO `hosp_role` VALUES ('1', '超级管理员', '111111', '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('2', '用户管理员', '222222', '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('3', '一般用户', '333333', '0', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('4', '黑客黑进去', null, '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('5', '你进不去', '256565', '0', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('6', '闲杂用户啊', null, '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('7', '哈哈哈', null, '0', '小小', '2018-04-24 17:50:01', null, null);
INSERT INTO `hosp_role` VALUES ('8', '阿萨德', null, '1', '小小', '2018-04-24 17:50:34', null, null);
INSERT INTO `hosp_role` VALUES ('9', '地方', null, '0', '小小', '2018-04-24 18:02:16', null, null);
INSERT INTO `hosp_role` VALUES ('10', 'dsgf 嘉实多', null, '0', '小小', '2018-04-25 09:51:29', null, null);
INSERT INTO `hosp_role` VALUES ('11', 'gf', null, '0', '小小', '2018-04-25 09:54:39', null, null);
INSERT INTO `hosp_role` VALUES ('12', '你发吧', null, '1', '小小', '2018-04-25 09:56:36', null, null);

-- ----------------------------
-- Table structure for hosp_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `hosp_role_authority`;
CREATE TABLE `hosp_role_authority` (
  `role_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  PRIMARY KEY (`authority_id`,`role_id`),
  KEY `FKtowon8uaoo8ut0d49vlvymug` (`role_id`),
  CONSTRAINT `hosp_role_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `hosp_role` (`id`),
  CONSTRAINT `hosp_role_authority_ibfk_2` FOREIGN KEY (`authority_id`) REFERENCES `hosp_authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role_authority
-- ----------------------------
INSERT INTO `hosp_role_authority` VALUES ('1', '1');
INSERT INTO `hosp_role_authority` VALUES ('1', '2');
INSERT INTO `hosp_role_authority` VALUES ('1', '3');
INSERT INTO `hosp_role_authority` VALUES ('1', '4');
INSERT INTO `hosp_role_authority` VALUES ('1', '9');
INSERT INTO `hosp_role_authority` VALUES ('1', '10');
INSERT INTO `hosp_role_authority` VALUES ('1', '11');
INSERT INTO `hosp_role_authority` VALUES ('1', '12');
INSERT INTO `hosp_role_authority` VALUES ('1', '13');
INSERT INTO `hosp_role_authority` VALUES ('2', '3');
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
INSERT INTO `hosp_role_authority` VALUES ('4', '1');
INSERT INTO `hosp_role_authority` VALUES ('4', '4');
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
  `password` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_user
-- ----------------------------
INSERT INTO `hosp_user` VALUES ('1', 'aa', '4124bc0a9335c27f086f24ba207a4912', '0', null, '阿珂', '2', null, null, 'aa', '2018-04-24 11:18:02');
INSERT INTO `hosp_user` VALUES ('3', '小小', 'e10adc3949ba59abbe56e057f20f883e', '1', 'hh@126.c', '郑爽', '1', null, null, '小小', '2018-04-16 15:50:13');
INSERT INTO `hosp_user` VALUES ('4', 'hh', '5e36941b3d856737e81516acd45edc50', '1', 'hh@126.cqqqqq', '韩寒', '3', 'dfg', '2017-10-16 10:38:32', 'hh', '2018-04-16 15:53:24');
INSERT INTO `hosp_user` VALUES ('14', 'sdfdsfs', 'sdfds', '1', 'sdfds@dfs.com', 'sdfsd', '3', null, null, null, null);
INSERT INTO `hosp_user` VALUES ('17', '丫丫', 'yaya', '1', 'yaya@qq.com', '呀呀', '1', '丫丫', '2018-04-16 15:43:51', '丫丫', '2018-04-16 15:44:14');
INSERT INTO `hosp_user` VALUES ('18', '哈哈', 'haha', '0', 'haha@yeah.net', '不知道', '2', '哈哈', '2018-04-16 15:46:11', null, null);
INSERT INTO `hosp_user` VALUES ('19', '舞蹈服', '123', '1', '232@qq', '但是', '2', '舞蹈服', '2018-04-24 11:20:06', null, null);
INSERT INTO `hosp_user` VALUES ('20', '韩燕超', '123456', '0', 'hy@qq,com', '韩燕超', '3', '韩燕超', '2018-04-24 11:27:34', '韩燕超', '2018-04-24 11:29:02');
INSERT INTO `hosp_user` VALUES ('27', 'gfh', '123456fdgfd', '0', 'dfs@qq.com', 'dffvbv', '5', 'gfh', '2018-04-24 14:20:43', null, null);
INSERT INTO `hosp_user` VALUES ('34', 'sdf', '23423423', '1', 'sdf@qq.com', 'dsfsd', '6', 'sdf', '2018-04-24 14:22:19', 'sdf', '2018-04-24 14:22:33');
INSERT INTO `hosp_user` VALUES ('70', 'admin', '4124bc0a9335c27f086f24ba207a4912', '1', '', '', '2', 'admin', '2018-04-24 16:31:19', 'admin', '2018-04-24 16:36:14');

-- ----------------------------
-- Table structure for online_pills
-- ----------------------------
DROP TABLE IF EXISTS `online_pills`;
CREATE TABLE `online_pills` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '在线发药',
  `regist_num` varchar(255) DEFAULT NULL,
  `pills_num` int(6) DEFAULT NULL COMMENT '药品数量',
  `pills_send` int(6) DEFAULT NULL,
  `drug_num` varchar(255) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `drug_num` (`drug_num`),
  KEY `regist_num` (`regist_num`) USING BTREE,
  CONSTRAINT `online_pills_ibfk_1` FOREIGN KEY (`regist_num`) REFERENCES `hosp_registinfo` (`regist_num`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of online_pills
-- ----------------------------
INSERT INTO `online_pills` VALUES ('18', 'jsdhjj', '35', '35', '15454545', 'aa', '2018-04-19 09:59:57', '小小', '2018-04-19 09:59:58');
INSERT INTO `online_pills` VALUES ('19', 'd8996', '20', '16', '15454545', '小小', '2018-04-11 14:17:27', '小小', '2018-04-11 14:17:28');
INSERT INTO `online_pills` VALUES ('20', '4Y274jo0', '2', '1', '54548875', 'admin', '2018-04-09 15:18:33', '小小', '2018-04-09 15:18:33');
INSERT INTO `online_pills` VALUES ('23', '28179034', '56', '23', '54548875', 'aa', '2018-04-09 15:18:36', '小小', '2018-04-09 15:18:36');
INSERT INTO `online_pills` VALUES ('25', 'rdtdfgd', '15', '4', '54548875', null, '2018-04-11 14:17:17', '小小', '2018-04-11 14:17:18');
INSERT INTO `online_pills` VALUES ('26', 'b1105', '38', '38', 'C3TIY85U', 'admin', '2018-04-11 14:17:44', '小小', '2018-04-11 14:17:45');
INSERT INTO `online_pills` VALUES ('27', 'b1107', '25', '0', '15454545', 'admin', '2018-04-19 09:45:22', null, '2018-04-19 09:45:22');
INSERT INTO `online_pills` VALUES ('28', 'jsdhjj', '35', '4', '15454546', 'admin', '2018-04-19 09:59:50', '小小', '2018-04-19 09:59:51');
INSERT INTO `online_pills` VALUES ('29', 'rdtdfgd', '20', '20', '15454545', '小小', '2018-04-11 14:15:45', '小小', '2018-04-11 14:15:45');
INSERT INTO `online_pills` VALUES ('31', 'jsdhjj', '145', '57', 'I833BFQA', '小小', '2018-04-23 10:04:51', '小小', '2018-04-23 10:04:51');
INSERT INTO `online_pills` VALUES ('32', '4Y274jo0', '32', '1', '15454545', '小小', '2018-04-23 10:04:54', null, '2018-04-23 10:04:54');
