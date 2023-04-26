package com.fittrio.fitday.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.fittrio.fitday.dto.BoardDTO;

@Mapper
@Repository
public interface BoardDAO {

	int getAllBoardCnt();

	List<BoardDTO> getAllBoardList();

	BoardDTO getOneBoard(int boardSeq);
	
	void insertBoard(BoardDTO dto);
		
	void deleteBoard(int boardSeq);
	
	void updateViewCount(int boardSeq);
	
	void updateBoard(HashMap<String, Object> map);

	List<BoardDTO> getAllMissionList();

	void insertMission(BoardDTO dto);
	
	void deleteBoardByUserSeq(int userSeq);
}
