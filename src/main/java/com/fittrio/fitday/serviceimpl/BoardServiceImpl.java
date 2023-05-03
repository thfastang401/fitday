package com.fittrio.fitday.serviceimpl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.BoardDAO;
import com.fittrio.fitday.dao.CommentDAO;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;
import org.springframework.web.multipart.MultipartFile;

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
	public List<BoardDTO> getAllBoardList(int limit) {
		return dao.getAllBoardList(limit);
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

	@Override
	public int getBoardUserSeq(int boardSeq) {
		return dao.getBoardUserSeq(boardSeq);
	}

	@Override
	public List<BoardDTO> getSearchList(Map<String, Object> map) {
		return dao.getSearchResult(map);
	}

	@Override
	public int getSearchListCnt(String keyword) {
		return dao.getSearchListCnt(keyword);
	}

	@Override
	public List<BoardDTO> getRecentCommunityList() {
		return dao.getRecentCommunityList();
	}

	@Override
	public List<BoardDTO> getRecentMissionList() {
		return dao.getRecentMissionList();
	}

	@Override
	public void updateMission(HashMap<String, Object> map) {
		dao.updateMission(map);
	}


//	@Override
//	public void uploadFile(BoardDTO dto, MultipartFile file) throws IOException {
//		String projectPath = System.getProperty("user.dir")+"/src/main/resources/uploads";
//		UUID uuid = UUID.randomUUID();
//		String fileName = uuid + "_" + file.getOriginalFilename();
//		File saveFile = new File(projectPath, fileName);
//		file.transferTo(saveFile);
//		dto.setFileName(fileName);
//		dto.setFilePath("/files/"+fileName);
//
//	}
}
