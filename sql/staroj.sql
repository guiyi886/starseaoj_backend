/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云数据库
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 8.134.202.187:3306
 Source Schema         : staroj

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 08/09/2024 19:51:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目答案',
  `submitNum` int NOT NULL DEFAULT 0 COMMENT '题目提交数',
  `acceptedNum` int NOT NULL DEFAULT 0 COMMENT '题目通过数',
  `judgeCase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题用例（json 数组）',
  `judgeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题配置（json 对象）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '【两数之和】A + B', '输入两个整数A、B，输出两个整数之和 A+B\n\n***\n***\n可使用以下代码提交后稍等一会，在【浏览题目提交】查看结果。\n```java\npublic class Main {\n    public static void main(String[] args) {\n        int a = Integer.parseInt(args[0]);\n        int b = Integer.parseInt(args[1]);\n        System.out.println(a + b);\n    }\n}\n```', '[\"add\",\"easy\"]', 'A+B', 0, 0, '[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"2 3\",\"output\":\"5\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1024,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-08-10 06:49:17', '2024-09-08 19:39:53', 0);
INSERT INTO `question` VALUES (2, 'Hello,World!', '编写一个能够输出 Hello,World! 的程序。', '[\"Hello,World!\",\"easy\"]', '', 0, 0, '[{\"input\":\"\",\"output\":\"Hello,World!\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-08-10 06:51:23', '2024-09-08 19:42:17', 0);
INSERT INTO `question` VALUES (3, '【两数之差】A - B', '【两数之差】A - B\n\n测试样例中保证A大于B', '[\"easy\"]', '', 0, 0, '[{\"input\":\"5 1\",\"output\":\"4\"},{\"input\":\"8 2\",\"output\":\"6\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-08-10 06:51:24', '2024-09-08 19:48:12', 0);
INSERT INTO `question` VALUES (4, '【两数之除】A / B', '【两数之除】A / B\n\n测试样例保证A大于B', '[\"easy\"]', '', 0, 0, '[{\"input\":\"6 2\",\"output\":\"3\"},{\"input\":\"8 4\",\"output\":\"2\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-08-10 06:51:26', '2024-09-08 19:48:00', 0);
INSERT INTO `question` VALUES (5, '【两数之积】A × B', '请输出a*b\n## 示例输入\n2 3\n\n## 示例输出\n6', '[\"简单\",\"乘法\"]', '', 0, 0, '[{\"input\":\"2 3\",\"output\":\"6\"},{\"input\":\"3 4\",\"output\":\"12\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-06 22:08:20', '2024-09-08 19:46:45', 0);
INSERT INTO `question` VALUES (6, '-----分割线-----欢迎修改下面题目或自定义题目，但请不要改动上面试用题目，谢谢！', '111', '[\"公告\"]', '11', 0, 0, '[{\"input\":\"1\",\"output\":\"1\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-06 22:44:56', '2024-09-08 19:49:57', 0);
INSERT INTO `question` VALUES (7, '11122', '222', '[]', '2', 0, 0, '[{\"input\":\"2\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-06 22:46:58', '2024-09-07 00:22:39', 0);
INSERT INTO `question` VALUES (8, '1', '1', '[\"1\"]', '', 0, 0, '[{\"input\":\"1\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-06 22:52:32', '2024-09-07 00:22:39', 0);
INSERT INTO `question` VALUES (9, '555', '5', '[\"55\"]', '', 0, 0, '[{\"input\":\"\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-07 00:19:29', '2024-09-07 00:19:29', 0);
INSERT INTO `question` VALUES (10, '7777', '77', '[\"7\"]', '7', 0, 0, '[{\"input\":\"\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-07 00:19:49', '2024-09-07 00:19:49', 0);
INSERT INTO `question` VALUES (11, 'aaaa', 'aaaa', '[]', '', 0, 0, '[{\"input\":\"\",\"output\":\"\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1822041828647587841, '2024-09-07 00:31:29', '2024-09-07 00:31:29', 0);

-- ----------------------------
-- Table structure for question_submit
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编程语言',
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `judgeInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题信息（json 对象）',
  `status` int NOT NULL DEFAULT 0 COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint NOT NULL COMMENT '题目 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionId`(`questionId` ASC) USING BTREE,
  INDEX `idx_userId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1832502111702556674 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目提交' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES (1822048827951108098, 'java', 'aabb', '{}', 0, 1, 1822041828647587841, '2024-08-10 07:14:29', '2024-08-10 07:14:29', 0);
INSERT INTO `question_submit` VALUES (1822687610350424066, 'java', 'public class', '{}', 0, 1822043014301831169, 1822041828647587841, '2024-08-12 01:32:45', '2024-08-12 01:32:45', 0);
INSERT INTO `question_submit` VALUES (1822688807429951490, 'java', 'java code', '{}', 0, 1822043014301831169, 1822041828647587841, '2024-08-12 01:37:30', '2024-08-12 01:37:30', 0);
INSERT INTO `question_submit` VALUES (1822689046765326337, 'java', 'java code2', '{}', 0, 1822043014301831169, 1822041828647587841, '2024-08-12 01:38:27', '2024-08-12 01:38:27', 0);
INSERT INTO `question_submit` VALUES (1822689882979520513, 'java', 'java code2', '{}', 0, 1822043014301831169, 1822041828647587841, '2024-08-12 01:41:46', '2024-08-12 01:41:46', 0);
INSERT INTO `question_submit` VALUES (1822690637169905666, 'java', 'code test', '{}', 0, 1, 1822041828647587841, '2024-08-12 01:44:46', '2024-08-12 01:44:46', 0);
INSERT INTO `question_submit` VALUES (1822692908616212482, 'java', 'code test', '{}', 0, 1, 1822041828647587841, '2024-08-12 01:53:48', '2024-08-12 01:53:48', 0);
INSERT INTO `question_submit` VALUES (1822693175902429185, 'java', 'test', '{}', 0, 1, 1822041828647587841, '2024-08-12 01:54:51', '2024-08-12 01:54:51', 0);
INSERT INTO `question_submit` VALUES (1822696479738912770, 'java', 'test', '{}', 0, 1822043014301831169, 1822041828647587841, '2024-08-12 02:07:59', '2024-08-12 02:07:59', 0);
INSERT INTO `question_submit` VALUES (1822698295247540226, 'java', 'test222', '{}', 1, 1822043014301831169, 1822041828647587841, '2024-08-12 02:15:12', '2024-08-12 02:15:12', 0);
INSERT INTO `question_submit` VALUES (1822698659212464130, 'java', 'code11', '{}', 1, 1822043014301831169, 1822041828647587841, '2024-08-12 02:16:39', '2024-08-12 02:16:39', 0);
INSERT INTO `question_submit` VALUES (1822698829492817922, 'java', 'code11', '{}', 1, 1822043014301831169, 1822041828647587841, '2024-08-12 02:17:19', '2024-08-12 02:17:19', 0);
INSERT INTO `question_submit` VALUES (1822698905577492481, 'java', 'ssss', '{\"message\":\"Accepted\",\"memory\":100,\"time\":100}', 2, 1822043014301831169, 1822041828647587841, '2024-08-12 02:17:38', '2024-08-12 02:17:38', 0);
INSERT INTO `question_submit` VALUES (1822716786541416449, 'cpp', 'a', '{\"message\":\"内存溢出\",\"memory\":100,\"time\":100}', 2, 1, 1822041828647587841, '2024-08-12 03:28:41', '2024-08-12 03:28:41', 0);
INSERT INTO `question_submit` VALUES (1822716857542594561, 'go', 'aaa', '{\"message\":\"内存溢出\",\"memory\":100,\"time\":100}', 2, 1, 1822041828647587841, '2024-08-12 03:28:58', '2024-08-12 03:28:58', 0);
INSERT INTO `question_submit` VALUES (1822719809124651010, 'cpp', '111', '{\"message\":\"Accepted\",\"memory\":100,\"time\":100}', 2, 1822043014301831169, 1822041828647587841, '2024-08-12 03:40:41', '2024-08-12 03:40:42', 0);
INSERT INTO `question_submit` VALUES (1823103579262607362, 'java', '11111', '{\"message\":\"Accepted\",\"memory\":100,\"time\":100}', 2, 1822043014301831169, 1822041828647587841, '2024-08-13 05:05:40', '2024-08-13 05:05:41', 0);
INSERT INTO `question_submit` VALUES (1825427988699525121, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:02:02', '2024-08-19 15:02:04', 0);
INSERT INTO `question_submit` VALUES (1825429434417389569, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:07:47', '2024-08-19 15:09:11', 0);
INSERT INTO `question_submit` VALUES (1825429805315497986, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:09:15', '2024-08-19 15:11:06', 0);
INSERT INTO `question_submit` VALUES (1825430279183769601, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:11:08', '2024-08-19 15:14:22', 0);
INSERT INTO `question_submit` VALUES (1825431108343144450, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:14:26', '2024-08-19 15:16:11', 0);
INSERT INTO `question_submit` VALUES (1825431567216779266, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:16:15', '2024-08-19 15:16:16', 0);
INSERT INTO `question_submit` VALUES (1825432025436102658, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":0}', 2, 1, 1822041828647587841, '2024-08-19 15:18:04', '2024-08-19 15:21:28', 0);
INSERT INTO `question_submit` VALUES (1825432505348366338, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"超时\",\"memory\":0,\"time\":6521}', 2, 1, 1822041828647587841, '2024-08-19 15:19:59', '2024-08-19 15:21:35', 0);
INSERT INTO `question_submit` VALUES (1825432567608614914, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"超时\",\"memory\":0,\"time\":6519}', 2, 1, 1822041828647587841, '2024-08-19 15:20:14', '2024-08-19 15:21:35', 0);
INSERT INTO `question_submit` VALUES (1825432636772687874, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":143}', 2, 1, 1822041828647587841, '2024-08-19 15:20:30', '2024-08-19 15:21:35', 0);
INSERT INTO `question_submit` VALUES (1825433729233690626, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":136}', 2, 1, 1822041828647587841, '2024-08-19 15:24:51', '2024-08-19 15:24:52', 0);
INSERT INTO `question_submit` VALUES (1825433895160356866, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":132}', 2, 1, 1822041828647587841, '2024-08-19 15:25:30', '2024-08-19 15:25:31', 0);
INSERT INTO `question_submit` VALUES (1825434480009912322, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":157}', 2, 1, 1822041828647587841, '2024-08-19 15:27:50', '2024-08-19 15:27:51', 0);
INSERT INTO `question_submit` VALUES (1825434786512871426, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":136}', 2, 1, 1822041828647587841, '2024-08-19 15:29:03', '2024-08-19 15:30:15', 0);
INSERT INTO `question_submit` VALUES (1825435230186348546, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":137}', 2, 1, 1822041828647587841, '2024-08-19 15:30:48', '2024-08-19 15:30:50', 0);
INSERT INTO `question_submit` VALUES (1825435272334909441, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":144}', 2, 1, 1822041828647587841, '2024-08-19 15:30:59', '2024-08-19 15:31:00', 0);
INSERT INTO `question_submit` VALUES (1831717124163825665, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(\"结果为\" + (a + b));\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-05 23:32:49', '2024-09-05 23:32:50', 0);
INSERT INTO `question_submit` VALUES (1831717641434755073, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a + b));\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-05 23:34:53', '2024-09-05 23:34:53', 0);
INSERT INTO `question_submit` VALUES (1831718993934217217, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":142}', 2, 1, 1822041828647587841, '2024-09-05 23:40:15', '2024-09-05 23:40:16', 0);
INSERT INTO `question_submit` VALUES (1832061533904543745, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":127}', 2, 1, 1822041828647587841, '2024-09-06 22:21:23', '2024-09-06 22:21:26', 0);
INSERT INTO `question_submit` VALUES (1832095095571623938, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println((a + b));\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":109}', 2, 1, 1822041828647587841, '2024-09-07 00:34:45', '2024-09-07 00:34:47', 0);
INSERT INTO `question_submit` VALUES (1832412377294774273, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-07 21:35:29', '2024-09-07 21:35:30', 0);
INSERT INTO `question_submit` VALUES (1832412943626477569, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-07 21:37:45', '2024-09-07 21:37:45', 0);
INSERT INTO `question_submit` VALUES (1832439470711840770, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":157}', 2, 1, 1822041828647587841, '2024-09-07 23:23:09', '2024-09-07 23:23:26', 0);
INSERT INTO `question_submit` VALUES (1832446839537737730, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-07 23:52:26', '2024-09-07 23:52:26', 0);
INSERT INTO `question_submit` VALUES (1832450338417745922, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":189}', 2, 1, 1822041828647587841, '2024-09-08 00:06:20', '2024-09-08 00:06:23', 0);
INSERT INTO `question_submit` VALUES (1832457125497872385, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":170}', 2, 1, 1822041828647587841, '2024-09-08 00:33:18', '2024-09-08 00:33:21', 0);
INSERT INTO `question_submit` VALUES (1832457338291691522, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":202}', 2, 1, 1822041828647587841, '2024-09-08 00:34:09', '2024-09-08 00:34:12', 0);
INSERT INTO `question_submit` VALUES (1832476415114551298, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":163}', 2, 1, 1822041828647587841, '2024-09-08 01:49:57', '2024-09-08 01:50:00', 0);
INSERT INTO `question_submit` VALUES (1832483102600929281, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Wrong Answer\",\"memory\":0,\"time\":121}', 2, 1, 1822041828647587841, '2024-09-08 02:16:32', '2024-09-08 02:16:33', 0);
INSERT INTO `question_submit` VALUES (1832486764580642817, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"内存溢出\",\"memory\":135168,\"time\":144}', 2, 1, 1822041828647587841, '2024-09-08 02:31:05', '2024-09-08 02:31:07', 0);
INSERT INTO `question_submit` VALUES (1832487913597640706, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":138}', 2, 1, 1822041828647587841, '2024-09-08 02:35:39', '2024-09-08 02:35:41', 0);
INSERT INTO `question_submit` VALUES (1832490555770085378, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":132,\"time\":151}', 2, 1, 1822041828647587841, '2024-09-08 02:46:09', '2024-09-08 02:46:11', 0);
INSERT INTO `question_submit` VALUES (1832491318848200705, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":134}', 2, 1, 1822041828647587841, '2024-09-08 02:49:11', '2024-09-08 02:49:13', 0);
INSERT INTO `question_submit` VALUES (1832491543310573569, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":468,\"time\":141}', 2, 1, 1822041828647587841, '2024-09-08 02:50:04', '2024-09-08 02:50:07', 0);
INSERT INTO `question_submit` VALUES (1832491779563134977, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"内存溢出\",\"memory\":6292,\"time\":121}', 2, 1, 1822041828647587841, '2024-09-08 02:51:00', '2024-09-08 02:51:02', 0);
INSERT INTO `question_submit` VALUES (1832491890921906178, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":135}', 2, 1, 1822041828647587841, '2024-09-08 02:51:27', '2024-09-08 02:51:28', 0);
INSERT INTO `question_submit` VALUES (1832491925017403393, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":106}', 2, 1, 1822041828647587841, '2024-09-08 02:51:35', '2024-09-08 02:51:36', 0);
INSERT INTO `question_submit` VALUES (1832491944869044225, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":128,\"time\":115}', 2, 1, 1822041828647587841, '2024-09-08 02:51:40', '2024-09-08 02:51:41', 0);
INSERT INTO `question_submit` VALUES (1832491964980731905, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"内存溢出\",\"memory\":5404,\"time\":110}', 2, 1, 1822041828647587841, '2024-09-08 02:51:45', '2024-09-08 02:51:46', 0);
INSERT INTO `question_submit` VALUES (1832491984010289154, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":104}', 2, 1, 1822041828647587841, '2024-09-08 02:51:49', '2024-09-08 02:51:50', 0);
INSERT INTO `question_submit` VALUES (1832491999059451906, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":107}', 2, 1, 1822041828647587841, '2024-09-08 02:51:53', '2024-09-08 02:51:54', 0);
INSERT INTO `question_submit` VALUES (1832493251566706690, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{}', 1, 1, 1822041828647587841, '2024-09-08 02:56:51', '2024-09-08 02:56:51', 0);
INSERT INTO `question_submit` VALUES (1832496881430634497, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":139}', 2, 1, 1822041828647587841, '2024-09-08 03:11:17', '2024-09-08 03:11:19', 0);
INSERT INTO `question_submit` VALUES (1832496955535597569, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":109}', 2, 1, 1822041828647587841, '2024-09-08 03:11:35', '2024-09-08 03:11:36', 0);
INSERT INTO `question_submit` VALUES (1832497040067600386, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":109}', 2, 1, 1822041828647587841, '2024-09-08 03:11:55', '2024-09-08 03:11:56', 0);
INSERT INTO `question_submit` VALUES (1832500225905729538, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":388,\"time\":138}', 2, 1, 1822041828647587841, '2024-09-08 03:24:34', '2024-09-08 03:24:37', 0);
INSERT INTO `question_submit` VALUES (1832500263700602882, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"内存溢出\",\"memory\":7068,\"time\":158}', 2, 1, 1822041828647587841, '2024-09-08 03:24:43', '2024-09-08 03:24:44', 0);
INSERT INTO `question_submit` VALUES (1832500423176429569, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":0,\"time\":120}', 2, 1, 1822041828647587841, '2024-09-08 03:25:21', '2024-09-08 03:25:22', 0);
INSERT INTO `question_submit` VALUES (1832501433940779009, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":131}', 2, 1, 1822041828647587841, '2024-09-08 03:29:22', '2024-09-08 03:29:35', 0);
INSERT INTO `question_submit` VALUES (1832501543454056450, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":114}', 2, 1, 1822041828647587841, '2024-09-08 03:29:48', '2024-09-08 03:29:59', 0);
INSERT INTO `question_submit` VALUES (1832501663595700226, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":133}', 2, 1, 1822041828647587841, '2024-09-08 03:30:17', '2024-09-08 03:30:28', 0);
INSERT INTO `question_submit` VALUES (1832502111702556673, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":136,\"time\":153}', 2, 1, 1822041828647587841, '2024-09-08 03:32:04', '2024-09-08 03:32:16', 0);
INSERT INTO `question_submit` VALUES (1832512132905639937, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":156,\"time\":128}', 2, 1, 1822041828647587841, '2024-09-08 04:11:53', '2024-09-08 04:12:05', 0);
INSERT INTO `question_submit` VALUES (1832654143658860546, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a * b);\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":428,\"time\":121}', 2, 5, 1822041828647587841, '2024-09-08 13:36:11', '2024-09-08 13:36:22', 0);
INSERT INTO `question_submit` VALUES (1832746457035120641, 'java', 'public class Main {\r\n    public static void main(String[] args) {\r\n        System.out.println(\"Hello,World!\");\r\n    }\r\n}', '{\"message\":\"Accepted\",\"memory\":596,\"time\":110}', 2, 2, 1822041828647587841, '2024-09-08 19:43:00', '2024-09-08 19:43:11', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1823081987593789443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1822041828647587841, 'admin', 'dd802604f40e1d8dfafb538cafdfb107', NULL, NULL, 'Admin', NULL, NULL, 'admin', '2024-08-10 06:46:40', '2024-08-13 03:41:25', 0);
INSERT INTO `user` VALUES (1823081987593789442, 'user', 'dd802604f40e1d8dfafb538cafdfb107', NULL, NULL, 'User', NULL, NULL, 'user', '2024-08-13 03:39:52', '2024-08-13 03:41:25', 0);

SET FOREIGN_KEY_CHECKS = 1;
