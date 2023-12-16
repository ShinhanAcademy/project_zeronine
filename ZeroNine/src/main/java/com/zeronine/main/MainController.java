package com.zeronine.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/main.do")
	public void main() {
	}
	@RequestMapping("/introZeroNine.do")
	public void introZeroNine() {
	}

}
