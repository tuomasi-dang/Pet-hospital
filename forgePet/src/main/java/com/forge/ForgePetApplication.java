package com.forge;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ForgePetApplication {
    private static final Logger log = LoggerFactory.getLogger(ForgePetApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(ForgePetApplication.class, args);
        log.info("宠物医院系统的设计与实现启动");
        log.info("http://localhost:8083/login.html");
    }
}
