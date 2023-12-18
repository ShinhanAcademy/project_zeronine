package com.zeronine.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("deliveryService_ys")
public class DeliveryService_ys {
	
	@Autowired
	DeliveryDAOMybatis_ys deliveryDAO_ys;
	
	public int PersonGoDelivery(String deliveryId, String custid,String address, String addressdetail) {
		return deliveryDAO_ys.PersonGoDelivery(deliveryId, custid, address, addressdetail);
	}
}
