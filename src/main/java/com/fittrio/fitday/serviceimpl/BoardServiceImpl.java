package com.fittrio.fitday.serviceimpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.BoardDAO;
import com.fittrio.fitday.dao.CommentDAO;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;
	
	@Autowired
	CommentDAO commentDao;

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
	
	@Override
	public void deleteBoard(int boardSeq) {
		commentDao.deleteCommentByBoardSeq(boardSeq);
		dao.deleteBoard(boardSeq);
	}
	
	@Override
	public void updateViewCount(int boardSeq) {
		dao.updateViewCount(boardSeq);
	}

	@Override
	public void updateBoard(HashMap<String, Object> map) {
		dao.updateBoard(map);
	}

	//mission
	@Override
	public List<BoardDTO> getAllMissionList(){return dao.getAllMissionList();}

	@Override
	public void insertMission(BoardDTO dto) {
		dao.insertMission(dto);
	}

	@Override
	public void deleteBoardByUserSeq(int userSeq) {
		dao.deleteBoardByUserSeq(userSeq);
	}
}
