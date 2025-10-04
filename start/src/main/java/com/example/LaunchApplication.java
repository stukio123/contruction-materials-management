package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication(scanBasePackages = {
        "com.example.*"
})
@EnableConfigurationProperties
public class LaunchApplication {
    public static void main(String[] args) {
        SpringApplication.run(LaunchApplication.class, args);
    }

}
