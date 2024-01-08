package com.zeronine.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PayDAOMybatis")
public class PayDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ChatDAOMybatis.class);
	final static String NAMESPACE = "net.zeronine.pay.";

	public int payFreeDeliverySubscription(String customerId) {
		logger.info(customerId);
		return sqlSession.insert(NAMESPACE + "insertFreeDelivery", customerId);
	}

	public int pay5Ecocare(String customerId) {
		return sqlSession.insert(NAMESPACE + "insert5Ecocare", customerId);
	}

	public int payEcocareSubscription(String customerId) {
		return sqlSession.insert(NAMESPACE + "payEcocareSubscription", customerId);
	}

	public int IsFreeDelivery(String customerId) {
		int result =sqlSession.selectOne(NAMESPACE+ "IsFreeDelivery",customerId);
		return result;
	}

	public int payFreeDeliverySubscription(String customerId, String subscriptionId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("customerId", customerId);
		params.put("subscriptionId", subscriptionId);
		return sqlSession.insert(NAMESPACE + "insertFreeDeliveryWithId", params);
	}

	public int payEcocareSubscription(String customerId, String subscriptionId) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("customerId", customerId);
		params.put("subscriptionId", subscriptionId);
		return sqlSession.insert(NAMESPACE + "insertEcocareSubscriptionWithId", params);
	}

}
