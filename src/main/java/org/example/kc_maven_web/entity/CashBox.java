package org.example.kc_maven_web.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("cash_box")
public class CashBox {
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private String boxCode;        // 箱子编号
    private String pointCode;      // 关联的网点编号
    private Integer scanStatus;    // 扫描状态：0-未扫描，1-已扫描
    private String boxType;        // 箱子类型：1-款箱，2-款包
    private String boxSize;        // 箱子尺寸
    private Double weight;         // 重量(kg)
    private String remark;         // 备注
    
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    
    @TableLogic
    private Integer deleted;
} 