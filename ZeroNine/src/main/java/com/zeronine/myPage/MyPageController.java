package com.zeronine.myPage;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeronine.model.CustomerService;
import com.zeronine.myapp.HomeController;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	CustomerService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	// MY_SHOPPING
	// orderHistory(���� ����)
	@GetMapping("/myWallet.do")
	public String myWallet(Model model) {
		//model.addAttribute("clist", cService.selectAll());	
		/*
		 * CustomerVO cust = cService.selectByName("����"); logger.info("������:" +
		 * cust.toString());
		 */
		return "myPage/myWallet";
	}
	
	// orderHistory(�ֹ� ����)
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "myPage/orderHistory";
	}
	
	// orderCancelHistory(���/��ǰ/��ȯ/ȯ�� ����)
	@RequestMapping("/orderCancelHistory.do")
	public String orderCancelHistory() {
		return "myPage/orderCancelHistory";
	}
	
	// myCart(��ٱ���)
	@RequestMapping("/myCart.do")
	public String myCart() {
		return "myPage/myCart";
	}

	// likeList(���� ��ǰ)
	@RequestMapping("/likeProduct.do")
	public String likeProduct() {
		return "myPage/likeProduct";
	}
		

	// MY_ACTIVITIES
	// Board(���� �� �Խñ�)
	@RequestMapping("/createdBoard.do")
	public void createdBoard(HttpSession session) {
		String email = (String)session.getAttribute("email");
		
		
		
	}
	
	// chatList(���� ������ �Խñ�)
	@RequestMapping("/participatedBoard.do")
	public String participatedBoard() {
		return "myPage/participatedBoard";
	}

	// chatList(ä�� ���)
	@RequestMapping("/chatList.do")
	public void chatList() {
	}

	// likeBoard(���� �Խñ�)
	@RequestMapping("/likeBoard.do")
	public String likeBoard() {
		return "myPage/likeBoard";
	}
	
	
	// MY_INFOMATION
	// personal_info(���� ����) - vaildate_password(��й�ȣ Ȯ��)
	@RequestMapping("/validatePassword.do")
	public String validatePassword() {
		return "myPage/myInfo";
	}

	// subscriptionInfo(���� ����)
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
