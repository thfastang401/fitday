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



}
