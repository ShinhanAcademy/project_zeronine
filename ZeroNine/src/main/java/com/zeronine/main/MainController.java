package com.zeronine.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@RequestMapping("/main.do")
	public String fastBoard() {
		return "main/main";
	}

}
