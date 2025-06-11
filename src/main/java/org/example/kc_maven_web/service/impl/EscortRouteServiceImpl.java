package org.example.kc_maven_web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.example.kc_maven_web.entity.EscortRoute;
import org.example.kc_maven_web.entity.RoutePoint;
import org.example.kc_maven_web.mapper.EscortRouteMapper;
import org.example.kc_maven_web.mapper.RoutePointMapper;
import org.example.kc_maven_web.service.EscortRouteService;
import org.example.kc_maven_web.vo.RouteDetailVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
public class EscortRouteServiceImpl implements EscortRouteService {
    
    @Autowired
    private EscortRouteMapper escortRouteMapper;
    
    @Autowired
    private RoutePointMapper routePointMapper;

    @Override
    public List<RouteDetailVO> getTodayRoutes(String username) {
        // 获取今天的开始时间和结束时间
        LocalDateTime todayStart = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        LocalDateTime todayEnd = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
        
        log.info("查询条件：username={}, todayStart={}, todayEnd={}", username, todayStart, todayEnd);
        
        // 查询当天线路
        List<EscortRoute> routes = escortRouteMapper.selectList(
            new LambdaQueryWrapper<EscortRoute>()
                .eq(EscortRoute::getEscortUser, username)
                .between(EscortRoute::getRouteDate, todayStart, todayEnd)
                .orderByAsc(EscortRoute::getRouteDate)
        );
        
        log.info("查询结果：{}", routes);
        
        if (routes.isEmpty()) {
            return new ArrayList<>();
        }
        
        // 获取所有线路ID
        List<Long> routeIds = routes.stream()
            .map(EscortRoute::getId)
            .collect(Collectors.toList());
        
        // 查询所有网点
        List<RoutePoint> points = routePointMapper.selectList(
            new LambdaQueryWrapper<RoutePoint>()
                .in(RoutePoint::getRouteId, routeIds)
                .orderByAsc(RoutePoint::getSequence)
        );
        
        // 按线路ID分组网点
        Map<Long, List<RoutePoint>> pointsByRoute = points.stream()
            .collect(Collectors.groupingBy(RoutePoint::getRouteId));
        
        // 组装返回数据
        List<RouteDetailVO> result = new ArrayList<>();
        for (EscortRoute route : routes) {
            RouteDetailVO vo = new RouteDetailVO();
            BeanUtils.copyProperties(route, vo);
            
            // 设置网点信息
            List<RoutePoint> routePoints = pointsByRoute.getOrDefault(route.getId(), new ArrayList<>());
            List<RouteDetailVO.PointDetailVO> pointVOs = routePoints.stream()
                .map(point -> {
                    RouteDetailVO.PointDetailVO pointVO = new RouteDetailVO.PointDetailVO();
                    BeanUtils.copyProperties(point, pointVO);
                    return pointVO;
                })
                .collect(Collectors.toList());
            
            vo.setPoints(pointVOs);
            result.add(vo);
        }
        
        return result;
    }
} 