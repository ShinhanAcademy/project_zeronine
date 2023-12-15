package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
