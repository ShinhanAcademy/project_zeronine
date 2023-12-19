package com.zeronine.model;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.DeliveryProductVO;

@Repository("deliveryproductDAO_ys")
public class DeliveryProductDAOMybatis_ys {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(DeliveryProductDAOMybatis_ys.class);
	final static String NAMESPACE = "net.zeronine.personorder.";
	
	
	public int PersonGoDelivery(String deliveryId, String custid, String address, String addressdetail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deliveryId", deliveryId);
		map.put("custid", custid);
	    map.put("address", address);
	    map.put("addressdetail", addressdetail);
		return sqlSession.insert(NAMESPACE + "PersonGoDelivery",map);
	}


	public int PersonGoDeliveryProduct(String deliveryId, String custid, String productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deliveryId", deliveryId);
		map.put("custid", custid);
		map.put("productId", productId);
		return sqlSession.insert(NAMESPACE + "PersonGoDeliveryProduct",map);
	}


	public DeliveryProductVO selectByDidpCount(String deliveryId) {
		DeliveryProductVO deliveryproduct = sqlSession.selectOne(NAMESPACE + "selectByDidpCount",deliveryId);
		return deliveryproduct;
	}
	

}

	

