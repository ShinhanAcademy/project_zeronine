package com.zeronine.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.PagingVO;
import com.zeronine.dto.ProductVO;

@Service("productService")
public class ProductService {

	@Autowired
	ProductDAOMybatis productDAO;

	int pageLimit = 12;
	int blockLimit = 5;

	public List<ProductVO> searchAll(int page, int selectedValue, String inputValue, String buttonValue) {
		// 1페이지당 나오게할 때
		int pageStartNum = (page - 1) * pageLimit;
		System.out.println("searchAll"+selectedValue);
		Map<String, Object> paginateParam = new HashMap<>();
		paginateParam.put("start", pageStartNum);
		paginateParam.put("selectedValue", selectedValue);
		paginateParam.put("inputValue", inputValue);
		paginateParam.put("buttonValue", buttonValue);
		System.out.println(paginateParam.toString());
		List<ProductVO> plist = productDAO.searchAll(paginateParam);
	


		return  plist;
	
	}

	// 하단 페이징한 데이터
	public PagingVO getPages(int page, int selectedValue, String inputValue, String buttonValue) {
		int pageStartNum = (page - 1) * pageLimit;
		Map<String, Object> paginateParam = new HashMap<>();
		paginateParam.put("start", pageStartNum);
		paginateParam.put("limit", pageLimit);
		paginateParam.put("inputValue", inputValue);
		paginateParam.put("buttonValue", buttonValue);
		String paramStr = buttonValue;
		System.out.println("paramStr"+paramStr);
		if (buttonValue.equals("0") || buttonValue==null) {
			paramStr = "%"; // '1', 2 ,3, 4
		}

		int countProducts = productDAO.countProduct(paginateParam);

		int maxPageNumber = (int) (Math.ceil((double) countProducts / pageLimit));

		int startPageNumber = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

		int endPageNumber = startPageNumber + blockLimit - 1;
		if (endPageNumber > maxPageNumber) {
			endPageNumber = maxPageNumber;
		}
		PagingVO paramsPage = new PagingVO();
		paramsPage.setEndPageNumber(endPageNumber);
		paramsPage.setMaxPageNumber(maxPageNumber);
		paramsPage.setPageNumber(endPageNumber);
		paramsPage.setStartPageNumber(startPageNumber);
		return paramsPage;

	}


	public int countProduct(Map<String, Object> inputValue) {
		// TODO Auto-generated method stub
		int cnt = productDAO.countProduct(inputValue);
		System.out.println("CountProduct cnt ==>" + cnt);
		return cnt;
	}

	public ProductVO selectByProductId(String productId) {
		return productDAO.selectByProductId(productId);
	}

	public List<ProductVO> selectDetailDelivery4() {
		return productDAO.selectDetailDelivery4();
	}

	
	public ProductVO selectByPricePname(String productId) {
		return productDAO.selectByPricePname(productId);
	}

}