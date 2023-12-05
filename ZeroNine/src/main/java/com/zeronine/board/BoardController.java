package com.zeronine.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	//board_Main
	@RequestMapping("/")
	public String boardListGet() {
		return "board/boardMain";
	}

	//board_list
	@RequestMapping("/fastboard.do")
	public String fastBoard() {
		return "board/fast_board";
	}
	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard() {
		return "board/free_delivery_board";
	}

	@RequestMapping("/onetooneboard.do")
	public String onetooneBoard() {
		return "board/one_to_one_board";
	}

	//board_edit
	@RequestMapping("/boardEdit.do")
	public String editBoard() {
		return "board/boardEdit";
	}
	@RequestMapping("/completeEdit.do")
	public String compliteEdit() {
		return "board/completeEdit";
	}
	
}
