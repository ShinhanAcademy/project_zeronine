package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService_jy")
public class BoardService_jy {
	
	@Autowired
	BoardDAOMybatis_jy boardDAO_jy;
	
	public List<Map<String, Object>> selectfastBoardList() {
		List<Map<String, Object>> infoList = boardDAO_jy.selectfastBoardList();
		return infoList;
	}

}
