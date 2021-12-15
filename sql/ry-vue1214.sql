/*
 Navicat Premium Data Transfer

 Source Server         : mysql57
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 14/12/2021 14:53:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_fangan
-- ----------------------------
DROP TABLE IF EXISTS `c_fangan`;
CREATE TABLE `c_fangan`  (
  `id` int(19) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `goal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培养目标',
  `charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培养方案_测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_fangan
-- ----------------------------
INSERT INTO `c_fangan` VALUES (1, '2017', '计算机科学与技术', 'yzl', '', NULL, '', NULL);
INSERT INTO `c_fangan` VALUES (2, '2020', '哈和', NULL, '', NULL, '', NULL);

-- ----------------------------
-- Table structure for c_gj_teacher
-- ----------------------------
DROP TABLE IF EXISTS `c_gj_teacher`;
CREATE TABLE `c_gj_teacher`  (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工号',
  `teacher_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `degree_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历（ 1博士研究生 2硕士研究生 3大学本科）',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_gj_teacher
-- ----------------------------
INSERT INTO `c_gj_teacher` VALUES (10001, '1', '3');
INSERT INTO `c_gj_teacher` VALUES (10002, '2', '3');
INSERT INTO `c_gj_teacher` VALUES (10003, '3', '3');
INSERT INTO `c_gj_teacher` VALUES (10004, '4', '2');
INSERT INTO `c_gj_teacher` VALUES (10005, '5', '2');
INSERT INTO `c_gj_teacher` VALUES (10006, '6', '1');
INSERT INTO `c_gj_teacher` VALUES (10007, '7', '1');
INSERT INTO `c_gj_teacher` VALUES (10008, '8', '3');
INSERT INTO `c_gj_teacher` VALUES (10009, '9', '3');
INSERT INTO `c_gj_teacher` VALUES (10010, '张老师', '1');
INSERT INTO `c_gj_teacher` VALUES (10011, '李老师', '2');
INSERT INTO `c_gj_teacher` VALUES (10012, '田老师', '3');

-- ----------------------------
-- Table structure for c_py_byyq
-- ----------------------------
DROP TABLE IF EXISTS `c_py_byyq`;
CREATE TABLE `c_py_byyq`  (
  `byyq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '毕业要求id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父要求id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `byyq_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '毕业要求名称',
  `byyq_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业要求内容',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `pyfa_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '培养方案版本号（0-2017  1-2020）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`byyq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '毕业要求' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_py_byyq
-- ----------------------------
INSERT INTO `c_py_byyq` VALUES (100, 0, '0', '毕业要求', NULL, 0, '0', '1', '', NULL, '', '2021-11-30 18:27:35');
INSERT INTO `c_py_byyq` VALUES (101, 100, '0,100', '毕业要求1', '工程知识', 1, '0', '1', '', '2021-11-27 20:34:40', '', '2021-11-27 23:00:28');
INSERT INTO `c_py_byyq` VALUES (102, 100, '0,100', '毕业要求2', '问题分析', 2, '0', '1', '', '2021-11-28 09:30:28', '', '2021-11-28 10:06:49');
INSERT INTO `c_py_byyq` VALUES (103, 101, '0,100,101', '指标点1.1', '具备运用数学知识、自然科学基础知识解决复杂软件工程问题的能力', 1, '0', '1', '', '2021-11-28 10:12:34', '', NULL);
INSERT INTO `c_py_byyq` VALUES (105, 101, '0,100,101', '指标点1.2', '掌握计算机系统基础知识和基本工作原理', 2, '0', '1', '', '2021-12-01 09:07:21', '', NULL);

-- ----------------------------
-- Table structure for c_py_goal
-- ----------------------------
DROP TABLE IF EXISTS `c_py_goal`;
CREATE TABLE `c_py_goal`  (
  `goal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '培养目标id',
  `pyfa_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '培养方案版本号（0-2017  1-2018）',
  `describe1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `goal1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标点1',
  `goal2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标点2',
  `goal3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标点3',
  `goal4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标点4',
  `goal5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标点5',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培养目标' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_py_goal
-- ----------------------------
INSERT INTO `c_py_goal` VALUES (5, '1', '哈哈哈', '啊', '', '', '', '', '', NULL, '', '2021-12-01 10:52:23');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'c_fangan', '培养方案', NULL, NULL, 'CFangan', 'crud', 'com.ruoyi.system', 'system', 'fangan', '培养方案', 'ruoyi', '0', '/', NULL, 'admin', '2021-10-31 16:47:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'c_py_goal', '培养目标表', '', '', 'CPyGoal', 'crud', 'com.ruoyi.pyfa', 'system', 'goal', '培养目标表', 'ruoyi', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2021-11-11 14:12:51', '', '2021-11-11 14:20:51', NULL);
INSERT INTO `gen_table` VALUES (4, 'c_py_byyq', '毕业要求', '', '', 'CPyByyq', 'tree', 'com.ruoyi.pyfa', 'pyfa', 'byyq', '毕业要求', 'ruoyi', '0', '/', '{\"treeCode\":\"byyq_id\",\"treeName\":\"byyq_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"2000\"}', 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42', NULL);
INSERT INTO `gen_table` VALUES (5, 'c_gj_teacher', '教师信息', NULL, NULL, 'CGjTeacher', 'crud', 'com.ruoyi.drdc', 'drdc', 'teacherInfo', '教师信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2033\"}', 'admin', '2021-12-05 20:44:41', '', '2021-12-09 20:47:27', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (4, '2', 'id', 'id', 'char(19)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-31 16:47:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '2', 'year', '年份', 'varchar(255)', 'String', 'year', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-31 16:47:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'goal', '培养目标', 'varchar(255)', 'String', 'goal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-11-08 11:14:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '3', 'goal_id', '培养目标id', 'int(11)', 'Long', 'goalId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (11, '3', 'pyfa_id', '培养方案id', 'int(255)', 'Long', 'pyfaId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (12, '3', 'describe', '描述信息', 'varchar(255)', 'String', 'describe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (13, '3', 'goal1', '指标点1', 'varchar(255)', 'String', 'goal1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (14, '3', 'goal2', '指标点2', 'varchar(255)', 'String', 'goal2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (15, '3', 'goal3', '指标点3', 'varchar(255)', 'String', 'goal3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (16, '3', 'goal4', '指标点4', 'varchar(255)', 'String', 'goal4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (17, '3', 'goal5', '指标点5', 'varchar(255)', 'String', 'goal5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-11-11 14:12:52', '', '2021-11-11 14:20:51');
INSERT INTO `gen_table_column` VALUES (18, '2', 'charge', '负责人', 'varchar(255)', 'String', 'charge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2021-11-26 16:37:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, '', '2021-11-26 16:37:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, '', '2021-11-26 16:37:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, '', '2021-11-26 16:37:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, '', '2021-11-26 16:37:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '4', 'byyq_id', '毕业要求id', 'bigint(20)', 'Long', 'byyqId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (24, '4', 'parent_id', '父要求id', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (25, '4', 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (26, '4', 'byyq_name', '毕业要求名称', 'varchar(30)', 'String', 'byyqName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (27, '4', 'byyq_content', '毕业要求内容', 'varchar(255)', 'String', 'byyqContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (28, '4', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (29, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (30, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (31, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (32, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (33, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-11-27 16:35:58', '', '2021-11-27 19:33:42');
INSERT INTO `gen_table_column` VALUES (34, '5', 'teacher_id', '工号', 'bigint(20)', 'Long', 'teacherId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-05 20:44:42', '', '2021-12-09 20:47:27');
INSERT INTO `gen_table_column` VALUES (35, '5', 'teacher_name', '姓名', 'varchar(30)', 'String', 'teacherName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-12-05 20:44:42', '', '2021-12-09 20:47:27');
INSERT INTO `gen_table_column` VALUES (36, '5', 'degree_id', '学历', 'bigint(20)', 'Long', 'degreeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'c_gj_degree', 3, 'admin', '2021-12-05 20:44:42', '', '2021-12-09 20:47:27');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CA1102BA078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CA1102BA078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CA1102BA078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-MJN98BV21639464702467', 1639464720681, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1639464710000, -1, 5, 'PAUSED', 'CRON', 1639464702000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1639464705000, -1, 5, 'PAUSED', 'CRON', 1639464703000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1639464720000, -1, 5, 'PAUSED', 'CRON', 1639464703000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-10-21 12:16:03', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-10-21 12:16:03', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-10-21 12:16:03', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2021-10-21 12:16:03', 'admin', '2021-11-07 21:39:01', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-10-21 12:16:03', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表-院系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '西安工程大学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', 'admin', '2021-10-31 20:25:18');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '计算机科学学院', 1, '若依', '15888888889', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', 'admin', '2021-11-27 16:04:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '理学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件工程', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', 'admin', '2021-11-28 10:02:55');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '计算机科学与技术', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '网络工程', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '数字媒体技术', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '数据科学与大数据技术', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '信息与计算科学', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '数学与应用数学', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-21 12:15:56', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-10-21 12:16:03', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '2017版', '0', 'xpu_pyfa_version', NULL, 'default', 'N', '0', 'admin', '2021-11-19 21:18:10', 'admin', '2021-11-23 11:25:19', '2017版培养方案');
INSERT INTO `sys_dict_data` VALUES (30, 2, '2020版', '1', 'xpu_pyfa_version', NULL, 'default', 'N', '0', 'admin', '2021-11-19 21:18:47', 'admin', '2021-11-23 11:24:59', '2018版培养方案');
INSERT INTO `sys_dict_data` VALUES (31, 1, '博士研究生', '1', 'c_gj_degree', NULL, 'default', 'N', '0', 'admin', '2021-12-05 22:00:00', 'admin', '2021-12-05 22:02:43', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 2, '硕士研究生', '2', 'c_gj_degree', NULL, 'default', 'N', '0', 'admin', '2021-12-05 22:00:36', 'admin', '2021-12-05 22:02:50', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 3, '大学本科', '3', 'c_gj_degree', NULL, 'default', 'N', '0', 'admin', '2021-12-05 22:00:56', 'admin', '2021-12-05 22:02:55', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-10-21 12:16:02', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '培养方案版本', 'xpu_pyfa_version', '0', 'admin', '2021-11-19 21:15:15', '', NULL, '培养方案版本列表');
INSERT INTO `sys_dict_type` VALUES (12, '教师学历列表', 'c_gj_degree', '0', 'admin', '2021-12-05 21:58:18', 'admin', '2021-12-05 21:58:30', '教师学历列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-10-21 12:16:04', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-10-21 12:16:04', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-10-21 12:16:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:16:10');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-10-21 14:17:16');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:17:22');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:21:03');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-10-21 14:26:06');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:26:14');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:42:27');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:43:35');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 14:50:41');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-21 20:05:46');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:49:24');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 16:17:47');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 17:41:48');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 18:37:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 18:52:04');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 18:52:30');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 20:23:44');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 20:53:17');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-10-31 21:04:29');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:04:38');
INSERT INTO `sys_logininfor` VALUES (120, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 21:06:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:06:47');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 21:07:30');
INSERT INTO `sys_logininfor` VALUES (123, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:07:44');
INSERT INTO `sys_logininfor` VALUES (124, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 21:16:35');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:16:41');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 21:18:04');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:18:12');
INSERT INTO `sys_logininfor` VALUES (128, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-31 21:18:57');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 21:19:02');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-07 20:27:57');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-07 21:36:31');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-08 10:48:57');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-11 10:51:20');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-11 12:31:55');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-11 14:08:52');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-15 13:40:08');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-15 14:57:26');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-15 15:38:37');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 14:59:39');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 16:44:12');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-11-19 16:47:05');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 17:03:09');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-11-19 17:17:59');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 17:18:11');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 20:38:29');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-19 22:56:30');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-20 11:11:33');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-20 12:43:18');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-20 13:37:45');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-20 18:00:45');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-20 20:49:41');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 11:16:30');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 12:40:26');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 14:21:30');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 17:41:34');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-26 14:25:15');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-26 17:09:24');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-27 15:41:30');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-27 19:08:59');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-27 22:19:08');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-27 23:00:15');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-28 09:02:02');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-28 11:19:21');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-30 16:40:19');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-30 17:27:54');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 08:38:20');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 09:32:27');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 10:15:45');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 08:44:05');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 10:55:24');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 13:35:20');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 14:30:29');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 16:32:54');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-02 17:37:49');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-05 09:18:17');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-05 19:56:46');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-05 20:29:27');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-05 21:42:42');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-05 23:47:19');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-06 09:11:26');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-06 11:09:32');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-06 11:58:18');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-06 18:48:24');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 10:48:34');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 13:19:02');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 14:08:07');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 15:57:19');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 16:45:42');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 19:35:22');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-09 15:31:32');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-09 16:33:51');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-09 17:26:24');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-09 20:40:15');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-10 09:07:48');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-10 11:47:17');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-14 09:53:14');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-14 11:43:20');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-14 14:21:32');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-14 14:32:23');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-14 14:32:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2040 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 3, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-10-21 12:15:58', 'admin', '2021-12-05 10:15:52', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-10-21 12:15:58', 'admin', '2021-10-31 20:41:21', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 5, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-10-21 12:15:58', 'admin', '2021-12-05 10:16:05', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-10-21 12:15:58', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-10-21 12:15:58', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-10-21 12:15:58', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-10-21 12:15:58', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-10-21 12:15:58', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-10-21 12:15:58', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-10-21 12:15:58', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-10-21 12:15:58', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-10-21 12:15:58', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-10-21 12:15:58', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-10-21 12:15:58', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-10-21 12:15:58', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-10-21 12:15:58', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-10-21 12:15:58', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-10-21 12:15:58', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-10-21 12:15:58', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-10-21 12:15:58', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-10-21 12:15:58', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-10-21 12:15:58', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-10-21 12:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '培养方案', 0, 1, 'pyfa', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2021-10-31 16:24:29', 'admin', '2021-11-19 21:07:41', '');
INSERT INTO `sys_menu` VALUES (2001, '测试_培养方案2017', 2000, 50, 'fangan', 'pyfa/fangan/index', NULL, 1, 0, 'M', '0', '0', 'pyfa:fangan:list', '#', 'admin', '2021-10-31 16:48:59', 'admin', '2021-11-28 12:37:51', '培养方案菜单');
INSERT INTO `sys_menu` VALUES (2002, '培养方案查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:fangan:query', '#', 'admin', '2021-10-31 16:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '培养方案新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:fangan:add', '#', 'admin', '2021-10-31 16:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '培养方案修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:fangan:edit', '#', 'admin', '2021-10-31 16:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '培养方案删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:fangan:remove', '#', 'admin', '2021-10-31 16:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '培养方案导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:fangan:export', '#', 'admin', '2021-10-31 16:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '培养目标', 2000, 1, 'goal', 'pyfa/goal/index', NULL, 1, 0, 'C', '0', '0', 'pyfa:goal:list', '#', 'admin', '2021-11-11 16:07:08', 'admin', '2021-11-26 14:56:34', '培养目标表菜单');
INSERT INTO `sys_menu` VALUES (2015, '培养目标表查询', 2014, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:goal:query', '#', 'admin', '2021-11-11 16:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '培养目标表新增', 2014, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:goal:add', '#', 'admin', '2021-11-11 16:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '培养目标表修改', 2014, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:goal:edit', '#', 'admin', '2021-11-11 16:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '培养目标表删除', 2014, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:goal:remove', '#', 'admin', '2021-11-11 16:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '培养目标表导出', 2014, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:goal:export', '#', 'admin', '2021-11-11 16:07:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '毕业要求', 2000, 2, 'byyq', 'pyfa/byyq/index', NULL, 1, 0, 'C', '0', '0', 'pyfa:byyq:list', '#', 'admin', '2021-11-27 17:00:03', 'admin', '2021-11-28 12:37:59', '毕业要求菜单');
INSERT INTO `sys_menu` VALUES (2021, '毕业要求查询', 2020, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:byyq:query', '#', 'admin', '2021-11-27 17:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '毕业要求新增', 2020, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:byyq:add', '#', 'admin', '2021-11-27 17:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '毕业要求修改', 2020, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:byyq:edit', '#', 'admin', '2021-11-27 17:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '毕业要求删除', 2020, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:byyq:remove', '#', 'admin', '2021-11-27 17:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '毕业要求导出', 2020, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'pyfa:byyq:export', '#', 'admin', '2021-11-27 17:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '高教信息', 0, 2, 'drdc', NULL, NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2021-12-05 10:15:10', 'admin', '2021-12-14 14:43:51', '');
INSERT INTO `sys_menu` VALUES (2034, '教师信息', 2033, 1, 'teacherInfo', 'drdc/teacherInfo/index', NULL, 1, 0, 'C', '0', '0', 'drdc:teacherInfo:list', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '教师信息菜单');
INSERT INTO `sys_menu` VALUES (2035, '教师信息查询', 2034, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drdc:teacherInfo:query', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '教师信息新增', 2034, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drdc:teacherInfo:add', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '教师信息修改', 2034, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drdc:teacherInfo:edit', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '教师信息删除', 2034, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drdc:teacherInfo:remove', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '教师信息导出', 2034, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drdc:teacherInfo:export', '#', 'admin', '2021-12-05 20:54:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2021-10-01 新版本发布啦', '2', 0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 'admin', '2021-10-21 12:16:05', 'admin', '2021-12-02 13:41:38', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2020-11-01 系统凌晨维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2021-10-21 12:16:05', 'admin', '2021-12-02 13:41:49', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 338 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1634789756000,\"remark\":\"hello\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1634789756000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-21 14:54:07');
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1634789756000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1634789756000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-21 14:54:21');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666999\",\"admin\":false,\"loginDate\":1634789756000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1634789756000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-21 14:54:44');
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666333\",\"admin\":false,\"loginDate\":1634789756000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1634789756000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-21 14:55:41');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"培养方案\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pyfa\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 16:24:29');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'c_fangan', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 16:34:20');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-31 16:35:27');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 16:47:26');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'c_fangan', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 16:47:32');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-31 16:47:34');
INSERT INTO `sys_oper_log` VALUES (110, '培养方案', 1, 'com.ruoyi.pyfa.controller.CFanganController.add()', 'POST', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"计算机科学与技术\",\"year\":\"2021\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CFanganMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CFanganMapper.insertCFangan-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_fangan          ( year,             goal )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2021-10-31 19:18:42');
INSERT INTO `sys_oper_log` VALUES (111, '培养方案', 1, 'com.ruoyi.pyfa.controller.CFanganController.add()', 'POST', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"计算机科学与技术\",\"year\":\"2021\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 19:22:53');
INSERT INTO `sys_oper_log` VALUES (112, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"计算机科学与技术\",\"year\":\"2019\",\"id\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 19:25:32');
INSERT INTO `sys_oper_log` VALUES (113, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"计算机科学与技术\",\"year\":\"2018\",\"id\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 19:25:41');
INSERT INTO `sys_oper_log` VALUES (114, '培养方案', 1, 'com.ruoyi.pyfa.controller.CFanganController.add()', 'POST', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"计算机科学与技术\",\"year\":\"2018\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 19:26:01');
INSERT INTO `sys_oper_log` VALUES (115, '培养方案', 3, 'com.ruoyi.pyfa.controller.CFanganController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/fangan/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 19:26:23');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"西安工程大学\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 20:25:18');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"计算机科学学院\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 20:25:51');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"培养方案菜单\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pyfa\",\"children\":[],\"createTime\":1635668669000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 20:40:45');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":\"4\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 20:41:21');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 20:41:30');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-31 20:45:55');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1634789757000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,3,114,115,1055,1056,1058,1057,1059,1060,116,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 21:17:16');
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaOnOff\",\"createBy\":\"admin\",\"createTime\":1634789763000,\"updateBy\":\"admin\",\"configId\":4,\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"configType\":\"Y\",\"configValue\":\"false\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-07 21:39:01');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"2021\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-07 22:02:33');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-07 22:14:04');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/c_fangan', '127.0.0.1', '内网IP', '{tableName=c_fangan}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-08 11:11:38');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/c_fangan', '127.0.0.1', '内网IP', '{tableName=c_fangan}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-08 11:11:46');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/c_fangan', '127.0.0.1', '内网IP', '{tableName=c_fangan}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-08 11:14:42');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'c_py_goal', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 14:12:52');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"GoalId\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"goalId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"培养目标id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1636611172000,\"tableId\":3,\"pk\":true,\"columnName\":\"goal_id\"},{\"capJavaField\":\"PyfaId\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pyfaId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"培养方案id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1636611172000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"pyfa_id\"},{\"capJavaField\":\"Describe\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"describe\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"描述信息\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1636611172000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"describe\"},{\"capJavaField\":\"Goal1\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"goal1\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指标点1\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"ad', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 14:20:51');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-11 14:21:53');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"0\",\"menuName\":\"一、培养目标\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"pyfa/goal/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 14:47:34');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 14:52:04');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"0\",\"menuName\":\"一、培养目标\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"pyfa/goal/index\",\"children\":[],\"createTime\":1636613254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 14:54:28');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"一、培养目标\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"pyfa/goal/index\",\"children\":[],\"createTime\":1636613254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 15:55:14');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 15:56:02');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"一、培养目标\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"goal\",\"component\":\"pyfa/goal/index\",\"children\":[],\"createTime\":1636618028000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"pyfa:goal:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 16:10:02');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 16:10:20');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 16:10:46');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"一、培养目标\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"goal\",\"component\":\"pyfa/goal/index\",\"children\":[],\"createTime\":1636618028000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"pyfa:goal:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-11 16:13:21');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 13:40:37');
INSERT INTO `sys_oper_log` VALUES (142, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"掌握从事计算机软件领域工作所需要的专业理论知识和工程方法，具备中、小规模软件系统的分析、设计和实现能力；\",\"goal1\":\"具备软件工程专业工作所需要的数学、自然科学和社会科学基础理论素养，并能在工作中应用的能力；\",\"pyfaId\":2017,\"params\":{},\"describe\":\"本专业培养掌握扎实的软件工程理论知识和开发技术,受到规范的软件开发实践训练，具备良好的软件设计与实现能力、项目管理能力、组织协调能力，具有良好的人文科学素养、职业操守、社会责任感和团队合作精神，能在计算机软件领域从事相关科学研究、应用开发、工程项目管理等工作，也可在国内外高等院校、科研院所继续深造、或在政府部门与企业从事管理工作的高级应用型专门人才。本专业毕业生毕业后五年左右能够达到以下目标：\",\"goal5\":\"了解与软件工程相关的职业和行业的方针、政策、法律、法规，了解经济和管理科学的基础知识，熟悉和遵守软件行业标准和流程规范，了解本专业的前沿和发展趋势，具备分析解决纺织服装行业领域信息技术相关联问题的能力，具有不断学习和适应发展的能力。\",\"goal4\":\"具有良好的人文素养、社会责任感和工程职业道德，能够在多学科背景下的团队中进行有效地表达、交流和沟通，并在团队中发挥作用，表现出良好的协作精神和职业态度；系统地掌握一门外语，具备熟练的外语读写和口语表达的能力；\",\"goal3\":\"熟悉现代软件工程开发技术，具有研究文献检索、资料查询、知识获取、发现问题、分析问题和解决问题的能力，具备自主学习和拓展知识的能力，具备在软件工程专业领域工作的业务素质与能力；\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:43:01');
INSERT INTO `sys_oper_log` VALUES (143, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"掌握从事计算机软件领域工作所需要的专业理论知识和工程方法，具备中、小规模软件系统的分析、设计和实现能力；\",\"goal1\":\"具备软件工程专业工作所需要的数学、自然科学和社会科学基础理论素养，并能在工作中应用的能力；\",\"pyfaId\":1,\"params\":{},\"describe\":\"本专业培养掌握扎实的软件工程理论知识和开发技术,受到规范的软件开发实践训练，具备良好的软件设计与实现能力、项目管理能力、组织协调能力，具有良好的人文科学素养、职业操守、社会责任感和团队合作精神，能在计算机软件领域从事相关科学研究、应用开发、工程项目管理等工作，也可在国内外高等院校、科研院所继续深造、或在政府部门与企业从事管理工作的高级应用型专门人才。本专业毕业生毕业后五年左右能够达到以下目标：\",\"goal5\":\"了解与软件工程相关的职业和行业的方针、政策、法律、法规，了解经济和管理科学的基础知识，熟悉和遵守软件行业标准和流程规范，了解本专业的前沿和发展趋势，具备分析解决纺织服装行业领域信息技术相关联问题的能力，具有不断学习和适应发展的能力。\",\"goal4\":\"具有良好的人文素养、社会责任感和工程职业道德，能够在多学科背景下的团队中进行有效地表达、交流和沟通，并在团队中发挥作用，表现出良好的协作精神和职业态度；系统地掌握一门外语，具备熟练的外语读写和口语表达的能力；\",\"goal3\":\"熟悉现代软件工程开发技术，具有研究文献检索、资料查询、知识获取、发现问题、分析问题和解决问题的能力，具备自主学习和拓展知识的能力，具备在软件工程专业领域工作的业务素质与能力；\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:43:10');
INSERT INTO `sys_oper_log` VALUES (144, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"的\",\"goal1\":\"在\",\"pyfaId\":2017,\"params\":{},\"describe\":\"啊\",\"goal5\":\"怕\",\"goal4\":\"和\",\"goal3\":\"给\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:45:34');
INSERT INTO `sys_oper_log` VALUES (145, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"的\",\"goal1\":\"在\",\"pyfaId\":2017,\"params\":{},\"describe\":\"啊\",\"goal5\":\"怕\",\"goal4\":\"和\",\"goal3\":\"给\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:49:49');
INSERT INTO `sys_oper_log` VALUES (146, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"的\",\"goal1\":\"在\",\"pyfaId\":2017,\"params\":{},\"describe\":\"啊\",\"goal5\":\"怕\",\"goal4\":\"和\",\"goal3\":\"给\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:51:29');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 13:52:29');
INSERT INTO `sys_oper_log` VALUES (148, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"给\",\"goal1\":\"和\",\"pyfaId\":11,\"params\":{},\"describe\":\"了\",\"goal5\":\"你\",\"goal4\":\"的\",\"goal3\":\"发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 13:52:50');
INSERT INTO `sys_oper_log` VALUES (149, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"哦\",\"goal1\":\"哦\",\"pyfaId\":2,\"params\":{},\"describe\":\"了\",\"goal5\":\"哦\",\"goal4\":\"哦\",\"goal3\":\" 哦哦\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe,             goal1,             goal2,             goal3,             goal4,             goal5 )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            goal1,\n            goal2,\n            goal3,\n            g\' at line 3', '2021-11-15 14:57:53');
INSERT INTO `sys_oper_log` VALUES (150, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":2,\"params\":{},\"describe\":\"理论\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe )\' at line 3\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal          ( pyfa_id,             describe )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe )\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe )\' at line 3', '2021-11-15 15:01:47');
INSERT INTO `sys_oper_log` VALUES (151, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":11,\"params\":{},\"describe\":\"了\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:42:13');
INSERT INTO `sys_oper_log` VALUES (152, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/1', '127.0.0.1', '内网IP', '{goalIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:42:21');
INSERT INTO `sys_oper_log` VALUES (153, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"啊\",\"goal1\":\"啊\",\"pyfaId\":11,\"params\":{},\"describe\":\"本专业培养掌握扎实的软件工程理论知识和开发技术,受到规范的软件开发实践训练，具备良好的软件设计与实现能力、项目管理能力、组织协调能力，具有良好的人文科学素养、职业操守、社会责任感和团队合作精神，能在计算机软件领域从事相关科学研究、应用开发、工程项目管理等工作，也可在国内外高等院校、科研院所继续深造、或在政府部门与企业从事管理工作的高级应用型专门人才。本专业毕业生毕业后五年左右能够达到以下目标：\",\"goal5\":\"啊\",\"goal4\":\"啊\",\"goal3\":\"啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:43:12');
INSERT INTO `sys_oper_log` VALUES (154, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"啊\",\"goal1\":\"啊\",\"goalId\":2,\"pyfaId\":11,\"params\":{},\"describe\":\"本专业培养掌握扎实的软件工程理论知识和开发技术,受到规范的软件开发实践训练，具备良好的软件设计与实现能力、项目管理能力、组织协调能力，具有良好的人文科学素养、职业操守、社会责任感和团队合作精神，能在计算机软件领域从事相关科学研究、应用开发、工程项目管理等工作，也可在国内外高等院校、科研院所继续深造、或在政府部门与企业从事管理工作的高级应用型专门人才。本专业毕业生毕业后五年左右能够达到以下目标：\",\"goal5\":\"啊\",\"goal4\":\"啊\",\"goal3\":\"啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:43:49');
INSERT INTO `sys_oper_log` VALUES (155, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/2', '127.0.0.1', '内网IP', '{goalIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:43:59');
INSERT INTO `sys_oper_log` VALUES (156, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:44:08');
INSERT INTO `sys_oper_log` VALUES (157, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/3', '127.0.0.1', '内网IP', '{goalIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-15 15:44:13');
INSERT INTO `sys_oper_log` VALUES (158, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":11,\"params\":{},\"describe\":\"啊\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:00:14');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"培养方案\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pyfa\",\"children\":[],\"createTime\":1635668669000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 15:29:18');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"1\",\"menuName\":\"培养方案\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"pyfa\",\"children\":[],\"createTime\":1635668669000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:07:41');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:07:47');
INSERT INTO `sys_oper_log` VALUES (162, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"培养方案版本\",\"remark\":\"培养方案版本列表\",\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:15:15');
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"2017版培养方案\",\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"dictLabel\":\"2017\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:18:10');
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"dictLabel\":\"2018\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:18:47');
INSERT INTO `sys_oper_log` VALUES (165, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"2018版培养方案\",\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"dictLabel\":\"2018\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1637327927000,\"dictCode\":30,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-19 21:19:27');
INSERT INTO `sys_oper_log` VALUES (166, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal1\":\"在\",\"params\":{},\"describe\":\"哈哈\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-20 20:53:19');
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"2018版培养方案\",\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"dictLabel\":\"2020版\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1637327927000,\"dictCode\":30,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 11:24:59');
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"2017版培养方案\",\"params\":{},\"dictType\":\"xpu_pyfa_version\",\"dictLabel\":\"2017版\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1637327890000,\"dictCode\":29,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 11:25:19');
INSERT INTO `sys_oper_log` VALUES (169, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyGoalMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyGoalMapper.insertCPyGoal-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_goal\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2021-11-23 15:32:30');
INSERT INTO `sys_oper_log` VALUES (170, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal1\":\"j\",\"params\":{},\"describe\":\"j\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:33:06');
INSERT INTO `sys_oper_log` VALUES (171, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/6', '127.0.0.1', '内网IP', '{goalIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:33:16');
INSERT INTO `sys_oper_log` VALUES (172, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"E\",\"goal1\":\"W\",\"pyfaId\":0,\"params\":{},\"describe\":\"Q\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:35:42');
INSERT INTO `sys_oper_log` VALUES (173, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"D\",\"goal1\":\"S\",\"pyfaId\":1,\"params\":{},\"describe\":\"A\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:36:19');
INSERT INTO `sys_oper_log` VALUES (174, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/8', '127.0.0.1', '内网IP', '{goalIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:36:37');
INSERT INTO `sys_oper_log` VALUES (175, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/7', '127.0.0.1', '内网IP', '{goalIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 15:36:40');
INSERT INTO `sys_oper_log` VALUES (176, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/4', '127.0.0.1', '内网IP', '{goalIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:02:28');
INSERT INTO `sys_oper_log` VALUES (177, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"aa\",\"params\":{},\"describe\":\"aa\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:13:45');
INSERT INTO `sys_oper_log` VALUES (178, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"fg\",\"goal1\":\"在\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"哈哈\",\"goal5\":\"d\",\"goal4\":\"d\",\"goal3\":\"f\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:14:17');
INSERT INTO `sys_oper_log` VALUES (179, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"z\",\"goalId\":9,\"pyfaId\":0,\"params\":{},\"describe\":\"aa\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:14:32');
INSERT INTO `sys_oper_log` VALUES (180, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"fg\",\"goal1\":\"在\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"哈哈\",\"goal5\":\"\",\"goal4\":\"d\",\"goal3\":\"f\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:15:19');
INSERT INTO `sys_oper_log` VALUES (181, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"在\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:16:48');
INSERT INTO `sys_oper_log` VALUES (182, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/9', '127.0.0.1', '内网IP', '{goalIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:17:22');
INSERT INTO `sys_oper_log` VALUES (183, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"pyfaId\":0,\"params\":{},\"describe\":\"2017的培养目标\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:22:50');
INSERT INTO `sys_oper_log` VALUES (184, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/10', '127.0.0.1', '内网IP', '{goalIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:23:13');
INSERT INTO `sys_oper_log` VALUES (185, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":0,\"params\":{},\"describe\":\"呵呵呵\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-23 18:55:44');
INSERT INTO `sys_oper_log` VALUES (186, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:30:43');
INSERT INTO `sys_oper_log` VALUES (187, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"啦\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:36:10');
INSERT INTO `sys_oper_log` VALUES (188, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/11', '127.0.0.1', '内网IP', '{goalIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:36:23');
INSERT INTO `sys_oper_log` VALUES (189, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"啦啦啦\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:45:29');
INSERT INTO `sys_oper_log` VALUES (190, '培养目标表', 1, 'com.ruoyi.pyfa.controller.CPyGoalController.add()', 'POST', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"pyfaId\":0,\"params\":{},\"describe\":\"飞机地方\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:46:55');
INSERT INTO `sys_oper_log` VALUES (191, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"啦\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:47:19');
INSERT INTO `sys_oper_log` VALUES (192, '培养目标表', 3, 'com.ruoyi.pyfa.controller.CPyGoalController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/goal/12', '127.0.0.1', '内网IP', '{goalIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:47:43');
INSERT INTO `sys_oper_log` VALUES (193, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:48:13');
INSERT INTO `sys_oper_log` VALUES (194, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:54:43');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"培养目标\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"goal\",\"component\":\"pyfa/goal/index\",\"children\":[],\"createTime\":1636618028000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"pyfa:goal:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 14:56:34');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"毕业要求\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"byyq\",\"component\":\"pyfa/byyq/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 15:19:49');
INSERT INTO `sys_oper_log` VALUES (197, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":1,\"params\":{},\"describe\":\"哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 15:21:08');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/c_fangan', '127.0.0.1', '内网IP', '{tableName=c_fangan}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 16:37:59');
INSERT INTO `sys_oper_log` VALUES (199, '培养方案', 1, 'com.ruoyi.pyfa.controller.CFanganController.add()', 'POST', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"goal\":\"哈哈\",\"year\":\"2020\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 17:17:55');
INSERT INTO `sys_oper_log` VALUES (200, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"goal\":\"哈\",\"updateBy\":\"\",\"year\":\"2020\",\"id\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 17:23:06');
INSERT INTO `sys_oper_log` VALUES (201, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"goal\":\"哈啊\",\"updateBy\":\"\",\"year\":\"2020\",\"id\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 17:48:23');
INSERT INTO `sys_oper_log` VALUES (202, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"goal\":\"哈\",\"updateBy\":\"\",\"year\":\"2020\",\"id\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 17:52:30');
INSERT INTO `sys_oper_log` VALUES (203, '培养方案', 2, 'com.ruoyi.pyfa.controller.CFanganController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/fangan', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"goal\":\"哈和\",\"updateBy\":\"\",\"year\":\"2020\",\"id\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-26 17:53:27');
INSERT INTO `sys_oper_log` VALUES (204, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"计算机科学学院\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888889\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 15:42:31');
INSERT INTO `sys_oper_log` VALUES (205, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"计算机科学\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888889\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 16:04:18');
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"计算机科学学院\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888889\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 16:04:55');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'c_py_byyq', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 16:35:58');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"ByyqId\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"byyqId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"毕业要求id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638002158000,\"tableId\":4,\"pk\":true,\"columnName\":\"byyq_id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父要求id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638002158000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Ancestors\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ancestors\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"祖级列表\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638002158000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"ancestors\"},{\"capJavaField\":\"ByyqName\",\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"byyqName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"毕业要求名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(30', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 16:51:04');
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-11-27 16:51:30');
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"subTableName\":\"\",\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"ByyqId\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"byyqId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"毕业要求id\",\"updateTime\":1638003064000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638002158000,\"tableId\":4,\"pk\":true,\"columnName\":\"byyq_id\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":24,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父要求id\",\"isQuery\":\"1\",\"updateTime\":1638003064000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638002158000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"Ancestors\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ancestors\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"祖级列表\",\"isQuery\":\"1\",\"updateTime\":1638003064000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638002158000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"ancestors\"},{\"capJavaField\":\"ByyqName\",\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"byyqName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"毕业要求名称\",\"isQuery\":\"1\",\"updateTime\":16', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 19:33:42');
INSERT INTO `sys_oper_log` VALUES (211, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqName\":\"毕业要求\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"children\":[],\"createTime\":1638014408575,\"byyqId\":110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 20:00:08');
INSERT INTO `sys_oper_log` VALUES (212, '毕业要求', 3, 'com.ruoyi.pyfa.controller.CPyByyqController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/byyq/110', '127.0.0.1', '内网IP', '{byyqIds=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 20:01:41');
INSERT INTO `sys_oper_log` VALUES (213, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqName\":\"毕业要求\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"children\":[],\"createTime\":1638014547790}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'byyq_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\service\\target\\classes\\mapper\\CPyByyqMapper.xml]\r\n### The error may involve com.ruoyi.pyfa.mapper.CPyByyqMapper.insertCPyByyq-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into c_py_byyq          ( parent_id,                          byyq_name,                          order_num,                                       create_time )           values ( ?,                          ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'byyq_id\' doesn\'t have a default value\n; Field \'byyq_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'byyq_id\' doesn\'t have a default value', '2021-11-27 20:02:28');
INSERT INTO `sys_oper_log` VALUES (214, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"工程知识\",\"byyqName\":\"毕业要求1\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"children\":[],\"createTime\":1638016480100,\"byyqId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 20:34:40');
INSERT INTO `sys_oper_log` VALUES (215, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"工程知识\",\"byyqName\":\"毕业要求1\",\"orderNum\":1,\"updateTime\":1638025227747,\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"\",\"children\":[],\"createTime\":1638016480000,\"updateBy\":\"\",\"byyqId\":101,\"ancestors\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-27 23:00:27');
INSERT INTO `sys_oper_log` VALUES (216, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"children\":[],\"createTime\":1638063027806,\"byyqId\":102,\"ancestors\":\"0,100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 09:30:27');
INSERT INTO `sys_oper_log` VALUES (217, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638063390806,\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 09:36:30');
INSERT INTO `sys_oper_log` VALUES (218, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638063439875,\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 09:37:19');
INSERT INTO `sys_oper_log` VALUES (219, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638063440000,\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100,101\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.pyfa.mapper.CPyByyqMapper.selectChildrenByyqById', '2021-11-28 09:50:43');
INSERT INTO `sys_oper_log` VALUES (220, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638063440000,\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100,101\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.pyfa.mapper.CPyByyqMapper.selectChildrenByyqById', '2021-11-28 09:51:43');
INSERT INTO `sys_oper_log` VALUES (221, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638064853016,\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100,101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:00:53');
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"软件工程\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,102\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:02:27');
INSERT INTO `sys_oper_log` VALUES (223, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"软件工程\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1634789756000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:02:56');
INSERT INTO `sys_oper_log` VALUES (224, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"问题分析\",\"byyqName\":\"毕业要求2\",\"orderNum\":2,\"updateTime\":1638065208577,\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"\",\"children\":[],\"createTime\":1638063028000,\"updateBy\":\"\",\"byyqId\":102,\"ancestors\":\"0,100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:06:48');
INSERT INTO `sys_oper_log` VALUES (225, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"具备运用数学知识、自然科学基础知识解决复杂软件工程问题的能力\",\"byyqName\":\"指标点1.1\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"children\":[],\"createTime\":1638065425816,\"byyqId\":103,\"ancestors\":\"0,100,101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:10:25');
INSERT INTO `sys_oper_log` VALUES (226, '毕业要求', 3, 'com.ruoyi.pyfa.controller.CPyByyqController.remove()', 'DELETE', 1, 'admin', NULL, '/pyfa/byyq/103', '127.0.0.1', '内网IP', '{byyqIds=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:11:38');
INSERT INTO `sys_oper_log` VALUES (227, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"具备运用数学知识、自然科学基础知识解决复杂软件工程问题的能力\",\"byyqName\":\"指标点1.1\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"children\":[],\"createTime\":1638065553792,\"byyqId\":104,\"ancestors\":\"0,100,101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 10:12:33');
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"50\",\"menuName\":\"测试_培养方案2017\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"fangan\",\"component\":\"pyfa/fangan/index\",\"children\":[],\"createTime\":1635670139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"pyfa:fangan:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 12:37:52');
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"毕业要求\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"byyq\",\"component\":\"pyfa/byyq/index\",\"children\":[],\"createTime\":1638003603000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"C\",\"perms\":\"pyfa:byyq:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-28 12:37:59');
INSERT INTO `sys_oper_log` VALUES (230, '毕业要求', 2, 'com.ruoyi.pyfa.controller.CPyByyqController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqName\":\"毕业要求\",\"pyfaId\":0,\"orderNum\":0,\"updateTime\":1638268054932,\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"\",\"children\":[],\"updateBy\":\"\",\"byyqId\":100,\"ancestors\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-30 18:27:35');
INSERT INTO `sys_oper_log` VALUES (231, '毕业要求', 1, 'com.ruoyi.pyfa.controller.CPyByyqController.add()', 'POST', 1, 'admin', NULL, '/pyfa/byyq', '127.0.0.1', '内网IP', '{\"byyqContent\":\"掌握计算机系统基础知识和基本工作原理\",\"byyqName\":\"指标点1.2\",\"pyfaId\":\"1\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"children\":[],\"createTime\":1638320840822,\"byyqId\":105,\"ancestors\":\"0,100,101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 09:07:21');
INSERT INTO `sys_oper_log` VALUES (232, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 09:42:17');
INSERT INTO `sys_oper_log` VALUES (233, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 09:43:52');
INSERT INTO `sys_oper_log` VALUES (234, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 09:45:57');
INSERT INTO `sys_oper_log` VALUES (235, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 09:46:39');
INSERT INTO `sys_oper_log` VALUES (236, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"createBy\":\"\",\"updateBy\":\"\",\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:28:54');
INSERT INTO `sys_oper_log` VALUES (237, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"createBy\":\"\",\"updateBy\":\"\",\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:29:53');
INSERT INTO `sys_oper_log` VALUES (238, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊啊啊啊\",\"goalId\":5,\"pyfaId\":\"1\",\"params\":{},\"createBy\":\"\",\"updateBy\":\"\",\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:31:03');
INSERT INTO `sys_oper_log` VALUES (239, '培养目标表', 2, 'com.ruoyi.pyfa.controller.CPyGoalController.edit()', 'PUT', 1, 'admin', NULL, '/pyfa/goal', '127.0.0.1', '内网IP', '{\"goal2\":\"\",\"goal1\":\"啊\",\"goalId\":5,\"pyfaId\":\"1\",\"updateTime\":1638327143100,\"params\":{},\"createBy\":\"\",\"updateBy\":\"\",\"describe\":\"哈哈哈\",\"goal5\":\"\",\"goal4\":\"\",\"goal3\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:52:23');
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666333\",\"admin\":false,\"loginDate\":1635686293000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"xxcey@qq.com\",\"nickName\":\"小小测试员\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"网络工程\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1634789756000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-02 13:39:52');
INSERT INTO `sys_oper_log` VALUES (241, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"新版本内容\",\"createBy\":\"admin\",\"createTime\":1634789765000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 新版本发布啦\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-02 13:41:15');
INSERT INTO `sys_oper_log` VALUES (242, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>维护内容</p>\",\"createBy\":\"admin\",\"createTime\":1634789765000,\"updateBy\":\"admin\",\"noticeType\":\"1\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":2,\"noticeTitle\":\"维护通知：2018-07-01 系统凌晨维护\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-02 13:41:21');
INSERT INTO `sys_oper_log` VALUES (243, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>新版本内容</p>\",\"createBy\":\"admin\",\"createTime\":1634789765000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"updateTime\":1638423675000,\"params\":{},\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2021-10-01 新版本发布啦\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-02 13:41:38');
INSERT INTO `sys_oper_log` VALUES (244, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>维护内容</p>\",\"createBy\":\"admin\",\"createTime\":1634789765000,\"updateBy\":\"admin\",\"noticeType\":\"1\",\"remark\":\"管理员\",\"updateTime\":1638423681000,\"params\":{},\"noticeId\":2,\"noticeTitle\":\"维护通知：2020-11-01 系统凌晨维护\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-02 13:41:49');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"导入导出\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"drdc\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 10:15:11');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"导入导出\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"drdc\",\"children\":[],\"createTime\":1638670510000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 10:15:33');
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"3\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 10:15:52');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"4\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 10:16:00');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"5\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1634789758000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 10:16:05');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'c_gj_teacher', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 20:44:42');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"TeacherId\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"teacherId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"工号\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638708282000,\"tableId\":5,\"pk\":true,\"columnName\":\"teacher_id\"},{\"capJavaField\":\"TeacherName\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teacherName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638708282000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"teacher_name\"},{\"capJavaField\":\"DegreeId\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"degreeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"学历\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638708282000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"degree_id\"}],\"businessName\":\"teacherInfo\",\"moduleName\":\"drdc\",\"className\":\"CGjTeacher\",\"tableName\":\"c_gj_teacher\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2033}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.drdc\",\"functionName\":\"教师信息\",\"tree\":false,\"tableComment\":\"教师信息\",\"params\":{\"parentMenuId\":2033},\"tplCategory\":\"crud\",\"parentMenuId\":\"2033\",\"tableId\":5,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 20:47:42');
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-05 20:51:29');
INSERT INTO `sys_oper_log` VALUES (253, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"教师学历列表\",\"params\":{},\"dictType\":\"c_gj_degree\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 21:58:18');
INSERT INTO `sys_oper_log` VALUES (254, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1638712698000,\"updateBy\":\"admin\",\"dictName\":\"教师学历列表\",\"remark\":\"教师学历列表\",\"dictId\":12,\"params\":{},\"dictType\":\"c_gj_degree\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 21:58:30');
INSERT INTO `sys_oper_log` VALUES (255, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"博士研究生\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:00:00');
INSERT INTO `sys_oper_log` VALUES (256, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"硕士研究生\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:00:36');
INSERT INTO `sys_oper_log` VALUES (257, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"大学本科\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:00:56');
INSERT INTO `sys_oper_log` VALUES (258, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"大学本科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1638712856000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:01:02');
INSERT INTO `sys_oper_log` VALUES (259, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"博士研究生\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1638712800000,\"dictCode\":31,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:02:43');
INSERT INTO `sys_oper_log` VALUES (260, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"硕士研究生\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1638712836000,\"dictCode\":32,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:02:50');
INSERT INTO `sys_oper_log` VALUES (261, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"c_gj_degree\",\"dictLabel\":\"大学本科\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1638712856000,\"dictCode\":33,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-05 22:02:56');
INSERT INTO `sys_oper_log` VALUES (262, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"be16f1a5-b274-4a91-853d-907a7b665f5a_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-05 22:03:23');
INSERT INTO `sys_oper_log` VALUES (263, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ffcd7ad8-3166-40f2-b57a-9f7eabaa12e8_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-05 22:04:23');
INSERT INTO `sys_oper_log` VALUES (264, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"4aa742d7-3f6b-4f17-b47d-2ac0b1b6026a_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-05 22:23:55');
INSERT INTO `sys_oper_log` VALUES (265, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"6574b6c7-eef8-454a-8999-0164e3041e21_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 09:22:16');
INSERT INTO `sys_oper_log` VALUES (266, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"c901f04a-119b-4ca0-9af7-d569e4bc9097_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 09:34:54');
INSERT INTO `sys_oper_log` VALUES (267, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"831b136f-43ba-483d-ab01-92fd61d2765c_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 14:41:31');
INSERT INTO `sys_oper_log` VALUES (268, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"0f51a9b8-98a5-4b6d-baa3-7f5068c50559_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 18:50:56');
INSERT INTO `sys_oper_log` VALUES (269, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"c86b5d9e-ec26-4a0a-9eb6-a6982b39ecc3_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 18:51:33');
INSERT INTO `sys_oper_log` VALUES (270, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"b57068b1-4b4d-47a0-a521-0bc5e9754d6a_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-06 18:52:13');
INSERT INTO `sys_oper_log` VALUES (271, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ec1e0f95-32de-47c0-b421-766641211316_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-07 10:49:34');
INSERT INTO `sys_oper_log` VALUES (272, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1bc3f4b9-c3d8-4c48-8475-d48ee299ccd7_教师信息统计word.xlsx\",\"code\":200}', 0, NULL, '2021-12-07 11:12:12');
INSERT INTO `sys_oper_log` VALUES (273, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"0cd51882-e4e3-4a9e-aa7b-7b529d091112_教师信息统计word.xlsx\",\"code\":200}', 0, NULL, '2021-12-07 11:13:04');
INSERT INTO `sys_oper_log` VALUES (274, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"9b1dc913-3dcb-48f2-a978-7c2ccf650ad8_教师信息统计word.xlsx\",\"code\":200}', 0, NULL, '2021-12-07 11:15:57');
INSERT INTO `sys_oper_log` VALUES (275, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"f43cc791-886f-4227-ac7f-eae98b4f22d8_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 11:16:40');
INSERT INTO `sys_oper_log` VALUES (276, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"b75b6d8c-120a-4878-8897-6f0164ea5ddd_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-07 14:07:45');
INSERT INTO `sys_oper_log` VALUES (277, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:08:57');
INSERT INTO `sys_oper_log` VALUES (278, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:13:08');
INSERT INTO `sys_oper_log` VALUES (279, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:15:25');
INSERT INTO `sys_oper_log` VALUES (280, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:17:29');
INSERT INTO `sys_oper_log` VALUES (281, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:18:12');
INSERT INTO `sys_oper_log` VALUES (282, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:25:36');
INSERT INTO `sys_oper_log` VALUES (283, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-07 14:38:49');
INSERT INTO `sys_oper_log` VALUES (284, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ecc3ac72-d4fe-4253-94a0-bacecf9e6e99_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 14:43:10');
INSERT INTO `sys_oper_log` VALUES (285, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"8b0039fb-bec1-4a1a-b8b0-f5cba66a651c_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:02:17');
INSERT INTO `sys_oper_log` VALUES (286, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"dc2be01e-abe1-4891-96fd-c7a506033c93_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:04:12');
INSERT INTO `sys_oper_log` VALUES (287, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"9acacb1f-fc50-464b-a2b5-6729fecc2535_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:06:15');
INSERT INTO `sys_oper_log` VALUES (288, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"3a27ff4a-c13e-4cd1-9201-2d26b210b1a8_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:06:25');
INSERT INTO `sys_oper_log` VALUES (289, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"0c411059-3a53-45b6-b2fa-ae2f029ebb28_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:09:37');
INSERT INTO `sys_oper_log` VALUES (290, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"fdabe553-e8fb-4699-a667-36eb8e5f860a_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:11:44');
INSERT INTO `sys_oper_log` VALUES (291, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"d1886cca-a2d3-4dac-8c08-df739877b2c3_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:12:27');
INSERT INTO `sys_oper_log` VALUES (292, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"d49853dc-e00a-4ea6-98e5-96abb7b4c4e0_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:12:43');
INSERT INTO `sys_oper_log` VALUES (293, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"b102c4b8-9729-49ef-b02a-8963b4713a1a_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:14:12');
INSERT INTO `sys_oper_log` VALUES (294, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"13d879d7-0760-43f4-85e0-5e0c36246f22_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:19:10');
INSERT INTO `sys_oper_log` VALUES (295, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"3431c679-f0ee-4051-b1df-5d656054ddef_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:20:02');
INSERT INTO `sys_oper_log` VALUES (296, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"9cfb6ffa-e3cf-43b9-95f2-4720089db720_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 15:24:38');
INSERT INTO `sys_oper_log` VALUES (297, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"2534d87f-310c-4a44-b77e-e4dffdf9c531_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 16:13:03');
INSERT INTO `sys_oper_log` VALUES (298, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"f950c0e0-4b97-4cb1-a7be-caf9b6e57ff8_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 16:13:59');
INSERT INTO `sys_oper_log` VALUES (299, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"4cf07354-9ecb-4eb4-bc6c-726f5da65db1_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 16:19:53');
INSERT INTO `sys_oper_log` VALUES (300, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"98c816f0-b1e6-4300-ad7f-a6e7004af927_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 19:39:35');
INSERT INTO `sys_oper_log` VALUES (301, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"90c8a6bd-36b0-41c6-b7dd-52416afa480b_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 19:50:34');
INSERT INTO `sys_oper_log` VALUES (302, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"b9d16951-7f5c-4b51-a3c5-2c3ab65c1caa_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 19:59:43');
INSERT INTO `sys_oper_log` VALUES (303, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"88398f61-783a-48a0-8ebb-50c1a960cf39_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 20:05:08');
INSERT INTO `sys_oper_log` VALUES (304, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"6c01c5f1-024e-4e98-9ea6-5fa52ea806fe_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 20:30:14');
INSERT INTO `sys_oper_log` VALUES (305, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"e330b2d8-6b90-4527-844b-197bb026fb41_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-07 20:32:02');
INSERT INTO `sys_oper_log` VALUES (306, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"a2f98dda-c712-4402-9993-cf4037dd371a_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 15:43:13');
INSERT INTO `sys_oper_log` VALUES (307, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"aaa56439-d6e0-43d7-9c12-d796597e44c4_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 15:47:48');
INSERT INTO `sys_oper_log` VALUES (308, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"d5ef3e8b-e11a-4db4-ae02-29ec04332c2f_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 15:51:21');
INSERT INTO `sys_oper_log` VALUES (309, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"c16f0af9-da6d-4a73-9d2b-c8621acfb460_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 15:57:36');
INSERT INTO `sys_oper_log` VALUES (310, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"48c68947-61d7-41e1-b443-16c93833bb5a_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 16:03:10');
INSERT INTO `sys_oper_log` VALUES (311, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"7bc4ef33-c6f5-457b-b97f-116a9a48c40c_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-09 16:03:26');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 7, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '导入用户数据不能为空！', '2021-12-09 17:30:03');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 10010 导入成功\",\"code\":200}', 0, NULL, '2021-12-09 20:45:12');
INSERT INTO `sys_oper_log` VALUES (314, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"TeacherId\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"teacherId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"工号\",\"updateTime\":1638708461000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638708282000,\"tableId\":5,\"pk\":true,\"columnName\":\"teacher_id\"},{\"capJavaField\":\"TeacherName\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teacherName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"姓名\",\"isQuery\":\"1\",\"updateTime\":1638708461000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638708282000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"teacher_name\"},{\"capJavaField\":\"DegreeId\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"c_gj_degree\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"degreeId\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"学历\",\"isQuery\":\"1\",\"updateTime\":1638708461000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638708282000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"degree_id\"}],\"businessName\":\"teacherInfo\",\"moduleName\":\"drdc\",\"className\":\"CGjTeacher\",\"tableName\":\"c_gj_teacher\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":\\\"2033\\\"}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.drdc\",\"functionName\":\"教师信息\",\"tree\":false,\"tableComment\":\"教师信息\",\"params\":{\"parentMenuId\":\"2033\"},\"tplCategory\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-09 20:47:27');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在', '2021-12-09 20:58:21');
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 7, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 小杨 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,                               sex,       password,             create_by,            create_time    )values(      ?,       ?,       ?,                               ?,       ?,             ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2021-12-09 21:02:11');
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 7, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 杨某某 导入成功\",\"code\":200}', 0, NULL, '2021-12-09 21:04:40');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 10010 更新成功\",\"code\":200}', 0, NULL, '2021-12-09 21:05:20');
INSERT INTO `sys_oper_log` VALUES (319, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 10010 更新成功\",\"code\":200}', 0, NULL, '2021-12-09 21:12:05');
INSERT INTO `sys_oper_log` VALUES (320, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 10010 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'\' for column \'degree_id\' at row 1\r\n### The error may exist in file [E:\\code_practice\\RuoYi-Vue-master\\xpu-common\\target\\classes\\mapper\\CGjTeacherMapper.xml]\r\n### The error may involve com.ruoyi.drdc.mapper.CGjTeacherMapper.updateCGjTeacher-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update c_gj_teacher          SET teacher_name = ?,             degree_id = ?          where teacher_id = ?\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'\' for column \'degree_id\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'\' for column \'degree_id\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'\' for column \'degree_id\' at row 1', '2021-12-09 21:14:02');
INSERT INTO `sys_oper_log` VALUES (321, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 10010 更新成功<br/>2、账号 10011 更新成功\",\"code\":200}', 0, NULL, '2021-12-09 21:14:42');
INSERT INTO `sys_oper_log` VALUES (322, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"77c7eb74-568b-4221-95be-95091ba03b5a_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-09 21:15:53');
INSERT INTO `sys_oper_log` VALUES (323, '教师信息', 5, 'com.ruoyi.drdc.controller.CGjTeacherController.export()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"090d618d-cea1-4dc9-a996-0321902f2f22_教师信息数据.xlsx\",\"code\":200}', 0, NULL, '2021-12-09 21:15:53');
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在<br/>2、账号 10011 已存在', '2021-12-09 21:50:11');
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在<br/>2、账号 10011 已存在', '2021-12-09 21:50:41');
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在<br/>2、账号 10011 已存在', '2021-12-09 21:51:30');
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：<br/>1、账号 10010 更新成功<br/>2、账号 10011 更新成功<br/>3、账号 10012 更新成功\",\"code\":200}', 0, NULL, '2021-12-09 21:51:49');
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 3 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在<br/>2、账号 10011 已存在<br/>3、账号 10012 已存在', '2021-12-09 22:12:38');
INSERT INTO `sys_oper_log` VALUES (329, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：<br/>1、账号 10010 更新成功<br/>2、账号 10011 更新成功<br/>3、账号 10012 更新成功\",\"code\":200}', 0, NULL, '2021-12-09 22:12:50');
INSERT INTO `sys_oper_log` VALUES (330, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'true', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：<br/>1、账号 10010 更新成功<br/>2、账号 10011 更新成功<br/>3、账号 10012 更新成功\",\"code\":200}', 0, NULL, '2021-12-14 10:06:01');
INSERT INTO `sys_oper_log` VALUES (331, '用户管理', 7, 'com.ruoyi.drdc.controller.CGjTeacherController.importTeacherData()', 'POST', 1, 'admin', NULL, '/drdc/teacherInfo/importTeacherData', '127.0.0.1', '内网IP', 'false', NULL, 1, '很抱歉，导入失败！共 3 条数据格式不正确，错误如下：<br/>1、账号 10010 已存在<br/>2、账号 10011 已存在<br/>3、账号 10012 已存在', '2021-12-14 10:06:39');
INSERT INTO `sys_oper_log` VALUES (332, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"2be8dac3-8826-4c19-97e4-b63bf05bf4c6_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-14 10:08:43');
INSERT INTO `sys_oper_log` VALUES (333, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"fbbe69cb-0ead-43a1-b49d-e931abda01ff_教师信息统计word.docx\",\"code\":200}', 0, NULL, '2021-12-14 10:12:08');
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"高教信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"drdc\",\"children\":[],\"createTime\":1638670510000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 14:43:51');
INSERT INTO `sys_oper_log` VALUES (335, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-14 14:44:03');
INSERT INTO `sys_oper_log` VALUES (336, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-14 14:48:13');
INSERT INTO `sys_oper_log` VALUES (337, '教师信息', 6, 'com.ruoyi.drdc.controller.CGjTeacherController.exportWord()', 'GET', 1, 'admin', NULL, '/drdc/teacherInfo/exportWord', '127.0.0.1', '内网IP', '{}', NULL, 1, '导出Word失败，请联系网站管理员！', '2021-12-14 14:51:54');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '校长', 1, '0', 'admin', '2021-10-21 12:15:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '院长', 2, '0', 'admin', '2021-10-21 12:15:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '系主任', 3, '0', 'admin', '2021-10-21 12:15:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-10-21 12:15:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-21 12:15:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-10-21 12:15:57', 'admin', '2021-10-31 21:17:16', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 102);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'XPU', '00', 'admin@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-12-14 14:32:31', 'admin', '2021-10-21 12:15:56', '', '2021-12-14 14:32:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'test1', '小小测试员', '00', 'xxcey@qq.com', '15666666333', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-31 21:18:13', 'admin', '2021-10-21 12:15:56', 'admin', '2021-12-02 13:39:52', '测试员');
INSERT INTO `sys_user` VALUES (3, 103, '杨某某', '小杨', '00', '777888999@xpu.edu', '13388887777', '1', '', '$2a$10$xRiaTb7P2yIIQOI8TTDjOO4hu5I1/WUvR8qvwt0A70SYOCdGQxzQC', '0', '0', '', NULL, 'admin', '2021-12-09 21:04:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
