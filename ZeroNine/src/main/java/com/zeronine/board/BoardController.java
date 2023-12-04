package com.zeronine.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/boardList.do")
	public String boardListGet() {
		return "board/boardMain";
	}

	@RequestMapping("/boardFast.do")
	public String fastBoard() {
		return "board/boardFast";
	}

	@RequestMapping("/boardEdit.do")
	public String editBoard() {
		return "board/boardEdit";
	}

}
