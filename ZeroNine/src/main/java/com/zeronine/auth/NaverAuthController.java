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






/**
 * Handles requests for the application home page.
 */

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
	
//	@RequestMapping("/naverLogin.do")
//	public void naverLogin() {
//		System.out.println("naverLogin!");
//	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void login(Model model, HttpSession session) {
		System.out.println("naverLogin.do controller called");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);

		return; //auth/naverLogin.do
		/* 생성한 인증 URL을 View로 전달 */
		//return "login";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    //System.out.println(apiResult);
		model.addAttribute("result", apiResult);
		
		JSONParser parser = new JSONParser();
		Object obj = null;
		JSONObject naverCustomerData = null;
		JSONObject jsonObj = null; 
		try {
			obj = parser.parse(apiResult);
			jsonObj = (JSONObject)obj;
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//jsonObj.get("response").get;
		
		//logger.info(response);
		JSONObject response = (JSONObject)jsonObj.get("response");
		String email = (String)response.get("email");
		logger.info("이멜---->"+email);
		
		CustomerVO customerVo = null; 
		customerVo = customerService.selectByEmail(email);
		
		
		if(customerVo == null) {
			//네이버로 가입 하지 않은 상태
			logger.info("customerVo is null");
			return "/auth/login";
		}
		
		
		String customerId = customerVo.getCustomerId();
		logger.info("네이버 로그인", customerId);
		session.setAttribute("customerId", customerId);
		session.setAttribute("email", customerVo.getEmail());
		
		return "/main/main";
		//logger.info(jsonObj.get("response").getClass().toString());
		//logger.info(naverCustomerData.get("email").toString());
		//CustomerVO customerVo = customerService.selectByEmail(email);
		
		
		
		//logger.info(apiResult);
		
        /* 네이버 로그인 성공 페이지 View 호출 */
		//return "auth/naverSuccess";
	}
}

