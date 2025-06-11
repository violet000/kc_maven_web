package org.example.kc_maven_web.controller;

import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.dto.LoginDTO;
import org.example.kc_maven_web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Result<String> login(@Valid @RequestBody LoginDTO loginDTO) {
        String token = String.valueOf(userService.login(loginDTO));
        return Result.success(token);
    }
} 