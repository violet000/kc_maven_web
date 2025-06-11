-- 创建押运线路表
CREATE TABLE IF NOT EXISTS `escort_route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `route_name` varchar(100) NOT NULL COMMENT '线路名称',
  `route_code` varchar(50) NOT NULL COMMENT '线路编号',
  `escort_user` varchar(50) NOT NULL COMMENT '押运人员',
  `route_date` datetime NOT NULL COMMENT '押运日期',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-未开始，1-进行中，2-已完成',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_escort_user` (`escort_user`),
  KEY `idx_route_date` (`route_date`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='押运线路表';

-- 创建线路网点表
CREATE TABLE IF NOT EXISTS `route_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `route_id` bigint(20) NOT NULL COMMENT '关联的线路ID',
  `point_name` varchar(100) NOT NULL COMMENT '网点名称',
  `point_code` varchar(50) NOT NULL COMMENT '网点编号',
  `address` varchar(200) NOT NULL COMMENT '网点地址',
  `sequence` int(11) NOT NULL COMMENT '顺序号',
  `operation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作类型：0-出库，1-入库',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-未到达，1-已到达，2-已离开',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_route_id` (`route_id`),
  KEY `idx_sequence` (`sequence`),
  KEY `idx_status` (`status`),
  CONSTRAINT `fk_route_point_route` FOREIGN KEY (`route_id`) REFERENCES `escort_route` (`id`),
  UNIQUE KEY `uk_point_code` (`point_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='线路网点表';

-- 创建款箱表
CREATE TABLE IF NOT EXISTS `cash_box` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `box_code` varchar(50) NOT NULL COMMENT '箱子编号',
  `point_code` varchar(50) NOT NULL COMMENT '关联的网点编号',
  `scan_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '扫描状态：0-未扫描，1-已扫描',
  `box_type` varchar(20) NOT NULL COMMENT '箱子类型：1-款箱，2-款包',
  `box_size` varchar(50) DEFAULT NULL COMMENT '箱子尺寸',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '重量(kg)',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_box_code` (`box_code`),
  KEY `idx_point_code` (`point_code`),
  KEY `idx_scan_status` (`scan_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='款箱表'; 