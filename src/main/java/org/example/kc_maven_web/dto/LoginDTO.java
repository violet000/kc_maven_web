package org.example.kc_maven_web.dto;

import lombok.Data;
import javax.validation.constraints.NotBlank;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.util.DigestUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Data
public class LoginDTO {
    @NotBlank(message = "用户名不能为空")
    private String username;

    @JsonProperty("password")
    private String password;

    @JsonProperty("image")
    private String image;
}