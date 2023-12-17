package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService_sg")
public class BoardService_sg {
	
	@Autowired
	BoardDAOMybatis_sg boardDAO_sg;
	
	public int writeOBoard(String boardId, String authorId, String title, String content, String postingMinutes, String imgURL, String address, String addressDetail) {
		return boardDAO_sg.writeOBoard(boardId, authorId, title, content, postingMinutes, imgURL, address, addressDetail);
	}
	
	
}
