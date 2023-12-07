package com.zeronine.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zeronine.dto.ProductVO;
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
	@GetMapping("/productCategory.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String productvegetable(Integer pCategoryId, Model model) {
		List<ProductVO> plist = productService.selectBypCategoryId(pCategoryId);
		model.addAttribute("plist", plist);
		return "product/vegetarian";
	}
	@GetMapping("/productCategoryall.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String productvegetableall(Integer pCategoryId, Model model) {
		List<ProductVO> plist = productService.selectBypCategoryIdall(pCategoryId);
		model.addAttribute("plist", plist);
		return "product/vegetarian";
	}
	
	
}
