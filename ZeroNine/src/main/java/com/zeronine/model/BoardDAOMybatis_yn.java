package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.ProductVO;

@Repository("boardDAO")
public class BoardDAOMybatis_yn {
	
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(BoardDAOMybatis_yn.class);
	final static String NAMESPACE = "net.zeronine.board.";
	
	public List<Map<String,Object>> myWriteBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myWriteBlist",customerId);
		return info;
	}

	public Map<String, Object> boardDetail(String boardId) {
		Map<String,Object> info = sqlSession.selectOne(NAMESPACE + "boardDetail",boardId);
		return info;
	}

	public int boardpCount(String boardId) {
		int count = sqlSession.selectOne(NAMESPACE + "boardpCount", boardId);
		return count;
	}

	public int numOfParticipant(String boardId) {
		int participant = sqlSession.selectOne(NAMESPACE + "numOfParticipant", boardId);
		return participant;
	}

	public List<Map<String, Object>> myWriteFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myWriteFreeBlist",customerId);
		return info;
	}

	public Map<String, Object> freeBoardDetail(String boardId) {
		Map<String,Object> info = sqlSession.selectOne(NAMESPACE + "freeBoardDetail",boardId);
		return info;
	}

	public int numOfFreeParticipant(String boardId) {
		int participant = sqlSession.selectOne(NAMESPACE + "numOfFreeParticipant", boardId);
		return participant;
	}

	public List<Map<String, Object>> myParticipatedBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myParticipatedBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> myParticipatedFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "myParticipatedFreeBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> likeBoardBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "likeBoardBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> likeBoardFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "likeBoardFreeBlist",customerId);
		return info;
	}

	public List<String> likeBidList(String customerId) {
		List<String> likedbid = sqlSession.selectList(NAMESPACE + "likeBidList", customerId);
		return likedbid;
	}

	public int deleteLikedBoard(String customerId, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("boardId", boardId);
		int result = sqlSession.delete(NAMESPACE + "deleteLikedBoard", map);
		return result;
	}

	public int insertLikedBoard(String customerId, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("boardId", boardId);
		int result = sqlSession.insert(NAMESPACE + "insertLikedBoard", map);
		return result;
	}

	public List<String> likeFreeBidList(String customerId) {
		List<String> likedbid = sqlSession.selectList(NAMESPACE + "likeFreeBidList", customerId);
		return likedbid;
	}

	public List<Map<String, Object>> chatBlist(String customerId) {
		List<Map<String, Object>> info = sqlSession.selectList(NAMESPACE + "chatBlist", customerId);
		return info;
	}

	public Map<String, Object> boardDetailEdit(String boardId) {
		Map<String, Object> info = sqlSession.selectOne(NAMESPACE + "boardDetailEdit", boardId);
		return info;
	}

	public int completeEdit(String title, String context, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("context", context);
		map.put("boardId", boardId);
		int result = sqlSession.update(NAMESPACE + "completeEdit", map);
		return result;
	}

	public int completeEditTime(String title, String context, int remainTime, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("context", context);
		map.put("remainTime", remainTime);
		map.put("boardId", boardId);
		int result = sqlSession.update(NAMESPACE + "completeEditTime", map);
		return result;
	}

	public int deleteBoard(String boardId) {
		int result = sqlSession.delete(NAMESPACE + "deleteBoard", boardId);
		return result;
	}

	public Map<String, Object> chatListDetail(String boardId) {
		Map<String,Object> info = sqlSession.selectOne(NAMESPACE + "chatListDetail",boardId);
		return info;
	}

	public Map<String, Object> freeBoardDetailEdit(String boardId) {
		Map<String, Object> info = sqlSession.selectOne(NAMESPACE + "freeBoardDetailEdit", boardId);
		return info;
	}

	public List<Map<String, Object>> participantChatList(String customerId) {
		List<Map<String, Object>> info = sqlSession.selectList(NAMESPACE + "participantChatList", customerId);
		return info;
	}

	public int numOfChatParticipant(String boardId) {
		int participant = sqlSession.selectOne(NAMESPACE + "numOfChatParticipant", boardId);
		return participant;
	}

	public Map<String, Object> chatListEdit(String boardId) {
		Map<String, Object> info = sqlSession.selectOne(NAMESPACE + "chatListEdit", boardId);
		return info;
	}

	public int completeChatEdit(String title, String context, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("context", context);
		map.put("boardId", boardId);
		int result = sqlSession.update(NAMESPACE + "completeChatEdit", map);
		return result;
	}

	public List<Map<String, Object>> successMyWriteBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successMyWriteBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> successMyWriteFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successMyWriteFreeBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> successMyParticipatedBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successMyParticipatedBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> successMyParticipatedFreeBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successMyParticipatedFreeBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> successChatBlist(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successChatBlist",customerId);
		return info;
	}

	public List<Map<String, Object>> successParticipantChatList(String customerId) {
		List<Map<String,Object>> info = sqlSession.selectList(NAMESPACE + "successParticipantChatList",customerId);
		return info;
	}

	public List<Map<String, Object>> freeBoardProductEdit(String boardId, String customerId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		map.put("customerId", customerId);
		List<Map<String,Object>> productInfo = sqlSession.selectList(NAMESPACE + "freeBoardProductEdit", map);
		return productInfo;
	}

	public int completeFreeEdit(String title, String context, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("context", context);
		map.put("boardId", boardId);
		int result = sqlSession.update(NAMESPACE + "completeFreeEdit", map);
		return result;
	}

	public int completeFreeEditTime(String title, String context, int remainTime, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("context", context);
		map.put("remainTime", remainTime);
		map.put("boardId", boardId);
		int result = sqlSession.update(NAMESPACE + "completeFreeEditTime", map);
		return result;
	}

	public int deleteChat(String boardId) {
		int result = sqlSession.update(NAMESPACE + "deleteChat", boardId);
		return result;
	}

	public List<Map<String, Object>> myCart(String customerId) {
		List<Map<String,Object>> myCart = sqlSession.selectList(NAMESPACE + "myCart", customerId);
		return myCart;
	}

	public ProductVO selectByPid(String productId) {
		ProductVO product = sqlSession.selectOne(NAMESPACE + "selectByPid", productId);
		return product;
	}

	/*
	 * public int orderSuccess(String deliveryId, String customerId) { Map<String,
	 * Object> map = new HashMap<String, Object>(); map.put("deliveryId",
	 * deliveryId); map.put("customerId", customerId); int result =
	 * sqlSession.insert(NAMESPACE + "orderSuccess", map); return result; }
	 * 
	 * public int orderSuccessProduct(String deliveryId, String productId, int
	 * count) { Map<String, Object> map = new HashMap<String, Object>();
	 * map.put("deliveryId", deliveryId); map.put("productId", productId);
	 * map.put("count", count); int result = sqlSession.insert(NAMESPACE +
	 * "orderSuccessProduct", map); return result; }
	 */

	public Map<String, Object> orderInfo(String customerId, String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("boardId", boardId);
		Map<String, Object> info = sqlSession.selectOne(NAMESPACE + "orderInfo", map);
		return info;
	}

	public int orderFastProduct(String customerId, String boardId, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("boardId", boardId);
		map.put("count", count);
		map.put("result_code", 0);
		//int result = sqlSession.insert(NAMESPACE + "orderFastProduct", map);
		sqlSession.insert(NAMESPACE + "orderFastProduct", map);
		return (Integer)map.get("result_code");
		/*
		 * if(map.get("result_code")!=null &&
		 * !"".equals(map.get("result_code").toString())) {
		 * 
		 * }
		 */
		//return result;
	}

	public Map<String, Object> fastBoardProduct(String boardId) {
		Map<String, Object> info = sqlSession.selectOne(NAMESPACE + "fastBoardProduct", boardId);
		return info;
	}

	

	

	

}
