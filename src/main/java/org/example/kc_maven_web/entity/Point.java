package org.example.kc_maven_web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("route_point")
public class Point {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String pointCode;
    private Integer status;
} 