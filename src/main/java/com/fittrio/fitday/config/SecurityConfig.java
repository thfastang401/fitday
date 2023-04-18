package com.fittrio.fitday.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	                	.requestMatchers("/", "/board/list").permitAll() // 로그인 없이도 접근 가능한 페이지
	                        .anyRequest().authenticated()	// 어떠한 요청이라도 인증필요
	                .and()
	                .formLogin()	// form 방식 로그인 사용
	                		.loginPage("/user/login")	// 커스텀 로그인 페이지 지정
//	                		.loginProcessingUrl("/user/login-process")	// submit 받을 url
	                		.usernameParameter("email") 	// submit할 아이디 변수 설정
	                		.passwordParameter("password")	// submit할 비밀번호 변수 설정
	                        .defaultSuccessUrl("/", true)	// 로그인 성공 시 메인페이지로
//	                        .failureUrl("/user/login?error")
//	                        .failureHandler((request, response, exception) -> {
//	                            String errorMessage = "error";
//	                            if (exception instanceof BadCredentialsException) {
//	                                errorMessage = "userid error";
//	                            }
//	                            else if (exception instanceof UsernameNotFoundException) {
//	                            	errorMessage = "no user";
//	                            }
//	                            String redirectUrl = "/user/login?error=" + errorMessage;
//	                            response.sendRedirect(redirectUrl);
//	                        })
	                        .permitAll()	// 대시보드 이동이 막히면 안되므로 얘는 허용
	                .and()
	                .logout();	// 로그아웃은 기본설정으로 (/logout으로 인증해제)

	        return http.build();
	    }
	 @Bean
	 PasswordEncoder passwordEncoder() {
	     return new SimplePasswordEncoder(); // 이후 수정할것
	 }

}