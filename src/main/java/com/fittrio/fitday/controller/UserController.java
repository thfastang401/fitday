package com.fittrio.fitday.controller;

import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    UserService service;

    
    @GetMapping("/user/login")
    public String login() {
        return "loginForm";
    }

    @GetMapping("/register")
    public String register(){return "register";}

    @PostMapping("/register")
    public String register(UserDTO dto){
        UserDTO userDTO = service.findUserByEmail(dto.getEmail());
        if(userDTO==null){
            service.insertUser(dto);
        }
        return "redirect:/";
    }

    
}
