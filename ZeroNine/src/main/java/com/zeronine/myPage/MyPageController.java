package com.zeronine.myPage;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zeronine.dto.CustomerVO;
import com.zeronine.dto.PagingVO;
import com.zeronine.dto.PickupVO;
import com.zeronine.dto.ProductVO;
import com.zeronine.model.BoardService_yn;
import com.zeronine.model.CartService;
import com.zeronine.model.CustomerService;
import com.zeronine.model.MyPageService;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	MyPageService deliveryService;
	@Autowired
	BoardService_yn boardService;
	@Autowired
	ProductService productService;
	@Autowired
	CustomerService cService;
	@Autowired
	MyPageService mypageservice;
	@Autowired
	CartService cartservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	/* ****************************
			COMMON
	****************************** */
	@PostMapping("/common/personalInfo.do")
	public void personalInfo(HttpSession session, Model model) {
		String customerId = (String) session.getAttribute("customerId");
		logger.info("personalInfo"+customerId);
		Map<String, Object> personalInfo = mypageservice.personalInfo(customerId);
		
		model.addAttribute("personalInfo", personalInfo); 
	}
	
	
	/* ****************************
			MY_SHOPPING
	 ****************************** */
	// orderHistory(나의 지갑)
	@GetMapping("/myWallet.do")
	public void myWallet() {
	}
	
	// orderHistory(주문 내역)
	@RequestMapping("/orderHistory.do")
	public void orderHistory(HttpSession session) {
		session.removeAttribute("deliveryId");
	}

	@RequestMapping("/subPage/orderHistoryDetail.do")
	public void orderHistoryDetail(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model, HttpSession session) {
//		String customerId = "e70c4145-25b8-43d3-9ff8-60ef51d4adb9"; //주영이
		
		String customerId = (String) session.getAttribute("customerId");
		PagingVO orderHistorypaginating = mypageservice.orderHistorygetPages(Page,customerId, searchWord, startDate, endDate);
		model.addAttribute("OHpagination",orderHistorypaginating);
		model.addAttribute("pageCount",mypageservice.orderHistoryCount(customerId, searchWord, startDate, endDate));
		model.addAttribute("orderHistoryAll", deliveryService.orderHistoryAll(Page,customerId, searchWord, startDate, endDate));
	
	
	}
	
	// orderCancelHistory(취소 / 반품 내역)
	@RequestMapping("/orderCancelHistory.do")
	public void orderCancelHistory() {
	}

	@RequestMapping("/subPage/orderCancelHistoryDetail.do")
	public void orderCancelHistoryDetail(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model, HttpSession session) {
//		String customerId = "7cb70b46-d6c2-462d-b785-dc27e1e7d045";
		String customerId = (String) session.getAttribute("customerId");
		PagingVO orderCancelpaging = mypageservice.orderCancelHistoryAllgetPages(Page, customerId, searchWord, startDate, endDate);
		int count = mypageservice.orderCancelHistoryAllCount(customerId, searchWord, startDate, endDate);
		model.addAttribute("orderCancelHistoryAll", deliveryService.orderCancelHistoryAll(Page,customerId, searchWord, startDate, endDate));
		model.addAttribute("count",count);
		model.addAttribute("orderCancelpaging",orderCancelpaging);
	}
	// myCart(장바구니)
	@RequestMapping("/myCart.do")
	public void myCart() {
	}
	
	
	@RequestMapping("/subPage/myCartDetail.do") 
	public void myCartDetail(Model model, HttpSession session) { 
		String customerId = (String)session.getAttribute("customerId"); 
  
		model.addAttribute("myCart", deliveryService.myCart(customerId)); 
	}

	// orderSheet(주문서)
	@PostMapping(value="/beforeOrderSheet.do" )
	public @ResponseBody String beforeOrderSheet(@RequestParam(value = "productIdArr[]" )  String[] productIdArr,
			@RequestParam(value = "countArr[]") String[] countArr,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		
		for(int i=0;i<productIdArr.length;i++) {
			cartservice.beforeproductOrder(customerId, productIdArr[i], Integer.parseInt(countArr[i]));
		}
		
		List<ProductVO> productList = productService.selectByProductList(productIdArr);
		session.setAttribute("productList", productList);
		
		return "OK";
	}
	
	@PostMapping("/orderSheet.do")
	public void orderSheet(@RequestParam(value = "productIdArr" )  String[] productIdArr,
			@RequestParam(value = "countArr") String[] countArr,
			@RequestParam(value = "imagePathArr") String[] imagePathArr,
			Model model, HttpSession session) {
		

		
		List<ProductVO> productList = productService.selectByProductList(productIdArr);
		
		ObjectMapper om = new ObjectMapper();
		List<Map<String, Object>> pList = new ArrayList<Map<String,Object>>();
		for(int i=0; i<productList.size(); i++) {
			productList.get(i).setpCount(Integer.parseInt(countArr[i]));
			
			Map<String, Object> productMap = om.convertValue(productList.get(i), Map.class);
			productMap.put("imagePath", imagePathArr[i]);
			pList.add(productMap);
		}
		
		String customerId = session.getAttribute("customerId").toString();
		CustomerVO customerInfo =  cService.selectById(customerId);
		
		model.addAttribute("productList", pList);
		model.addAttribute("customerInfo", customerInfo);
	}
	
	// likeProduct(찜한 상품)
	@RequestMapping("/likeProduct.do")
	public void likeProduct() {
	}
	
	@RequestMapping("/subPage/likeProductDetail.do")
	public void likeProductDetail(
			@RequestParam(value = "page", required = false ,defaultValue="1") int page,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model, HttpSession session) {

		String customerId = (String) session.getAttribute("customerId");
		PagingVO pagenation = deliveryService.likeProductgetPages(page, customerId, searchWord);
		model.addAttribute("likeProduct", deliveryService.likeProduct(page,customerId, searchWord));
		model.addAttribute("likeProductCount",deliveryService.likeProductCount(customerId, searchWord));
		model.addAttribute("pagenation",pagenation);
	
	}
	
	
	
	/* ****************************
			MY_ACTIVITIES
	 ****************************** */

	// ecoCare
	@RequestMapping("/ecoCare.do")
	public void ecoCare(HttpSession session, Model model, String customerId) {
		String customer_id = (String)session.getAttribute("customerId");
		List<Map<String, Object>> ecodashinfo = mypageservice.selectEcoInfoAll(customer_id);
		List<Map<String, Object>> couponCtn = mypageservice.selectCouponCtn(customer_id);
		
		JSONArray ecoarray = new JSONArray();
		for(Map<String, Object> map : ecodashinfo) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String)entry.getKey();
				String value = (String)entry.getValue().toString();
				json.put(key, value);
			} ecoarray.add(json);
		}
		
		JSONArray couponarr = new JSONArray();
		for(Map<String, Object> cmap : couponCtn) {
			JSONObject cjson = new JSONObject();
			for(Map.Entry<String, Object> entry : cmap.entrySet()) {
				String key = (String)entry.getKey();
				String value = (String)entry.getValue().toString();
				cjson.put(key, value);
			} couponarr.add(cjson);
		}
		model.addAttribute("ecodashinfo",ecoarray);
		model.addAttribute("couponCtn", couponarr);
		logger.info("이것은 컨트롤러에서 보여주는 id 정보 :{}",customer_id );
		logger.info("이것은 컨트롤러에서 보여주는 정보 :{}",ecoarray);
		logger.info("이것은 컨트롤러에서 보여주는 쿠폰 정보 :{}", couponarr);
	}
	@RequestMapping("/requestPickup.do")
	public ResponseEntity<String> updateCouponCnt(@RequestParam("subscriptionId") String subscription_id) {
		logger.info("이것은 id:{}"+ subscription_id);
		int result = mypageservice.updateCouponCnt(subscription_id);
		//model.addAttribute("result",result);
		if (result > 0) {
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}
	
	@RequestMapping("/requestPickupInsert.do")
	public ResponseEntity<String> insertPickupRequest(@RequestParam("subscriptionId") String subscription_id, HttpServletRequest request, HttpSession session){
		String customer_id = (String)session.getAttribute("customerId");
		String subscriptionId = subscription_id;
		int result = mypageservice.insertPickupRequest(customer_id, subscriptionId);
		if (result > 0) {
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}
	
	@GetMapping("/createdBoard.do")
	public void createdBoard(Model model, HttpSession session) {

	}
	@GetMapping("/subPage/createdBoardDetail.do")
	public void createdBoardDetail(String boardId, String isSuccess, Model model) {
		Map<String, Object> info = boardService.boardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		int participant = boardService.numOfParticipant(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
		model.addAttribute("participant", participant);
		model.addAttribute("isSuccess", isSuccess);
	}
	
	@GetMapping("/subPage/cbFastboardEdit.do")
	public void cbFastboardEdit(String boardId, int participant, Model model) {
		Map<String, Object> info = boardService.boardDetailEdit(boardId);
		model.addAttribute("info", info);
		model.addAttribute("participant", participant);		
	}
	
	@PostMapping(value="/subPage/completeEdit.do", consumes="application/json")
	public void completeEdit(@RequestBody Map<String,Object> info, Model model) {
		int participant = Integer.parseInt((String)info.get("participant"));
		String boardId = (String)info.get("boardId");
		String title = (String)info.get("title");
		String context = (String)info.get("context");
		int result;
		if(participant>1) {
			result = boardService.completeEdit(title,context,boardId);
		}else {
			int remainTime = Integer.parseInt((String)info.get("day")) + (Integer.parseInt((String)info.get("hour")))*60 + Integer.parseInt((String)info.get("minute"));
			result = boardService.completeEditTime(title,context,remainTime,boardId);
		}
		if(result>0) {
			model.addAttribute("message","게시물이 정상적으로 수정되었습니다.");
		}else {
			model.addAttribute("message","게시물을 다시 수정해주세요.");
		}
		model.addAttribute("kind","create");
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
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		Map<String, Object> info = boardService.freeBoardDetailEdit(boardId);
		List<Map<String, Object>> productInfo = boardService.freeBoardProductEdit(boardId,customerId);
		model.addAttribute("info", info);
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("participant", participant);		
	}
	
	@GetMapping("/subPage/cbFastDelivery.do")
	public void cbFastDelivery(@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		PagingVO myWritePaging = boardService.myWriteBlistgetPages(Page,customerId);
		List<Map<String, Object>> info = boardService.myWriteBlist(Page,customerId);
		int count = boardService.myWriteBlistCount(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", count);
		model.addAttribute("myWritePaging",myWritePaging);

	}
	@GetMapping("/subPage/cbFastSuccessDelivery.do")
	public void cbFastSuccessDelivery(@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		List<Map<String, Object>> successInfo = boardService.successMyWriteBlist(Page,customerId);
		int successCount = boardService.successMyWriteBlistCount(customerId);
		PagingVO myWritePaging = boardService.successMyWriteBlistgetPages(Page,customerId);
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successCount);
		model.addAttribute("myWritePaging",myWritePaging);

	}

	@GetMapping("/subPage/cbFreeDelivery.do")
	public void cbFreeDelivery(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		int count = boardService.myWriteFreeBlistCount(customerId);
		List<Map<String, Object>> info = boardService.myWriteFreeBlist(Page,customerId);
		PagingVO myWritePaging = boardService.myWriteFreeBlistgetPages(Page,customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", count);
		model.addAttribute("myWritePaging",myWritePaging);
	}
	@GetMapping("/subPage/cbFreeSuccessDelivery.do")
	public void cbFreeSuccessDelivery(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		List<Map<String, Object>> successInfo = boardService.successMyWriteFreeBlist(Page,customerId);
		int successCount = boardService.successMyWriteFreeBlistCount(customerId);
		PagingVO myWritePaging = boardService.successMyWriteFreeBlistgetPages(Page,customerId);
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount",successCount);
		model.addAttribute("myWritePaging",myWritePaging);
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
	}
	
	@GetMapping("/subPage/participatedBoardDetail.do")
	public void participatedBoardDetail(String boardId, Model model) {
		Map<String, Object> info = boardService.boardDetail(boardId);
		int pCount = boardService.boardpCount(boardId);
		model.addAttribute("info", info);
		model.addAttribute("pCount", pCount);
	}
	
	@GetMapping("/subPage/pbFreeDelivery.do")
	public void pbFreeDelivery(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myParticipatedFreeBlist(Page,customerId);
		int count = boardService.myParticipatedFreeBlistCount(customerId);
		PagingVO boardPaging = boardService.myParticipatedFreeBlistgetPages(Page, customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", count);
		model.addAttribute("boardPaging",boardPaging);
	}
	@GetMapping("/subPage/pbFreeDeliverySuccess.do")
	public void pbFreeDeliverySuccess(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		
		List<Map<String, Object>> successInfo = boardService.successMyParticipatedFreeBlist(Page,customerId);
		int successcount = boardService.successMyParticipatedFreeBlistCount(customerId);
		PagingVO boardSuccessPaging = boardService.successMyParticipatedFreeBlistgetPages(Page, customerId);
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successcount);
		model.addAttribute("boardSuccessPaging",boardSuccessPaging);
	}
	@GetMapping("/subPage/pbFastDelivery.do")
	public void pbFastDelivery(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.myParticipatedBlist(Page,customerId);
		int count = boardService.myParticipatedBlistCount(customerId);
		PagingVO boardPaging = boardService.myParticipatedBlistgetPages(Page, customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", count);
		model.addAttribute("boardPaging",boardPaging);
	}
	@GetMapping("/subPage/pbFastSuccessDelivery.do")
	public void pbFastSuccessDelivery(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> successInfo = boardService.successMyParticipatedBlist(Page,customerId);
		int successcount = boardService.successMyParticipatedBlistCount(customerId);
		PagingVO boardSuccessPaging = boardService.successMyParticipatedBlistgetPages(Page, customerId);
		model.addAttribute("successInfo", successInfo);
		model.addAttribute("successCount", successcount);
		model.addAttribute("boardSuccessPaging",boardSuccessPaging);
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
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
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
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.likeBoardFreeBlist(customerId);
		List<String> likedbid = boardService.likeFreeBidList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("likedbid", likedbid);
	}
	
	@GetMapping("/subPage/lbFastDelivery.do")
	public void lbFastDelivery(Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.likeBoardBlist(customerId);
		List<String> likedbid = boardService.likeBidList(customerId);
		model.addAttribute("info", info);
		model.addAttribute("count", info.size());
		model.addAttribute("likedbid", likedbid);
	}
	
	@GetMapping("/subPage/deleteLikedBoard.do")
	public ResponseEntity<String> deleteLikedBoard(String boardId, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		int result = boardService.deleteLikedBoard(customerId,boardId);
		if (result>0) {
			return ResponseEntity.ok("찜 제거성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("찜 제거실패");
		}
		
	}
	
	@GetMapping("/subPage/insertLikedBoard.do")
	public ResponseEntity<String> insertLikedBoard(String boardId, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		int result = boardService.insertLikedBoard(customerId,boardId);
		if (result>0) {
			return ResponseEntity.ok("찜 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("찜 실패");
		}
	}

	// chatList(채占쏙옙 占쏙옙占�)
	@GetMapping("/chatList.do")
	public void chatList(@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.chatBlist(Page,customerId);
		model.addAttribute("customerId", customerId);
	}
	
	@GetMapping("/subPage/chatListDetail.do")
	public void chatListDetail(String boardId, String isSuccess, Model model) {
		Map<String, Object> info = boardService.chatListDetail(boardId);
		model.addAttribute("info", info);
		model.addAttribute("isSuccess", isSuccess);
	}
	

	
	
	@GetMapping("/subPage/participantChatDetail.do")
	public void participantChatDetail(String boardId, String isSuccess, Model model) {
		Map<String, Object> info = boardService.chatListDetail(boardId);
		model.addAttribute("info", info);
		model.addAttribute("isSuccess", isSuccess);
	}
	
	@GetMapping("/subPage/authorChatList.do")
	public void authorChatList(@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> info = boardService.chatBlist(Page,customerId);
		PagingVO ChatListPage = boardService.chatBlistgetPages(Page, customerId);
		model.addAttribute("ChatListPage",ChatListPage);
		model.addAttribute("info", info);
		model.addAttribute("cBCount", boardService.chatBlistCount(customerId));
		/*
		 * List<Map<String, Object>> successInfo =boardService.successChatBlist(customerId);
		 */
		/*
		 * model.addAttribute("successInfo", successInfo);
		 * model.addAttribute("successCount", successInfo.size());
		 */
	}
	@GetMapping("/subPage/participantChatList.do")
	public void participantChatList(
			@RequestParam(value="pCount",required = false, defaultValue="1")int Page,
			Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
		List<Map<String, Object>> partiInfo = boardService.participantChatList(Page,customerId);
		PagingVO particiPaging = boardService.participantChatListgetPages(Page, customerId);
		int participantCount =  boardService.participantChatListCount(customerId);
		model.addAttribute("partiInfo", partiInfo);
		model.addAttribute("participantCount", participantCount);
		model.addAttribute("particiPaging", particiPaging);
		
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
	@GetMapping("/subscriptionInfo.do")
	public void subscriptionInfo(HttpSession session, Model model) {
		String customerId = (String)session.getAttribute("customerId");
		List<Map<String, Object>> info = boardService.mySubscriptionInfo(customerId);
		model.addAttribute("info",info);
		model.addAttribute("count",info.size());
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
	@GetMapping("/PickUpList.do") 
	public String PickUpList(@RequestParam(value="pCount",required = false, defaultValue="1")int page, Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId"); //customerId
		List<PickupVO> pickUpList = mypageservice.PickUpList(page, customerId);
		int pickUpListCount =mypageservice.PickUpCount(customerId);
		PagingVO paginating = mypageservice.getPages(page,customerId);
		model.addAttribute("pickUpList",pickUpList);
		model.addAttribute("pickUpListCount",pickUpListCount);
		model.addAttribute("paginating",paginating);
		return"/myPage/subPage/echoCareInPickUpList";
	}
	@GetMapping("/PickUpDetail.do") 
	public String PickUpDetail(String pickUpId,Model model ) {
		PickupVO pickUp = mypageservice.PickUpDetail(pickUpId);
		model.addAttribute("pickUp",pickUp);
		return "/myPage/subPage/pickUpModal";
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

}
