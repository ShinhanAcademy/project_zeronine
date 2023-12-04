package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.CustomerVO;

@Service
public class CustomerService {

	@Autowired
	CustomerDAOMybatis dao;
	
	public List<CustomerVO> selectAll(){
		return dao.selectAll();
	}
	
	public CustomerVO selectByName(String customerName) {
		return dao.selectByName(customerName);
	}
}
