package com.fittrio.fitday.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	@Qualifier("commentService")
	CommentService commentService;
	
	//코멘트 등록
	@PostMapping("/insert")
	public ModelAndView insert(CommentDTO commentDto) {
		ModelAndView mv = new ModelAndView();
		commentService.insertComment(commentDto);
		mv.setViewName("redirect:/board/detail/"+commentDto.getBoardSeq());
		return mv;
	}
	
	//코멘트 삭제
	@GetMapping(value={"/delete/{boardSeq}/{commentSeq}"})
	public String deleteComment(@PathVariable("boardSeq") int boardSeq, @PathVariable("commentSeq") int commentSeq) {
		commentService.deleteComment(commentSeq);
		return "redirect:/board/detail/"+boardSeq;
	}
	
}
