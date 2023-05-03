package com.fittrio.fitday.service;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.fittrio.fitday.config.CustomUser;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.dto.UserDTO;

public interface UserService {

	String getNickNameByUserSeq(int userSeq);

	UserDTO findUserByEmail(String email);
  
	int insertUser(UserDTO dto, BCryptPasswordEncoder passwordEncoder);
	
	List<String> getCommentNickNameByBoardSeq(int boardSeq);
	
	void updateUserInfo(UserDTO dto);
	
	String nicknameCheck(String nickname, CustomUser customUser);
	
	UserDTO findUserByNickname(String nickname);
	
	boolean checkPassword (String Email, String password);

	List<String> getNickNameJoinBoard(List<BoardDTO> boardList);

	List<String> getNicknameMission(List<BoardDTO> missionList);

	void updatePasswordInfo(UserDTO dto);

	List<String> getNickNameJoinComment(int boardSeq);
	
	void deleteUserByUserSeq(int UserSeq);

}
