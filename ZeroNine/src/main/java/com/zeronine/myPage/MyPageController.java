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
		CustomerVO cust = cService.selectByName("ï¿½ï¿½ï¿½ï¿½");
		logger.info("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½:" + cust.toString());
	}

	// MY_SHOPPING
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
	public String likeList() {
		return "myPage/likeList";
	}
		

	// MY_ACTIVITIES
	// Board(³»°¡ ¾´ °Ô½Ã±Û)
	@RequestMapping("/createdBoard.do")
	public String createdBoard() {
		return "myPage/createdBoard";
	}
	
	// chatList(³»°¡ Âü¿©ÇÑ °Ô½Ã±Û)
	@RequestMapping("/participatedBoard.do")
	public String participatedBoard() {
		return "myPage/participatedBoard";
	}

	// chatList(Ã¤ÆÃ ¸ñ·Ï)
	@RequestMapping("/chatList.do")
	public String chatList() {
		return "myPage/chatList";
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

}
