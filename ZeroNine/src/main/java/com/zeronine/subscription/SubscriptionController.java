package com.zeronine.subscription;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/subscription")
public class SubscriptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@GetMapping("/subscriptionBuy.do")
	public void SubscriptionMenu() {
		
	}
	
	@GetMapping("/subscriptionBanner.do")
	public void SubscriptionBuying(String subscriptionType) {
		
		logger.info("구독타입: "+subscriptionType);
		
	}

}
