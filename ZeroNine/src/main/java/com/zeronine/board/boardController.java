package com.zeronine.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class boardController {

	@RequestMapping("/boardList.do")
	public String boardListGet() {
		return "board/boardMain";
	}
	
	@RequestMapping("/boardFast.do")
	public String fastBoard() {
		return "board/boardfast";
	}
	
	
}
