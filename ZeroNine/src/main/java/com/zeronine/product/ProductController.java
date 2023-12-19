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

	@PostMapping("/goProductCart.do")
	public ResponseEntity<String> goProductCart(String custid, String productId, HttpSession session, Model model) {

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
	public ResponseEntity<String> plusProductCart(String custid, String productId, HttpSession session, Model model) {

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
	public ResponseEntity<String> productLike(String custid, String productId, Model model, PagingVO paging) {
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
	public ResponseEntity<Boolean> deleteLikedProduct(String productId, String custid, Model model) {
		int result = likedproductservice.deleteLikedProduct(custid, productId);
		boolean isUpdateSuccess = result == 1;

		return ResponseEntity.ok(isUpdateSuccess);

	}

	@GetMapping("/productList.do")
	public void productlist() {
	
	}
	
	@GetMapping("/pcategoryPageCount.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String pcategoryPageCount( Integer pCategoryId, Model model,@RequestParam(value = "vo", required = false)PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		String customerid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		int total = productService.countProduct();
		if (nowPage == null && cntPerPage == null) {
			
			nowPage = "1";
			cntPerPage = "7";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "7";
		}

		if (cntPerPage.equals("")) {
			cntPerPage = "7";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage));
		model.addAttribute("paging", vo);
		Integer nowPageInt = Integer.parseInt(nowPage);
		List<ProductVO> plist = productService.pcategoryPageCount(nowPageInt - 1,pCategoryId);
		model.addAttribute("plist", plist);
		if (customerid != null) {
			model.addAttribute("likedcid", likedproductservice.selectByCidlist(customerid));
			model.addAttribute("cartcheckpid", cartservice.cartCheckPid(customerid));
		}
		return "/product/catagory";
	}
	@GetMapping("/productPageCount.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String productPageCount(/* Integer value, */Model model, 
			@RequestParam(value = "vo", required = false)PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		String customerid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		int total = productService.countProduct();
		if (nowPage == null && cntPerPage == null) {
			
			nowPage = "1";
			cntPerPage = "7";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "7";
		}

		if (cntPerPage.equals("")) {
			cntPerPage = "7";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage));
		model.addAttribute("paging", vo);
		Integer nowPageInt = Integer.parseInt(nowPage);
		List<ProductVO> plist = productService.pcategoryPageCount(nowPageInt - 1,1);
		model.addAttribute("plist", plist);
		if (customerid != null) {
			model.addAttribute("likedcid", likedproductservice.selectByCidlist(customerid));
			model.addAttribute("cartcheckpid", cartservice.cartCheckPid(customerid));
		}
		return "/product/catagory";
	}

	@GetMapping("/productCategory.do")
	public String productvegetable(Integer pCategoryId, Model model) {
		List<ProductVO> plist = productService.selectBypCategoryId(pCategoryId);
		model.addAttribute("plist", plist);
		return "product/catagory";
	}

	@GetMapping("/productCategoryall.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String productvegetableall(Integer pCategoryId, Model model) {
		List<ProductVO> plist = productService.selectBypCategoryIdall(pCategoryId);
		model.addAttribute("plist", plist);
		return "product/catagory";
	}

	@GetMapping("/selectBymanyLiked.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String selectBymanyLiked(Model model) {
		List<ProductVO> plist = productService.selectBymanyLiked();
		model.addAttribute("plist", plist);
		return "product/catagory";

	}

	@GetMapping("/selectByAll.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String selectByAll(Model model) {
		List<ProductVO> plist = productService.selectAll();
		model.addAttribute("plist", plist);
		return "product/catagory";

	}

	@GetMapping("/selectByDelivery.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String selectByDelivery(Model model) {
		List<ProductVO> plist = productService.selectByDelivery();
		model.addAttribute("plist", plist);
		return "product/catagory";

	}

	@GetMapping("/selectBypriceAsc.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String selectBypriceAsc(Model model) {
		List<ProductVO> plist = productService.selectBypriceAsc();
		model.addAttribute("plist", plist);
		return "product/catagory";

	}

	@GetMapping("/selectBypriceDesc.do")
	// @ResponseBody //body���� �����ؼ� �޴´�.
	public String selectBypriceDesc(Model model) {
		List<ProductVO> plist = productService.selectBypriceDesc();
		model.addAttribute("plist", plist);
		return "product/catagory";

	}

	@GetMapping("/selectByPnameBrand.do")
	public String selectByPnameBrand(String q, Model model) {
		List<ProductVO> plist = productService.selectByPnameBrand(q);
		model.addAttribute("plist", plist);

		return "product/catagory";
	}

	@GetMapping("/productDetail.do")
	public String productDetail(String productId, Model model, HttpSession session) {
		ProductVO product = productService.selectByProductId(productId);
		String customerid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		session.setAttribute("customerid", customerid);
		customerid = (String) session.getAttribute("customerid");
		System.out.println(product);
		model.addAttribute("plist", productService.selectByProductId(productId));
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(customerid));
		model.addAttribute("deliverylist4", productService.selectDetailDelivery4());
		return "product/productDetail";
	}
	@PostMapping("/goProductDCart.do")
	public ResponseEntity<String> goProductDCart(String productid,int pcount, HttpSession session, Model model) {
	int result =0;
	//String custid = (String)session.getAttribute("customerId");
	String custid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		result = cartservice.goProductDCart(custid, productid,pcount);
		model.addAttribute("productid",productid);
		if (result > 0) {
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	
	}
	@PostMapping("/beforeproductOrder.do")
	public ResponseEntity<String> beforeproductOrder(String productid,int pcount, HttpSession session, Model model) {
	int result = 0;
	//String custid = (String)session.getAttribute("customerId");
	String custid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		result = cartservice.beforeproductOrder(custid,productid,pcount);
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(custid));
		
		
		if (result > 0) {
			logger.info("Data Saved Successfully");
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			logger.info("Data Save Failed");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	
	}
	//은경
		@PostMapping("/deleteCartItem.do")
		@ResponseBody
		public Map<String, Object> deleteCartItem(@RequestParam String productId,
									HttpSession session) {
			String customerId = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
			//String customerId = (String) session.getAttribute("customerId"); //customerId
			
			int count = cartservice.deleteCartItem(customerId, productId);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("count", count);
			
			return map;
		}
	
	@GetMapping("/productOrder.do")
	public String productOrder(String productid,  Model model, HttpSession session) {
		String customerid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		session.setAttribute("customerid", customerid);
		customerid = (String) session.getAttribute("customerid");
		List<String> order = cartservice.orderOneCart(customerid, productid);
		
		model.addAttribute("cartCheckPid", cartservice.cartCheckPid(customerid));
		model.addAttribute("orderonecart", order);

		model.addAttribute("custlist",customerservice.selectById(customerid));
		return "product/productOrder";
	}
	@PostMapping("/Orderdelivery.do")
	public String Orderdelivery(String productId,String address,String addressdetail,Model model, HttpSession session) {
		String customerid = "4591549e-7eaa-4009-a4cd-b052d8b1f537";
		session.setAttribute("customerid", customerid);
		customerid = (String) session.getAttribute("customerid");
		String deliveryId = UUID.randomUUID().toString();
		session.setAttribute("productId", productId);
		session.setAttribute("deliveryId", deliveryId);
		int deliveryfirst = deliveryservice_ys.PersonGoDelivery(deliveryId, customerid,address,addressdetail);
		int deliverysecond =deliveryproductservice_ys.PersonGoDeliveryProduct(deliveryId, customerid, productId);
		return "product/productOrderSuccess";
	}
	@GetMapping("/productOrderSuccess.do")
	public void productOrderSuccess(Model model, HttpSession session) {
		 String deliveryId = (String) session.getAttribute("deliveryId");
		    String productId = (String) session.getAttribute("productId");

		    // Use the values as needed
		    logger.info("Delivery ID: " + deliveryId);
		    logger.info("Product ID: " + productId);
		    model.addAttribute("product",productService.selectByPricePname(productId));
		    model.addAttribute("deliproduct",deliveryproductservice_ys.selectByDidpCount(deliveryId));
		    // Clear session attributes if needed
		    session.removeAttribute("deliveryId");
		    session.removeAttribute("productId");
		 	
	}
}
