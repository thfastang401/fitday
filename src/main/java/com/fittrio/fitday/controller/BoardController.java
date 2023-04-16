package com.fittrio.fitday.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    @Qualifier("boardService")
    BoardService boardService;

    //폼 확인용
//    @GetMapping("/list")
//    public String list() {
//    	return "board/list";
//    }
    
    @GetMapping("/list")
    public ModelAndView list() {
    	ModelAndView mv = new ModelAndView();
    	int boardCnt = boardService.getAllBoardCnt();//총 게시글 갯수 가져오기
    	List<BoardDTO> boardList= boardService.getAllBoardList();//모든 게시글 내용 가져오기
    	for(BoardDTO dto: boardList) {
    		System.out.println(dto.getTitle()+dto.getContent());
    	}
    	mv.addObject("boardList",boardList);
    	mv.setViewName("board/list");
    	return mv;
    }
    
}
