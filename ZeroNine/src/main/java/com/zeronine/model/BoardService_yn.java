package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.BoardVO;

@Service("boardService")
public class BoardService_yn {
	
	@Autowired
	BoardDAOMybatis_yn boardDAO;

	public List<BoardVO> myWriteBlist(String customerId) {
		return boardDAO.myWriteBlist(customerId);
	}

	public List<String> getRemainTime(String customerId) {
		return boardDAO.getRemainTime(customerId);
	}


}
