package com.zeronine.model;

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

}
