package com.zeronine.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.CustomerVO;

@Repository("customerDAO")
public class CustomerDAOMybatis {

	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(CustomerDAOMybatis.class);
	final static String NAMESPACE = "net.zeronine.customer.";
	
	public List<CustomerVO> selectAll(){
		List<CustomerVO> clist = sqlSession.selectList(NAMESPACE + "selectAll");
		logger.info("selectAll:{}°Ç", clist.size());
		return clist;
	}
	
	public CustomerVO selectByName(String customerName){
		CustomerVO cust = sqlSession.selectOne(NAMESPACE + "selectByName", customerName);
		return cust;
	}

	public int emailCheck(String email) {
		int cnt = sqlSession.selectOne(NAMESPACE + "emailCheck", email);
		return cnt;
	}

	public int phoneCheck(String phone) {
		int cnt = sqlSession.selectOne(NAMESPACE + "phoneCheck", phone);
		return cnt;
	}

	public int joinMembership(CustomerVO customer) {
		int cnt = sqlSession.insert(NAMESPACE + "joinMembership",customer);
		return cnt;
	}

	public int login(String email, String pwd) {
		HashMap<String,String> info = new HashMap<>();
		info.put("email", email);
		info.put("pwd", pwd);
		int cnt = sqlSession.selectOne(NAMESPACE + "login", info);
		return cnt;
	}

	public String findEmail(String name, String phone) {
		HashMap<String,String> info = new HashMap<>();
		info.put("name", name);
		info.put("phone", phone);
		String email = sqlSession.selectOne(NAMESPACE + "findEmail", info);
		return email;
	}

	public String findPwd(String name, String email) {
		HashMap<String,String> info = new HashMap<>();
		info.put("name", name);
		info.put("email", email);
		String pwd = sqlSession.selectOne(NAMESPACE + "findPwd", info);
		return pwd;
	}

}
