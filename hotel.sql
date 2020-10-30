/*
 Navicat MySQL Data Transfer

 Source Server         : bookinformation
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/10/2020 07:37:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

use hotel;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域id,主键且自增',
  `aName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行政区域名称',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '锦江区');
INSERT INTO `area` VALUES (2, '青羊区');
INSERT INTO `area` VALUES (3, '武侯区');
INSERT INTO `area` VALUES (4, '成华区');
INSERT INTO `area` VALUES (5, '金牛区');
INSERT INTO `area` VALUES (6, '双流区');
INSERT INTO `area` VALUES (7, '高新区');
INSERT INTO `area` VALUES (8, '温江区');
INSERT INTO `area` VALUES (9, '郫都区');
INSERT INTO `area` VALUES (10, '龙泉驿区');
INSERT INTO `area` VALUES (11, '新都');
INSERT INTO `area` VALUES (12, '都江堰');
INSERT INTO `area` VALUES (13, '大邑');
INSERT INTO `area` VALUES (14, '崇州');
INSERT INTO `area` VALUES (15, '邛崃');
INSERT INTO `area` VALUES (16, '金堂');
INSERT INTO `area` VALUES (17, '彭州');
INSERT INTO `area` VALUES (18, '浦江');
INSERT INTO `area` VALUES (19, '青白江');
INSERT INTO `area` VALUES (20, '新津');

-- ----------------------------
-- Table structure for dateprice
-- ----------------------------
DROP TABLE IF EXISTS `dateprice`;
CREATE TABLE `dateprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `day` date NULL DEFAULT NULL COMMENT '日期',
  `bookState` int(11) NULL DEFAULT NULL COMMENT '0为不可预订，1为可预订',
  `priceUnity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格符号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `roomId` int(11) NULL DEFAULT NULL COMMENT '外键rid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dateprice
-- ----------------------------
INSERT INTO `dateprice` VALUES (1, '2020-10-23', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (2, '2020-10-24', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (3, '2020-10-25', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (4, '2020-10-26', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (5, '2020-10-27', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (6, '2020-10-28', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (7, '2020-10-29', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (8, '2020-10-30', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (9, '2020-10-31', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (10, '2020-11-01', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (11, '2020-11-02', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (12, '2020-11-03', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (13, '2020-11-04', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (14, '2020-11-05', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (15, '2020-11-06', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (16, '2020-11-07', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (17, '2020-11-08', 1, '￥', 429.00, 1);
INSERT INTO `dateprice` VALUES (18, '2020-11-09', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (19, '2020-11-10', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (20, '2020-11-11', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (21, '2020-11-12', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (22, '2020-11-13', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (23, '2020-11-14', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (24, '2020-11-15', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (25, '2020-11-16', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (26, '2020-11-17', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (27, '2020-11-18', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (28, '2020-11-19', 1, '￥', 449.00, 1);
INSERT INTO `dateprice` VALUES (29, '2020-11-20', 1, '￥', 449.00, 0);
INSERT INTO `dateprice` VALUES (30, '2020-11-21', 1, '￥', 449.00, 0);

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `roomId` int(11) NOT NULL COMMENT '外键rid',
  `eName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `eIcon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备icon图标',
  `eHas` int(11) NULL DEFAULT NULL COMMENT '是否拥有该设备，0无1有',
  PRIMARY KEY (`eid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, 1, '热水淋浴', 'linyu', 1);
INSERT INTO `equipment` VALUES (2, 1, '无线网络', 'wuxian', 1);
INSERT INTO `equipment` VALUES (3, 1, '空调', 'kongtiao', 1);
INSERT INTO `equipment` VALUES (4, 1, '电视', 'dianshi', 1);
INSERT INTO `equipment` VALUES (5, 1, '洗衣机', 'xiyiji', 1);
INSERT INTO `equipment` VALUES (6, 1, '冰箱', 'binxiang', 1);
INSERT INTO `equipment` VALUES (7, 1, '停车位', 'tingche', 1);
INSERT INTO `equipment` VALUES (8, 1, '饮水设备', 'yinshui', 1);
INSERT INTO `equipment` VALUES (9, 1, '暖气', 'nuanqi', 1);
INSERT INTO `equipment` VALUES (10, 1, '拖鞋', 'tuoxie', 1);
INSERT INTO `equipment` VALUES (11, 1, '手纸', 'shouzhi', 1);
INSERT INTO `equipment` VALUES (12, 1, '牙具', 'yaju', 1);
INSERT INTO `equipment` VALUES (13, 1, '毛巾', 'maojin', 1);
INSERT INTO `equipment` VALUES (14, 1, '浴液 洗发水', 'yuye', 1);
INSERT INTO `equipment` VALUES (15, 1, '允许做饭', 'iscook', 1);
INSERT INTO `equipment` VALUES (16, 1, '允许聚餐', 'isunion', 1);
INSERT INTO `equipment` VALUES (17, 1, '电梯', 'dianti', 0);
INSERT INTO `equipment` VALUES (18, 1, '门禁系统', 'menjin', 0);
INSERT INTO `equipment` VALUES (19, 1, '浴缸', 'yugang', 0);
INSERT INTO `equipment` VALUES (20, 1, '有线网络', 'youxian', 0);
INSERT INTO `equipment` VALUES (21, 1, '香皂', 'xiangz', 0);
INSERT INTO `equipment` VALUES (22, 1, '允许吸烟', 'issmok', 0);
INSERT INTO `equipment` VALUES (23, 1, '允许带宠物', 'ispat', 0);
INSERT INTO `equipment` VALUES (24, 1, '适宜儿童', 'ischilren', 0);
INSERT INTO `equipment` VALUES (25, 1, '适宜老人', 'isold', 0);
INSERT INTO `equipment` VALUES (26, 1, '适宜残疾人', 'cjr', 0);

-- ----------------------------
-- Table structure for landscape
-- ----------------------------
DROP TABLE IF EXISTS `landscape`;
CREATE TABLE `landscape`  (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '景点id,主键且自增',
  `lname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点名称',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of landscape
-- ----------------------------
INSERT INTO `landscape` VALUES (1, '武侯祠');
INSERT INTO `landscape` VALUES (2, '锦里古街');
INSERT INTO `landscape` VALUES (3, '都江堰景区');
INSERT INTO `landscape` VALUES (4, '宽窄巷子');
INSERT INTO `landscape` VALUES (5, '金沙遗址博物馆');
INSERT INTO `landscape` VALUES (6, '街子古镇');
INSERT INTO `landscape` VALUES (7, '乐平古镇');
INSERT INTO `landscape` VALUES (8, '洛带古镇');
INSERT INTO `landscape` VALUES (9, '黄龙溪古镇');
INSERT INTO `landscape` VALUES (10, '杜甫草堂');
INSERT INTO `landscape` VALUES (11, '望江楼公园');
INSERT INTO `landscape` VALUES (12, '文殊院');
INSERT INTO `landscape` VALUES (13, '昭觉寺');
INSERT INTO `landscape` VALUES (14, '青城山');
INSERT INTO `landscape` VALUES (15, '青羊宫');
INSERT INTO `landscape` VALUES (16, '宝光寺');
INSERT INTO `landscape` VALUES (17, '合江亭');
INSERT INTO `landscape` VALUES (18, '国色天香');
INSERT INTO `landscape` VALUES (19, '三圣花乡');
INSERT INTO `landscape` VALUES (20, '熊猫基地');
INSERT INTO `landscape` VALUES (21, '欢乐谷');
INSERT INTO `landscape` VALUES (22, '百花潭公园');
INSERT INTO `landscape` VALUES (23, '九眼桥');
INSERT INTO `landscape` VALUES (24, '环球中心');
INSERT INTO `landscape` VALUES (25, '东郊记忆');
INSERT INTO `landscape` VALUES (26, '天府广场');
INSERT INTO `landscape` VALUES (27, '人民公园');
INSERT INTO `landscape` VALUES (28, '春熙路');
INSERT INTO `landscape` VALUES (29, '成都339');
INSERT INTO `landscape` VALUES (30, '浣花溪公园');

-- ----------------------------
-- Table structure for landscapewithroom
-- ----------------------------
DROP TABLE IF EXISTS `landscapewithroom`;
CREATE TABLE `landscapewithroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `RoomRid` int(11) NOT NULL COMMENT '外键，rid',
  `LandScapeLid` int(11) NOT NULL COMMENT '外键，lid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of landscapewithroom
-- ----------------------------
INSERT INTO `landscapewithroom` VALUES (1, 1, 28);
INSERT INTO `landscapewithroom` VALUES (2, 1, 26);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `chatId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '聊天室id，由用户和屋主共同组成',
  `senderId` int(11) NULL DEFAULT NULL COMMENT '发消息的用户',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '内容',
  `isReader` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否已读',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userType` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户的类型',
  `ownerId` int(11) NULL DEFAULT NULL,
  `senderNickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `senderAvatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('u1o1', 1, '2020-10-22 19:46:16', '能讲个价吗', 0, 1, 'user', 1, '用户1', NULL, 1);
INSERT INTO `messages` VALUES ('u1o1', 1, '2020-10-22 19:50:14', '不能呢，亲', 0, 2, 'owner', 1, 'ceshihao1', NULL, 1);
INSERT INTO `messages` VALUES ('u1o2', 1, '2020-10-23 00:22:37', '能讲个价吗', 0, 3, 'user', 2, '房东1', NULL, 1);
INSERT INTO `messages` VALUES ('u2o1', 1, '2020-10-23 00:40:01', '您在看房吗', 0, 4, 'owner', 2, 'ceshihao1', NULL, 2);
INSERT INTO `messages` VALUES ('u2o1', 2, '2020-10-23 22:19:17', '是的呢', 0, 5, 'user', 1, '13566666666', NULL, 2);

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '房东id,主键且自增',
  `oname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房东用户名',
  `opwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房东密码,md5加密',
  `oNickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东姓名',
  `identification` int(11) NULL DEFAULT NULL COMMENT '认证与否，0未认证1认证',
  `oImg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东头像图片',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES (1, 'ceshihao1', '25d55ad283aa400af464', '幽默主义', 1, '');
INSERT INTO `owner` VALUES (2, '房东2', '123', '房东2', 1, NULL);

-- ----------------------------
-- Table structure for ownerwithroom
-- ----------------------------
DROP TABLE IF EXISTS `ownerwithroom`;
CREATE TABLE `ownerwithroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `ownerId` int(11) NOT NULL COMMENT '外键，房东oid',
  `roomId` int(11) NOT NULL COMMENT '外键，房屋rid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ownerwithroom
-- ----------------------------
INSERT INTO `ownerwithroom` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id,主键且自增',
  `rName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋名称',
  `areaName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行政区域名称',
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `leaseType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出租类型',
  `guestNum` int(11) NULL DEFAULT NULL COMMENT '宜居人数',
  `bedNum` int(11) NULL DEFAULT NULL COMMENT '床的数量',
  `commentScore` float(2, 1) NULL DEFAULT NULL COMMENT '房屋评分',
  `roomArea` int(11) NULL DEFAULT NULL COMMENT '房屋面积',
  `houseTypeInfo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型，如一室一厅',
  `houseOtherInfo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋其他信息，如1厨1阳台',
  `img_t` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋首页展示图片',
  `img_c` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋图片(内容展示)url',
  `personDesc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性描述',
  `roomDesc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋内部描述',
  `traffic` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附近交通情况',
  `loaction` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房源位置',
  `sellNum` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `lowerPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低价格',
  `ownerId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (2, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (3, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (4, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (5, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (6, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (7, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (8, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (9, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);
INSERT INTO `room` VALUES (10, '【诗和远方】春熙路/盐市口/太古里/天府广场', '锦江区', '30.660947', '104.078819', '整套出租', 6, 3, 5.0, 110, '3室2厅', '1卫1厨2阳台', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg', '房子位于成都市中心的中心,背靠春熙路,毗邻盐市口,左拥太古里,右徬天府广场,出门步行三四十米就可抵达繁华的春熙路步行街了,地理位置极其优越。楼下商场商铺云集,美食酒楼林立,多趟公交车从楼下经过停靠,距地铁天府广场站仅500米左右,机场专线1号线终点站起步价即到,步行10分钟即到小家,无论吃喝玩乐还是衣食住行都极其方便。', '超大的投影墙,网络电视 海量影视随便看 .免费提供一次性牙刷牙膏 .免费提供洗发水、沐浴乳、浴巾 .床品采用舒适的水洗棉,裸睡力MAX .充足的自然光及绿萝植物 .所有床上用品及浴巾一客一换,干净卫生', '机场:打车30分钟左右,约48元。约18.3公里 地铁:10号线到春熙路下,步行300米左右。可以停车，但是需要单独收费。', '四川省成都市锦江区东大街上东大街118号', 120, 429.00, 1);

-- ----------------------------
-- Table structure for roomimg
-- ----------------------------
DROP TABLE IF EXISTS `roomimg`;
CREATE TABLE `roomimg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键且自增',
  `roomId` int(11) NOT NULL COMMENT '外键rid',
  `banner` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roomimg
-- ----------------------------
INSERT INTO `roomimg` VALUES (1, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (2, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (3, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (4, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (5, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (6, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (7, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (8, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (9, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (10, 2, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (11, 3, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (12, 4, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (13, 5, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (14, 6, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (15, 7, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (16, 8, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (17, 9, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (18, 10, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (19, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (20, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (21, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');
INSERT INTO `roomimg` VALUES (22, 1, '/public/img/house/h1/1,20,0,70,25426,2666,2000,f4d660ee.jpg');

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `roomId` int(11) NOT NULL COMMENT '外键rid',
  `orderType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '预定方式',
  `days` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '入住天数',
  `priceDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '定金比描述',
  `deposit` int(11) NOT NULL COMMENT '押金',
  `cleanDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '清洁费描述',
  `cleanPrice` int(11) NULL DEFAULT NULL COMMENT '清洁费',
  `otherPriceDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '其他费用描述',
  `know` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '入住须知',
  `requirement` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '特殊要求',
  `peopleNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '人数要求',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES (1, 1, '下单即可入住，无需房东确认', '最少入住1天', '订单确认后，在线支付房款的100%作为订金', 300, '', 90, '', '允许做饭、不允许带宠物、不允许聚会、允许吸烟、接待境外人士', '', '6');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id,主键且自增',
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题名称',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (1, '速订');
INSERT INTO `title` VALUES (2, '长租优惠');
INSERT INTO `title` VALUES (3, '商旅首选');
INSERT INTO `title` VALUES (4, '近地铁');

-- ----------------------------
-- Table structure for titlewithroom
-- ----------------------------
DROP TABLE IF EXISTS `titlewithroom`;
CREATE TABLE `titlewithroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键且自增',
  `RoomRid` int(11) NOT NULL COMMENT '外键，rid',
  `TitleTid` int(11) NOT NULL COMMENT '外键，tid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of titlewithroom
-- ----------------------------
INSERT INTO `titlewithroom` VALUES (1, 1, 1);
INSERT INTO `titlewithroom` VALUES (2, 1, 3);
INSERT INTO `titlewithroom` VALUES (3, 1, 4);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '13655555555', '用户1', NULL, '123');
INSERT INTO `users` VALUES (2, '13566666666', '13566666666', NULL, 'q1234567');

SET FOREIGN_KEY_CHECKS = 1;
