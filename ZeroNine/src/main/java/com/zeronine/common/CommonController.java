package com.zeronine.common;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.CustomerVO;
import com.zeronine.dto.ProductVO;
import com.zeronine.model.BoardService_yn;
import com.zeronine.model.CustomerService;
import com.zeronine.myPage.MyPageController;

@Controller
public class CommonController {
	
	@Autowired
	BoardService_yn boardService;
	@Autowired
	CustomerService customerService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@GetMapping("/common/participateBoard.do")
	public void participateBoard(String boardId, Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("boardId", boardId);
		Map<String,Object> info = boardService.fastBoardProduct(boardId);
		int remainCount = boardService.boardpCount(boardId);
		model.addAttribute("info", info);
		model.addAttribute("remainCount", remainCount);
	}
	
	@PostMapping("/common/orderFast.do")
	public void orderFast(HttpServletRequest request, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		String productId = request.getParameter("productId");
		int count = Integer.parseInt(request.getParameter("count"));
		ProductVO product = boardService.selectByPid(productId);
		CustomerVO customer =  customerService.selectById(customerId);
		model.addAttribute("count",count);
		model.addAttribute("product",product);
		model.addAttribute("customer",customer);
	}
	
	@PostMapping(value="/common/orderSuccess.do", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String orderSuccess(String productId, int count, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		String boardId = (String)session.getAttribute("boardId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		String message;
		int isFastProduct = boardService.orderFastProduct(customerId,boardId,count);
		System.out.println("isFastProduct" + isFastProduct);
		if(isFastProduct==0 || isFastProduct==1) {
			message = "참여완료";
		}else {
			message = "이미 참여한 게시글입니다.";
		}
		return message;
		
	}
	
	@GetMapping("/common/orderSuccess.do") 
	public void orderSuccess(Model model,HttpSession session) { 
		String customerId = (String)session.getAttribute("customerId"); 
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77"; 
		String boardId = (String)session.getAttribute("boardId");
		Map<String,Object> info = boardService.orderInfo(customerId, boardId); 
		int price = (Integer)info.get("price"); 
		int pCount = (Integer)info.get("pCount"); 
		int totalPrice = (Integer)info.get("pickCount") * (Math.round(price/pCount));
	    if(totalPrice<50000) { totalPrice += 3000; }
	    model.addAttribute("info",info);
	 	model.addAttribute("totalPrice",totalPrice);
	 	session.removeAttribute("boardId"); 
	 	}
	
	
	
	@PostMapping(value="/common/writeOrderFast.do", consumes="application/json")
	public void writeOrderFast(@RequestBody Map<String,Object> info, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("info", info);
		String productId = (String)info.get("productId");
		int count = Integer.parseInt((String)info.get("count"));
		ProductVO product = boardService.selectByPid(productId);
		CustomerVO customer =  customerService.selectById(customerId);
		model.addAttribute("count",count);
		model.addAttribute("product",product);
		model.addAttribute("customer",customer);
		
	}
	
}
