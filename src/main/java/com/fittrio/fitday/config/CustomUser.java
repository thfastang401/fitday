package com.fittrio.fitday.config;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fittrio.fitday.dto.UserDTO;

import lombok.Getter;
import lombok.Setter;

//@Setter
@Getter
@SuppressWarnings("serial")
public class CustomUser implements UserDetails{
	
	 private String nickname;	
	 private String email;	
	 private String password;	
	 private boolean enable;	//계정 잠김 여부
	 private String authority;
	 private String goal;
	 private String fitType;
	 private int userSeq;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
//	public void update(UserDetails user) {
//		if (user instanceof UserDTO) {
//            UserDTO userDto = (UserDTO) user;
//            this.nickname = userDto.getNickname();
//            this.fitType = userDto.getFitType();
//            this.goal = userDto.getGoal();
//            this.email = userDto.getEmail();
//            this.password = userDto.getPassword();
//        }
//	}
	public void update(UserDTO user) {
            this.nickname = user.getNickname();
            this.fitType = user.getFitType();
            this.goal = user.getGoal();
            this.email = user.getEmail();
            this.password = user.getPassword();
			this.userSeq = user.getUserSeq();
        
	}
	
	//Getter ,Setter
	
	public String getNickname() {
		return nickname;
	}

//	public void setNickname(String nickname) {
//		this.nickname = nickname;
//	}

	public String getEmail() {
		return email;
	}

//	public void setEmail(String email) {
//		this.email = email;
//	}

	public boolean isEnable() {
		return enable;
	}

//	public void setEnable(boolean enable) {
//		this.enable = enable;
//	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getGoal() {
		return goal;
	}

//	public void setGoal(String goal) {
//		this.goal = goal;
//	}

	public String getFitType() {
		return fitType;
	}

//	public void setFitType(String fitType) {
//		this.fitType = fitType;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}

	public int getUserSeq() {
		return userSeq;
	}
}


