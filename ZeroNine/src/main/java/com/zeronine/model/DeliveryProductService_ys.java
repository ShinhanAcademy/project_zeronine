package com.zeronine.model;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.DeliveryProductVO;

@Service("deliveryproductService_ys")
public class DeliveryProductService_ys {
	
	@Autowired
	DeliveryProductDAOMybatis_ys deliveryproductDAO_ys;
	
	public int PersonGoDeliveryProduct(String deliveryId, String custid,String productId) {
		return deliveryproductDAO_ys.PersonGoDeliveryProduct(deliveryId, custid, productId);
	}
	public Map<String, Object> selectOrderInfo(String deliveryId) {
		return deliveryproductDAO_ys.selectOrderInfo(deliveryId);
	}
}
