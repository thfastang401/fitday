package com.fittrio.fitday.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.service.BoardService;
import com.fittrio.fitday.service.CommentService;
import com.fittrio.fitday.service.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    @Qualifier("boardService")
    BoardService boardService;
    
    @Autowired
    @Qualifier("userService")
    UserService userService;
    
    @Autowired
    @Qualifier("commentService")
    CommentService commentService;

    //커뮤니티게시판 목록
    @GetMapping("/list")
    public ModelAndView list() {
    	ModelAndView mv = new ModelAndView();
    	int boardCnt = boardService.getAllBoardCnt();//총 게시글 갯수 가져오기
//    	int limit = *1; //페이징
    	List<BoardDTO> boardList= boardService.getAllBoardList();//모든 게시글 내용 가져오기
    	
    	mv.addObject("boardList",boardList);
    	mv.setViewName("board/list");
    	return mv;
    }
    
    //게시글 상세화면
    @GetMapping(value={"/detail/{boardSeq}"})
    public ModelAndView detail(@PathVariable("boardSeq") int boardSeq) {
    	ModelAndView mv = new ModelAndView();
    	BoardDTO dto = boardService.getOneBoard(boardSeq);//게시글 내용 가져오기
    	String nickName = userService.getNickNameByUserSeq(dto.getUserSeq());//작성자 닉네임 가져오기
    	List<CommentDTO> commentList = commentService.getCommentListByBoardSeq(boardSeq);
    	mv.addObject("commentList",commentList);
    	mv.addObject("nickName",nickName);
    	mv.addObject("board", dto);
    	mv.setViewName("board/detail");
    	return mv;
    }
    
    @GetMapping("/form")
    public String form() {
    	return "board/form";
    }
    
    //글 작성
    @PostMapping("/form")
    public ModelAndView form(@Valid BoardDTO dto, BindingResult bindResult) {
    	ModelAndView mv = new ModelAndView();
    	if (bindResult.hasErrors()) {
			mv.getModel().putAll(bindResult.getModel());
			return mv;
		}
    	try {
    		boardService.insertBoard(dto);
    		mv.setViewName("redirect:list");    		
    	}catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.board.insert");
			mv.getModel().putAll(bindResult.getModel());
			return mv;
		}
    	mv.setViewName("redirect:board/list");
    	return mv;
    }
    
    //글 삭제
    @GetMapping(value = {"/delete/{boardSeq}"})
    public ModelAndView deleteBoard(@PathVariable("boardSeq") int boardSeq) {
    	ModelAndView mv = new ModelAndView();
    	System.out.println(boardSeq);
    	boardService.deleteBoard(boardSeq);
    	mv.setViewName("redirect:/board/list");
    	return mv;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
