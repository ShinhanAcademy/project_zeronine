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
		logger.info("selectAll:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypCategoryId(Integer pCategoryId) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypCategoryId",pCategoryId);
		logger.info("selectBypCategoryId:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypCategoryIdall(Integer pCategoryId) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypCategoryIdall",pCategoryId);
		logger.info("selectBypCategoryIdall:{}건", productList.size());
		return productList;
	}
	public List<ProductVO> selectBymanyLiked() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBymanyLiked");
		logger.info("selectBymanyLiked:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectByDelivery() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectByDelivery");
		logger.info("selectByDelivery:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypriceAsc() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypriceAsc");
		logger.info("selectByDelivery:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypriceDesc() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypriceDesc");
		logger.info("selectByDelivery:{}건", productList.size());
		return productList;
	}


	public List<ProductVO> selectByPnameBrand(String q) {
		q = "%" + q + "%";
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectByPnameBrand",q);
		logger.info("selectByPnameBrand:{}건", productList.size());
		return productList;
	}
}
