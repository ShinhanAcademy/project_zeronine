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
		return "board/fastBoard";
	}
	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard() {
		return "board/freeDeliveryBoard";
	}

	@RequestMapping("/onetooneboard.do")
	public String onetooneBoard() {
		return "board/oneTooneBoard";
	}

	//board_edit
	@RequestMapping("/boardedit.do")
	public String editBoard() {
		return "board/boardEdit";
	}
	@RequestMapping("/fboardedit.do")
	public String editFBoard() {
		return "board/fastEdit";
	}
	@RequestMapping("/fdboardedit.do")
	public String editFDBoard() {
		return "board/freeDeliveryEdit";
	}
	@RequestMapping("/oboardedit.do")
	public String editOBoard() {
		return "board/onTooneEdit";
	}
	@RequestMapping("/completeedit.do")
	public String compliteEdit() {
		return "board/completeEdit";
	}
	
}
 
