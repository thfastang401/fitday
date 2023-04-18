package com.fittrio.fitday.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.fittrio.fitday.dto.UserDTO;

@Mapper
@Repository
public interface UserDAO {
	
	String getNickNameByUserSeq(int userSeq);
	
	UserDTO findUserByEmail(String email);
}
