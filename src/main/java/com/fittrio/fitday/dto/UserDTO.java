package com.fittrio.fitday.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class UserDTO {

    private int userSeq;

    @Email(message = "이메일 양식에 맞게 입력해주세요.")
    private String email;

    @NotEmpty(message = "닉네임을 입력해주세요.")
    @Size(max = 10, message = "10자 이하로 입력해주세요.")
    private String nickname;

    private String password;
    private String fitType;

    private String date;
    private String goal;
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFitType() {
		return fitType;
	}
	public void setFitType(String fitType) {
		this.fitType = fitType;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}



}
