package com.zeronine.pay;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.zeronine.model.MyPageService;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	MyPageService deliveryService;
	@Autowired
	BoardService_yn boardService;
	@Autowired
	ProductService productService;
	@Autowired
	CustomerService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	/* ****************************
			MY_SHOPPING
	 ****************************** */
	
	
	@PostMapping(value="/subscription.do", consumes="application/json")
	public String paySubscription(@RequestParam Map<String,Object> payInfo, Model model, HttpSession session) {
		/*
		 * System.out.println("!@!@!@!" + payInfo); String customerId =
		 * (String)session.getAttribute("customerId"); String productDisplayName =
		 * (String)payInfo.get("name"); int amount = (Integer)payInfo.get("amount");
		 * System.out.println("!@!@!@!" + customerId + productDisplayName + amount);
		 */
		logger.info("lets go~");
		return "redirect:main/main";
	}
	
	@PostMapping(value="/subPage/completeFreeEdit.do", consumes="application/json")
	public String completeFreeEdit(@RequestBody Map<String,Object> info, Model model) {
		int participant = Integer.parseInt((String)info.get("participant"));
		String boardId = (String)info.get("boardId");
		String title = (String)info.get("title");
		String context = (String)info.get("context");
		int result;
		if(participant>1) {
			result = boardService.completeFreeEdit(title,context,boardId);
		}else {
			int remainTime = Integer.parseInt((String)info.get("day")) + (Integer.parseInt((String)info.get("hour")))*60 + Integer.parseInt((String)info.get("minute"));
			result = boardService.completeFreeEditTime(title,context,remainTime,boardId);
		}
		if(result>0) {
			model.addAttribute("message","게시물이 정상적으로 수정되었습니다.");
		}else {
			model.addAttribute("message","게시물을 다시 수정해주세요.");
		}
		model.addAttribute("kind","create");
		return "myPage/subPage/completeEdit";
	}
	
	@PostMapping("/subPage/isDeleteBoard.do")
	public void isDeleteBoard(String boardId,Model model) {
		model.addAttribute("boardId", boardId);
	}
	
	@PostMapping("/subPage/isDeleteChat.do")
	public void isDeleteChat(String boardId,Model model) {
		model.addAttribute("boardId", boardId);
	}
	
	@PostMapping("/subPage/deleteBoard.do")
	@ResponseBody
	public int deleteBoard(String boardId,Model model) {
		int result = boardService.deleteBoard(boardId);
		return result;
	}
	
	@PostMapping("/subPage/deleteChat.do")
	@ResponseBody
	public int deleteChat(String boardId,Model model) {
		int result = boardService.deleteChat(boardId);
		return result;
	}
	
	@GetMapping("/subPage/cbFreeboardEdit.do")
	public void cbFreeboardEdit(String boardId, int participant, Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		Map<String, Object> info = boardService.freeBoardDetailEdit(boardId);
		List<Map<String, Object>> productInfo = boardService.freeBoardProductEdit(boardId,customerId);
		model.addAttribute("info", info);
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("participant", participant);		
	}
	
	@GetMapping("/subPage/cbFastDelivery.do")
	public void cbFastDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successMyWriteBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());

	}

	@GetMapping("/subPage/cbFreeDelivery.do")
	public void cbFreeDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myWriteFreeBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successMyWriteFreeBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}
	
	@GetMapping("/subPage/createdFreeBoardDetail.do")
	public void createdFreeBoardDetail(String boardId,String isSuccess,Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		int participant = boardService.numOfFreeParticipant(boardId);
		model.addAttribute("info", info);
		model.addAttribute("participant", participant);
		model.addAttribute("isSuccess", isSuccess);
	}
	
	// chatList(占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌉시깍옙)
	@GetMapping("/participatedBoard.do")
	public void participatedBoard(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myParticipatedBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successMyParticipatedBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
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
		List<Map<String, Object>> info = boardService.myParticipatedFreeBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successMyParticipatedFreeBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}
	
	@GetMapping("/subPage/pbFastDelivery.do")
	public void pbFastDelivery(Model model, HttpSession session) {
		// String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myParticipatedBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successMyParticipatedBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}

	@GetMapping("/subPage/participatedFreeBoardDetail.do")
	public void participatedFreeBoardDetail(String boardId, String isSuccess,Model model) {
		Map<String, Object> info = boardService.freeBoardDetail(boardId);
		model.addAttribute("info", info);
		model.addAttribute("isSuccess", isSuccess);
	}

	// likeBoard(占쏙옙占쏙옙 占쌉시깍옙)
	@GetMapping("/likeBoard.do")
	public void likeBoard(Model model, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
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
		List<Map<String, Object>> successInfo = boardService.successChatBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}
	
	@GetMapping("/subPage/chatListDetail.do")
	public void chatListDetail(String boardId, String isSuccess, Model model) {
		Map<String, Object> info = boardService.chatListDetail(boardId);
		model.addAttribute("info", info);
		model.addAttribute("isSuccess", isSuccess);
	}
	
	@GetMapping("/subPage/participantChatList.do")
	public void participantChatList(Model model, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.participantChatList(customerId);
		List<Map<String, Object>> successInfo = boardService.successParticipantChatList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}
	
	@GetMapping("/subPage/participantChatDetail.do")
	public void participantChatDetail(String boardId, String isSuccess, Model model) {
		Map<String, Object> info = boardService.chatListDetail(boardId);
		model.addAttribute("info", info);
		model.addAttribute("isSuccess", isSuccess);
	}
	
	@GetMapping("/subPage/authorChatList.do")
	public void authorChatList(Model model, HttpSession session) {
		//String customerId = (String)session.getAttribute("customerId");
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.chatBlist(customerId);
		List<Map<String, Object>> successInfo = boardService.successChatBlist(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successInfo.size());
	}
	
	@GetMapping("/subPage/chatListEdit.do")
	public void chatListEdit(String boardId, Model model) {
		Map<String, Object> info = boardService.chatListEdit(boardId);
		model.addAttribute("info", info);	
	}
	
	@PostMapping(value="/subPage/completeChatEdit.do", consumes="application/json")
	public String completeChatEdit(@RequestBody Map<String,Object> info, Model model) {
		String boardId = (String)info.get("boardId");
		String title = (String)info.get("title");
		String context = (String)info.get("context");
		int result = boardService.completeChatEdit(title,context,boardId);;
		if(result>0) {
			model.addAttribute("message","게시물이 정상적으로 수정되었습니다.");
		}else {
			model.addAttribute("message","게시물을 다시 수정해주세요.");
		}
		model.addAttribute("kind","chat");
		return "myPage/subPage/completeEdit";
	}
	
	/* ****************************
			MY_INFOMATION
	 ****************************** */
	
	/*
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
	*/
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
