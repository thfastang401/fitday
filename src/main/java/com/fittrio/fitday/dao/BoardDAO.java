package com.fittrio.fitday.dao;

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
		
	void deleteBoard(int BoardSeq);
}
