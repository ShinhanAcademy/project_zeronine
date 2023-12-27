package com.zeronine.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
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
import com.zeronine.model.PayService;
import com.zeronine.myPage.MyPageController;

@Controller
public class CommonController {
	
	@Autowired
	BoardService_yn boardService;
	@Autowired
	CustomerService customerService;
	@Autowired
	PayService payService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@GetMapping("/common/participateBoard.do")
	public void participateBoard(String boardId, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("boardId", boardId);
		Map<String,Object> info = boardService.fastBoardProduct(boardId);
		int remainCount = boardService.boardpCount(boardId);
		model.addAttribute("info", info);
		model.addAttribute("remainCount", remainCount);
		model.addAttribute("IsFreeDelivery",payService.IsFreeDelivery(customerId));
	}
	
	@GetMapping("/common/participateFreeBoard.do")
	public void participateFreeBoard(String boardId, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("boardId", boardId);
		List<Map<String,Object>> cart = boardService.myCart(customerId);
		model.addAttribute("cart", cart);
	}
	
	@PostMapping("/common/orderFast.do")
	public void orderFast(HttpServletRequest request, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		String productId = request.getParameter("productId");
		int count = Integer.parseInt(request.getParameter("count"));
		String boardId = (String)session.getAttribute("boardId");
		ProductVO product = boardService.selectByPid(productId);
		CustomerVO customer =  customerService.selectById(customerId);
		int isParticipate = boardService.isParticipateFast(customerId,boardId);
		model.addAttribute("count",count);
		model.addAttribute("product",product);
		model.addAttribute("customer",customer);
		model.addAttribute("isParticipate",isParticipate);
		model.addAttribute("IsFreeDelivery",payService.IsFreeDelivery(customerId));
	}
	
	@PostMapping(value="/common/orderSuccess.do", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void orderSuccessP(String productId, int count, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		String boardId = (String)session.getAttribute("boardId");
		boardService.orderFastProduct(customerId,boardId,count);
		/*
		int isFastProduct = boardService.orderFastProduct(customerId,boardId,count);
		if(isFastProduct==0 || isFastProduct==1) {
			message = "참여완료"; //participate complete
		}else {
			message = "이미 참여한 게시글입니다."; //already
		}
		return message;
		*/
	}
	
	@PostMapping(value="/common/freeOrderSuccess.do", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void freeOrderSuccessP(Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		String boardId = (String)session.getAttribute("boardId");
		Map<String,Object> productInfo = (Map<String,Object>)session.getAttribute("info");
		Map<String, Integer> productList = new HashMap<>(); //productId - purchaseCount
		Map<String,Object> data = (Map)productInfo.get("myMap");
		Set<Entry<String,Object>> entrys = data.entrySet();
		for(Entry<String,Object> row:entrys) {
			productList.put(row.getKey(), Integer.parseInt((String)row.getValue()));
		}
		boardService.orderFreeProduct(customerId, boardId, productList);
		/*
		int isFreeProduct = boardService.orderFreeProduct(customerId, boardId, productList);
		String message;
		if(isFreeProduct==0 || isFreeProduct==1) {
			message = "참여완료"; //participate complete
			for(Entry<String,Object> row:entrys) {
				boardService.deleteCart(customerId, row.getKey());
			}
		}else {
			message = "이미 참여한 게시글입니다."; //already
		}
		return message;
		*/
		
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
		int isFreeDelivery = payService.IsFreeDelivery(customerId);
		if (isFreeDelivery<=0) {
			if(totalPrice<50000) { totalPrice += 3000; }
		}
	    model.addAttribute("info",info);
	 	model.addAttribute("totalPrice",totalPrice);
	 	session.removeAttribute("boardId"); 
	 	}
	
	@GetMapping("/common/freeOrderSuccess.do") 
	public void freeOrderSuccess(Model model,HttpSession session) { 
		String customerId = (String)session.getAttribute("customerId"); 
		String boardId = (String)session.getAttribute("boardId");
		Map<String,Object> info = boardService.freeOrderInfo(customerId, boardId);
		int totalPrice = boardService.freeTotalPrice(customerId, boardId);
	    model.addAttribute("info",info);
	 	model.addAttribute("totalPrice",totalPrice);
	 	session.removeAttribute("boardId"); 
	 	session.removeAttribute("info"); 
	 	}
	
	
	
	@PostMapping(value="/common/writeOrderFast.do", consumes="application/json")
	public void writeOrderFast(@RequestBody Map<String,Object> info, Model model, HttpSession session) {
	//public String writeOrderFast(@RequestBody Map<String,Object> info, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("info", info);
		String productId = (String)info.get("productId");
		int count = Integer.parseInt((String)info.get("count"));
		ProductVO product = boardService.selectByPid(productId);
		CustomerVO customer = customerService.selectById(customerId);
		model.addAttribute("count",count);
		model.addAttribute("product",product);
		model.addAttribute("customer",customer);
		model.addAttribute("IsFreeDelivery",payService.IsFreeDelivery(customerId));
	}
	
	@PostMapping(value="/common/writeOrderFree.do", consumes="application/json")
	public void writeOrderFree(@RequestBody Map<String,Object> info, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		session.setAttribute("info", info);
		Map<String,Object> data = (Map)info.get("myMap");
		Set<Entry<String,Object>> entrys = data.entrySet();
		List<Map<String,Object>> plist = new ArrayList<>();
		int totalPrice = 0;
		for(Entry<String,Object> row:entrys) {
			Map<String,Object> map = new HashMap<>();
			ProductVO product = boardService.selectByPid(row.getKey());
			map.put("productId", product.getProductId());
			map.put("count", row.getValue());
			map.put("pName", product.getpName());
			map.put("price", product.getPrice());
			totalPrice += Integer.parseInt((String)row.getValue())*product.getPrice();
			plist.add(map);
		}
		CustomerVO customer =  customerService.selectById(customerId);
		model.addAttribute("plist",plist);
		model.addAttribute("customer",customer);
		model.addAttribute("totalPrice",totalPrice);		

	}
	
	@PostMapping(value="/common/orderFree.do", consumes="application/json")
	public void orderFree(@RequestBody Map<String,Object> info, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		String boardId = (String)session.getAttribute("boardId");
		session.setAttribute("info", info);
		Map<String,Object> data = (Map)info.get("myMap");
		Set<Entry<String,Object>> entrys = data.entrySet();
		List<Map<String,Object>> plist = new ArrayList<>();
		int totalPrice = 0;
		for(Entry<String,Object> row:entrys) {
			Map<String,Object> map = new HashMap<>();
			ProductVO product = boardService.selectByPid(row.getKey());
			map.put("productId", product.getProductId());
			map.put("count", row.getValue());
			map.put("pName", product.getpName());
			map.put("price", product.getPrice());
			totalPrice += Integer.parseInt((String)row.getValue())*product.getPrice();
			plist.add(map);
		}
		CustomerVO customer =  customerService.selectById(customerId);
		int isParticipate = boardService.isParticipateFree(customerId,boardId);
		model.addAttribute("plist",plist);
		model.addAttribute("customer",customer);
		model.addAttribute("totalPrice",totalPrice); 		
		model.addAttribute("isParticipate",isParticipate); 		
	}
	
}
