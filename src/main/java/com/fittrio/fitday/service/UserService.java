package com.fittrio.fitday.service;

import com.fittrio.fitday.dto.UserDTO;

public interface UserService {

	String getNickNameByUserSeq(int userSeq); 
	
	UserDTO findUserByEmail(String email);
}
