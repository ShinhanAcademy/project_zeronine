package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.ProductVO;



@Service("productService")
public class ProductService {

	@Autowired
	ProductDAOMybatis productDAO;
	
	public List<ProductVO> selectAll() {
		return productDAO.selectAll();
		}

	public List<ProductVO> selectBypCategoryId(Integer pCategoryId) {
		return productDAO.selectBypCategoryId( pCategoryId);
	}
	public List<ProductVO> selectBypCategoryIdall(Integer pCategoryId) {
		return productDAO.selectBypCategoryIdall( pCategoryId);
		
	}
	public List<ProductVO> selectBymanyLiked() {
		return productDAO.selectBymanyLiked();
	}
}
