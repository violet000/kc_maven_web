package org.example.kc_maven_web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.example.kc_maven_web.mapper")
public class KcMavenWebApplication {
    public static void main(String[] args) {
        SpringApplication.run(KcMavenWebApplication.class, args);
    }
}