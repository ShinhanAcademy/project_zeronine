package com.zeronine.myPage;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.BoardVO;
import com.zeronine.dto.CustomerVO;
import com.zeronine.model.BoardService_yn;
import com.zeronine.model.CustomerService;
import com.zeronine.myapp.HomeController;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	CustomerService cService;
	@Autowired
	BoardService_yn boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	

	// MY_SHOPPING
	// orderHistory(占쏙옙占쏙옙 占쏙옙占쏙옙)
	@GetMapping("/myWallet.do")
	public String myWallet(Model model) {
		//model.addAttribute("clist", cService.selectAll());	
		/*
		 * CustomerVO cust = cService.selectByName("占쏙옙占쏙옙"); logger.info("占쏙옙占쏙옙占쏙옙:" +
		 * cust.toString());
		 */
		return "myPage/myWallet";
	}
	
	// orderHistory(占쌍뱄옙 占쏙옙占쏙옙)
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "myPage/orderHistory";
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
		//String customerId = (String)session.getAttribute("customerId"); 
		String customerId = "490ef92a-d77f-432f-8bfb-2828eee6db77"; 
		List<BoardVO> blist = boardService.myWriteBlist(customerId); 
		
		model.addAttribute("blist",blist);
		model.addAttribute("blistCount",blist.size());
	}
	
	/*
	 * // MY_ACTIVITIES // Board(占쏙옙占쏙옙 占쏙옙 占쌉시깍옙)
	 * 
	 * @GetMapping("/createdBoardBlist.do")
	 * 
	 * @ResponseBody public List<BoardVO> createdBoardBlist(HttpSession session) {
	 * //String email = (String)session.getAttribute("email"); String email =
	 * "yongsu9630@gmail.com"; List<BoardVO> blist =
	 * boardService.myWriteBlist(email); return blist; }
	 */
	
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
	// personal_info(占쏙옙占쏙옙 占쏙옙占쏙옙) - vaildate_password(占쏙옙橘占싫� 확占쏙옙)
	@PostMapping(value = "/validatePw.do", consumes = "application/json")
	@ResponseBody
	public int validatePassword(@RequestBody Map<String, String> map, Model model) {
		String email = map.get("email");
		String password = map.get("password");
		
		int isValid = cService.login(email, password);
		
		
		return isValid;	
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
	public void updateInfo() {}

}
