package com.fittrio.fitday.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.UserDAO;
import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO dao;

	@Override
	public String getNickNameByUserSeq(int userSeq) {
		return dao.getNickNameByUserSeq(userSeq);
	}

	@Override
	public UserDTO findUserByEmail(String email){return dao.findUserByEmail(email);}
  
	@Override
	public int insertUser(UserDTO dto){return dao.insertUser(dto);}

	@Override
	public List<String> getCommentNickNameByBoardSeq(int boardSeq){
		return dao.getCommentNickNameByBoardSeq(boardSeq);
	}
	 
}
