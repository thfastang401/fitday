package com.fittrio.fitday.controller;

import com.fittrio.fitday.config.CustomUser;
import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    UserService service;

    //로그인 화면
    @GetMapping("/user/login")
    public String login() {
        return "user/loginForm";
    }
    //회원가입 화면
    @GetMapping("/register")
    public String register(){return "register";}
    //회원가입
    @PostMapping("/register")
    public String register(UserDTO dto){
        UserDTO userDTO = service.findUserByEmail(dto.getEmail());
        if(userDTO==null){
            service.insertUser(dto);
        }
        return "redirect:/";
    }
    //마이페이지 화면
    @GetMapping("/user/mypage")
    public String mypage() {
    	return "user/myPage";
    }
    //회원정보 수정 화면
    @GetMapping("/user/mypage/form")
    public String mypageForm() {
    	return "user/myPageForm";
    }
    //회원정보 수정
    
    @Transactional
    @PostMapping("/user/mypage/form")
    public String mypageInfo(@ModelAttribute UserDTO dto , @AuthenticationPrincipal CustomUser customUser) {
    	dto.setEmail(customUser.getEmail());
    	dto.setPassword(customUser.getPassword());
    	service.updateUserInfo(dto);
    	
    	// 2. 현재 Authentication에 저장된 account의 age값 변경
        // 2-1. 현재 Authentication 정보 호출
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	CustomUser userAccount = (CustomUser) authentication.getPrincipal();
    	UserDTO newPrincipal = service.findUserByEmail(customUser.getEmail());
    	UsernamePasswordAuthenticationToken newToken = new UsernamePasswordAuthenticationToken(newPrincipal,authentication.getCredentials(),userAccount.getAuthorities()); 
        newToken.setDetails(authentication.getDetails());
        // 2-2. 현재 Authentication로 사용자 인증 후 새 Authentication 정보를 SecurityContextHolder에 세팅
        SecurityContextHolder.getContext().setAuthentication(newToken);
    	
    	return "redirect:/";
    }
    
}
