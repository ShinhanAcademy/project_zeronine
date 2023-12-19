package com.zeronine.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.zeronine.model.BoardService_yn;

@Controller
public class CommonController {
	
	@Autowired
	BoardService_yn boardService;
	
	@GetMapping("/common/participateBoard.do")
	public void participateBoard(String boardId, Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String,Object>> myCart = boardService.myCartFast(customerId);
		model.addAttribute("myCart", myCart);
		model.addAttribute("boardId", boardId);
	}
}
