package com.zeronine.myPage;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeronine.dto.CustomerVO;
import com.zeronine.model.CustomerService;
import com.zeronine.myapp.HomeController;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	CustomerService cService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping("/myWallet.do")
	public void myPage(Model model) {
		model.addAttribute("clist", cService.selectAll());	
		CustomerVO cust = cService.selectByName("����");
		logger.info("������:" + cust.toString());
	}

	// MY_SHOPPING
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
	public String likeList() {
		return "myPage/likeList";
	}
		

	// MY_ACTIVITIES
	// Board(���� �� �Խñ�)
	@RequestMapping("/createdBoard.do")
	public String createdBoard() {
		return "myPage/createdBoard";
	}
	
	// chatList(���� ������ �Խñ�)
	@RequestMapping("/participatedBoard.do")
	public String participatedBoard() {
		return "myPage/participatedBoard";
	}

	// chatList(ä�� ���)
	@RequestMapping("/chatList.do")
	public String chatList() {
		return "myPage/chatList";
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

}
