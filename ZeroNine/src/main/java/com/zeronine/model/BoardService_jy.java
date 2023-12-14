package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService_jy")
public class BoardService_jy {
	
	@Autowired
	BoardDAOMybatis_jy boardDAO_jy;
	
	public List<Map<String, Object>> selectFastBoardList() {
		List<Map<String, Object>> infoFList = boardDAO_jy.selectFastBoardList();
		System.out.println(infoFList);
		return infoFList;
	}
	
	public Map<String, Object> selectDetailView(String boardId) {
		Map<String, Object> detail = boardDAO_jy.selectDetailView(boardId);
		System.out.println("servie 디테일 정보" + detail);
		return detail;
	}
	
	public List<Map<String, Object>> selectOneBoardList(){
		List<Map<String, Object>> infoOne = boardDAO_jy.selecOneBoardList();
		return infoOne;
	}


}
