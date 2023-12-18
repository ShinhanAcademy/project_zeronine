package com.zeronine.main;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/main.do")
	public String main(HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		logger.info(customerId);
	
		return "main/main";
	}
	
	@RequestMapping("main/introZeroNine.do")
	public void introZeroNine() {
	}

}
