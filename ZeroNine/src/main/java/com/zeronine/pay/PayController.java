package com.zeronine.pay;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.model.PayService;


@Controller
@RequestMapping("/pay")
public class PayController {
	@Autowired
	PayService payService;
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	/* ****************************
			MY_SHOPPING
	 ****************************** */
	
	
	@RequestMapping(value="/subscription.do", consumes="application/json", method=RequestMethod.POST)
	@ResponseBody
	public boolean paySubscription(@RequestBody Map<String,Object> payInfo, Model model, HttpSession session) {
		String subscription = (String)payInfo.get("name");
		logger.info(payInfo.toString());
		String customerId = (String)session.getAttribute("customerId");
		//String customerId = "a6a48528-9215-4fb9-9dd0-5bb174103277"; //네이버승광 
		
		if(subscription.equals("5회 이용권")) {
			payService.pay5Ecocare(customerId);
			return true;
		}
		else if(subscription.equals("무료 배송 이용권")) {
			payService.payFreeDeliverySubscription(customerId);
			return true;
		}
		else if(subscription.equals("에코케어 이용권")) {
			payService.payEcocareSubscription(customerId);
			return true;
		}
		else if (subscription.equals("에코케어+무료 배송 이용권")) {
			payService.payFreeDeliverySubscription(customerId);
			payService.payEcocareSubscription(customerId);
			return true;
		}
		
		return false;
	}
	
	

}
