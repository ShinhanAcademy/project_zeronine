package com.zeronine.myPage;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zeronine.myapp.HomeController;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/myWallet", method = RequestMethod.GET)
	public void myPage(Locale locale, Model model) {


		
	}
	@RequestMapping(value = "/sangpum", method = RequestMethod.GET)
	public void sangpumPage(Locale locale, Model model) {


		
	}

}
