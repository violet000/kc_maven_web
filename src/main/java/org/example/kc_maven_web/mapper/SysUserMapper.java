package org.example.kc_maven_web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.example.kc_maven_web.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
} 