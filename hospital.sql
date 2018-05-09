/*
Navicat MySQL Data Transfer

Source Server         : xi
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-09 14:56:32
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
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_authority
-- ----------------------------
INSERT INTO `hosp_authority` VALUES ('1', '挂号信息管理', 'reg/regIndex.do', '1', null, null, null, null, '3');
INSERT INTO `hosp_authority` VALUES ('2', '门诊医生管理', 'doctor/index.do', '1', null, null, null, null, '1');
INSERT INTO `hosp_authority` VALUES ('3', '药品管理', 'drug/drugIndex.do', '0', null, null, null, null, '1');
INSERT INTO `hosp_authority` VALUES ('4', '住院办理', 'inhosp/inhospIndex.do', '1', null, null, '小小', '2018-04-18 15:58:53', '1');
INSERT INTO `hosp_authority` VALUES ('5', '消费结算', 'bill/accountIndex.do', '1', null, null, null, null, '3');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_doctor
-- ----------------------------
INSERT INTO `hosp_doctor` VALUES ('1', '2017-10-11 00:00:00', '2017-10-03 21:23:48', 'aa', '程军', 'y11111', '111111', '0', '2', '53545@sdkji', '54454', '1995-06-12 21:26:04', '	工作热情积极表现非常的优异', '1', '5656', '2018-04-26 11:10:47', '小小', '2');
INSERT INTO `hosp_doctor` VALUES ('2', '2017-10-10 00:00:00', '2017-11-04 21:23:44', 'aa', '王博', 'w11112', '111112498', '0', '2', '@kjd', '56544', '2017-10-18 21:25:27', '	工作热情积极表现非常的优异', '1', '1545', '2018-04-26 11:10:09', '小小', '4');
INSERT INTO `hosp_doctor` VALUES ('3', '2017-10-01 00:00:00', '2017-10-24 21:23:41', 'aa', '欧阳露露', 'o11113', '111113', '0', '1', 'kdjs@kd', '9897468458', '2016-02-03 21:25:32', '	工作热情积极表现非常的优异', '1', '545684', '2018-04-26 10:20:41', '小小', '1');
INSERT INTO `hosp_doctor` VALUES ('4', '2017-10-25 00:00:00', '2018-06-20 11:16:30', 'admin', '谢科ss', 'x53544', '410258199806072016', '0', '1', 'aajhjh@163.com', '18634597853', '2018-04-02 15:54:12', '	工作热情积极表现非常的优异', '1', '544asdssddd', '2018-03-27 13:33:41', 'aa', '2');
INSERT INTO `hosp_doctor` VALUES ('5', '2017-10-17 21:23:30', '2017-10-18 21:23:34', 'admin', '张华', 'z11115', '111115', '2', '1', '1@yeah.net', '251564', '2015-11-12 21:25:41', '	工作热情积极表现非常的优异', '0', '48865', null, null, '6');
INSERT INTO `hosp_doctor` VALUES ('6', '2017-04-10 21:24:28', '2018-01-23 21:24:35', 'aa', '小小呵', 'x11116', '111116', '1', '2', 'xiaoxioahe@qq.com', '3323251', '2016-11-23 21:25:48', '	工作热情积极表现非常的优异', '1', '56456', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('7', '2017-10-16 15:18:00', '2018-04-04 15:53:31', '小小', '金科', 'h45455', '123456jin', '1', '1', 'hyc@qq.com', '1522', '2018-03-25 15:54:15', '水电费', '1', '54565', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('8', '1971-05-10 15:20:00', '2018-04-09 15:53:34', '小小', '德玛西亚', 'u42422', 'de99999', '1', '0', 'de@qq.com', '9999', '2018-03-19 15:54:18', '饿吗活动时间好', '1', '000000', null, null, '7');
INSERT INTO `hosp_doctor` VALUES ('9', '1987-02-20 00:00:00', '2018-04-01 15:53:37', 'adim', '谢南', 'g73452', 'x111114', '0', '1', 'xienana@163.com', 'x564564568', '2018-01-12 15:54:22', '谢楠工作认真 踏实 负责啊asdf', '1', 'x544', '2018-03-27 14:45:33', 'aa', '1');
INSERT INTO `hosp_doctor` VALUES ('10', '1995-10-12 00:00:00', '2018-03-27 15:13:50', 'aa', '张丹', 'Do3h0X', '410258199806072016', '0', '3', 'tidetrace@yeah.net', 'ddd1664', '2018-05-14 15:54:26', '生殖细胞', '1', '544asdss55555555', null, null, '3');
INSERT INTO `hosp_doctor` VALUES ('11', '1995-06-08 00:00:00', '2018-03-27 15:41:24', 'admin', '小小', 'OV72Xy', '410236199506082016', '0', '2', 'xiaoxiao@126.com', '15987456125', '2017-05-12 15:54:31', '聪明伶俐 笑容动人', '0', '456456', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('13', '1996-02-06 00:00:00', '2018-03-29 09:29:36', 'admin', '王艳', '372b28', '452696199602061026', '0', '2', '5456464@qq.com', '17598456123', '2018-04-01 15:54:45', '美女医生 热情服务', '0', '56589891', null, null, '3');
INSERT INTO `hosp_doctor` VALUES ('15', '2018-04-03 00:00:00', '2018-04-26 10:18:01', '小小', 'sdfsd', 'JF9kLd', '484', '0', '1', '5454', '5454', null, '155', '1', '515', null, null, '2');
INSERT INTO `hosp_doctor` VALUES ('17', '2018-04-11 00:00:00', '2018-04-26 10:56:23', '小小', '双方都', '3q4Y99', '3423', '1', '0', 'erew@q.oxm', '2342', '2018-04-26 10:56:23', 'dsf第三方梵蒂冈', '1', '3423', null, null, '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_drug
-- ----------------------------
INSERT INTO `hosp_drug` VALUES ('1', '15454545', '生病了', '2017-10-03 16:34:05', null, '富含维生素', '一天一次，一次一片', null, '感冒药', '1', '45', '2018-05-14 14:55:41', '10.5', '感冒的人使用', '25', '23', '1', '100', null, null, '药膳');
INSERT INTO `hosp_drug` VALUES ('2', '54454548', '吃吧', '2017-10-02 16:35:27', null, '高钙片，吃了能让你长高', '一天一次', null, '高钙片', '0', '566', '2018-04-30 14:55:45', '56', '咀嚼使用', '89', '100', '0', '35', null, null, '同仁');
INSERT INTO `hosp_drug` VALUES ('3', '54548875', '视野变得更亮了', '2017-10-04 16:37:57', null, '眼睛不酸了', '滴一滴', null, '眼药水', '2', '666', '2018-05-15 00:00:00', '8.2', '清洁眼睛', '52', '15', '3', '65', null, null, '宝视达');
INSERT INTO `hosp_drug` VALUES ('4', '15454546', '腰不疼', '2018-03-13 19:30:32', null, '啦啦啦', '一一aa', null, '海士兰', '3', '666', '2016-09-05 00:00:00', '45.6', '不知道', '89', '45', '1', '54', null, null, '同得');
INSERT INTO `hosp_drug` VALUES ('16', 'I833BFQA', '更符合法规', '2018-04-02 16:43:58', 'admin', '吗丁啉(多潘立酮片)，1.由胃排空延缓、胃食道反流、食道炎引起的消化不良症。-上腹部胀闷感、腹胀、上腹疼痛；-暧气、肠胃胀气；-恶心、呕吐；-口中带有或不带有反流胃内容物的胃烧灼感。2.功能性、器质性、感染性、饮食性、放射性治疗或化疗所引起的恶心、呕吐。用多巴胺受体激动剂（如左旋多巴、溴隐亭等）治疗帕金森氏症 所引起的恶心和呕吐，为本品的特效适应症。', '有毒的药品', null, '吗丁啉', '0', '1000', '2017-09-06 00:00:00', '39', '内分泌：\r\n　　罕见：催乳素水平升高 \r\n　　精神系统：\r\n　　罕见：兴奋、神经过敏 \r\n　　神经系统：\r\n　　非常罕见：锥体外系副作用、惊厥、嗜睡、头痛\r\n　　胃肠道：', '99.9', '5', '1', '232', null, null, '多潘立酮片');
INSERT INTO `hosp_drug` VALUES ('17', 'C3TIY85U', '电饭锅', '2018-04-02 16:48:09', 'admin', '本品是以烟酰胺、泛酸钙、生物素、维生素B1、维生素B2、维生素B6、维生素B12、叶酸、碳酸钙、玉米淀粉、糊精、硬脂酸镁为主要原料制成的保健食品，具有补充B族维生素的保健功能。', '本品不能代替药物；不宜超过推荐量或与同类营养素补充剂同时食用。', null, '维生素B族片', '1', '9999', '2017-09-15 00:00:00', '36.9', '需要补充B族维生素的成人', '76.5', '96', '1', '4569', null, null, '汤臣倍健股份有限公司');
INSERT INTO `hosp_drug` VALUES ('18', '808H510Q', '一天一次吧', '2018-05-07 11:30:11', '小小', 'ajhjh韩国说句话', '治疗嗓子不舒服...', null, '金银花', '0', '5000', '2018-03-20 00:00:00', '10', '有副作用', '50.9', '23', '1', '200', null, null, '阿萨德结合实际');
INSERT INTO `hosp_drug` VALUES ('19', 'E3AZ159T', '吃吧', '2018-05-09 10:27:06', '小小', '能吃就行', '清淡可口。。', null, '龟苓膏', '0', '50', '2017-06-21 00:00:00', '4', '', '10', '2', '1', '50', null, null, '哈药集团');

-- ----------------------------
-- Table structure for hosp_inhospital_message
-- ----------------------------
DROP TABLE IF EXISTS `hosp_inhospital_message`;
CREATE TABLE `hosp_inhospital_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regist_num` varchar(255) DEFAULT NULL,
  `nurse` varchar(255) DEFAULT NULL,
  `bed_num` varchar(255) DEFAULT NULL,
  `cash` double DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_inhospital_message
-- ----------------------------
INSERT INTO `hosp_inhospital_message` VALUES ('1', 'b1104', '50', '5645', '66', '生病', 'aa', '2018-05-09 08:50:56', null, '2018-05-09 08:50:56', '1', '突然一天水电费');
INSERT INTO `hosp_inhospital_message` VALUES ('2', 'j55648', '50', 'sdfs', '65', '头疼', '小小', '2018-05-09 08:50:59', 'aa', '2018-05-09 08:50:59', '2', '人体与他人');
INSERT INTO `hosp_inhospital_message` VALUES ('3', 'x1656', '100', 'sadfc', '56', '牙龈肿胀', 'aa', '2018-05-09 08:51:03', 'admin', '2018-05-09 08:51:03', '0', '额人体');
INSERT INTO `hosp_inhospital_message` VALUES ('4', 'd8996', '200', 'jsdh00', '98', '神经大条', 'admin', '2018-05-09 08:51:12', 'aa', '2018-05-09 08:51:12', '1', '玩儿');
INSERT INTO `hosp_inhospital_message` VALUES ('5', 'rdtdfgd', '500', 'sf', '98.3', '骨折', 'admin', '2018-05-09 08:51:15', '小小', '2018-05-09 08:51:15', '2', '二热热');
INSERT INTO `hosp_inhospital_message` VALUES ('6', '21488549', '800', 'hagh', '8.9', '脑袋大', 'aa', '2018-05-09 08:51:18', 'aa', '2018-05-09 08:51:18', '1', '突然一天');
INSERT INTO `hosp_inhospital_message` VALUES ('8', 'b1105', '500', '56', '121', '12', 'aa', '2018-05-09 08:51:21', null, '2018-05-09 08:51:21', '2', '玩儿');
INSERT INTO `hosp_inhospital_message` VALUES ('10', 'b1106', '200', '5656', '1000', '可能得了白血病..', 'admin', '2018-05-09 08:51:24', null, '2018-05-09 08:51:24', '1', '水电费');
INSERT INTO `hosp_inhospital_message` VALUES ('13', 'O326c71c', '50', '878', '100', '病情加重需要住院治疗', '小小', '2018-05-09 08:51:30', null, '2018-05-09 08:51:30', '1', '腿骨折了');
INSERT INTO `hosp_inhospital_message` VALUES ('16', '135071cJ', '200', '8989', '1200', '需要住院查看治疗', 'admin', '2018-05-09 08:51:33', null, '2018-05-09 08:51:33', '0', '啦啦啦啦啦');
INSERT INTO `hosp_inhospital_message` VALUES ('17', '27BU85Z7', '100', '1245', '1000', '需要拍照查看', '小小', '2018-05-09 08:51:37', null, '2018-05-09 08:51:37', '1', '腰酸腿疼...');
INSERT INTO `hosp_inhospital_message` VALUES ('18', '28179034', '50', '565', '100', '代查勘', '小小', '2018-05-09 08:51:39', null, '2018-05-09 08:51:39', '1', '收到');
INSERT INTO `hosp_inhospital_message` VALUES ('19', '28179034', '100', '545', '0', null, '小小', '2018-05-09 08:51:41', null, '2018-05-09 08:51:41', '1', null);
INSERT INTO `hosp_inhospital_message` VALUES ('20', 'HSCGY729', '50', '4545', '12', '的是你', '小小', '2018-05-09 08:51:45', null, '2018-05-09 08:51:45', '1', '应该吃坏肚子了');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_inhostipal_settle
-- ----------------------------
INSERT INTO `hosp_inhostipal_settle` VALUES ('1', '1', '569.6', '360', '2018-05-08 17:08:01', '65.9', '45.9', 'BMv161i0');
INSERT INTO `hosp_inhostipal_settle` VALUES ('2', '1', '895', '64', '2018-05-08 17:07:58', '895', '15.6', 'x1656');
INSERT INTO `hosp_inhostipal_settle` VALUES ('3', '1', '1000', '956.2', '2018-05-08 17:07:56', '451.61', '564.33', 'd8996');
INSERT INTO `hosp_inhostipal_settle` VALUES ('5', '1', '56', '12.3', '2018-04-02 16:10:29', '56.6', '15.2', 'b1106');
INSERT INTO `hosp_inhostipal_settle` VALUES ('6', '0', '100', '100', '2018-05-08 21:41:25', '36', '25.5', 'rdtdfgd');
INSERT INTO `hosp_inhostipal_settle` VALUES ('10', '1', '317', '66', '2018-05-09 10:40:34', '50', '178', 'b1104');

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
INSERT INTO `hosp_office` VALUES ('1', '2018-05-07 14:57:04', 'dsf', '身强力壮', '骨科', null, null);
INSERT INTO `hosp_office` VALUES ('2', '2018-04-29 14:57:07', '小明啊', '啊啊啊', '口腔科', null, null);
INSERT INTO `hosp_office` VALUES ('3', '2018-04-02 14:57:12', 'hh', '看你的血型', '血液科', null, null);
INSERT INTO `hosp_office` VALUES ('4', '2018-04-09 14:57:17', 'aa', '小朋友，快看这个', '儿科', null, null);
INSERT INTO `hosp_office` VALUES ('5', '2018-04-12 14:57:21', '小爱下', '心跳的节奏', '内科', null, null);
INSERT INTO `hosp_office` VALUES ('6', '2018-04-16 14:57:26', '小明', '想要有一口美丽健康的牙齿', '牙科', null, null);
INSERT INTO `hosp_office` VALUES ('7', '2018-04-03 14:57:33', '小英', '神奇的', '神经科', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_registinfo
-- ----------------------------
INSERT INTO `hosp_registinfo` VALUES ('1', 'jsdhjj', '5', '2017-10-18 21:03:55', 'aa', '1', 'IT', '4547581', '王璐', '54545452', '2', '8455454', '此人脑袋不舒服', '0', '56.2', '0', '1', null, null, '1', '3');
INSERT INTO `hosp_registinfo` VALUES ('2', 'b1104', '45', '2011-10-21 21:03:59', 'hh', '0', null, '5545447', '张珊', '35456456', '1', '5455454', '此人牙疼', '1', '100', '1', '1', null, null, '2', '6');
INSERT INTO `hosp_registinfo` VALUES ('3', 'b1105', '25', '2017-07-21 21:04:04', 'yyy', '1', null, '5436457', '小黑', '45545465', '2', '4534536', '此人心塞', '1', '50', '0', '1', null, null, '3', '4');
INSERT INTO `hosp_registinfo` VALUES ('4', 'b1106', '63', '2015-10-17 21:04:08', 'yyy', '0', null, '8254555', '阿珂', '56465465', '1', '4343543', '此人上火', '0', '40.9', '0', '1', null, null, '2', '7');
INSERT INTO `hosp_registinfo` VALUES ('5', 'b1107', '9', '2017-04-21 21:04:15', 'aa', '0', '', '4545546', '艾克', '545454545454', '1', '4312556', '此人傻了', '1', '56.67', '1', '1', '2018-05-07 16:00:21', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('6', 'x1656', '3', '2017-10-03 21:13:52', 'hh', '0', '', '5656566', '田志芳', '97894684', '1', '6666664', '不知道具体是什么原因 需要进一步检查', '1', '152', '0', '0', '2018-04-09 11:18:27', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('9', 'j55648', null, '2017-10-25 14:22:17', '小小', '0', '', '5463566', '金额', '54658445', '1', '4545454', '', '0', '874.6', '0', '1', '2018-04-09 11:18:19', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('10', 'd8996', '3', '2017-10-21 22:34:19', '小小', '0', 'dfg ', '4535754', '地方', '78749879', '1', '5665655', 'sdf sdfdsf', '0', '43', '0', '1', null, null, '2', '3');
INSERT INTO `hosp_registinfo` VALUES ('11', 'rdtdfgd', '2', '2017-10-22 15:56:31', '韩', '0', '吃饭', '2323', 'hah', '410526195610263036', '1', 'sdfds', '牙疼', '1', '23', '1', '0', '2018-05-07 14:44:56', '韩', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('12', '28179034', '2', '2017-10-22 16:04:32', '韩', '0', '发', '23424', '但是', '收到', '0', '234', '收到', '0', '23', '1', '0', null, null, '3', '1');
INSERT INTO `hosp_registinfo` VALUES ('13', '21488549', null, '2017-10-22 17:05:29', 'admin', '0', '科技', '5454545', '和A计划', 'dfg df', '1', 'dfgdf', '', '0', '3', '1', '1', '2018-03-28 17:15:08', '小小', '4', '3');
INSERT INTO `hosp_registinfo` VALUES ('23', 'BMv161i0', '3', null, 'admin', '0', '保护深林', '15977845454', '小老虎', '645454845545454', '0', '4545454', '吃不了肉啊', null, '5', '1', '1', null, null, '4', '7');
INSERT INTO `hosp_registinfo` VALUES ('24', '4Y274jo0', '5', null, 'aa', '1', '游泳', '15987456125', '白豚', '4545454', '1', '454545488', '身上的鳍受伤。。。', null, '4', '0', '1', null, null, '9', '5');
INSERT INTO `hosp_registinfo` VALUES ('30', '0fa361d0', '3', null, 'aa', '0', '吃泥巴', '15874563963', '小鱼', '4569874561236963', '0', '46464797', '牙掉了', null, '45', '1', '1', null, null, '5', '3');
INSERT INTO `hosp_registinfo` VALUES ('31', 'iqO3Zc6u', '2', null, 'admin', '1', '吸血', '15481154782', '蚊子', '45dfadzdfsd', '0', '15454545', '口器断了', null, '1', '1', '1', '2018-03-28 17:14:19', '小小', '5', '4');
INSERT INTO `hosp_registinfo` VALUES ('32', '135071cJ', '3', null, '小小', '0', '吐司', '23423423432', '金蝶', '234234324234', '0', '234543sada', '啦啦啦啦啦', null, '3.3', '0', '1', null, null, '3', '4');
INSERT INTO `hosp_registinfo` VALUES ('33', 'O326c71c', '6', null, '小小', '0', '跑呀跑', '549321515', '狮子', '551545454', '0', '121545', '腿骨折了', null, '12', '1', '1', null, null, '3', '2');
INSERT INTO `hosp_registinfo` VALUES ('34', 'HSCGY729', '18', '2018-04-09 10:29:33', 'admin', '1', '记者', '15978645234', '小蚊子', '412025200002102106', '1', '5697845', '应该吃坏肚子了', null, '10.9', '1', '1', '2018-04-09 11:11:22', '小小', '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('35', '27BU85Z7', '12', '2018-04-11 16:37:08', '小小', '0', 'IT技术人才', '15698745623', '小米', '412345678945125458', '0', '56565', '腰酸腿疼...', null, '12', '0', '1', null, null, '3', '3');
INSERT INTO `hosp_registinfo` VALUES ('36', 'B3K3W8T7', '45', '2018-04-16 11:11:47', '小小', '0', '21sdnhj', '45544', 'sdg', '654564', '1', '545454', 'dsfds', null, '454', '1', '1', null, null, '1', '1');
INSERT INTO `hosp_registinfo` VALUES ('37', '9T5052G7', '18', '2018-05-09 14:51:43', '小张', '0', '记者', '15998745454', '小张', '123456', '1', '123456', '问到', null, '12', '1', '1', '2018-05-09 14:52:07', '小张', '1', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role
-- ----------------------------
INSERT INTO `hosp_role` VALUES ('2', '用户管理员', '222222', '1', null, null, null, null);
INSERT INTO `hosp_role` VALUES ('19', '超级管理员', null, '1', '小小', '2018-05-09 11:38:50', null, null);
INSERT INTO `hosp_role` VALUES ('20', '一般用户', null, '1', 'aa', '2018-05-09 11:45:57', null, null);

-- ----------------------------
-- Table structure for hosp_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `hosp_role_authority`;
CREATE TABLE `hosp_role_authority` (
  `role_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  PRIMARY KEY (`authority_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_role_authority
-- ----------------------------
INSERT INTO `hosp_role_authority` VALUES ('19', '1');
INSERT INTO `hosp_role_authority` VALUES ('20', '1');
INSERT INTO `hosp_role_authority` VALUES ('19', '2');
INSERT INTO `hosp_role_authority` VALUES ('2', '3');
INSERT INTO `hosp_role_authority` VALUES ('19', '3');
INSERT INTO `hosp_role_authority` VALUES ('20', '3');
INSERT INTO `hosp_role_authority` VALUES ('19', '4');
INSERT INTO `hosp_role_authority` VALUES ('19', '5');
INSERT INTO `hosp_role_authority` VALUES ('2', '8');
INSERT INTO `hosp_role_authority` VALUES ('19', '8');
INSERT INTO `hosp_role_authority` VALUES ('2', '9');
INSERT INTO `hosp_role_authority` VALUES ('19', '9');
INSERT INTO `hosp_role_authority` VALUES ('2', '10');
INSERT INTO `hosp_role_authority` VALUES ('19', '10');
INSERT INTO `hosp_role_authority` VALUES ('20', '10');
INSERT INTO `hosp_role_authority` VALUES ('2', '11');
INSERT INTO `hosp_role_authority` VALUES ('19', '11');
INSERT INTO `hosp_role_authority` VALUES ('2', '12');
INSERT INTO `hosp_role_authority` VALUES ('19', '12');
INSERT INTO `hosp_role_authority` VALUES ('2', '13');
INSERT INTO `hosp_role_authority` VALUES ('19', '13');
INSERT INTO `hosp_role_authority` VALUES ('20', '13');
INSERT INTO `hosp_role_authority` VALUES ('19', '45');
INSERT INTO `hosp_role_authority` VALUES ('20', '45');

-- ----------------------------
-- Table structure for hosp_user
-- ----------------------------
DROP TABLE IF EXISTS `hosp_user`;
CREATE TABLE `hosp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` int(255) DEFAULT '0' COMMENT '是普通用户还是管理',
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
  KEY `FKcd615691nv3hn3pv88eok3oqv` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosp_user
-- ----------------------------
INSERT INTO `hosp_user` VALUES ('1', 'aa', '4124bc0a9335c27f086f24ba207a4912', '0', '1', 'aa@yeah.net', '阿珂', '20', null, null, 'aa', '2018-05-09 14:36:41');
INSERT INTO `hosp_user` VALUES ('3', '小小', 'f0a4058fd33489695d53df156b77c724', '1', '1', 'hh@126.c', '郑爽', '19', null, null, '小小', '2018-05-09 11:39:08');
INSERT INTO `hosp_user` VALUES ('4', 'hh', '5e36941b3d856737e81516acd45edc50', '1', '1', 'hh@126.cqqqqq', '韩寒', '3', 'dfg', '2017-10-16 10:38:32', 'hh', '2018-04-16 15:53:24');
INSERT INTO `hosp_user` VALUES ('14', '韩', '83832391027a1f2f4d46ef882ff3a47d', '0', '1', 'sdfds@dfs.com', 'sdfsd', '15', null, null, '韩', '2018-05-07 11:42:56');
INSERT INTO `hosp_user` VALUES ('17', '丫丫', '4409eae53c2e26a65cfc24b3a2359eb9', '0', '1', 'yaya@qq.com', '呀呀a', '1', '丫丫', '2018-04-16 15:43:51', '丫丫', '2018-05-09 11:12:52');
INSERT INTO `hosp_user` VALUES ('18', '哈哈', 'haha', '0', '0', 'haha@yeah.net', '不知道', '2', '哈哈', '2018-04-16 15:46:11', null, null);
INSERT INTO `hosp_user` VALUES ('19', '舞蹈服', '123', '0', '1', '232@qq', '但是', '2', '舞蹈服', '2018-04-24 11:20:06', null, null);
INSERT INTO `hosp_user` VALUES ('20', '韩燕超', '123456', '1', '0', 'hy@qq,com', '韩燕超', '3', '韩燕超', '2018-04-24 11:27:34', '韩燕超', '2018-04-24 11:29:02');
INSERT INTO `hosp_user` VALUES ('34', 'sdf', '23423423', '0', '1', 'sdf@qq.com', 'dsfsd', '6', 'sdf', '2018-04-24 14:22:19', 'sdf', '2018-04-24 14:22:33');
INSERT INTO `hosp_user` VALUES ('70', 'admin', '4124bc0a9335c27f086f24ba207a4912', '0', '1', '', '', '2', 'admin', '2018-04-24 16:31:19', 'admin', '2018-04-24 16:36:14');
INSERT INTO `hosp_user` VALUES ('72', 'yyy', 'f0a4058fd33489695d53df156b77c724', '0', '1', 'hhy@qq.com', '哈哈哈', '15', 'yyy', '2018-05-07 14:19:40', null, null);
INSERT INTO `hosp_user` VALUES ('73', '小张', '202cb962ac59075b964b07152d234b70', '0', '1', 'tian@qq.com', '张天', '20', '小张', '2018-05-09 14:37:52', '小张', '2018-05-09 14:40:27');

-- ----------------------------
-- Table structure for online_pills
-- ----------------------------
DROP TABLE IF EXISTS `online_pills`;
CREATE TABLE `online_pills` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '在线发药',
  `regist_num` varchar(255) DEFAULT NULL,
  `pills_num` int(6) DEFAULT NULL COMMENT '药品数量',
  `pills_send` int(6) DEFAULT '0',
  `drug_num` varchar(255) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updater` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `drug_num` (`drug_num`),
  KEY `regist_num` (`regist_num`) USING BTREE,
  CONSTRAINT `online_pills_ibfk_1` FOREIGN KEY (`regist_num`) REFERENCES `hosp_registinfo` (`regist_num`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of online_pills
-- ----------------------------
INSERT INTO `online_pills` VALUES ('18', 'jsdhjj', '35', '35', '15454545', 'aa', '2018-04-19 09:59:57', '小小', '2018-04-19 09:59:58');
INSERT INTO `online_pills` VALUES ('19', 'd8996', '20', '16', '15454545', '小小', '2018-04-11 14:17:27', '小小', '2018-04-11 14:17:28');
INSERT INTO `online_pills` VALUES ('20', '4Y274jo0', '2', '1', '54548875', 'admin', '2018-04-09 15:18:33', '小小', '2018-04-09 15:18:33');
INSERT INTO `online_pills` VALUES ('23', '28179034', '56', '23', '54548875', 'aa', '2018-04-09 15:18:36', '小小', '2018-04-09 15:18:36');
INSERT INTO `online_pills` VALUES ('25', 'rdtdfgd', '15', '4', '54548875', null, '2018-04-11 14:17:17', '小小', '2018-04-11 14:17:18');
INSERT INTO `online_pills` VALUES ('26', 'b1105', '38', '38', 'C3TIY85U', 'admin', '2018-04-11 14:17:44', '小小', '2018-04-11 14:17:45');
INSERT INTO `online_pills` VALUES ('27', 'b1107', '38', '1', '15454545', 'admin', '2018-05-09 09:30:38', '小小', '2018-05-09 09:30:39');
INSERT INTO `online_pills` VALUES ('28', 'jsdhjj', '35', '4', '15454546', 'admin', '2018-04-19 09:59:50', '小小', '2018-04-19 09:59:51');
INSERT INTO `online_pills` VALUES ('29', 'rdtdfgd', '20', '20', '15454545', '小小', '2018-04-11 14:15:45', '小小', '2018-04-11 14:15:45');
INSERT INTO `online_pills` VALUES ('31', 'jsdhjj', '145', '57', 'I833BFQA', '小小', '2018-04-23 10:04:51', '小小', '2018-04-23 10:04:51');
INSERT INTO `online_pills` VALUES ('48', 'HSCGY729', '20', '0', '15454545', '小小', '2018-05-07 09:54:28', '小小', '2018-05-07 09:54:29');
INSERT INTO `online_pills` VALUES ('49', 'HSCGY729', '30', '7', 'I833BFQA', '小小', '2018-05-07 09:57:02', '小小', '2018-05-07 09:57:02');
INSERT INTO `online_pills` VALUES ('50', 'HSCGY729', '66', '66', '54454548', '小小', '2018-05-07 09:56:44', '小小', '2018-05-07 09:56:45');
INSERT INTO `online_pills` VALUES ('51', 'b1104', '34', '0', '15454545', '小小', '2018-05-09 10:18:42', '小小', '2018-05-09 10:18:43');
INSERT INTO `online_pills` VALUES ('52', 'b1104', '18', '0', 'I833BFQA', '小小', '2018-05-09 09:19:04', '小小', '2018-05-09 09:19:04');
INSERT INTO `online_pills` VALUES ('53', 'b1104', '9', '0', '808H510Q', '小小', '2018-05-09 10:25:07', '小小', '2018-05-09 10:25:08');
INSERT INTO `online_pills` VALUES ('54', 'b1107', '2', '0', 'I833BFQA', '小小', '2018-05-09 09:30:39', null, null);
INSERT INTO `online_pills` VALUES ('55', 'b1104', '23', '0', '15454546', '小小', '2018-05-09 10:18:42', '小小', '2018-05-09 10:18:43');
INSERT INTO `online_pills` VALUES ('56', 'b1104', '23', '1', '54454548', '小小', '2018-05-09 10:19:01', '小小', '2018-05-09 10:19:02');
INSERT INTO `online_pills` VALUES ('57', 'b1104', '5', '5', 'C3TIY85U', '小小', '2018-05-09 10:56:22', '小小', '2018-05-09 10:56:23');
INSERT INTO `online_pills` VALUES ('58', 'b1104', '2', '1', 'E3AZ159T', '小小', '2018-05-09 10:56:33', '小小', '2018-05-09 10:56:34');
