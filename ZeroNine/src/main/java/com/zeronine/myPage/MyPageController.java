package com.zeronine.myPage;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.BoardVO;
import com.zeronine.dto.CustomerVO;
import com.zeronine.model.BoardService_yn;
import com.zeronine.model.CustomerService;
import com.zeronine.model.DeliveryService;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	DeliveryService deliveryService;
	@Autowired
	BoardService_yn boardService;
	@Autowired
	ProductService productService;
	@Autowired
	CustomerService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	

	// MY_SHOPPING
	// orderHistory(占쏙옙占쏙옙 占쏙옙占쏙옙)
	@GetMapping("/myWallet.do")
	public void myWallet() {
	}
	

	// orderHistory(占쌍뱄옙 占쏙옙占쏙옙)
	@RequestMapping("/orderHistory.do")
	public void orderHistory(Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId");
		System.out.println("ID = " + customerId);

		model.addAttribute("orderHistoryAll", deliveryService.orderHistoryAll(customerId));
		System.out.println("너는 무엇이냐" + deliveryService.orderHistoryAll(customerId));
	}
	
	// orderCancelHistory(占쏙옙占�/占쏙옙품/占쏙옙환/환占쏙옙 占쏙옙占쏙옙)
	@RequestMapping("/orderCancelHistory.do")
	public String orderCancelHistory() {
		return "myPage/orderCancelHistory";
	}
	
	// myCart(占쏙옙袂占쏙옙占�)
	@RequestMapping("/myCart.do")
	public String myCart() {
		return "myPage/myCart";
	}

	// likeList(占쏙옙占쏙옙 占쏙옙품)
	@RequestMapping("/likeProduct.do")
	public String likeProduct() {
		return "myPage/likeProduct";
	}
		
	@GetMapping("/createdBoard.do")
	public void createdBoard(Model model) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());

	}
	@GetMapping("/subPage/createdBoardDetail.do")
	public void createdBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.boardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		int participant = boardService.numOfParticipant(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
		model.addAttribute("participant", participant);
	}
	
	@GetMapping("/subPage/cbFastDelivery.do")
	public void cbFastDelivery(Model model) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());

	}

	@GetMapping("/subPage/cbFreeDelivery.do")
	public void cbFreeDelivery(Model model) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteFreeBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
	}
	
	@GetMapping("/subPage/createdFreeBoardDetail.do")
	public void createdFreeBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		int participant = boardService.numOfParticipant(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
		model.addAttribute("participant", participant);
	}
	
	// chatList(占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시깍옙)
	@RequestMapping("/participatedBoard.do")
	public String participatedBoard() {
		return "myPage/participatedBoard";
	}

	// chatList(채占쏙옙 占쏙옙占�)
	@RequestMapping("/chatList.do")
	public void chatList() {
	}

	// likeBoard(占쏙옙占쏙옙 占쌉시깍옙)
	@RequestMapping("/likeBoard.do")
	public String likeBoard() {
		return "myPage/likeBoard";
	}
	
	
	// MY_INFOMATION
	@PostMapping(value = "/validatePw.do", consumes = "application/json")
	@ResponseBody
	public CustomerVO validatePassword(@RequestBody Map<String, String> map, Model model) {
		String email = map.get("email");
		String password = map.get("password");


		boolean isValid = cService.login(email, password) > 0;

		if(!isValid) {
			CustomerVO invalidCustomer = new CustomerVO();
			invalidCustomer.setCustomerName("invalid");
			return invalidCustomer;
		}

		return cService.selectByEmail(email);	
	}

	@RequestMapping("/myInfo.do")
	public void myInfo(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		CustomerVO customerVo = cService.selectByEmail(email);
		logger.info(customerVo.toString());
		model.addAttribute("customerVo", customerVo);
		model.addAttribute("birthdayFormmated", customerVo.getBirthday().toString().substring(0, 10));
	
	}

	// subscriptionInfo(占쏙옙占쏙옙 占쏙옙占쏙옙)
	@RequestMapping("/subscriptionInfo.do")
	public String subscriptionInfo() {
		return "myPage/subscriptionInfo";
	}
	
	@RequestMapping("/checkPw.do")
	public void checkPw() {
		
	}
	
	@RequestMapping("/updateInfo.do") 
	public void updateInfo() {
	}

	@PostMapping("/updateCustomerInfo.do")
	//public String updateCustomerInfo(@RequestBody HashMap<String, String> map) {
	public ResponseEntity<Boolean> updateCustomerInfo(@RequestBody HashMap<String, String> map) {
		logger.info("updateCustomerInfo=>" + map.toString());
		boolean result = cService.updateCustomerInfo(map);
		return ResponseEntity.ok(result);
		//return "myPage/updateInfo.do";
	}
	// personal_info(占쏙옙占쏙옙 占쏙옙占쏙옙) - vaildate_password(占쏙옙橘占싫� 확占쏙옙)
	/*
	 * @RequestMapping("/validatePassword.do") public String validatePassword() {
	 * return "myPage/myInfo"; }
	 * 
	 * // subscriptionInfo(占쏙옙占쏙옙 占쏙옙占쏙옙)
	 * 
	 * @RequestMapping("/subscriptionInfo.do") public String subscriptionInfo() {
	 * return "myPage/subscriptionInfo"; }
	 * 
	 * @RequestMapping("/checkPw.do") public void checkPw() {
	 * 
	 * }
	 * 
	 * @RequestMapping("/updateInfo.do") public void updateInfo() {}
	 */

}
