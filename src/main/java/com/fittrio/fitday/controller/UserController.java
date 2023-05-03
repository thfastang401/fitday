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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String register(UserDTO dto, BCryptPasswordEncoder passwordEncoder){
        UserDTO userDTO = service.findUserByEmail(dto.getEmail());
        if(userDTO==null){
            service.insertUser(dto, passwordEncoder);
        }
        return "redirect:/";
    }
    //마이페이지 화면
    @GetMapping("/user/mypage")
    public String mypage() {
    	return "user/myPage";
    }
    //정보 수정 전 회원 확인
    @GetMapping("/user/check")
    public String checkPwdView(){
        return "user/checkPw";
    }
    
    //회원정보 수정 화면
    @GetMapping("/user/mypage/form")
    public String mypageForm() {
    	return "user/myPageForm";
    }
    // 비밀번호 수정 화면
    @GetMapping("/user/mypage/modifyPw")
    public String modifyPwdView() {
    	return "user/modifyPw";
    }
    //회원정보 수정
    @Transactional
    @PostMapping("/user/mypage/form")
    public String mypageInfo(@ModelAttribute UserDTO dto , @AuthenticationPrincipal CustomUser customUser) {
    	//DB 수정
    	dto.setEmail(customUser.getEmail());
    	service.updateUserInfo(dto);
    	//인증정보 수정
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUser userPrincipal = (CustomUser) authentication.getPrincipal();
        UserDTO userAccount = service.findUserByEmail(customUser.getEmail());
        userPrincipal.update(userAccount);
    	UsernamePasswordAuthenticationToken newToken = new UsernamePasswordAuthenticationToken(userPrincipal,authentication.getCredentials(),userPrincipal.getAuthorities()); 
        SecurityContextHolder.getContext().setAuthentication(newToken);
    	
    	return "redirect:/user/mypage";
    }
  //회원 탈퇴
    @GetMapping("/user/mypage/deactivate")
    public String userDeactivate(@AuthenticationPrincipal CustomUser customUser) {
    	service.deleteUserByUserSeq(customUser.getUserSeq());
    	return "redirect:/logout";
    }
}
