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
		System.out.println(infoFList);
		return infoFList;
	}
	
	public Map<String, Object> selectFastDetail(String boardId) {
		Map<String, Object> detail = boardDAO_jy.selectFastDetail(boardId);
		System.out.println("servie 에서 확인하는 fast디테일" + detail);
		return detail;
	}
	
	public List<DealFailRefundVO> selectDealFailBoard(){
		List<DealFailRefundVO> fail =  boardDAO_jy.selectDealFailBoard();
		System.out.println("이건 서비스에서 찍는 fail 정보 : " + fail);
		return fail;
	}
	
	public List<DealSuccessBoardVO> selectDealSuccessBoard(){
		List<DealSuccessBoardVO> success =  boardDAO_jy.selectDealSuccessBoard();
		System.out.println("이건 서비스에서 찍는 success 정보 : " + success);
		return success;
	}
	
	//free
	public List<Map<String, Object>> selectFreeDeliveryBoard(){
		List<Map<String, Object>> infoFree = boardDAO_jy.selectFreeDeliveryBoard();
		System.out.println("이건 서비스에서 찍는 infoFree 정보 : " + infoFree);
		return infoFree;
	}
	
	//oneBoard
	public List<Map<String, Object>> selectOneBoardList(){
		List<Map<String, Object>> infoOne = boardDAO_jy.selecOneBoardList();
		return infoOne;
	}
	
	public Map<String, Object> selectOneDetail(String boardId) {
		Map<String, Object> detail = boardDAO_jy.selectOneDetail(boardId);
		System.out.println("servie 에서 확인하는 one디테일" + detail);
		return detail;
	}
	
	
}
