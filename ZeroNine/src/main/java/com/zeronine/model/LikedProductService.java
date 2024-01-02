package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.LikedProductVO;

@Service("LikedproductService")
public class LikedProductService {

	@Autowired
	LikedProductDAOMybatis likedproductDAO;

	public int insertLikedProduct(String custid, String productId) {
		return likedproductDAO.insertLikedProduct(custid, productId);
	}

	public LikedProductVO selectByPid(String productId) {
		return likedproductDAO.selectByPid(productId);
	}

	public LikedProductVO selectByCid(String custId) {
		return likedproductDAO.selectByCid(custId);
	}

	public List<String> selectByCidlist(String custId) {
		return likedproductDAO.selectByCidlist(custId);
	}

	public int deleteLikedProduct(String custid, String productId) {
		return likedproductDAO.deleteLikedProduct(custid, productId);
	}

}
