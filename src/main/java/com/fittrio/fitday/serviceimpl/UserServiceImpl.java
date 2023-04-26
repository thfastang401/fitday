package com.fittrio.fitday.serviceimpl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.config.CustomUser;
import com.fittrio.fitday.dao.UserDAO;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.dto.UserDTO;
import com.fittrio.fitday.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
    @Autowired
    UserDAO dao;

	@Override
	public String getNickNameByUserSeq(int userSeq) {
		return dao.getNickNameByUserSeq(userSeq);
	}

	@Override
	public UserDTO findUserByEmail(String email){return dao.findUserByEmail(email);}
  
	@Override
	public int insertUser(UserDTO dto, BCryptPasswordEncoder passwordEncoder){
		dto.setPassword(passwordEncoder.encode(dto.getPassword()));
		return dao.insertUser(dto);
	}

	@Override
	public List<String> getCommentNickNameByBoardSeq(int boardSeq){
		return dao.getCommentNickNameByBoardSeq(boardSeq);
	}

	@Override
	public void updateUserInfo(UserDTO dto) {
		dao.updateUserInfo(dto);
	}

	@Override
	public String nicknameCheack(String nickname, @AuthenticationPrincipal CustomUser customUser) {
		Optional<UserDTO> byNickname = Optional.ofNullable(dao.findUserByNickname(nickname));

		if (byNickname.isPresent() && customUser.getNickname().equals(nickname)) {
			return "notchange";
		}
		else if (byNickname.isPresent() ) {
			return "no";
		}
		
		return "ok";
	}

	@Override
	public UserDTO findUserByNickname(String nickname) {
		return dao.findUserByNickname(nickname);
	}

	@Override
	public boolean checkPassword(String Email, String password) {
		
		String realPassword = dao.findUserByEmail(Email).getPassword();
		boolean matches = passwordEncoder.matches(password, realPassword);
		return matches;
	}

	@Override
	public List<String> getNickNameJoinBoard(List<BoardDTO> boardList) {
		return dao.getNickNameJoinBoard(boardList);
	}

	@Override
	public void updatePasswordInfo(UserDTO dto) {
		dto.setPassword(passwordEncoder.encode(dto.getPassword()));
		dao.updatePasswordInfo(dto);

	}

	@Override
	public List<String> getNickNameJoinComment(int boardSeq) {
		return dao.getNickNameJoinComment(boardSeq);
	}
	 
}
