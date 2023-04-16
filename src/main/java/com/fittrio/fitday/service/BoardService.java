package com.fittrio.fitday.service;

import java.util.List;

import com.fittrio.fitday.dto.BoardDTO;

public interface BoardService {

	int getAllBoardCnt();

	List<BoardDTO> getAllBoardList();
    

}
