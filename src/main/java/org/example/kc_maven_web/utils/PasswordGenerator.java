package org.example.kc_maven_web.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.DigestUtils;

public class PasswordGenerator {
    public static void main(String[] args) {
        // 明文密码
        String rawPassword = "123456";
        
        // 先MD5
        String md5Password = DigestUtils.md5DigestAsHex(rawPassword.getBytes());
        System.out.println("MD5 password: " + md5Password);
        
        // 再BCrypt
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(md5Password);
        System.out.println("BCrypt(MD5) password: " + encodedPassword);
        
        // 验证密码
        boolean matches = encoder.matches(md5Password, encodedPassword);
        System.out.println("Password verification result: " + matches);
    }
} 