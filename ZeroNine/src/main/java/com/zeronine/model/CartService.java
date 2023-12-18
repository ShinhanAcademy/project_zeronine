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
	public int plusProductCart(String custid, String productId) {
		// TODO Auto-generated method stub
		return cartDAO.plusProductCart(custid, productId);
	}

	public int goProductDCart(String custid, String productId, int pcount) {
		// TODO Auto-generated method stub
		return cartDAO.goProductDCart(custid, productId,pcount);
	}
	public int beforeproductOrder(String custid, String productId, int pcount) {
		return cartDAO.beforeproductOrder(custid, productId, pcount);
	}
	public List<String>orderOneCart(String custid, String productId) {
		return cartDAO.orderOneCart(custid, productId);
	}
}
