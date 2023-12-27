package com.zeronine.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.ProductVO;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	ProductService productService;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/main.do")
	public void main(HttpSession session) {
		String customerId = (String) session.getAttribute("customerId");
		logger.info(customerId);
	}

	@RequestMapping("introZeroNine.do")
	public void introZeroNine() {
	}

	@ResponseBody
	@RequestMapping(value = "/recommendedProducts.do", method = RequestMethod.POST)
	public List<ProductVO> productDetail(@RequestParam(value = "count") Integer count,
								Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId");
		//Integer count = 3;
		System.out.println("????count"+ count);
		List<ProductVO> productList = productService.selectRecommendedProducts(count);

		model.addAttribute("recommendedList", productList);
		return productList;
	}
}	
