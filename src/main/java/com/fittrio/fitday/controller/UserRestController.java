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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {
	
    @Autowired
    @Qualifier("userService")
    UserService service;

    //비밀번호 체크
    @PostMapping("/user/check")
    public boolean checkPassword(@AuthenticationPrincipal CustomUser user,
            					@RequestParam String checkPassword,
            					Model model){

    	return service.checkPassword(user.getEmail(), checkPassword);
    }
    

    //닉네임 체크
    @PostMapping("/user/mypage/nickname")
    public @ResponseBody String nicknameCheck(@RequestParam("nickname") String nickname, @AuthenticationPrincipal CustomUser customUser) {
//    	System.out.println("nickname = "+ nickname );
    	String checkResult = service.nicknameCheck(nickname, customUser);

    	return checkResult;
    }
    
    //비밀번호 변경
    @Transactional
    @PostMapping("/user/mypage/modifyPw")
    public boolean modifyPwd(@RequestParam("password") String password, @AuthenticationPrincipal CustomUser customUser) {
    	UserDTO dto = new UserDTO();
    	dto.setEmail(customUser.getEmail());
    	dto.setPassword(password);
    	service.updatePasswordInfo(dto);
    	return true;
    }
    
    
    
    
}
