package com.zeronine.subscription;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeronine.dto.CustomerVO;
import com.zeronine.myapp.HomeController;

@Controller
@RequestMapping("/subscription")
public class SubscriptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@GetMapping("/subscriptionBuy.do")
	public void SubscriptionMenu() {
		
	}

}
