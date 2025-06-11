package org.example.kc_maven_web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.kc_maven_web.entity.User;

@Mapper
public interface UserMapper extends BaseMapper<User> {
} 