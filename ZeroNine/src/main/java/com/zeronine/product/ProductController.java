package com.zeronine.product;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeronine.model.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	
	@GetMapping("/productList.do")
	public void productlist(Model model, HttpServletRequest request
	) {
	
		model.addAttribute("plist", productService.selectAll());

		
	}
}
