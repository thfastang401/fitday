package com.fittrio.fitday.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.fittrio.fitday.service.BoardService;

@Controller
public class BoardController {
    @Autowired
    @Qualifier("boardService")
    BoardService service;

}
