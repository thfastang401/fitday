package com.fittrio.fitday.controller;

import com.fittrio.fitday.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    UserService service;

    
    @GetMapping("/user/login")
    public String login() {
        return "user/loginForm";
    }
    
}
