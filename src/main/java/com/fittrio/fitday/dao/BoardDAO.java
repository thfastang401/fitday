package com.fittrio.fitday.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.fittrio.fitday.dto.BoardDTO;

@Mapper
@Repository
public interface BoardDAO {

	int getAllBoardCnt();

	List<BoardDTO> getAllBoardList(int limit);

	BoardDTO getOneBoard(int boardSeq);
	
	void insertBoard(BoardDTO dto);
		
	void deleteBoard(int boardSeq);
	
	void updateViewCount(int boardSeq);
	
	void updateBoard(HashMap<String, Object> map);

	List<BoardDTO> getAllMissionList();

	void insertMission(BoardDTO dto);
	
	void deleteBoardByUserSeq(int userSeq);

	int getBoardUserSeq(int boardSeq);

	List<BoardDTO> getSearchResult(Map<String, Object> map);

	int getSearchListCnt(String keyword);

	List<BoardDTO> getRecentBoardList();

	List<BoardDTO> getRecentCommunityList();

	List<BoardDTO> getRecentMissionList();

	void updateMission(HashMap<String, Object> map);


}
