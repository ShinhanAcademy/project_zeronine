package com.zeronine.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("deliveryproductService_ys")
public class DeliveryProductService_ys {
	
	@Autowired
	DeliveryProductDAOMybatis_ys deliveryproductDAO_ys;
	
	public int PersonGoDeliveryProduct(String deliveryId, String custid,String productId) {
		return deliveryproductDAO_ys.PersonGoDeliveryProduct(deliveryId, custid, productId);
	}
}
