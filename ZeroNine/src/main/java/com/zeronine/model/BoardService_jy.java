package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.DealFailRefundVO;
import com.zeronine.dto.DealSuccessBoardVO;

@Service("boardService_jy")
public class BoardService_jy {
	
	@Autowired
	BoardDAOMybatis_jy boardDAO_jy;
	
	//fast
	public List<Map<String, Object>> selectFastBoardList() {
		List<Map<String, Object>> infoFList = boardDAO_jy.selectFastBoardList();
		return infoFList;
	}
	
	public Map<String, Object> selectFastDetail(String boardId) {
		Map<String, Object> detail = boardDAO_jy.selectFastDetail(boardId);
		return detail;
	}
	
	public List<Map<String, Object>> selectValidFastList(){
		List<Map<String, Object>> infoVFb = boardDAO_jy.selectValidFastList();
		return infoVFb;
	}
	
	//deal success fail
	public List<DealFailRefundVO> selectDealFailBoard(){
		List<DealFailRefundVO> fail =  boardDAO_jy.selectDealFailBoard();
		return fail;
	}
	
	public List<DealSuccessBoardVO> selectDealSuccessBoard(){
		List<DealSuccessBoardVO> success =  boardDAO_jy.selectDealSuccessBoard();
		return success;
	}
	
	//free
	public List<Map<String, Object>> selectFreeDeliveryBoard(){
		List<Map<String, Object>> infoFree = boardDAO_jy.selectFreeDeliveryBoard();
		return infoFree;
	}
	
	public Map<String, Object> selectFreeDetail(String boardId){
		Map<String, Object> freeDetail = boardDAO_jy.selectFreeDetail(boardId);
		return freeDetail;
	}
	
	public List<Map<String, Object>> selectValidFreeList(){
		List<Map<String, Object>> infoVFreeb = boardDAO_jy.selectValidFreeList();
		return infoVFreeb;
	}
	
	//oneBoard
	public List<Map<String, Object>> selectOneBoardList(){
		List<Map<String, Object>> infoOne = boardDAO_jy.selecOneBoardList();
		return infoOne;
	}
	
	public Map<String, Object> selectOneDetail(String boardId) {
		Map<String, Object> detail = boardDAO_jy.selectOneDetail(boardId);
		return detail;
	}
	
	
}
