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
	// orderHistory(³ªÀÇ Áö°©)
	@GetMapping("/myWallet.do")
	public String myWallet(Model model) {
		//model.addAttribute("clist", cService.selectAll());	
		/*
		 * CustomerVO cust = cService.selectByName("ï¿½ï¿½ï¿½ï¿½"); logger.info("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:" +
		 * cust.toString());
		 */
		return "myPage/myWallet";
	}
	
	// orderHistory(ÁÖ¹® ³»¿ª)
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "myPage/orderHistory";
	}
	
	// orderCancelHistory(Ãë¼Ò/¹ÝÇ°/±³È¯/È¯ºÒ ³»¿ª)
	@RequestMapping("/orderCancelHistory.do")
	public String orderCancelHistory() {
		return "myPage/orderCancelHistory";
	}
	
	// myCart(Àå¹Ù±¸´Ï)
	@RequestMapping("/myCart.do")
	public String myCart() {
		return "myPage/myCart";
	}

	// likeList(ÂòÇÑ »óÇ°)
	@RequestMapping("/likeProduct.do")
	public String likeProduct() {
		return "myPage/likeProduct";
	}
		

	// MY_ACTIVITIES
	// Board(³»°¡ ¾´ °Ô½Ã±Û)
	@RequestMapping("/createdBoard.do")
	public void createdBoard(HttpSession session) {
		String email = (String)session.getAttribute("email");
		
		
		
	}
	
	// chatList(³»°¡ Âü¿©ÇÑ °Ô½Ã±Û)
	@RequestMapping("/participatedBoard.do")
	public String participatedBoard() {
		return "myPage/participatedBoard";
	}

	// chatList(Ã¤ÆÃ ¸ñ·Ï)
	@RequestMapping("/chatList.do")
	public void chatList() {
	}

	// likeBoard(ÂòÇÑ °Ô½Ã±Û)
	@RequestMapping("/likeBoard.do")
	public String likeBoard() {
		return "myPage/likeBoard";
	}
	
	
	// MY_INFOMATION
	// personal_info(°³ÀÎ Á¤º¸) - vaildate_password(ºñ¹Ð¹øÈ£ È®ÀÎ)
	@RequestMapping("/validatePassword.do")
	public String validatePassword() {
		return "myPage/myInfo";
	}

	// subscriptionInfo(±¸µ¶ Á¤º¸)
	@RequestMapping("/subscriptionInfo.do")
	public String subscriptionInfo() {
		return "myPage/subscriptionInfo";
	}

}
