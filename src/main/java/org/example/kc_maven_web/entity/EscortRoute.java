package org.example.kc_maven_web.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("escort_route")
public class EscortRoute {
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private String routeName;        // 线路名称
    private String routeCode;        // 线路编号
    private String escortUser;       // 押运人员
    private LocalDateTime routeDate; // 押运日期
    private Integer status;          // 状态：0-未开始，1-进行中，2-已完成
    private String remark;           // 备注
    
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
} 