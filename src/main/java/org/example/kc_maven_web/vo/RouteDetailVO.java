package org.example.kc_maven_web.vo;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class RouteDetailVO {
    private Long id;
    private String routeName;
    private String routeCode;
    private String escortUser;
    private LocalDateTime routeDate;
    private Integer status;
    private String remark;
    private List<PointDetailVO> points;
    
    @Data
    public static class PointDetailVO {
        private Long id;
        private String pointName;
        private String pointCode;
        private String address;
        private int operationType;
        private Integer sequence;
        private Integer status;
        private String remark;
    }
} 