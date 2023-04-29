package com.fittrio.fitday.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fittrio.fitday.dto.BoardDTO;
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
    @GetMapping(value = {"/list/{page}"})
    public ModelAndView list(@PathVariable("page") int page) {
    	ModelAndView mv = new ModelAndView();
    	int boardCnt = boardService.getAllBoardCnt();//총 게시글 갯수 가져오기
    	int limit = (page - 1)*10; //페이징
    	List<BoardDTO> boardList= boardService.getAllBoardList(limit);//모든 게시글 내용 가져오기
    	List<String> nickNameList = userService.getNickNameJoinBoard(boardList);
    	mv.addObject("boardCnt", boardCnt);
    	mv.addObject("nickNameList",nickNameList);
    	mv.addObject("boardList",boardList);
    	mv.setViewName("board/list");
    	return mv;
    }
    
    //ajax 커뮤니티게시판 목록
//    @GetMapping(value = {"/list/{page}"})
//    public @ResponseBody ModelAndView list(@RequestBody @PathVariable("page") int page) {
//    	ModelAndView mv = new ModelAndView();
//    	int boardCnt = boardService.getAllBoardCnt();//총 게시글 갯수 가져오기
//    	int limit = (page - 1)*10; //페이징
//    	List<BoardDTO> boardList= boardService.getAllBoardList(limit);//모든 게시글 내용 가져오기
//    	List<String> nickNameList = userService.getNickNameJoinBoard(boardList);
//    	mv.addObject("boardCnt", boardCnt);
//    	mv.addObject("nickNameList",nickNameList);
//    	mv.addObject("boardList",boardList);
//    	mv.setViewName("board/list");
//    	return mv;
//    }

//    //게시글 상세화면
    @GetMapping(value={"/detail/{boardSeq}"})
    public ModelAndView detail(@PathVariable("boardSeq") int boardSeq) {
    	ModelAndView mv = new ModelAndView();
    	boardService.updateViewCount(boardSeq);
    	BoardDTO dto = boardService.getOneBoard(boardSeq);//게시글 내용 가져오기
    	String boardNickName = userService.getNickNameByUserSeq(dto.getUserSeq());//작성자 닉네임 가져오기
    	List<String> commentNickName = userService.getCommentNickNameByBoardSeq(boardSeq);
    	mv.addObject("nickName",boardNickName);
    	mv.addObject("commentNick",commentNickName);
    	mv.addObject("board", dto);
    	mv.setViewName("board/detail");
    	return mv;
    }
    
  //게시글 상세화면
//    @GetMapping(value={"/detail/{boardSeq}"})
//    @ResponseBody
//    public Map<String, Object> detail(@PathVariable("boardSeq") int boardSeq) {
//    	Map<String,Object> resultMap = new HashMap<>();
//    	boardService.updateViewCount(boardSeq);
//    	BoardDTO dto = boardService.getOneBoard(boardSeq);//게시글 내용 가져오기
//    	String boardNickName = userService.getNickNameByUserSeq(dto.getUserSeq());//작성자 닉네임 가져오기
//    	List<CommentDTO> commentList = commentService.getCommentListByBoardSeq(boardSeq);//댓글 목록 가져오기
//    	List<String> commentNickName = userService.getCommentNickNameByBoardSeq(boardSeq);
//    	resultMap.put("commentList",commentList);
//    	resultMap.put("nickName",boardNickName);
//    	resultMap.put("commentNick",commentNickName);
//    	resultMap.put("board", dto);
//    	return resultMap;
//    }
    
    @GetMapping("/form")
    public String form() {
    	return "board/form";
    }
    
    //글 작성
    @PostMapping("/form")
    public ModelAndView form(@Valid BoardDTO dto) {
    	ModelAndView mv = new ModelAndView();
//    	if (bindResult.hasErrors()) {
//			mv.getModel().putAll(bindResult.getModel());
//			return mv;
//		}
//    	try {
    		boardService.insertBoard(dto);
    		mv.setViewName("redirect:list");    		
//    	}catch (Exception e) {
//			e.printStackTrace();
//			bindResult.reject("error.board.insert");
//			mv.getModel().putAll(bindResult.getModel());
//			return mv;
//		}
    	mv.setViewName("redirect:/board/list/1");
    	return mv;
    }
    
    //글 삭제
    @GetMapping(value = {"/delete/{boardSeq}"})
    public ModelAndView deleteBoard(@PathVariable("boardSeq") int boardSeq) {
    	ModelAndView mv = new ModelAndView();
    	boardService.deleteBoard(boardSeq);
    	mv.setViewName("redirect:/board/list/1");
    	return mv;
    }
    
    //글 수정 폼 보여주기
    @PostMapping(value= {"/updateForm/{boardSeq}"})
    public ModelAndView updateForm(@PathVariable("boardSeq") int boardSeq) {
    	ModelAndView mv = new ModelAndView();
    	BoardDTO boardDetail = boardService.getOneBoard(boardSeq);
    	mv.addObject("board",boardDetail);
    	mv.setViewName("board/updateForm");
        return mv;
    }
    //글 수정
    @PostMapping(value= {"/update/{boardSeq}"})
    public String update(@PathVariable("boardSeq") int boardSeq, BoardDTO dto) {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("dto", dto);
    	map.put("boardSeq", boardSeq);
    	boardService.updateBoard(map);
    	
    	return "redirect:/board/detail/"+boardSeq;
    }
    
    //검색결과
    @GetMapping(value= {"/searchResult/{page}"})
    public ModelAndView searchResult(String keyword, @PathVariable("page") int page) {
    	ModelAndView mv = new ModelAndView();
    	Map<String, Object> map = new HashMap<>();
    	List<String> searchNickNameList = new ArrayList<>();
    	int limit = (page - 1)*10;
    	map.put("keyword", keyword);
    	map.put("limit", limit);
    	List<BoardDTO> searchList = boardService.getSearchList(map);//검색 내용 리스트 불러오기
    	if(searchList.size()!= 0) {
    		searchNickNameList = userService.getNickNameJoinBoard(searchList);//검색시 작성자 닉네임 가져오기
    		mv.addObject("searchNickNameList", searchNickNameList);
    	}else {
    		mv.addObject("searchNickNameList", null);
    	}
    	mv.addObject("searchCnt", searchList.size());
    	mv.addObject("keyword",keyword);
    	mv.addObject("searchList", searchList);
    	mv.setViewName("board/search");
    	return mv;
    }
    
   

	//missionList 가져오기
    @GetMapping("/mission/list")
	public ModelAndView missionList(){
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> missionList = boardService.getAllMissionList();
		mv.addObject("missionList",missionList);
		mv.setViewName("board/mission/list");
		return mv;
	}

	@GetMapping("/mission/form")
	public String insertMission() {return "board/mission/form";}


	@GetMapping("/mission/detail/{seq}")
	public ModelAndView getOneMission(@PathVariable int seq) {
		ModelAndView mv = new ModelAndView();
		BoardDTO dto = boardService.getOneBoard(seq);
		mv.addObject("mission", dto);
		mv.setViewName("board/mission/detail");
		return mv;
	}

    
    
    
    
}
