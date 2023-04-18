package com.fittrio.fitday.serviceimpl;

import com.fittrio.fitday.dao.UserDAO;
import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO dao;

	@Override
	public String getNickNameByUserSeq(int userSeq) {
		return dao.getNickNameByUserSeq(userSeq);
	}

	@Override
	public UserDTO findUserByEmail(String email) {
		return dao.findUserByEmail(email);
	}
}
