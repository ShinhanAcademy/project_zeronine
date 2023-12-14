package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("boardService")
public class BoardService_yn {
	
	@Autowired
	BoardDAOMybatis_yn boardDAO;

	public List<Map<String,Object>> myWriteBlist(String customerId) {
		return boardDAO.myWriteBlist(customerId);
	}

	public Map<String, Object> boardDetail(String boardId) {
		return boardDAO.boardDetail(boardId);
	}

	public int boardpCount(String boardId) {
		return boardDAO.boardpCount(boardId);
	}

	public int numOfParticipant(String boardId) {
		return boardDAO.numOfParticipant(boardId);
	}

	public List<Map<String, Object>> myWriteFreeBlist(String customerId) {
		return boardDAO.myWriteFreeBlist(customerId);
	}

	public Map<String, Object> freeBoardDetail(String boardId) {
		return boardDAO.freeBoardDetail(boardId);
	}

	public int numOfFreeParticipant(String boardId) {
		return boardDAO.numOfFreeParticipant(boardId);
	}

	public List<Map<String, Object>> myParticipatedBlist(String customerId) {
		return boardDAO.myParticipatedBlist(customerId);
	}

	public List<Map<String, Object>> myParticipatedFreeBlist(String customerId) {
		return boardDAO.myParticipatedFreeBlist(customerId);
	}

	public List<Map<String, Object>> likeBoardBlist(String customerId) {
		return boardDAO.likeBoardBlist(customerId);
	}

	public List<Map<String, Object>> likeBoardFreeBlist(String customerId) {
		return boardDAO.likeBoardFreeBlist(customerId);
	}

	public List<String> likeBidList(String customerId) {
		return boardDAO.likeBidList(customerId);
	}

	public int deleteLikedBoard(String customerId, String boardId) {
		return boardDAO.deleteLikedBoard(customerId,boardId);
	}

	public int insertLikedBoard(String customerId, String boardId) {
		return boardDAO.insertLikedBoard(customerId,boardId);
	}

	public List<String> likeFreeBidList(String customerId) {
		return boardDAO.likeFreeBidList(customerId);
	}

	public List<Map<String, Object>> chatBlist(String customerId) {
		return boardDAO.chatBlist(customerId);
	}

	public Map<String, Object> boardDetailEdit(String boardId) {
		return boardDAO.boardDetailEdit(boardId);
	}

}
