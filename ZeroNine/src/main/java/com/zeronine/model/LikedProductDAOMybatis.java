package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.LikedProductVO;

@Repository("LikedProductDAO")
public class LikedProductDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(LikedProductDAOMybatis.class);
	String namespace = "net.zeronine.product.";

	public int insertLikedProduct(String custid, String productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custid", custid);
		map.put("productId", productId);
		return sqlSession.insert(namespace + "insertLikedProduct", map);
	}

	
	public LikedProductVO selectByPid(String productId) {
		LikedProductVO Lpro = sqlSession.selectOne(namespace + "selectByPid", productId);
		return Lpro;
	}

	public LikedProductVO selectByCid(String custId) {
		LikedProductVO Lpro = sqlSession.selectOne(namespace + "selectByCid", custId);
		return Lpro;
	}

	public List<String> selectByCidlist(String custId) {
		List<String> clist = sqlSession.selectList(namespace + "selectByCidlist", custId);

		return clist;
	}

	public int deleteLikedProduct(String custid, String productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custid", custid);
		map.put("productId", productId);	
		int result = sqlSession.delete(namespace + "deleteLikedProduct", map);
			return result;
	}

}
