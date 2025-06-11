package org.example.kc_maven_web.vo;

import lombok.Data;
import java.util.Date;

@Data
public class LoginVO {
    private String token;
    private String username;
    private Date expireTime;
    
    public LoginVO(String token, String username, Date expireTime) {
        this.token = token;
        this.username = username;
        this.expireTime = expireTime;
    }
} 