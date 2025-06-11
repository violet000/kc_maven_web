package org.example.kc_maven_web.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("route_point")
public class RoutePoint {
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private Long routeId;           // 关联的线路ID
    private String pointName;       // 网点名称
    private String pointCode;       // 网点编号
    private String address;         // 网点地址
    private Integer sequence;       // 顺序号
    private Integer operationType;  // 0-出库，1-入库
    private Integer status;         // 状态：0-未到达，1-已到达，2-已离开
    private String remark;          // 备注
    
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
} 