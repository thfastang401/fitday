package com.fittrio.fitday.service;

import java.util.List;
import java.util.Map;

import com.fittrio.fitday.dto.UserDTO;

public interface UserService {

	String getNickNameByUserSeq(int userSeq);

	UserDTO findUserByEmail(String email);
  
	int insertUser(UserDTO dto);
	
	List<String> getCommentNickNameByBoardSeq(int boardSeq);
	
	void updateUserInfo(UserDTO dto);

}
