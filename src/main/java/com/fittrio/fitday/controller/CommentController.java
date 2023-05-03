package com.fittrio.fitday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.fittrio.fitday.service.BoardService;
import com.fittrio.fitday.service.CommentService;
import com.fittrio.fitday.service.UserService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	@Qualifier("commentService")
	CommentService commentService;
	
	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	@Autowired
	@Qualifier("boardService")
	BoardService boardService;
	
	//코멘트 등록
//	@PostMapping("/insert")
//	public ModelAndView insert(CommentDTO commentDto) {
//		ModelAndView mv = new ModelAndView();
//		commentService.insertComment(commentDto);
//		mv.setViewName("redirect:/board/detail/"+commentDto.getBoardSeq());
//		return mv;
//	}
	//코멘트 리스트
	@PostMapping(value={"/list/{boardSeq}"})
	public @ResponseBody Map<String, Object>  list(@PathVariable("boardSeq") int boardSeq){
		Map<String, Object> map = new HashMap<>();
		List<CommentDTO> commentList = commentService.getCommentListByBoardSeq(boardSeq);
		List<String> commentNicknameList = userService.getNickNameJoinComment(boardSeq);
		int boardUserSeq = boardService.getBoardUserSeq(boardSeq);
		map.put("commentList", commentList);//댓글 리스트
		map.put("commentNicknameList", commentNicknameList);//댓글작성자 리스트 map에 넣어서 ajax로 보내기
		map.put("boardUserSeq",boardUserSeq);
		return map;
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

	//코멘트 수정
	@PostMapping(value= {"/update"})
	public @ResponseBody String updateComment(@RequestBody CommentDTO commentDto ) {
		commentService.updateComment(commentDto);
		return "success";
	}
	
	
}
