package com.zeronine.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.PagingVO;
import com.zeronine.dto.ProductAdditionalImageVO;
import com.zeronine.dto.ProductVO;

@Service("productService")
public class ProductService {

	@Autowired
	ProductDAOMybatis productDAO;

	int pageLimit = 12;
	int blockLimit = 5;

	public List<Map<String,Object>> searchAll(int page, int selectedValue, String inputValue, String buttonValue) {
		// 1�럹�씠吏��떦 �굹�삤寃뚰븷 �븣
		int pageStartNum = (page - 1) * pageLimit;
		System.out.println("searchAll"+selectedValue);
		Map<String, Object> paginateParam = new HashMap<>();
		paginateParam.put("start", pageStartNum);
		paginateParam.put("selectedValue", selectedValue);
		paginateParam.put("inputValue", inputValue);
		paginateParam.put("buttonValue", buttonValue);
		System.out.println(paginateParam.toString());
		List<Map<String,Object>> plist = productDAO.searchAll(paginateParam);
	
		return  plist;
	
	}

	public PagingVO getPages(int page, int selectedValue, String inputValue, String buttonValue) {
		Map<String, Object> paginateParam = new HashMap<>();
		paginateParam.put("inputValue", inputValue);
		paginateParam.put("buttonValue", buttonValue);
		
		
		int countProducts = productDAO.countProduct(inputValue ,buttonValue);

		int maxPageNumber = (int) (Math.ceil((double) countProducts / pageLimit));

		int startPageNumber = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

		int endPageNumber = startPageNumber + blockLimit - 1;
		if (endPageNumber > maxPageNumber) {
			endPageNumber = maxPageNumber;
		}
		PagingVO paramsPage = new PagingVO();
		paramsPage.setEndPageNumber(endPageNumber);
		paramsPage.setMaxPageNumber(maxPageNumber);
		paramsPage.setPageNumber(page);
		paramsPage.setStartPageNumber(startPageNumber);
		System.out.println(paramsPage.toString());
		return paramsPage;

	}


	public int countProduct(String inputValue,String buttonValue) {
		// TODO Auto-generated method stub
		int cnt = productDAO.countProduct(inputValue,buttonValue);
		return cnt;
	}

	public ProductVO selectByProductId(String productId) {
		return productDAO.selectByProductId(productId);
	}

	public List<Map<String,Object>>  selectDetailDelivery4() {
		return productDAO.selectDetailDelivery4();
	}

	
	public ProductVO selectByPricePname(String productId) {
		return productDAO.selectByPricePname(productId);
	}

	public List<ProductVO> selectByProductList(String[] productIdArr) {
		// TODO Auto-generated method stub
		return productDAO.selectByProductList(productIdArr);
	}

	public List<ProductVO> selectRecommendedProducts(Integer count) {
		return productDAO.selectRecommendedProducts(count);
	}

	public String selectPImage(String productId) {
		return productDAO.selectPImage(productId);
	}

	public List<ProductAdditionalImageVO> selectDetailImage(String productId) {
		return productDAO.selectDetailImage(productId);
	}
}