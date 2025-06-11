package org.example.kc_maven_web.service;

import org.example.kc_maven_web.vo.RouteDetailVO;
import java.util.List;

public interface EscortRouteService {
    List<RouteDetailVO> getTodayRoutes(String username);
} 