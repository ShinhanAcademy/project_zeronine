package com.zeronine.board;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zeronine.model.BoardService_jy;

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
		List<Map<String, Object>> infoFb = boardService.selectFastBoardList();
		model.addAttribute("infoFb", infoFb);
		
		logger.info("controller fast정보: {}", infoFb);
		
		return "board/fastBoard";
	}
	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard() {
		return "board/freeDeliveryBoard";
	}

	@RequestMapping("/onetooneboard.do")
	public String onetooneBoard(Model model) {
		List<Map<String, Object>> infoOne = boardService.selectOneBoardList();
		logger.info("controller infoOne 정보: {}", infoOne);
		model.addAttribute("infoOne", infoOne);
		return "board/oneTooneBoard";
	}

	//board_edit
	@RequestMapping("/boardedit.do")
	public String editBoard(@RequestParam(name="boardType") String boardType, Model model) {
		logger.info("controller 보드 타입 정보 :{}   ", boardType);
		model.addAttribute("boardType", boardType);
		return "board/boardEdit";
	}
	@RequestMapping("/fastEdit.do")
	public String editFBoard() {
		return "board/fastEdit";
	}
	@RequestMapping("/freeDeliveryEdit.do")
	public String editFDBoard() {
		return "board/freeDeliveryEdit";
	}
	@RequestMapping("/oneTooneEdit.do")
	public String editOBoard() {
		return "board/onTooneEdit";
	}
	@RequestMapping("/completeedit.do")
	public String compliteEdit(@RequestParam("send_bt_to_com")String boardListType, Model model ) {
		String lower_boardListType = boardListType.toLowerCase();
		model.addAttribute("boardListType", lower_boardListType);
		System.out.println("controller에서 게시글 작성 후 넘어가는 보드 타입 알고싶어~~" + boardListType);
		return "board/completeEdit";
	}
	
	@RequestMapping("/fastboardDetail.do")
	public String fastboardDetail(@RequestParam("boardId") String board_id ,Model model) {		
		Map<String, Object> detail = boardService.selectFastDetail(board_id);
		model.addAttribute("detail", detail);
		
		logger.info("controller fast 디테일 아이디 : {}", board_id);
		logger.info("controller fast 디테일 내용: {}", detail);
		
		return "board/fastDetailView";
	}
	
	/*
	 * @RequestMapping("/freeboardDetail.do") public String
	 * freeboardDetail(@RequestParam("boardId") String board_id ,Model model) {
	 * Map<String, Object> detail = boardService.selectFreeDetail(board_id);
	 * model.addAttribute("detail", detail);
	 * 
	 * logger.info("controller free 디테일 아이디 : {}", board_id);
	 * logger.info("controller free 디테일 내용: {}", detail);
	 * 
	 * return "board/freeDetailView"; }
	 */
	
	@RequestMapping("/oneboardDetail.do")
	public String oneboardDetail(@RequestParam("boardId") String board_id ,Model model) {		
		Map<String, Object> detail = boardService.selectOneDetail(board_id);
		model.addAttribute("detail", detail);
		
		logger.info("controller one 디테일 아이디 : {}", board_id);
		logger.info("controller one 디테일 내용: {}", detail);
		
		return "board/oneDetailView";
	}
	
	

	
}
 
