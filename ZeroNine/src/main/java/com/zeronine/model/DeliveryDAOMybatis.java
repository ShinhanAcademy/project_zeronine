package com.zeronine.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.DeliveryVO;

@Repository("deliveryDAO")
public class DeliveryDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ProductDAOMybatis.class);
	final static String NAMESPACE="net.zeronine.delivery.";

	public List<DeliveryVO> selectAll(){
		List<DeliveryVO> deliveryList = sqlSession.selectList(NAMESPACE + "selectAll");
		logger.info("selectAll:{}", deliveryList.size());
		return deliveryList;
	}
	
}
