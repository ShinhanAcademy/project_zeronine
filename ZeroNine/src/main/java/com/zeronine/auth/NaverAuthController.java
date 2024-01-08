package com.zeronine.auth;

import java.io.IOException;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.zeronine.dto.CustomerVO;
import com.zeronine.dto.NaverLoginBO;
import com.zeronine.model.CustomerService;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@RequestMapping("/auth")
@Controller
public class NaverAuthController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	@Autowired
	CustomerService customerService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	

	@RequestMapping(value = "/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);

		return; 
	}

	@RequestMapping(value = "/naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		
		JSONParser parser = new JSONParser();
		Object obj = null;
		JSONObject naverCustomerData = null;
		JSONObject jsonObj = null; 
		try {
			obj = parser.parse(apiResult);
			jsonObj = (JSONObject)obj;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		JSONObject response = (JSONObject)jsonObj.get("response");
		String email = (String)response.get("email");
		
		CustomerVO customerVo = null; 
		customerVo = customerService.selectByEmail(email);
		
		
		if(customerVo == null) {
			logger.info("customerVo is null");
			return "/auth/login";
		}
		
		
		String customerId = customerVo.getCustomerId();
		String customerName = customerVo.getCustomerName();
		session.setAttribute("customerId", customerId);
		session.setAttribute("customerName", customerName);
		session.setAttribute("email", customerVo.getEmail());
		
		return "/main/main";

	}
}

