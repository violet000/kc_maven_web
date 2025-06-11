package org.example.kc_maven_web.service;

import org.example.kc_maven_web.dto.LoginDTO;
import org.example.kc_maven_web.entity.User;
import org.example.kc_maven_web.vo.LoginVO;

public interface UserService {
    LoginVO login(LoginDTO loginDTO);
    User getUserByUsername(String username);
} 