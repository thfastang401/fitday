package com.fittrio.fitday.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fittrio.fitday.config.CustomUser;


@Controller
public class MainController {
	
	@GetMapping("/")
    public String main(@AuthenticationPrincipal CustomUser customUser, Model model) {
		if(customUser != null) {
			model.addAttribute("loginId", customUser.getUsername());
			model.addAttribute("loginNickname", customUser.getNickname());
			model.addAttribute("loginRoles", customUser.getAuthorities());
		}
        return "main";
    }
	
	@GetMapping("/error")
	public String errorView() {
		return "error";
	}
	
	
	
	
}
