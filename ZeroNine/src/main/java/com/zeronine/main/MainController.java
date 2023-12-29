package com.zeronine.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.zeronine.model.BoardService_jy;
import com.zeronine.model.ProductService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	ProductService productService;
	
	@Autowired
	BoardService_jy boardService;

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

		return productList;
	}

	@ResponseBody
	@RequestMapping(value = "/boardList.do", method = RequestMethod.POST)
	public Map<String, Object> boardList(Model model, HttpSession session) {

		String customerId = (String) session.getAttribute("customerId");
		List<Map<String, Object>> infoFb = boardService.selectValidFastList();
		List<Map<String, Object>> infoFree = boardService.selectValidFreeList();
		List<Map<String, Object>> infoOne = boardService.selectOneBoardList();
		
		JSONArray jsonFbArr = new JSONArray();
		for (Map<String, Object> map : infoFb) {
			JSONObject fastJson = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				// Object value = (Object)entry.getValue();
				String value = entry.getValue().toString();
				fastJson.put(key, value);
			}
			jsonFbArr.add(fastJson);
		}
		
		JSONArray jsonFreeArr = new JSONArray();
		for (Map<String, Object> map : infoFree) {
			JSONObject freeJson = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				String value = entry.getValue().toString();
				freeJson.put(key, value);
			}
			jsonFreeArr.add(freeJson);
		}
		
		JSONArray jsonOneToOneArr = new JSONArray();
		for (Map<String, Object> map : infoOne) {
			JSONObject oneJson = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				String value = entry.getValue().toString();
				oneJson.put(key, value);
			}
			jsonOneToOneArr.add(oneJson);
		}

		Map<String, Object> result = new HashMap<String, Object>();

		result.put("customerId", customerId);
		result.put("fastBoardList", jsonFbArr);
		result.put("freeBoardList", jsonFreeArr);
		result.put("oneToOneBoardList", jsonOneToOneArr);
		
		//logger.info("????????????????>>>>{}" + jsonOneToOneArr);
		
		return result;
	}
}	
