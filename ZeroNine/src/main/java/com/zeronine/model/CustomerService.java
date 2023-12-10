package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.CustomerVO;

@Service("customerService")
public class CustomerService {

	@Autowired
	CustomerDAOMybatis customerDAO;
	
	public List<CustomerVO> selectAll(){
		return customerDAO.selectAll();
	}
	
	public CustomerVO selectByName(String customerName) {
		return customerDAO.selectByName(customerName);
	}

	public int emailCheck(String email) {
		return customerDAO.emailCheck(email);
	}

	public int phoneCheck(String phone) {
		return customerDAO.phoneCheck(phone);
	}

	public int joinMembership(CustomerVO customer) {
		return customerDAO.joinMembership(customer);
	}

	public int login(String email, String pwd) {
		return customerDAO.login(email,pwd);
	}

	public String findEmail(String name, String phone) {
		return customerDAO.findEmail(name,phone);
	}

	public String findPwd(String name, String email) {
		return customerDAO.findPwd(name,email);
	}
	
	public CustomerVO selectById(String customerId) {
		return customerDAO.selectById(customerId);
	}
	
	public CustomerVO selectByEmail(String email) {
		return customerDAO.selectByEmail(email);
	}
}
