package org.example.kc_maven_web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.example.kc_maven_web.dto.LoginDTO;
import org.example.kc_maven_web.entity.User;
import org.example.kc_maven_web.mapper.UserMapper;
import org.example.kc_maven_web.service.UserService;
import org.example.kc_maven_web.utils.JwtUtil;
import org.example.kc_maven_web.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import java.util.Date;
import org.springframework.util.DigestUtils;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private JwtUtil jwtUtil;

    @Override
    public LoginVO login(LoginDTO loginDTO) {
        User user = getUserByUsername(loginDTO.getUsername());
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        
        // 前端传来的已经是MD5加密后的密码，直接用BCrypt校验
        boolean matches = loginDTO.getPassword().equals(user.getPassword());
        log.info("Input password: {}", loginDTO.getPassword());
        log.info("Stored password: {}", user.getPassword());
        log.info("Password matches: {}", matches);
        
        if (!matches) {
            throw new RuntimeException("密码错误");
        }
        
        if (user.getStatus() != 1) {
            throw new RuntimeException("账号已被禁用");
        }

        String token = jwtUtil.generateToken(user.getUsername());
        Date expireTime = jwtUtil.getExpirationFromToken(token);
        
        return new LoginVO(token, user.getUsername(), expireTime);
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.selectOne(
            new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username)
        );
    }
} 