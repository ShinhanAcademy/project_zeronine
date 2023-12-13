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
		List<Map<String, Object>> info = boardService.selectfastBoardList();
		model.addAttribute("info", info);
		
		logger.info("controller 정보: {}", info);
		
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
	public String editBoard(@RequestParam(name="boardType") String boardType, Model model) {
		logger.info("controller 보드 타입 :{}   ", boardType);
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
		System.out.println("나는 controller의 sysout :: edit를 완료하면 value가 오는지 보고싶어" + boardListType);
		return "board/completeEdit";
	}
	
	@RequestMapping("/boardDetail.do")
	public String boardDetail(@RequestParam("boardId") String board_id ,Model model) {		
		Map<String, Object> detail = boardService.selectDetailView(board_id);
		model.addAttribute("detail", detail);
		
		logger.info("controller 보드 아이디 : {}", board_id);
		logger.info("controller 디테일 정보: {}", detail);
		
		return "common/detailView";
	}
	
	

	
}
 
