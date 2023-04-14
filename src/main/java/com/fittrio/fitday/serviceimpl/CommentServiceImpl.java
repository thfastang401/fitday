package com.fittrio.fitday.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.CommentDAO;
import com.fittrio.fitday.service.CommentService;

@Service("commentservice")
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDAO dao;
	
	
}
