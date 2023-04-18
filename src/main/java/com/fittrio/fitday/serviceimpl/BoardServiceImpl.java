package com.fittrio.fitday.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.BoardDAO;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;

	@Override
	public int getAllBoardCnt() {
		return dao.getAllBoardCnt();
	}

	@Override
	public List<BoardDTO> getAllBoardList() {
		return dao.getAllBoardList();
	}

	@Override
	public BoardDTO getOneBoard(int boardSeq) {
		return dao.getOneBoard(boardSeq);
	}

	@Override
	public void insertBoard(BoardDTO dto) {
		dao.insertBoard(dto);
	}
	
	
}
