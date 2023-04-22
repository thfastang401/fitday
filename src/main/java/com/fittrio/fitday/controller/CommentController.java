package com.fittrio.fitday.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fittrio.fitday.dto.CommentDTO;
import com.fittrio.fitday.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	@Qualifier("commentService")
	CommentService commentService;
	
	//코멘트 등록
//	@PostMapping("/insert")
//	public ModelAndView insert(CommentDTO commentDto) {
//		ModelAndView mv = new ModelAndView();
//		commentService.insertComment(commentDto);
//		mv.setViewName("redirect:/board/detail/"+commentDto.getBoardSeq());
//		return mv;
//	}
	//코멘트 리스트
	@GetMapping(value={"/list/{boardSeq}"})
	public @ResponseBody List<CommentDTO> list(@PathVariable("boardSeq") int boardSeq){
		List<CommentDTO> commentList = commentService.getCommentListByBoardSeq(boardSeq);
		return commentList;
	}
	
	//코멘트 등록
	@PostMapping("/insert")
	public @ResponseBody String insert(@RequestBody CommentDTO commentDto) {
		commentService.insertComment(commentDto);
//		mv.setViewName("redirect:/board/detail/"+commentDto.getBoardSeq());
		return "success";
	}
	
//	//코멘트 삭제
//	@GetMapping(value={"/delete/{boardSeq}/{commentSeq}"})
//	public String deleteComment(@PathVariable("boardSeq") int boardSeq, @PathVariable("commentSeq") int commentSeq) {
//		commentService.deleteComment(commentSeq);
//		return "redirect:/board/detail/"+boardSeq;
//	}
	
	//코멘트 삭제
	@PostMapping(value={"/delete/{boardSeq}/{commentSeq}"})
	public @ResponseBody String deleteComment(@PathVariable("boardSeq") int boardSeq, @PathVariable("commentSeq") int commentSeq) {
	    commentService.deleteComment(commentSeq);
	    return "success";
	}

	@PostMapping(value= {"/update/{boardSeq}/{commentSeq}"})
	public @ResponseBody String updateComment(@PathVariable("boardSeq") int boardSeq, @PathVariable("commentSeq") int commentSeq, String content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("content", content);
		map.put("commentSeq", commentSeq);
		commentService.updateComment(map);
		return "success";
	}
	
	
}
