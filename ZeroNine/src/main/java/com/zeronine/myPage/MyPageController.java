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
		CustomerVO cust = cService.selectByName("방용수");
		logger.info("정보:" + cust.toString());
	}

}
