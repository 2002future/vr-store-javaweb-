/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : VR_store

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 29/06/2022 22:10:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `stock` int(11) NULL DEFAULT NULL COMMENT '存货',
  `sell` int(20) NULL DEFAULT NULL COMMENT '销售',
  `type_id` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `scroll` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '轮播图',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'VR头戴式1', '/picture/yanjing1.jpg', 1234, '带你进入另一个世界，未来世界，无尽想象', 123, 123, 1, '2022-06-18', NULL);
INSERT INTO `goods` VALUES (2, 'VR一体机', '/picture/shebei.jpg', 46000, '畅想VR，满足无尽游戏体验', 568, 125, 2, '2022-06-07', NULL);
INSERT INTO `goods` VALUES (3, '触摸屏安全体验馆科技展示', '/picture/shebei2.jpg', 9500, '安全教育不可少，通过此款设备，更好把握安全', 231, 23, 1, '2022-05-30', NULL);
INSERT INTO `goods` VALUES (4, 'VR游戏3d眼镜xr虚拟设备体感', '/picture/shebei4.jpg', 2499, 'VR游戏3d眼镜xr虚拟设备体感元宇宙', 168, 4, 1, '2022-05-18', NULL);
INSERT INTO `goods` VALUES (5, '体感游戏软件动感平台', '/picture/shebei3.jpg', 20011, '体感游戏软件动感平台', 12, 94, 2, '2022-04-05', NULL);
INSERT INTO `goods` VALUES (6, 'Neo3玩家版vr眼镜一体机', '/picture/1.jpg', 1999, '256G大内存VR体感一体机3d智能眼镜游乐设备游戏Steam', 45, 2345, 1, '2021-12-14', NULL);
INSERT INTO `goods` VALUES (7, 'Neo3先锋版vr眼镜一体机', '/picture/11.jpg', 2499, '128G/256G大内存VR体感一体3d智能游乐设备游戏Steam', 34, 697, 1, '2022-06-18', NULL);
INSERT INTO `goods` VALUES (8, 'Quest 2 一体式头戴VR畅游设备', '/picture/13.jpg', 2199, 'Neo3先锋版vr眼镜虚拟现实游戏设备vr体感一体机4k高清vr游戏机家用steam vr游乐设备3D', 324, 86, 2, '2019-04-01', NULL);
INSERT INTO `goods` VALUES (9, 'Quest2一体机VR眼镜', '/picture/19.jpg', 1999, 'steam头戴虚拟性游乐设备体感游戏机', 153, 234, 1, '2022-05-18', NULL);
INSERT INTO `goods` VALUES (10, '诺亦腾动捕手套Perception Neuron', '/picture/shoutao1.jpg', 299, '高级全身无线动作捕捉系统VR眼镜配件套装 动作捕捉手套', 23, 278, 5, '2022-05-30', NULL);
INSERT INTO `goods` VALUES (11, 'HTC VIVE VR手套', '/picture/shoutao2.jpg', 9800, 'Cosmos系列适用配件 vive Pro专用诺亦腾动作捕捉', 175, 234, 5, '2022-06-15', NULL);
INSERT INTO `goods` VALUES (12, '诺亦腾Hi5二代升级', '/picture/shoutao3.jpg', 29456, 'R虚拟现实交互手套动画传媒手指动作捕捉商业版 HI5 2.0 PCVR版', 21, 878, 5, '2022-05-21', NULL);
INSERT INTO `goods` VALUES (13, 'VIVE FOCUS 3 操控手柄', '/picture/shoubin1.jpg', 1299, '这是一个好手柄，好手柄就选VIVE', 962, 18389, 6, '2022-06-19', NULL);
INSERT INTO `goods` VALUES (14, 'RCGEEK', '/picture/shoubin2.jpg', 99, '适用Meta quest2 智能VR眼镜一体机双手柄控制器游戏虚拟空间增强体验头显配件 Oculus quest2 手柄枪', 184, 934, 6, '2022-06-15', NULL);
INSERT INTO `goods` VALUES (15, '节奏短光剑手柄', '/picture/shoubin3.jpg', 199, 'RCGEEK 适用Meta quest2 智能VR眼镜一体机双手柄控制器游戏虚拟空间增强体验头显配件 Oculus quest2 ', 63, 234, 6, '2022-06-19', NULL);
INSERT INTO `goods` VALUES (16, 'Oculus VR手柄', '/picture/shoubin4.jpg', 500, 'oculus专用配件 Oculus Touch 无线 VR手柄 虚拟现实手势控制器 Oculus rift Touch手柄', 213, 12, 6, '2022-05-30', NULL);
INSERT INTO `goods` VALUES (17, 'Redmi Note 11Pro+', '/picture/shouji1.jpg', 1999, '  性能强悍的年度旗舰芯\r\n  高配护眼的 LCD 旗舰屏幕\r\n  超越预期的充电、续航、品质\r\n  它，不可错过的 618 重磅新品', 2131, 3231, 3, '2022-06-19', NULL);
INSERT INTO `goods` VALUES (18, 'Redmi K50 pro', '/picture/shouji2.jpg', 2699, '有点狠的年度高性能\r\n有点狠的 2K 直屏换代\r\n有点狠的神仙充电 CP\r\n有点狠的光学防抖相机\r\n万众期待的年度旗舰\r\n   狠超你的想象！', 1234, 342, 3, '2022-05-30', '/ScrollImage/scroll2.jpg');
INSERT INTO `goods` VALUES (19, 'Xiaomi Civi 1S', '/picture/shouji3.jpg', 2299, '延续独特设计美学，奇迹新色一见倾心\r\n美颜、美妆双重科技，你的好看面面俱到\r\n骁龙778G Plus匠心调校，流畅体验超乎想象\r\n这枚指尖上跃动的精灵，为你倾心奉上', 6432, 2341, 3, '2022-01-19', '/ScrollImage/scroll4.jpg');
INSERT INTO `goods` VALUES (20, 'Xiaomi 11 Ultra', '/picture/shouji4.jpg', 3999, '一次探索，一个迎接光的窗口；\r\n一次致敬，一个规则外的新物种；\r\n一款倾尽心血的专业影像之作，\r\n在此。', 1237, 3214, 3, '2022-01-19', '/ScrollImage/scroll3.jpg');
INSERT INTO `goods` VALUES (21, 'Xiaomi 11 Pro', '/picture/shouji5.jpg', 3399, '前所未有的暗光拍摄，夜景惊艳显现\r\n无线充电一骑绝尘，电池揭晓未来方向\r\n音画双绝的视听，获得顶尖机构的认可', 132, 4523, 3, '2022-01-19', '/ScrollImage/scroll1.jpg');
INSERT INTO `goods` VALUES (22, '荣耀帝王 平板', '/picture/pingban1.jpg', 858, '4英寸全网通5GWiFi十核学习游戏二合一4K高清全面屏教育优惠Pad Pro 银灰色12+128G/免费试用/分期免息/一年换新 12英寸全网通5G', 9234, 123573, 4, '2022-05-30', NULL);
INSERT INTO `goods` VALUES (23, 'Apple2021年新款', '/picture/pingban2.jpg', 2399, 'iPad 10.2英寸平板电脑 2021年新款（64GB WLAN版/A13芯片 MK2L3CH/A） 银色', 73444, 23, 4, '2022-06-19', NULL);
INSERT INTO `goods` VALUES (24, 'vivo Pad 平板电脑 iQOO', '/picture/pingban3.jpg', 2299, '8GB+128GB 天空蓝 高通骁龙870 航空铝一体化机身 44W疾速闪充 vivo iqoopad', 1239, 342, 4, '2020-06-19', NULL);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 2499, 1, 1, 1);
INSERT INTO `orderitem` VALUES (5, 199, 1, 15, 16);
INSERT INTO `orderitem` VALUES (6, 1999, 1, 17, 17);
INSERT INTO `orderitem` VALUES (7, 2299, 1, 19, 17);
INSERT INTO `orderitem` VALUES (8, 1299, 1, 13, 17);
INSERT INTO `orderitem` VALUES (9, 2699, 1, 18, 18);
INSERT INTO `orderitem` VALUES (10, 2299, 4, 19, 18);
INSERT INTO `orderitem` VALUES (11, 3399, 7, 21, 18);
INSERT INTO `orderitem` VALUES (12, 199, 6, 15, 18);
INSERT INTO `orderitem` VALUES (13, 9800, 1, 11, 19);
INSERT INTO `orderitem` VALUES (14, 1299, 1, 13, 19);
INSERT INTO `orderitem` VALUES (15, 1999, 7, 6, 20);
INSERT INTO `orderitem` VALUES (16, 1299, 1, 13, 20);
INSERT INTO `orderitem` VALUES (17, 9800, 3, 11, 21);
INSERT INTO `orderitem` VALUES (18, 199, 2, 15, 21);
INSERT INTO `orderitem` VALUES (19, 1999, 10, 17, 22);
INSERT INTO `orderitem` VALUES (20, 2699, 1, 18, 22);
INSERT INTO `orderitem` VALUES (21, 299, 2, 10, 22);
INSERT INTO `orderitem` VALUES (22, 2399, 1, 23, 23);
INSERT INTO `orderitem` VALUES (23, 199, 3, 15, 23);
INSERT INTO `orderitem` VALUES (24, 199, 1, 15, 24);
INSERT INTO `orderitem` VALUES (25, 2399, 1, 23, 25);
INSERT INTO `orderitem` VALUES (26, 2299, 1, 24, 26);
INSERT INTO `orderitem` VALUES (27, 9800, 2, 11, 26);
INSERT INTO `orderitem` VALUES (28, 3399, 1, 21, 27);
INSERT INTO `orderitem` VALUES (29, 199, 1, 15, 27);
INSERT INTO `orderitem` VALUES (30, 199, 1, 15, 28);
INSERT INTO `orderitem` VALUES (31, 199, 1, 15, 29);
INSERT INTO `orderitem` VALUES (32, 2299, 1, 19, 30);
INSERT INTO `orderitem` VALUES (33, 199, 1, 15, 30);
INSERT INTO `orderitem` VALUES (34, 199, 1, 15, 31);
INSERT INTO `orderitem` VALUES (35, 1999, 1, 17, 32);
INSERT INTO `orderitem` VALUES (36, 1299, 1, 13, 33);
INSERT INTO `orderitem` VALUES (37, 1999, 1, 17, 34);
INSERT INTO `orderitem` VALUES (38, 3399, 5, 21, 35);
INSERT INTO `orderitem` VALUES (39, 299, 1, 10, 35);
INSERT INTO `orderitem` VALUES (40, 2399, 2, 23, 36);
INSERT INTO `orderitem` VALUES (41, 1299, 1, 13, 36);
INSERT INTO `orderitem` VALUES (42, 1999, 5, 17, 37);
INSERT INTO `orderitem` VALUES (43, 9800, 3, 11, 37);
INSERT INTO `orderitem` VALUES (44, 199, 4, 15, 38);
INSERT INTO `orderitem` VALUES (45, 1999, 5, 17, 40);
INSERT INTO `orderitem` VALUES (46, 1999, 7, 17, 43);
INSERT INTO `orderitem` VALUES (47, 2299, 8, 19, 43);
INSERT INTO `orderitem` VALUES (48, 858, 6, 22, 44);
INSERT INTO `orderitem` VALUES (49, 1299, 7, 13, 44);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int(6) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 2499, 1, 1, 1, '张三', '2147483647', '福建省厦门市集美区', '2022-06-27 13:18:47', 1);
INSERT INTO `orders` VALUES (16, 199, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 15:48:38', 29);
INSERT INTO `orders` VALUES (17, 5597, 3, 3, 1, '43423', '4441', '4134', '2022-06-28 15:50:22', 29);
INSERT INTO `orders` VALUES (18, 36882, 18, 1, 1, '43423', '4441', '4134', '2022-06-28 16:31:22', 29);
INSERT INTO `orders` VALUES (19, 11099, 2, 1, 2, '43423', '4441', '4134', '2022-06-28 16:42:58', 29);
INSERT INTO `orders` VALUES (20, 15292, 8, 1, 1, '43423', '4441', '4134', '2022-06-28 16:47:57', 29);
INSERT INTO `orders` VALUES (21, 29798, 5, 1, 1, '43423', '4441', '4134', '2022-06-28 17:49:59', 29);
INSERT INTO `orders` VALUES (22, 23287, 13, 1, 1, '43423', '4441', '4134', '2022-06-28 18:11:31', 29);
INSERT INTO `orders` VALUES (23, 2996, 4, 1, 1, '43423', '4441', '4134', '2022-06-28 18:31:53', 29);
INSERT INTO `orders` VALUES (24, 199, 1, 1, 1, '43423', '444124523453', '4134', '2022-06-28 18:35:23', 29);
INSERT INTO `orders` VALUES (25, 2399, 1, 1, 2, '213', '23', '43', '2022-06-28 18:51:41', 29);
INSERT INTO `orders` VALUES (26, 21899, 3, 1, 2, '243', '243', '234', '2022-06-28 18:52:59', 29);
INSERT INTO `orders` VALUES (27, 3598, 2, 1, 2, '345', '345', '345', '2022-06-28 18:55:13', 29);
INSERT INTO `orders` VALUES (28, 199, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:05:32', 29);
INSERT INTO `orders` VALUES (29, 199, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:06:44', 29);
INSERT INTO `orders` VALUES (30, 2498, 2, 4, 1, '43423', '4441', '4134', '2022-06-28 19:13:30', 29);
INSERT INTO `orders` VALUES (31, 199, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:27:20', 29);
INSERT INTO `orders` VALUES (32, 1999, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:27:29', 29);
INSERT INTO `orders` VALUES (33, 1299, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:28:05', 29);
INSERT INTO `orders` VALUES (34, 1999, 1, 1, 1, '43423', '4441', '4134', '2022-06-28 19:28:42', 29);
INSERT INTO `orders` VALUES (35, 17294, 6, 2, 1, '43423', '4441', '4134', '2022-06-28 19:31:09', 29);
INSERT INTO `orders` VALUES (36, 6097, 3, 1, 1, '43423', '4441', '4134', '2022-06-28 19:31:43', 29);
INSERT INTO `orders` VALUES (37, 39395, 8, 2, 1, '43423', '4441324', '4134', '2022-06-28 22:32:34', 29);
INSERT INTO `orders` VALUES (38, 796, 4, 2, 1, '43423243', '44413242231', '413412332131', '2022-06-28 22:42:12', 29);
INSERT INTO `orders` VALUES (39, 0, 0, 3, 1, '43423', '44413242', '4134', '2022-06-28 23:03:49', 29);
INSERT INTO `orders` VALUES (40, 9995, 5, 1, 1, '43423', '44413242', '4134', '2022-06-29 09:38:19', 29);
INSERT INTO `orders` VALUES (41, 0, 0, 2, 2, '43423', '44413242', '4134', '2022-06-29 09:38:30', 29);
INSERT INTO `orders` VALUES (42, 0, 0, 2, 1, '43423', '44413242', '4134', '2022-06-29 10:21:23', 29);
INSERT INTO `orders` VALUES (43, 32385, 15, 4, 1, '43423', '44413242', '4134', '2022-06-29 13:28:47', 29);
INSERT INTO `orders` VALUES (44, 14241, 13, 2, 1, '43423', '44413242', '4134', '2022-06-29 17:13:19', 29);
INSERT INTO `orders` VALUES (45, 0, 0, 2, 1, '43423', '44413242', '4134', '2022-06-29 17:13:29', 29);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'VR头戴式');
INSERT INTO `type` VALUES (2, '台式VR');
INSERT INTO `type` VALUES (3, '手机');
INSERT INTO `type` VALUES (4, '平板');
INSERT INTO `type` VALUES (5, 'VR手套');
INSERT INTO `type` VALUES (6, 'VR手柄');
INSERT INTO `type` VALUES (35, 'aaaaa');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isadmin` bit(1) NULL DEFAULT NULL,
  `isvalidate` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三三', '2630611111@qq.com', '123456', '张三', '12345678901', '厦门工学院', b'1', b'0');
INSERT INTO `user` VALUES (2, '123', 'ewqr', '1231', '12344', 'rqe', 'qrew', b'0', b'0');
INSERT INTO `user` VALUES (3, '122', '122', '122', '132', '234', '24', b'1', b'0');
INSERT INTO `user` VALUES (13, '12341', '39402402@qq.com', '1234', '王二麻子', '12341', '厦门工学院吧', b'0', b'0');
INSERT INTO `user` VALUES (18, '王五', '2949293919@qq.com', '123', '34', '234', '413', b'0', b'0');
INSERT INTO `user` VALUES (23, '王二麻子', '2341', '3214', '2341452', '231323', '123', b'0', b'0');
INSERT INTO `user` VALUES (25, '晚风', '34554', '123', '432', '234', '1243', b'0', b'0');
INSERT INTO `user` VALUES (26, '我是王二麻子', '2630611277@qq.com', '123', '王二麻子', '19384728452', '福建省厦门市湖里区十一号街', b'0', b'0');
INSERT INTO `user` VALUES (27, '张三三1', '5242455', '452', '25', '25', '524', b'0', b'0');
INSERT INTO `user` VALUES (29, '张三', '28301302@qq.com', '123', '43423', '44413242', '4134', b'0', b'0');
INSERT INTO `user` VALUES (31, 'asd', '3984253489@qq.com', 'sfa', 'scascf', 'scaS', 'ASD', b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
