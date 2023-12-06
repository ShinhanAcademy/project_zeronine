package com.zeronine.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.CustomerVO;
import com.zeronine.model.CustomerService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	CustomerService customerService;

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@GetMapping("/joinMembership.do")
	public void JoinMembership() {

	}

	@PostMapping("/confirmEmail.do")
	public @ResponseBody int ConfirmEmail(String email) {
		int cnt = customerService.emailCheck(email);
		return cnt;
	}
	
	@PostMapping("/confirmPhone.do")
	public @ResponseBody int ConfirmPhone(String phone) {
		int cnt = customerService.phoneCheck(phone);
		return cnt;
	}

	@PostMapping(value = "/joinMembership.do", consumes="application/json")
	@ResponseBody
	public int JoinMembership_P(@RequestBody CustomerVO customer ) {	
		int cnt = customerService.joinMembership(customer);
		return cnt;
	}
	
	@GetMapping("/login.do")
	public void login() {
		
	}
	

}