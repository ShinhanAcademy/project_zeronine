package com.zeronine.model;

import java.util.List;

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
	
	
	public List<ProductVO> selectAll() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectAll");
		logger.info("selectAll:{}°Ç", productList.size());
		return productList;
	}
}
