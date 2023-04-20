package com.fittrio.fitday.service;

import java.util.List;

import com.fittrio.fitday.dto.CommentDTO;

public interface CommentService {
    List<CommentDTO> getCommentListByBoardSeq(int boardSeq);
    void insertComment(CommentDTO commentDto);
    void deleteComment(int commentSeq);
}
