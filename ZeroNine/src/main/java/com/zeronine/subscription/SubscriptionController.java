package com.zeronine.subscription;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/subscription")
public class SubscriptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@GetMapping("/subscriptionBuy.do")
	public void SubscriptionMenu(HttpSession session, Model model) {
		String customerId = (String)session.getAttribute("customerId");
		model.addAttribute("customerId", customerId);
	}
	
	@GetMapping("/subscriptionBanner.do")
	public void SubscriptionBuying(String subscriptionType, Model model) {
		logger.info("subscripton Type: "+subscriptionType);
		
		model.addAttribute("subscriptionType", subscriptionType);
		
	}
}
