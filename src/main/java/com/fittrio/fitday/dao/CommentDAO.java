package com.fittrio.fitday.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.dto.CommentDTO;

@Mapper
@Repository
public interface CommentDAO {

	List<CommentDTO> getCommentListByBoardSeq(int boardSeq);
	void insertComment(CommentDTO commentDto);
	void deleteCommentByBoardSeq(int boardSeq);	
	void deleteComment(int commentSeq);
	void updateComment(CommentDTO commentDto);
	void deleteCommentByUserSeq(int userSeq);
	void deleteBoardCommentByUserSeq(int userSeq);
	List<Integer> getCommentCntByboardSeq();
}
