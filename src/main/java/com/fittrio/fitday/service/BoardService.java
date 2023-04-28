package com.fittrio.fitday.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.fittrio.fitday.dto.BoardDTO;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {

	int getAllBoardCnt();

	List<BoardDTO> getAllBoardList(int limit);

	BoardDTO getOneBoard(int boardSeq);

	void insertBoard(BoardDTO dto);
    
	void deleteBoard(int boardSeq);
	
	void updateViewCount(int boardSeq);
	
	void updateBoard(HashMap<String,Object> map);

	List<BoardDTO> getAllMissionList();

	void insertMission(BoardDTO dto);
	
	void deleteBoardByUserSeq(int userSeq);

	int getBoardUserSeq(int boardSeq);

	void uploadFile(BoardDTO dto, MultipartFile file) throws IOException;

}
