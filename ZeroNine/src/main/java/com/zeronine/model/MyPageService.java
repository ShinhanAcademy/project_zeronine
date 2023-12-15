package com.zeronine.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("myPageService")
public class MyPageService {

	@Autowired
	MyPageDAOMybatis myPageDAO;
	
	/*
	 * public List<DeliveryVO> selectAll(){ return deliveryDAO.selectAll(); }
	 */
	
	/* order history */
	public List<Map<String, Object>> orderHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		return myPageDAO.orderHistoryAll(customerId, searchWord, startDate, endDate);
	}

	/* order cancel history */
	public List<Map<String, Object>> orderCancelHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		return myPageDAO.orderCancelHistoryAll(customerId, searchWord, startDate, endDate);
	}

	/* like product */
	public List<Map<String, Object>> myCart(String customerId) {
		return myPageDAO.myCart(customerId);		
	}
	
	/* like product */
	public List<Map<String, Object>> likeProduct(String customerId, String searchWord) {
		return myPageDAO.likeProduct(customerId, searchWord);		
	}
	
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		return deliveryDAO.orderHistoryAll(customerId);
	}
	*/
	
	
}