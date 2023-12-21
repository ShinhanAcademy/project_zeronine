package com.zeronine.model;

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
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "insertFreeDelivery", customerId);
	}

	public int pay5Ecocare(String customerId) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + "insert5Ecocare", customerId);
	}

	public int payEcocareSubscription(String customerId) {
		return sqlSession.insert(NAMESPACE + "payEcocareSubscription", customerId);
	}

}
