package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<Map<String, Object>> orderHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", searchWord);
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDate);
		List<Map<String, Object>> orderHistoryList = sqlSession.selectList(NAMESPACE + "orderHistoryAll", mapData);
		logger.info("조회조건:{}...결과:{}건", mapData, orderHistoryList.size());

		return orderHistoryList;
	}
	 
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		Map<String, Object> result = sqlSession.selectOne(NAMESPACE+"orderHistoryAll",customerId);
		return result;
	}
	*/
}
