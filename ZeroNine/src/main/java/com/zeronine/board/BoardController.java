package com.zeronine.board;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeronine.model.BoardDAOMybatis_jy;
import com.zeronine.model.BoardService_jy;
import com.zeronine.model.ProductDAOMybatis;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService_jy boardService;
	Logger logger= LoggerFactory.getLogger(BoardController.class);

	//board_Main
	@RequestMapping("/")
	public String boardListGet() {
		return "board/boardMain";
	}

	//board_list
	@RequestMapping("/fastboard.do")
	public String fastBoard(Model model) {		
		List<Map<String, Object>> info = boardService.selectfastBoardList();
		model.addAttribute("info", info);
		
		logger.info("Á¤º¸: {}", info);
		
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
	
	@Autowired
	BoardDAOMybatis_jy dao;
	
	/*
	 * @RequestMapping("/completeedit2.do") public String compliteEdit2() {
	 * dao.function(); return "board/completeEdit"; }
	 */
	
}
 
