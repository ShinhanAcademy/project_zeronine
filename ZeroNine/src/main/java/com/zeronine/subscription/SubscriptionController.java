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
		/*
		 * String[] pg_code = {"tosspayments"}; String[] channelKey =
		 * {"channel-key-1918b0a8-8461-412e-ac87-031e27a5b205"};
		 */
		
		//long selected_pg = product_id % 2;
		
		/*
		 * model.addAttribute("storeId", "store-6abdf6f7-f7a0-47dd-b006-bb33315ba0bd");
		 */
		/*
		 * model.addAttribute("tosspayments",
		 * "channel-key-1918b0a8-8461-412e-ac87-031e27a5b205");
		 */
		model.addAttribute("subscriptionType", subscriptionType);
		
	}
	
	//肄쒕갚 �닔�떊 泥섎━
	/*
	 * @PostMapping("/sss") public ResponseEntity<> callback_receive(@RequestBody
	 * Portone entity)
	 */
	
	
	
	
	
	
	

}
