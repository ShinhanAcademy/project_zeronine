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

@Repository("cartDAO")
public class CartDAOMybatis {
	
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(CustomerDAOMybatis.class);
	final static String NAMESPACE = "net.zeronine.gocart.";
	
	public int goProductCart(String custid, String productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custid", custid);
		map.put("productId", productId);
		
		return sqlSession.insert(NAMESPACE + "goProductCart", map);
	}
	public List<String>cartCheckPid(String custid) {
		List<String> prodid = sqlSession.selectList(NAMESPACE + "cartCheckPid", custid);
		return prodid;
		
	}

}