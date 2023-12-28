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

	public List<Map<String, Object>> myWriteBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.myWriteBlist(pageStartNum,customerId);
	}
	public int myWriteBlistCount(String customerId) {
		return boardDAO.myWriteBlistCount(customerId);
	}
	public PagingVO myWriteBlistgetPages(int page, String customerId) {

		int myWriteBlistCount = boardDAO.myWriteBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) myWriteBlistCount / pageLimit));

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
	public List<Map<String, Object>> successMyWriteBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.successMyWriteBlist(pageStartNum,customerId);
	}
	public int successMyWriteBlistCount(String customerId) {
		return boardDAO.successMyWriteBlistCount(customerId);
	}
	public PagingVO successMyWriteBlistgetPages(int page, String customerId) {

		int successMyWriteBlistCount = boardDAO.successMyWriteBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) successMyWriteBlistCount / pageLimit));

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
	
	public Map<String, Object> boardDetail(String boardId) {
		return boardDAO.boardDetail(boardId);
	}

	public int boardpCount(String boardId) {
		return boardDAO.boardpCount(boardId);
	}

	public int numOfParticipant(String boardId) {
		return boardDAO.numOfParticipant(boardId);
	}

	public List<Map<String, Object>> myWriteFreeBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.myWriteFreeBlist(pageStartNum,customerId);
	}
	public int myWriteFreeBlistCount(String customerId) {
		return boardDAO.myWriteFreeBlistCount(customerId);
	}
	public PagingVO myWriteFreeBlistgetPages(int page, String customerId) {

		int MyWriteFreeBlistCount = boardDAO.myWriteFreeBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) MyWriteFreeBlistCount / pageLimit));

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
	public Map<String, Object> freeBoardDetail(String boardId) {
		return boardDAO.freeBoardDetail(boardId);
	}

	public int numOfFreeParticipant(String boardId) {
		return boardDAO.numOfFreeParticipant(boardId);
	}
	
	
	public PagingVO myParticipatedBlistgetPages(int page, String customerId) {

		int myParticipatedBlistCount = boardDAO.myParticipatedBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) myParticipatedBlistCount / pageLimit));

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
	public List<Map<String, Object>> myParticipatedBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.myParticipatedBlist(pageStartNum,customerId);
	}
	public int myParticipatedBlistCount(String customerId) {
		return boardDAO.myParticipatedBlistCount(customerId);
	}
	
	
	public PagingVO successMyParticipatedBlistgetPages(int page, String customerId) {

		int successMyParticipatedBlistCount = boardDAO.successMyParticipatedBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) successMyParticipatedBlistCount / pageLimit));

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
	public List<Map<String, Object>> successMyParticipatedBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.successMyParticipatedBlist(pageStartNum,customerId);
	}
	public int successMyParticipatedBlistCount(String customerId) {
		return boardDAO.successMyParticipatedBlistCount(customerId);
	}
	public PagingVO myParticipatedFreeBlistgetPages(int page, String customerId) {

		int myParticipatedFreeBlistCount = boardDAO.myParticipatedFreeBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) myParticipatedFreeBlistCount / pageLimit));

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


	public List<Map<String, Object>> myParticipatedFreeBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.myParticipatedFreeBlist(pageStartNum,customerId);
	}
	public int myParticipatedFreeBlistCount(String customerId) {
		return boardDAO.myParticipatedFreeBlistCount(customerId);
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

	public PagingVO successMyWriteFreeBlistgetPages(int page, String customerId) {

		int successMyWriteFreeBlistCount = boardDAO.successMyWriteFreeBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) successMyWriteFreeBlistCount / pageLimit));

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
	public List<Map<String, Object>> successMyWriteFreeBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.successMyWriteFreeBlist(pageStartNum,customerId);
	}
	public int successMyWriteFreeBlistCount(String customerId) {
		return boardDAO.successMyWriteFreeBlistCount(customerId);
	}

	public PagingVO successMyParticipatedFreeBlistgetPages(int page, String customerId) {

		int successMyParticipatedFreeBlistCount = boardDAO.successMyParticipatedFreeBlistCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) successMyParticipatedFreeBlistCount / pageLimit));

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
	public List<Map<String, Object>> successMyParticipatedFreeBlist(int page,String customerId) {
		int pageStartNum = (page - 1) * pageLimit;
		return boardDAO.successMyParticipatedFreeBlist(pageStartNum,customerId);
	}
	public int successMyParticipatedFreeBlistCount(String customerId) {
		return boardDAO.successMyParticipatedFreeBlistCount(customerId);
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
	public List<Map<String, Object>> mySubscriptionInfo(String customerId) {
		return boardDAO.mySubscriptionInfo(customerId);
	}

}
