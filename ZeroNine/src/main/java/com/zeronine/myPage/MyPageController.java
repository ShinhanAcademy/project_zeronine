package com.zeronine.myPage;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	/* ****************************
			MY_SHOPPING
	 ****************************** */
	// orderHistory(나의 지갑)
	@GetMapping("/myWallet.do")
	public void myWallet() {
	}
	
	// orderHistory(주문 내역)
	@RequestMapping("/orderHistory.do")
	public void orderHistory() {
		/*
			String customerId = (String) session.getAttribute("customerId");
			String customerId = "1248e04d-c268-4c90-85bc-fd014f7ddee6"; //박자바
			String customerId = "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"; //주영이
			System.out.println("ID = " + customerId);
	
			model.addAttribute("orderHistoryAll", deliveryService.orderHistoryAll(customerId));
			System.out.println("너는 무엇이냐" + deliveryService.orderHistoryAll(customerId));
		*/
	}

	@RequestMapping("/subPage/orderHistoryDetail.do")
	public void orderHistoryDetail(@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model, HttpSession session) {
		/*
			String customerId = (String) session.getAttribute("customerId");
			String customerId = "1248e04d-c268-4c90-85bc-fd014f7ddee6"; //박자바
		*/
		String customerId = "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"; //주영이
		System.out.println("ID = " + customerId);

		model.addAttribute("orderHistoryAll", deliveryService.orderHistoryAll(customerId, searchWord, startDate, endDate));
	}
	
	// orderCancelHistory(취소 / 반품 내역)
	@RequestMapping("/orderCancelHistory.do")
	public void orderCancelHistory() {
	}

	@RequestMapping("/subPage/orderCancelHistoryDetail.do")
	public void orderCancelHistoryDetail(@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model, HttpSession session) {
//		String customerId = (String) session.getAttribute("customerId");
		String customerId = "7cb70b46-d6c2-462d-b785-dc27e1e7d045";
		System.out.println("ID = " + customerId);
		
		model.addAttribute("orderCancelHistoryAll", deliveryService.orderCancelHistoryAll(customerId, searchWord, startDate, endDate));
	}
	
	// myCart(장바구니)
	@RequestMapping("/myCart.do")
	public String myCart() {
		return "myPage/myCart";
	}

	// likeProduct(찜한 상품)
	@RequestMapping("/likeProduct.do")
	public String likeProduct() {
		return "myPage/likeProduct";
	}
	
	
	/* ****************************
			MY_ACTIVITIES
	 ****************************** */

	// chatList(채占쏙옙 占쏙옙占�)
	@RequestMapping("/ecoCare.do")
	public void ecoCare() {
	}
	
	@GetMapping("/createdBoard.do")
	public void createdBoard(Model model, HttpSession session) {
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
	
	@GetMapping("/subPage/cbFastboardEdit.do")
	public void cbFastboardEdit(String boardId, int participant, Model model) {
		Map<String, Object> info = boardService.boardDetailEdit(boardId);
		model.addAttribute("info", info);
		model.addAttribute("participant", participant);		
	}
	
	@GetMapping("/subPage/cbFastDelivery.do")
	public void cbFastDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());

	}

	@GetMapping("/subPage/cbFreeDelivery.do")
	public void cbFreeDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteFreeBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
	}
	
	@GetMapping("/subPage/createdFreeBoardDetail.do")
	public void createdFreeBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		//int participant = boardService.numOfFreeParticipant(boardId);
		model.addAttribute("info", info);
		//model.addAttribute("participant", participant);
	}
	
	// chatList(占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시깍옙)
	@GetMapping("/participatedBoard.do")
	public void participatedBoard(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		//List<Map<String, Object>> info = boardService.myParticipatedBlist(customerId);
//		model.addAttribute("info", info);
//		model.addAttribute("count", info.size());
	}
	
	@GetMapping("/subPage/participatedBoardDetail.do")
	public void participatedBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.boardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
	}
	
	@GetMapping("/subPage/pbFreeDelivery.do")
	public void pbFreeDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
//		List<Map<String, Object>> info = boardService.myParticipatedFreeBlist(customerId);
//		model.addAttribute("info", info);
//		model.addAttribute("count", info.size());
	}
	
	@GetMapping("/subPage/pbFastDelivery.do")
	public void pbFastDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
//		List<Map<String, Object>> info = boardService.myParticipatedBlist(customerId);
//		model.addAttribute("info", info);
//		model.addAttribute("count", info.size());
	}

	
	
	@GetMapping("/subPage/participatedFreeBoardDetail.do")
	public void participatedFreeBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		model.addAttribute("info", info);
	}


	// likeBoard(占쏙옙占쏙옙 占쌉시깍옙)
	@GetMapping("/likeBoard.do")
	public void likeBoard(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.likeBoardBlist(customerId);
		List<String> likedbid = boardService.likeBidList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("likedbid",likedbid);
	}
	
	@GetMapping("/subPage/likeBoardDetail.do")
	public void likeBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.boardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
	}
	
	@GetMapping("/subPage/likeFreeBoardDetail.do")
	public void likeFreeBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		model.addAttribute("info", info);
	}
	
	@GetMapping("/subPage/lbFreeDelivery.do")
	public void lbFreeDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.likeBoardFreeBlist(customerId);
		List<String> likedbid = boardService.likeFreeBidList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("likedbid", likedbid);
	}
	
	@GetMapping("/subPage/lbFastDelivery.do")
	public void lbFastDelivery(Model model, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.likeBoardBlist(customerId);
		List<String> likedbid = boardService.likeBidList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("likedbid", likedbid);
	}
	
	@GetMapping("/subPage/deleteLikedBoard.do")
	public ResponseEntity<String> deleteLikedBoard(String boardId, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		int result = boardService.deleteLikedBoard(customerId,boardId);
		if (result>0) {
			return ResponseEntity.ok("찜 제거성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("찜 제거실패");
		}
		
	}
	
	@GetMapping("/subPage/insertLikedBoard.do")
	public ResponseEntity<String> insertLikedBoard(String boardId, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		int result = boardService.insertLikedBoard(customerId,boardId);
		if (result>0) {
			return ResponseEntity.ok("찜 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("찜 실패");
		}
	}
	
	
	
	// chatList(채占쏙옙 占쏙옙占�)
	@GetMapping("/chatList.do")
	public void chatList(Model model, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.chatBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
	}
	
	/* ****************************
			MY_INFOMATION
	 ****************************** */
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
