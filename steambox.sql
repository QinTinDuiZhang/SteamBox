/*
 Navicat Premium Data Transfer

 Source Server         : 001
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : steambox

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 30/11/2022 15:54:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '张三强');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '单机');
INSERT INTO `category` VALUES (2, '多人');
INSERT INTO `category` VALUES (3, '策略');
INSERT INTO `category` VALUES (4, '剧情');
INSERT INTO `category` VALUES (5, '动作');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `pubdate` datetime(0) NOT NULL COMMENT '发布时间',
  `ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏',
  `likenum` int(0) NULL DEFAULT NULL COMMENT '点赞数',
  `dislikenum` int(0) NULL DEFAULT NULL COMMENT '点踩数',
  `reply_for_id` bigint(0) NULL DEFAULT NULL COMMENT '回复的评论编号',
  `creator` int(0) NOT NULL COMMENT '作者编号',
  `post_id` int(0) NOT NULL COMMENT '帖子编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reply_for_id`(`reply_for_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`reply_for_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '这游戏就是开放世界的艺术品', '2021-12-16 22:07:41', '0:0:0:0:0:0:0:1', 0, 11, 1, NULL, 1, 1);
INSERT INTO `comment` VALUES (2, '确实是艺术品没错', '2021-12-22 19:46:44', '0:0:0:0:0:0:0:1', 0, 0, 0, 1, 2, 1);
INSERT INTO `comment` VALUES (3, '你是懂艺术品的', '2021-12-25 19:49:35', '0:0:0:0:0:0:0:1', 0, 1, 0, 2, 1, 1);

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游戏名称',
  `shoplink` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商店链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES (1, '荒野大镖客：救赎2', 'https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/');
INSERT INTO `community` VALUES (2, '只狼：影逝二度', 'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice__GOTY_Edition/');
INSERT INTO `community` VALUES (3, '空洞骑士', 'https://store.steampowered.com/app/367520/Hollow_Knight/');
INSERT INTO `community` VALUES (4, '双人成行', 'https://store.steampowered.com/app/1426210/');
INSERT INTO `community` VALUES (5, '艾尔登法环', 'https://store.steampowered.com/app/1245620/');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `content` varchar(15000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `pubdate` datetime(0) NOT NULL COMMENT '发布时间',
  `click_count` int(0) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `creator` int(0) NOT NULL COMMENT '作者编号',
  `auditor` int(0) NOT NULL COMMENT '审核员编号',
  `community_id` int(0) NULL DEFAULT NULL COMMENT '社区编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE,
  INDEX `auditor`(`auditor`) USING BTREE,
  INDEX `community_id`(`community_id`) USING BTREE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`auditor`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_ibfk_4` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '《荒野大镖客2》Steam同时在线达6万人！刷新历史纪录', 'post.jpg', 'R星传说级巨作《荒野大镖客：救赎2》最近迎来新的荣光。根据SteamDB数据显示，昨日在Steam平台同时玩该游戏的人数高达59991人，将近6万人！原先的同时在线记录为5.5万，在2019年12月游戏刚发售时创下。有人可能会问，6万这个数字也不算高呀，原因其实很简单。该游戏的PC版最开始只登陆R星自家平台和Epic商城，很多玩家为了第一时间玩到PC版游戏，而选择在其他平台购买。PC版发布的一个月后，《荒野大镖客2》才在Steam上发售。遗憾的是，R星早已宣布《荒野大镖客2》停止内容更新，将全力开发《GTA6》并持续运营《GTA OL》。玩家们期待的DLC、次世代版等可能长时间内都无望了。\r\n', '2021-12-30 17:16:44', 0, 1, 1, 1);

-- ----------------------------
-- Table structure for post_category
-- ----------------------------
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category`  (
  `post_id` int(0) NOT NULL COMMENT '帖子编号',
  `category_id` int(0) NOT NULL COMMENT '分类编号',
  PRIMARY KEY (`post_id`, `category_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `post_category_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_category
-- ----------------------------
INSERT INTO `post_category` VALUES (1, 1);
INSERT INTO `post_category` VALUES (1, 4);
INSERT INTO `post_category` VALUES (1, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `regdate` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `forbidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', 'e1adc3949ba59abbe56e057f2f883e', 'Steve', '1.jpg', '2021-12-09', 'abc@qq.com', '15145678910', '2021-12-20 17:26:46', 0);
INSERT INTO `user` VALUES (2, 'test1', 'e1adc3949ba59abbe56e057f2f883e', '绝地大叔', '4.jpg', '2021-12-14', 'abc123@qq.com', '15145678911', '2021-12-20 18:39:58', 0);
INSERT INTO `user` VALUES (3, 'test233', 'e1adc3949ba59abbe56e057f2f883e', '三月寒', '2.jpg', '2022-01-18', 'abc456@qq.com', '15145678912', '2022-01-18 12:14:03', 0);

-- ----------------------------
-- Table structure for user_community
-- ----------------------------
DROP TABLE IF EXISTS `user_community`;
CREATE TABLE `user_community`  (
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `community_id` int(0) NOT NULL COMMENT '社区编号',
  PRIMARY KEY (`user_id`, `community_id`) USING BTREE,
  INDEX `community_id`(`community_id`) USING BTREE,
  CONSTRAINT `user_community_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_community_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_community
-- ----------------------------
INSERT INTO `user_community` VALUES (1, 1);
INSERT INTO `user_community` VALUES (1, 2);
INSERT INTO `user_community` VALUES (1, 4);

SET FOREIGN_KEY_CHECKS = 1;
