package com.kh.ITWorks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("list.bo")
	public String listAllBoardView() {
		return "board/board_sidebar";
	}
	

}
