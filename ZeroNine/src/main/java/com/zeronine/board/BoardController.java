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
		
		logger.info("controller ����: {}", info);
		
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
		logger.info("controller ���� Ÿ�� :{}   ", boardType);
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
		System.out.println("���� controller�� sysout :: edit�� �Ϸ��ϸ� value�� ������ ����;�" + boardListType);
		return "board/completeEdit";
	}
	
	@RequestMapping("/boardDetail.do")
	public String boardDetail(@RequestParam("boardId") String board_id ,Model model) {		
		Map<String, Object> detail = boardService.selectDetailView(board_id);
		model.addAttribute("detail", detail);
		
		logger.info("controller ���� ���̵� : {}", board_id);
		logger.info("controller ������ ����: {}", detail);
		
		return "common/detailView";
	}
	
	

	
}
 
