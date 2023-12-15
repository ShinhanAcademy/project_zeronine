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
	
	
	public List<ProductVO> selectAll() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectAll");
		logger.info("selectAll:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypCategoryId(Integer pCategoryId) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypCategoryId",pCategoryId);
		logger.info("selectBypCategoryId:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypCategoryIdall(Integer pCategoryId) {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypCategoryIdall",pCategoryId);
		logger.info("selectBypCategoryIdall:{}��", productList.size());
		return productList;
	}
	public List<ProductVO> selectBymanyLiked() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBymanyLiked");
		logger.info("selectBymanyLiked:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectByDelivery() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectByDelivery");
		logger.info("selectByDelivery:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypriceAsc() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypriceAsc");
		logger.info("selectByDelivery:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectBypriceDesc() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectBypriceDesc");
		logger.info("selectByDelivery:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectByPnameBrand(String q) {
		q = "%" + q + "%";
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectByPnameBrand",q);
		logger.info("selectByPnameBrand:{}��", productList.size());
		return productList;
	}


	public List<ProductVO> selectAll16os(Integer pcount) {
		 int pCount = pcount*4;
		System.out.println(pCount);
		 List<ProductVO> productList = sqlSession.selectList(namespace + "selectAll16os",pCount);
		logger.info("selectAll16os:{}��", productList.size());
		return productList;
	}
	public List<ProductVO> selectAll16() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectAll16");
		logger.info("selectAll16:{}��", productList.size());
		return productList;
	}


	public int countProduct() {
		
		//int productcount = sqlSession.selectOne(namespace + "countProduct");
		//sqlSession.selectOne(namespace + "countProduct").
		sqlSession.selectOne(namespace + "countProduct");
		//System.out.println("countProduct ==>" + );
		//logger.info("");
		//return productcount;
		return sqlSession.selectOne(namespace + "countProduct");
	}
	public ProductVO selectByProductId(String productId) {
		ProductVO prodid = sqlSession.selectOne(namespace + "selectByProductId", productId);
		
		return prodid;
		
	}


	public List<ProductVO> selectDetailDelivery4() {
		List<ProductVO> productList = sqlSession.selectList(namespace + "selectDetailDelivery4");
		return productList;
	}


	public List<ProductVO> pcategoryPageCount(int pCount, Integer pCategoryId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pCategoryId", pCategoryId);
		map.put("pCount", pCount);
		List<ProductVO> productList = sqlSession.selectList(namespace + "pcategoryPageCount", map);
		return productList;
	}
	
}




