package com.fittrio.fitday.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.fittrio.fitday.dao.BoardDAO;
import com.fittrio.fitday.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;
	
	
}
