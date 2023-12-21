package com.zeronine.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zeronine.dto.PagingVO;
import com.zeronine.dto.ProductVO;
import com.zeronine.model.CartService;
import com.zeronine.model.CustomerService;
import com.zeronine.model.DeliveryProductDAOMybatis_ys;
import com.zeronine.model.DeliveryProductService_ys;
import com.zeronine.model.DeliveryService_ys;
import com.zeronine.model.LikedProductService;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;

	Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	LikedProductService likedproductservice;

	@Autowired
	CartService cartservice;

	@Autowired
	CustomerService customerservice;

	@Autowired
	DeliveryService_ys deliveryservice_ys;

	@Autowired
	DeliveryProductService_ys deliveryproductservice_ys;

	
	@GetMapping("/productList.do")
	public String productlist() {
		return "product/productList";
	}
	
	@GetMapping("/pcategoryPageCount.do")
	public String pcategoryPageCount(
			@RequestParam(value="pCount",required = false, defaultValue="1")int page,
			@RequestParam(value="q", defaultValue="%")String q,
			@RequestParam(value="selectedValue",required = false, defaultValue="0")String selectedValue,
			@RequestParam(value="buttonValue",required = false, defaultValue="%")String buttonValue,
			Model model,HttpSession session
			) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		
		List<ProductVO> productList= productService.searchAll( page,Integer.parseInt(selectedValue),q,buttonValue);
		PagingVO paginating = productService.getPages(page,Integer.parseInt(selectedValue), q, buttonValue);
		
		
		model.addAttribute("likedcid", likedproductservice.selectByCidlist(custid));
		model.addAttribute("customerid",custid);
		model.addAttribute("plist",productList);
		model.addAttribute("paginating",paginating);
		
		System.out.println(productList);
		
		System.out.println(paginating);
		return"/product/catagory";
	}
	
	
	@PostMapping("/goProductCart.do")
	public ResponseEntity<String> goProductCart(String productId, HttpSession session, Model model) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		int result = 0;
		List<String> cart = cartservice.cartCheckPid(custid);

		if (cart.contains(productId)) {
			logger.info("이미 담겼다니까~");
			return ResponseEntity.ok("이미 카트에 담긴놈임ㅋ");
			// return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed
			// to save data.");
		} else

			result = cartservice.goProductCart(custid, productId);
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));
		if (result > 0) {
			model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}

	@PostMapping("/plusProductCart.do")
	public ResponseEntity<String> plusProductCart(String productId, HttpSession session, Model model) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		int result = 0;

		result = cartservice.plusProductCart(custid, productId);

		if (result > 0) {
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}

	@PostMapping("/productLike.do")
	public ResponseEntity<String> productLike(String productId, Model model, PagingVO paging, HttpSession session) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		model.addAttribute("customerId", custid);
		model.addAttribute("productId", productId);

		// Assuming insertLikedProduct returns the number of rows affected or some
		// result
		int result = likedproductservice.insertLikedProduct(custid, productId);

		if (result > 0) {
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}

	@PostMapping("/deleteLikedProduct.do")
	public ResponseEntity<Boolean> deleteLikedProduct(String productId, Model model, HttpSession session) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		int result = likedproductservice.deleteLikedProduct(custid, productId);
		boolean isUpdateSuccess = result == 1;

		return ResponseEntity.ok(isUpdateSuccess);

	}
	@GetMapping("/productDetail.do")
	public String productDetail(String productId, Model model, HttpSession session) {
		ProductVO product = productService.selectByProductId(productId);
		String custid = (String) session.getAttribute("customerId"); //customerId
		model.addAttribute("likedcid", likedproductservice.selectByCidlist(custid));
		model.addAttribute("likedcid", likedproductservice.selectByCidlist(custid));
		model.addAttribute("plist", productService.selectByProductId(productId));
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));
		model.addAttribute("deliverylist4", productService.selectDetailDelivery4());
		return "product/productDetail";
	}

	@PostMapping("/goProductDCart.do")
	public ResponseEntity<String> goProductDCart(String productid, int pcount, HttpSession session, Model model) {
		int result = 0;
		String custid = (String)session.getAttribute("customerId");
		
		result = cartservice.goProductDCart(custid, productid, pcount);
		model.addAttribute("productid", productid);
		if (result > 0) {
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}

	}

	@PostMapping("/beforeproductOrder.do")
	public ResponseEntity<String> beforeproductOrder(String productid, int pcount, HttpSession session, Model model) {
		int result = 0;
		 String custid = (String)session.getAttribute("customerId");
		
		result = cartservice.beforeproductOrder(custid, productid, pcount);
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));

		if (result > 0) {
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}

	}

	// 은경
	@PostMapping("/deleteCartItem.do")
	@ResponseBody
	public Map<String, Object> deleteCartItem(@RequestParam String productId, HttpSession session) {
		
		String customerId = (String) session.getAttribute("customerId"); //customerId

		int count = cartservice.deleteCartItem(customerId, productId);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count);

		return map;
	}

	@GetMapping("/productOrder.do")
	public String productOrder(String productid, Model model, HttpSession session) {
		
		
		String custid = (String) session.getAttribute("customerId"); //customerId
		List<String> order = cartservice.orderOneCart(custid, productid);

		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));
		model.addAttribute("orderonecart", order);

		model.addAttribute("custlist", customerservice.selectById(custid));
		return "product/productOrder";
	}

	@PostMapping("/Orderdelivery.do")
	public String Orderdelivery(String productId, String address, String addressdetail, Model model,
			HttpSession session) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		String deliveryId = UUID.randomUUID().toString();
		session.setAttribute("productId", productId);
		session.setAttribute("deliveryId", deliveryId);
		int deliveryfirst = deliveryservice_ys.PersonGoDelivery(deliveryId, custid, address, addressdetail);
		int deliverysecond = deliveryproductservice_ys.PersonGoDeliveryProduct(deliveryId, custid, productId);
		return "product/productOrderSuccess";
	}

	@GetMapping("/productOrderSuccess.do")
	public void productOrderSuccess(Model model, HttpSession session) {
		String custid = (String) session.getAttribute("customerId"); //customerId
		String deliveryId = (String) session.getAttribute("deliveryId");
		String productId = (String) session.getAttribute("productId");

		// Use the values as needed
		logger.info("Delivery ID: " + deliveryId);
		logger.info("Product ID: " + productId);
		model.addAttribute("product", productService.selectByPricePname(productId));
		model.addAttribute("deliproduct", deliveryproductservice_ys.selectByDidpCount(deliveryId));
		// Clear session attributes if needed
		session.removeAttribute("deliveryId");
		session.removeAttribute("productId");

	}
}
