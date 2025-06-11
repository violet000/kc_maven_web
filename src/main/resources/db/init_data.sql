-- 清空现有数据（如果需要）
DELETE FROM route_point;
DELETE FROM escort_route;
DELETE FROM cash_box;

-- 插入押运线路数据
INSERT INTO escort_route (id, route_name, route_code, escort_user, route_date, status, remark) VALUES
(1, '押运线路1', 'RT20240315001', 'admin', CURRENT_DATE(), 0, '押运任务1'),
(2, '押运线路2', 'RT20240315002', 'admin', CURRENT_DATE(), 0, '押运任务2'),
(3, '押运线路3', 'RT20240315003', 'admin', CURRENT_DATE(), 0, '押运任务3'),
(4, '押运线路4', 'RT20240315004', 'lisi', CURRENT_DATE(), 0, '押运任务4');

-- 插入线路网点数据
-- 早班押运线路1的网点
INSERT INTO route_point (route_id, point_name, point_code, address, sequence, operation_type, status, remark) VALUES
(1, '总行金库', 'PT001', '北京市朝阳区建国路88号', 1, 0, 0, '起点'),
(1, '朝阳支行', 'PT002', '北京市朝阳区朝阳路123号', 2, 1, 0, '第一个网点'),
(1, '海淀支行', 'PT003', '北京市海淀区中关村大街1号', 3, 1, 0, '第二个网点'),
(1, '西城支行', 'PT004', '北京市西城区西长安街88号', 4, 1, 0, '第三个网点'),
(1, '东城支行', 'PT005', '北京市朝阳区建国路90号', 1, 1, 0, '第四个网点'),
(1, '朝阳北支行', 'PT006', '北京市朝阳区朝阳路92号', 2, 1, 0, '第五个网点'),
(1, '海淀西支行', 'PT007', '北京市海淀区中关村大街40号', 3, 1, 0, '第六个网点'),
(1, '西城南支行', 'PT008', '北京市西城区西长安街188号', 4, 1, 0, '第七个网点');

-- 早班押运线路2的网点
INSERT INTO route_point (route_id, point_name, point_code, address, sequence, operation_type, status, remark) VALUES
(2, '总行金库', 'PT001', '北京市朝阳区建国路88号', 1, 0, 0, '起点'),
(2, '丰台支行', 'PT005', '北京市丰台区丰台路456号', 2, 1, 0, '第一个网点'),
(2, '石景山支行', 'PT006', '北京市石景山区石景山路789号', 3, 1, 0, '第二个网点'),
(2, '门头沟支行', 'PT007', '北京市门头沟区门头沟路101号', 4, 1, 0, '第三个网点');

-- 午班押运线路1的网点
INSERT INTO route_point (route_id, point_name, point_code, address, sequence, operation_type, status, remark) VALUES
(3, '总行金库', 'PT001', '北京市朝阳区建国路88号', 1, 0, 0, '起点'),
(3, '通州支行', 'PT008', '北京市通州区通州路202号', 2, 1, 0, '第一个网点'),
(3, '大兴支行', 'PT009', '北京市大兴区大兴路303号', 3, 1, 0, '第二个网点'),
(3, '亦庄支行', 'PT010', '北京市大兴区亦庄路404号', 4, 1, 0, '第三个网点');

-- 晚班押运线路1的网点
INSERT INTO route_point (route_id, point_name, point_code, address, sequence, operation_type, status, remark) VALUES
(4, '总行金库', 'PT001', '北京市朝阳区建国路88号', 1, 0, 0, '起点'),
(4, '昌平支行', 'PT011', '北京市昌平区昌平路505号', 2, 1, 0, '第一个网点'),
(4, '顺义支行', 'PT012', '北京市顺义区顺义路606号', 3, 1, 0, '第二个网点'),
(4, '怀柔支行', 'PT013', '北京市怀柔区怀柔路707号', 4, 1, 0, '第三个网点');

-- 插入款箱数据
INSERT INTO cash_box (box_code, point_code, scan_status, box_type, box_size, weight, remark) VALUES
('AA001858', 'PT001', 0, '1', '大', 15.5, '款箱1'),
('AA001859', 'PT001', 0, '1', '中', 10.2, '款箱2'),
('AA001860', 'PT001', 0, '2', '小', 5.8, '款包1'),
('AB002912', 'PT001', 0, '1', '大', 15.5, '款箱1'),
('AB002913', 'PT001', 0, '1', '中', 10.2, '款箱2'),
('AB002914', 'PT001', 0, '2', '小', 5.8, '款包1'),
('AA001861', 'PT002', 0, '1', '大', 16.0, '款箱3'),
('AA001862', 'PT002', 0, '1', '中', 11.5, '款箱4'),
('AA001863', 'PT003', 0, '2', '小', 6.2, '款包2'),
('AA001864', 'PT003', 0, '1', '大', 14.8, '款箱5'),
('AA001865', 'PT004', 0, '1', '中', 12.0, '款箱6');