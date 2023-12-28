package com.zeronine.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.PagingVO;
import com.zeronine.dto.ProductVO;

@Service("boardService")
public class BoardService_yn {

	@Autowired
	BoardDAOMybatis_yn boardDAO;

	int pageLimit = 5;
	int blockLimit = 5;

	public List<Map<String, Object>> myWriteBlist(String customerId) {
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
		return boardDAO.deleteLikedBoard(customerId, boardId);
	}

	public int insertLikedBoard(String customerId, String boardId) {
		return boardDAO.insertLikedBoard(customerId, boardId);
	}

	public List<String> likeFreeBidList(String customerId) {
		return boardDAO.likeFreeBidList(customerId);
	}

	public List<Map<String, Object>> chatBlist(int page, String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.chatBlist(pageStartNum, customerId);
	}

	public int chatBlistCount(String customerId) {
		return boardDAO.chatBlistCount(customerId);
	}

	public PagingVO chatBlistgetPages(int page, String customerId) {

		int chatBlistCount = boardDAO.chatBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) chatBlistCount / pageLimit));

		int startPageNumber = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

		int endPageNumber = startPageNumber + blockLimit - 1;
		if (endPageNumber > maxPageNumber) {
			endPageNumber = maxPageNumber;
		}
		PagingVO paramsPage = new PagingVO();
		paramsPage.setEndPageNumber(endPageNumber);
		paramsPage.setMaxPageNumber(maxPageNumber);
		paramsPage.setPageNumber(page);
		paramsPage.setStartPageNumber(startPageNumber);
		System.out.println(paramsPage.toString());
		return paramsPage;

	}

	public Map<String, Object> boardDetailEdit(String boardId) {
		return boardDAO.boardDetailEdit(boardId);
	}

	public int completeEdit(String title, String context, String boardId) {
		return boardDAO.completeEdit(title, context, boardId);
	}

	public int completeEditTime(String title, String context, int remainTime, String boardId) {
		return boardDAO.completeEditTime(title, context, remainTime, boardId);
	}

	public int deleteBoard(String boardId) {
		return boardDAO.deleteBoard(boardId);
	}

	public Map<String, Object> chatListDetail(String boardId) {
		return boardDAO.chatListDetail(boardId);
	}

	public Map<String, Object> freeBoardDetailEdit(String boardId) {
		return boardDAO.freeBoardDetailEdit(boardId);
	}

	public List<Map<String, Object>> participantChatList(int page, String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.participantChatList(pageStartNum, customerId);
	}

	public int participantChatListCount(String customerId) {
		return boardDAO.participantChatListCount(customerId);
	}

	public PagingVO participantChatListgetPages(int page, String customerId) {

		int participantChatListCount = boardDAO.participantChatListCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) participantChatListCount / pageLimit));

		int startPageNumber = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;

		int endPageNumber = startPageNumber + blockLimit - 1;
		if (endPageNumber > maxPageNumber) {
			endPageNumber = maxPageNumber;
		}
		PagingVO paramsPage = new PagingVO();
		paramsPage.setEndPageNumber(endPageNumber);
		paramsPage.setMaxPageNumber(maxPageNumber);
		paramsPage.setPageNumber(page);
		paramsPage.setStartPageNumber(startPageNumber);
		System.out.println(paramsPage.toString());
		return paramsPage;

	}

	public int numOfChatParticipant(String boardId) {
		return boardDAO.numOfChatParticipant(boardId);
	}

	public Map<String, Object> chatListEdit(String boardId) {
		return boardDAO.chatListEdit(boardId);
	}

	public int completeChatEdit(String title, String context, String boardId) {
		return boardDAO.completeChatEdit(title, context, boardId);
	}

	public List<Map<String, Object>> successMyWriteBlist(String customerId) {
		return boardDAO.successMyWriteBlist(customerId);
	}

	public List<Map<String, Object>> successMyWriteFreeBlist(String customerId) {
		return boardDAO.successMyWriteFreeBlist(customerId);
	}

	public List<Map<String, Object>> successMyParticipatedBlist(String customerId) {
		return boardDAO.successMyParticipatedBlist(customerId);
	}

	public List<Map<String, Object>> successMyParticipatedFreeBlist(String customerId) {
		return boardDAO.successMyParticipatedFreeBlist(customerId);
	}

	public List<Map<String, Object>> freeBoardProductEdit(String boardId, String customerId) {
		return boardDAO.freeBoardProductEdit(boardId, customerId);
	}

	public int completeFreeEdit(String title, String context, String boardId) {
		return boardDAO.completeFreeEdit(title, context, boardId);
	}

	public int completeFreeEditTime(String title, String context, int remainTime, String boardId) {
		return boardDAO.completeFreeEditTime(title, context, remainTime, boardId);
	}

	public int deleteChat(String boardId) {
		return boardDAO.deleteChat(boardId);
	}

	public List<Map<String, Object>> myCart(String customerId) {
		return boardDAO.myCart(customerId);
	}

	public ProductVO selectByPid(String productId) {
		return boardDAO.selectByPid(productId);
	}

	public Map<String, Object> orderInfo(String customerId, String boardId) {
		return boardDAO.orderInfo(customerId, boardId);
	}

	public int orderFastProduct(String customerId, String boardId, int count) {
		return boardDAO.orderFastProduct(customerId, boardId, count);
	}

	public Map<String, Object> fastBoardProduct(String boardId) {
		return boardDAO.fastBoardProduct(boardId);
	}

	public int orderFreeProduct(String customerId, String boardId, Map<String, Integer> productList) {
		return boardDAO.orderFreeProduct(customerId, boardId, productList);
	}

	public Map<String, Object> freeOrderInfo(String customerId, String boardId) {
		return boardDAO.freeOrderInfo(customerId, boardId);
	}

	public int freeTotalPrice(String customerId, String boardId) {
		return boardDAO.freeTotalPrice(customerId, boardId);
	}

	public void deleteCart(String authorId, String productId) {
		boardDAO.deleteCart(authorId, productId);
	}

	public int isParticipateFast(String customerId, String boardId) {
		return boardDAO.isParticipateFast(customerId, boardId);
	}

	public int isParticipateFree(String customerId, String boardId) {
		return boardDAO.isParticipateFree(customerId, boardId);
	}

}
