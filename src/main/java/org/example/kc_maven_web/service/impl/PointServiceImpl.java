package org.example.kc_maven_web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.dto.PointUpdateDTO;
import org.example.kc_maven_web.entity.Point;
import org.example.kc_maven_web.entity.SysUser;
import org.example.kc_maven_web.mapper.PointMapper;
import org.example.kc_maven_web.mapper.SysUserMapper;
import org.example.kc_maven_web.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class PointServiceImpl implements PointService {

    @Autowired
    private PointMapper pointMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    @Transactional
    public Result updatePointStatus(PointUpdateDTO dto) {
        // 1. 根据网点编号查询网点信息
        List<Point> points = pointMapper.selectList(
            new LambdaQueryWrapper<Point>()
                .eq(Point::getPointCode, dto.getPointCode())
        );

        if (points.isEmpty()) {
            return Result.error("网点不存在");
        }

        Point point = points.get(0);

        // 2. 验证账号密码
        List<SysUser> users = sysUserMapper.selectList(
            new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getUsername, dto.getUsername())
                .eq(SysUser::getPassword, dto.getPassword())
        );

        if (users.isEmpty()) {
            return Result.error("账号或密码错误");
        }

        // 3. 更新状态
        boolean success = pointMapper.update(null,
            new LambdaUpdateWrapper<Point>()
                .eq(Point::getPointCode, dto.getPointCode())
                .set(Point::getStatus, 1)
        ) > 0;

        if (!success) {
            return Result.error("更新状态失败");
        }

        return Result.success("更新状态成功");
    }
} 