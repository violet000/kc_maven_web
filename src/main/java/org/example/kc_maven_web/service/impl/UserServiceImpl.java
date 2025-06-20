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
        log.info("登录请求参数: username={}, password={}, image={}", 
            loginDTO.getUsername(),
            loginDTO.getPassword() != null ? "已提供" : "未提供",
            loginDTO.getImage() != null ? "已提供" : "未提供");
            
        User user = getUserByUsername(loginDTO.getUsername());
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }

        if ((loginDTO.getPassword() == null || loginDTO.getPassword().isEmpty()) 
            && (loginDTO.getImage() == null || loginDTO.getImage().isEmpty())) {
            throw new RuntimeException("请输入密码或上传人脸照片");
        }

        boolean matches = false;
        if (loginDTO.getPassword() != null && !loginDTO.getPassword().isEmpty()) {
            matches = loginDTO.getPassword().equals(user.getPassword());
            log.info("使用密码登录");
        } else if (loginDTO.getImage() != null && !loginDTO.getImage().isEmpty()) {
            // TODO: 这里需要添加人脸识别的逻辑
            matches = true;
            log.info("使用人脸识别登录");
        }
        
        log.info("验证结果: 密码匹配={}", matches);
        
        if (!matches) {
            if (loginDTO.getPassword() != null && !loginDTO.getPassword().isEmpty()) {
                throw new RuntimeException("密码错误");
            } else {
                throw new RuntimeException("人脸识别失败");
            }
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