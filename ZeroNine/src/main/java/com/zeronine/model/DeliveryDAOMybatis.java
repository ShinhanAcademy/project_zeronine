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

	public String addPersentage(String str) {
		return "%"+str+"%";
	}

	public String endDateFormat(String str) {
		return str+" 23:59:59";
	}
	
	/* orderHistoryAll */
	public List<Map<String, Object>> orderHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		
		List<Map<String, Object>> orderHistoryList = sqlSession.selectList(NAMESPACE + "orderHistoryAll", mapData);
//		logger.info("orderHistoryAll조회조건:{}...결과:{}건", mapData, orderHistoryList.size());

		return orderHistoryList;
	}

	/* orderCancelHistoryAll */
	public List<Map<String, Object>> orderCancelHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		
//		logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> orderCancelHistoryList = sqlSession.selectList(NAMESPACE + "orderCancelHistoryAll", mapData);
		//logger.info("orderCancelHistoryAll조회조건:{}...결과:{}건", mapData, orderCancelHistoryList.size());

		return orderCancelHistoryList;
	}

	/* myCart */
	public List<Map<String, Object>> myCart(String customerId) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		
//		logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> myCartList = sqlSession.selectList(NAMESPACE + "myCart", mapData);
		logger.info("myCart조회조건:{}...결과:{}건", mapData, myCartList.size());

		return myCartList;
	}
	
	/* likeProduct */
	public List<Map<String, Object>> likeProduct(String customerId, String searchWord) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		
//		logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> likeProductList = sqlSession.selectList(NAMESPACE + "likeProduct", mapData);
//		logger.info("likeProduct조회조건:{}...결과:{}건", mapData, likeProductList.size());

		return likeProductList;
	}
	
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		Map<String, Object> result = sqlSession.selectOne(NAMESPACE+"orderHistoryAll",customerId);
		return result;
	}
	*/
}
