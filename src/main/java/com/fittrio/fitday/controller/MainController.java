package com.fittrio.fitday.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fittrio.fitday.config.CustomUser;
import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;


@Controller
public class MainController {
	
	@Autowired
    @Qualifier("boardService")
    BoardService boardService;
	
	@GetMapping("/")
    public String main(@AuthenticationPrincipal CustomUser customUser, Model model) {
		if(customUser != null) {
			model.addAttribute("loginId", customUser.getUsername());
			model.addAttribute("loginNickname", customUser.getNickname());
			model.addAttribute("loginRoles", customUser.getAuthorities());
		}
		List<BoardDTO> list = boardService.getRecentBoardList();
		model.addAttribute("recentBoardList", list);
        return "main";
    }
	
	@GetMapping("/error")
	public String errorView() {
		return "error";
	}
	
	
	
	
}
