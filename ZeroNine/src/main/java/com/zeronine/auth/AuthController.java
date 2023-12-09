package com.zeronine.auth;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.CustomerVO;
import com.zeronine.model.CustomerService;
import com.zeronine.model.MailSendService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	CustomerService customerService;
	@Autowired
	MailSendService mailService;

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

	@PostMapping(value = "/joinMembership.do", consumes = "application/json")
	@ResponseBody
	public int JoinMembership_P(@RequestBody CustomerVO customer) {
		int cnt = customerService.joinMembership(customer);
		return cnt;
	}

	@GetMapping("/login.do")
	public void login() {

	}

	@PostMapping(value = "/login.do", consumes = "application/json")
	@ResponseBody
	public int login_P(@RequestBody Map<String, String> map, HttpSession session) {
		String email = map.get("email");
		String pwd = map.get("password");

		session.setAttribute("email", email);

		int cnt = customerService.login(email, pwd);
		return cnt;
	}

	@GetMapping("/findId.do")
	public void findId() {

	}

	@PostMapping("/findId.do")
	public String findId_P(String name, String phone, Model model) {
		String email = customerService.findEmail(name, phone);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		return "auth/findIdModal";
	}

	@GetMapping("/findPwd.do")
	public void findPwd() {

	}

	@PostMapping("/findPwdCf.do")
	public void findPwdCf_P(String pwd, String name, String email, Model model) {
		model.addAttribute("pwd", pwd);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		String authKey = mailService.sendAuthMail(email);
		model.addAttribute("authKey", authKey);
		logger.info(authKey);
	}

	@GetMapping("/findPwdCf.do")
	public String findPwdCf(String name, String email, Model model) {

		String pwd = customerService.findPwd(name, email);

		if (pwd == null) {
			model.addAttribute("pwd", null);
			return "auth/findPwdModal";
		} else {
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("pwd", pwd);
			return "auth/findPwdCf";
		}

	}
	
	@PostMapping("/findPwd.do")
	public String findPwd_P(String authKey, String inputAuthKey, String pwd, String name, Model model) {
		if (authKey.equals(inputAuthKey)) {
			model.addAttribute("pwd",pwd);
			model.addAttribute("name",name);
		}else {
			model.addAttribute("pwd",null);
		}
		return "auth/findPwdModal_fin";
	}
	

}
