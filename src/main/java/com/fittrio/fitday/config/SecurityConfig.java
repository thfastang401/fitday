package com.fittrio.fitday.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	 @Bean
	    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		 
		 http.csrf().disable().cors().disable()      // csrf 보안 해제
	                .authorizeHttpRequests()
	                	.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll() 
	                	.requestMatchers("/board/detail/*" ,"/user/mypage","/user/mypage/*","/board/form").authenticated() // 로그인해야 접근 가능한 페이지
	                    .anyRequest().permitAll()	// 요청 모두 허용
	                .and()
	                .formLogin()	// form 방식 로그인 사용
	                	.loginPage("/user/login")	// 커스텀 로그인 페이지 지정
//	                	.loginProcessingUrl("/user/login-process")	// submit 받을 url
	                	.usernameParameter("email") 	// submit할 아이디 변수 설정
	                	.passwordParameter("password")	// submit할 비밀번호 변수 설정
	                    .defaultSuccessUrl("/", true)	// 로그인 성공 시 메인페이지로
//	                    .failureUrl("/user/login?error")
//	                    .failureHandler((request, response, exception) -> {
//	                        String errorMessage = "error";
//	                        if (exception instanceof BadCredentialsException) {
//	                            errorMessage = "userid error";
//	                        }
//	                        else if (exception instanceof UsernameNotFoundException) {
//	                        	errorMessage = "no user";
//	                        }
//	                        String redirectUrl = "/user/login?error=" + errorMessage;
//	                        response.sendRedirect(redirectUrl);
//	                    })
	                    .permitAll()
	                .and()
	                .logout() // 로그아웃은 기본설정으로 (/logout으로 인증해제)
	                .and()
	                .exceptionHandling()
	                	.accessDeniedPage("/error")
	                ;	
	        	
	        return http.build();
	    }
	 @Bean
	 public BCryptPasswordEncoder passwordEncoder() {
		 return new BCryptPasswordEncoder(); // 이후 수정할것
	 }

}