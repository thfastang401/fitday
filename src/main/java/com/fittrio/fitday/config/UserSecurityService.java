package com.fittrio.fitday.config;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;

@Component
public class UserSecurityService implements UserDetailsService{
	
	private final UserService userService;
	
	public UserSecurityService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		UserDTO siteUser = userService.findUserByEmail(email);
		CustomUser customUser = new CustomUser();
		
		if (siteUser==null) {
			throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
		}
		 String authorities=""; // 한 아이디에 권한을 여러개 줄 졍우 String []으로 변경
		if (siteUser.getNickname().equals("관리자")) {
			authorities = UserRole.ADMIN.getValue();
		}
		else {
			authorities = UserRole.USER.getValue();
		}
		
		customUser.update(siteUser);
		
		customUser.setAuthority(authorities);
		
//		System.out.println(authorities);
//		return User.builder()	
//				.username(siteUser.getEmail())
//				.password(siteUser.getPassword())
//				.roles(authorities)
//				.build()
		return customUser
				;
	}

}
