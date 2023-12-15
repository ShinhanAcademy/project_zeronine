package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("cartService")
public class CartService {

	@Autowired
	CartDAOMybatis cartDAO;
	
	public int goProductCart(String custid, String productId) {
		return cartDAO.goProductCart(custid, productId);
	}
	public List<String> cartCheckPid(String custId) {
		return  cartDAO.cartCheckPid(custId);
	}
}
