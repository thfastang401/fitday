package com.fittrio.fitday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.dto.UserDTO;

@Mapper
@Repository
public interface UserDAO {
	
	String getNickNameByUserSeq(int userSeq);
  
	UserDTO findUserByEmail(String email);
  
	int insertUser(UserDTO dto);
	
	List<String> getCommentNickNameByBoardSeq(int boardSeq);

	void updateUserInfo(UserDTO dto);

	UserDTO findUserByNickname(String nickname);
	
	List<String> getNickNameJoinBoard(List<BoardDTO> boardList);

	List<String> getNicknameMission(List<BoardDTO> missionList);

	void updatePasswordInfo(UserDTO dto);

	List<String> getNickNameJoinComment(int boardSeq);
	
	void deleteUserByUserSeq(int UserSeq);
}
