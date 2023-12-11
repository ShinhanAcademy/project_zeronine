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
		return "product/catagory";
	}
	@GetMapping("/productCategoryall.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String productvegetableall(Integer pCategoryId, Model model) {
		List<ProductVO> plist = productService.selectBypCategoryIdall(pCategoryId);
		model.addAttribute("plist", plist);
		return "product/catagory";
	}
	@GetMapping("/selectBymanyLiked.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String selectBymanyLiked( Model model) {
		List<ProductVO> plist = productService.selectBymanyLiked();
		model.addAttribute("plist", plist);
		return "product/catagory";
		
	}
	@GetMapping("/selectByAll.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String selectByAll( Model model) {
		List<ProductVO> plist = productService.selectAll();
		model.addAttribute("plist", plist);
		return "product/catagory";
		
	}
	@GetMapping("/selectByDelivery.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String selectByDelivery( Model model) {
		List<ProductVO> plist = productService.selectByDelivery();
		model.addAttribute("plist", plist);
		return "product/catagory";
		
	}
	@GetMapping("/selectBypriceAsc.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String selectBypriceAsc( Model model) {
		List<ProductVO> plist = productService.selectBypriceAsc();
		model.addAttribute("plist", plist);
		return "product/catagory";
		
	}
	@GetMapping("/selectBypriceDesc.do")
	//@ResponseBody //body에서 저장해서 받는다.
	public String selectBypriceDesc( Model model) {
		List<ProductVO> plist = productService.selectBypriceDesc();
		model.addAttribute("plist", plist);
		return "product/catagory";
		
	}
	@GetMapping("/selectByPnameBrand.do")
	public String selectByPnameBrand(String q,Model model) {
		List<ProductVO> plist = productService.selectByPnameBrand(q);
		model.addAttribute("plist", plist);
	
		return "product/catagory";
	}
	
	
	@GetMapping("/productDetail.do")
	public void productDetail() {}
	
	@GetMapping("/productOrder.do")
	public void productOrder() {}


}
