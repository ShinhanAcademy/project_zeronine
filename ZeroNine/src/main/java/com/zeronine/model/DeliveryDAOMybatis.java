package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.DeliveryProductVO;
import com.zeronine.dto.DeliveryVO;
import com.zeronine.dto.ProductMainImageVO;
import com.zeronine.dto.ProductVO;

@Repository("deliveryDAO")
public class DeliveryDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ProductDAOMybatis.class);
	final static String NAMESPACE="net.zeronine.delivery.";

	/*
	 * public List<DeliveryVO> orderHistoryAll(String customerId){ List<DeliveryVO>
	 * delivery = sqlSession.selectList(NAMESPACE + "selectAll");
	 * List<DeliveryProductVO> deliveryProduct = sqlSession.selectList(NAMESPACE +
	 * "selectAll"); List<ProductVO> deliveryList = sqlSession.selectList(NAMESPACE
	 * + "selectAll"); List<ProductMainImageVO> deliveryList =
	 * sqlSession.selectList(NAMESPACE + "selectAll"); logger.info("selectAll:{}",
	 * deliveryList.size()); return deliveryList;
	 * 
	 * }
	 */
	
	public List<Map<String, Object>> orderHistoryAll(String customerId) {
		List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		return result;
	}
	 
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		Map<String, Object> result = sqlSession.selectOne(NAMESPACE+"orderHistoryAll",customerId);
		return result;
	}
	*/
}
