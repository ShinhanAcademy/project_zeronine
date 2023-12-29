package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.DealFailRefundVO;
import com.zeronine.dto.DealSuccessBoardVO;

@Repository("boardDAO_jy")
public class BoardDAOMybatis_jy {

	@Autowired
	SqlSession sqlSession;
	Logger logger= LoggerFactory.getLogger(BoardDAOMybatis_jy.class);
	final static String namespace = "net.zeronine.board.";
	
	//fast
	public List<Map<String, Object>> selectFastBoardList(){
		List<Map<String, Object>> infoFb =  sqlSession.selectList(namespace+"selectFastBoardList");
		System.out.println(infoFb);
		return infoFb;
	}
	
	public Map<String, Object> selectFastDetail(String boardId){
		Map<String, Object> detail = sqlSession.selectOne(namespace+"selectFastDetail", boardId);
		System.out.println(detail);
		return detail;
	}
	
	//fast valid
	public List<Map<String, Object>> selectValidFastList(){
		List<Map<String, Object>> infoVFb = sqlSession.selectList(namespace+"selectValidFastList");
		return infoVFb;
	}
	
	//deal fail success
	public List<DealFailRefundVO> selectDealFailBoard(){
		List<DealFailRefundVO> fail = sqlSession.selectList(namespace+"selectDealFailBoard");
		return fail;
	}
	
	public List<DealSuccessBoardVO> selectDealSuccessBoard(){
		List<DealSuccessBoardVO> success = sqlSession.selectList(namespace+"selectDealSuccessBoard");
		return success;
	}
	
	//free
	public List<Map<String, Object>> selectFreeDeliveryBoard(){
		List<Map<String, Object>> infoFree = sqlSession.selectList(namespace+"selectFreeDeliveryBoard");
		return infoFree;
	}
	
	public Map<String, Object> selectFreeDetail(String boardId){
		Map<String, Object> freeDetail = sqlSession.selectOne(namespace+"selectFreeDetail",boardId);
		System.out.println("이것은 dao의 디테일 "+freeDetail);
		return freeDetail;
	}
	
	//free valid
	public List<Map<String, Object>> selectValidFreeList(){
		List<Map<String, Object>> infoVFreeb = sqlSession.selectList(namespace+"selectValidFreeList");
		return infoVFreeb;
	}
	
	//oneBoard
	public List<Map<String, Object>> selecOneBoardList() {
		List<Map<String, Object>> infoOne = sqlSession.selectList(namespace+"selectOneBoardList");
		return infoOne;
	}
	
	
	public Map<String, Object> selectOneDetail(String boardId){
		Map<String, Object> detail = sqlSession.selectOne(namespace+"selectOneDetail", boardId);
		System.out.println(detail);
		return detail;
	}
	
	
		
}
