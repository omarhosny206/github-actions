package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/hello-world")
public class HelloWorldController {
    @GetMapping("/")
    public String helloWorld() {
        return "Hello World! Github Actions!"
    }
}
