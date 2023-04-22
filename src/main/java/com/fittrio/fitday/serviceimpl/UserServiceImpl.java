package com.fittrio.fitday.serviceimpl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.config.CustomUser;
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

	@Override
	public void updateUserInfo(UserDTO dto) {
		dao.updateUserInfo(dto);
	}

	@Override
	public boolean nicknameCheack(String nickname, @AuthenticationPrincipal CustomUser customUser) {
		Optional<UserDTO> byNickname = Optional.ofNullable(dao.findUserByNickname(nickname));
		
		if (byNickname.isPresent()) {
			return false;
		}
		else if (byNickname.isPresent() && customUser.getNickname().equals(nickname)) {
			return true;
		}
		
		return true;
	}

	@Override
	public UserDTO findUserByNickname(String nickname) {
		return dao.findUserByNickname(nickname);
	}
	 
}
