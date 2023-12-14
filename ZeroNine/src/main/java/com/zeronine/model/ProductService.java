package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.ProductVO;



@Service("productService")
public class ProductService {

	@Autowired
	ProductDAOMybatis productDAO;
	
	public List<ProductVO> selectAll16os(Integer pCount) {
		return productDAO.selectAll16os(pCount);
		}
	public List<ProductVO> selectAll16() {
		return productDAO.selectAll16();
		}
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
	public List<ProductVO> selectByDelivery() {
		return productDAO.selectByDelivery();
	}
	public List<ProductVO> selectBypriceAsc() {
		return productDAO.selectBypriceAsc();
	}
	public List<ProductVO> selectBypriceDesc() {
		return productDAO.selectBypriceDesc();
	}

	public List<ProductVO> selectByPnameBrand(String q) {
	
		return productDAO.selectByPnameBrand(q);
	}
	public int countProduct() {
		// TODO Auto-generated method stub
		Integer cnt = productDAO.countProduct();
		System.out.println("CountProduct cnt ==>"+cnt);
		return cnt;
	}

	
	
}
