package com.alok.blogappwithboot.controllers.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestPostController {

    @GetMapping("/")
    public String sayHello() {
        return "ok";
    }
}
