package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.ProductVO;


@Repository("productDAO")
public class ProductDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger= LoggerFactory.getLogger(ProductDAOMybatis.class);
	String namespace = "net.zeronine.product.";
	
	
	public List<ProductVO> searchAll(Map<String, Object> paginateParam) {
		 List<ProductVO> productList = sqlSession.selectList(namespace + "searchAll", paginateParam);
		logger.info("searchAll:{}��", productList.size());
		return productList;
	}

	public int countProduct(Map<String, Object> paginateParam) {
		int result = sqlSession.selectOne(namespace + "countProduct",paginateParam);
		
		return result;
	}
	public ProductVO selectByProductId(String productId) {
		ProductVO prodid = sqlSession.selectOne(namespace + "selectByProductId", productId);
		
		return prodid;
		
	}


	public List<ProductVO> selectDetailDelivery4() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectDetailDelivery4");
		return productList;
	}



	public ProductVO selectByPricePname(String productId) {
		ProductVO product = sqlSession.selectOne(namespace + "selectByPricePname",productId);
	return product;
	}


	
}




