package com.zeronine.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("payService")
public class PayService {
	
	@Autowired
	PayDAOMybatis payDAO;
	
	public int payFreeDeliverySubscription(String customerId) {
		return  payDAO.payFreeDeliverySubscription(customerId);
	}
	
	public int payFreeDeliverySubscription(String customerId, String subscriptionId) {
		return  payDAO.payFreeDeliverySubscription(customerId, subscriptionId);
	}

	public int pay5Ecocare(String customerId) {
		return payDAO.pay5Ecocare(customerId);
		
	}
	
	public int payEcocareSubscription(String customerId) {
		return payDAO.payEcocareSubscription(customerId);
	}
	
	public int payEcocareSubscription(String customerId, String subscriptionId) {
		return payDAO.payEcocareSubscription(customerId, subscriptionId);
	}
	
	public int IsFreeDelivery(String customerId) {
		return payDAO.IsFreeDelivery(customerId);
	}
}
