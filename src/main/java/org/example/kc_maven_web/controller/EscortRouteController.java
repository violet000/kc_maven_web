package org.example.kc_maven_web.controller;

import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.service.EscortRouteService;
import org.example.kc_maven_web.vo.RouteDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/storage/escort-route")
public class EscortRouteController {
    
    @Autowired
    private EscortRouteService escortRouteService;
    
    /**
     * 获取当前用户的今日押运线路
     * @param username 用户名
     * @return 线路详情列表
     */
    @GetMapping("/today")
    public Result<List<RouteDetailVO>> getTodayRoutes(@RequestParam String username) {
        List<RouteDetailVO> routes = escortRouteService.getTodayRoutes(username);
        return Result.success(routes);
    }
} 