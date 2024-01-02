package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.ProductAdditionalImageVO;
import com.zeronine.dto.ProductVO;


@Repository("productDAO")
public class ProductDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger= LoggerFactory.getLogger(ProductDAOMybatis.class);
	String namespace = "net.zeronine.product.";
	
	
	public List<Map<String,Object>> searchAll(Map<String, Object> paginateParam) {
		List<Map<String,Object>> productList = sqlSession.selectList(namespace + "searchAll", paginateParam);
		//logger.info("searchAll:{}��", productList.size());
		return productList;
	}

	public int countProduct(String inputValue,String buttonValue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("inputValue", inputValue);
		map.put("buttonValue", buttonValue);
		int result = sqlSession.selectOne(namespace + "countProduct",map);
		
		return result;
	}
	public ProductVO selectByProductId(String productId) {
		ProductVO prodid = sqlSession.selectOne(namespace + "selectByProductId", productId);
		
		return prodid;	
	}


	public List<Map<String,Object>> selectDetailDelivery4() {
		List<Map<String,Object>> productList = sqlSession.selectList(namespace + "selectDetailDelivery4");
		return productList;
	}



	public ProductVO selectByPricePname(String productId) {
		ProductVO product = sqlSession.selectOne(namespace + "selectByPricePname",productId);
	return product;
	}

	public List<ProductVO> selectByProductList(String[] productIdArr) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectByProductList", productIdArr);
		return productList;
	}


	public List<ProductVO> selectRecommendedProducts(Integer count) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectRecommendedProducts", count);
		return productList;
	}

	public String selectPImage(String productId) {
		String pImage = sqlSession.selectOne(namespace + "selectPImage", productId);
		return pImage;
	}

	public List<ProductAdditionalImageVO> selectDetailImage(String productId) {
		List<ProductAdditionalImageVO> detailImage = sqlSession.selectList(namespace + "selectDetailImage", productId);
		return detailImage;
	}
	
}




