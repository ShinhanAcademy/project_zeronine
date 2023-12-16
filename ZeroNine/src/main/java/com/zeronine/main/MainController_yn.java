package com.zeronine.main;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController_yn {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController_yn.class);
	
	@GetMapping("/main.do")
	public void main(HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		logger.info(customerId);
	}

}
