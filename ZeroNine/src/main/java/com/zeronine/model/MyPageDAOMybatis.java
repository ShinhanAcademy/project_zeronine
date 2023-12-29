package com.zeronine.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeronine.dto.PickupVO;

@Repository("myPageDAO")
public class MyPageDAOMybatis {
	@Autowired
	SqlSession sqlSession;
	Logger Logger = LoggerFactory.getLogger(ProductDAOMybatis.class);
	final static String NAMESPACE="net.zeronine.mypage.";

	public String addPersentage(String str) {
		return "%"+str+"%";
	}

	public String endDateFormat(String str) {
		return str+" 23:59:59";
	}

	/* common - personal info */
	public Map<String, Object> personalInfo(String customerId) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		
		Map<String, Object> personalInfo = sqlSession.selectOne(NAMESPACE + "personalInfo", mapData);
		Logger.info("personalInfo조회조건:{}...결과:{}건", mapData, personalInfo.size());

		return personalInfo;
	}
	
	/* orderHistoryAll */
	public List<Map<String, Object>> orderHistoryAll(int page,String customerId, String searchWord, String startDate, String endDate) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		mapData.put("page", page);
		List<Map<String, Object>> orderHistoryList = sqlSession.selectList(NAMESPACE + "orderHistoryAll", mapData);
//		Logger.info("orderHistoryAll조회조건:{}...결과:{}건", mapData, orderHistoryList.size());

		return orderHistoryList;
	}
	public int orderHistoryCount(String customerId, String searchWord, String startDate, String endDate) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		int OHcount =sqlSession.selectOne(NAMESPACE + "orderHistoryCount", mapData);
		return OHcount;
	}
	

	/* orderCancelHistoryAll */
	public List<Map<String, Object>> orderCancelHistoryAll(int page,String customerId, String searchWord, String startDate, String endDate) {
		//List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE + "orderHistoryAll", customerId);
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		mapData.put("page",page);
//		Logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> orderCancelHistoryList = sqlSession.selectList(NAMESPACE + "orderCancelHistoryAll", mapData);
		//Logger.info("orderCancelHistoryAll조회조건:{}...결과:{}건", mapData, orderCancelHistoryList.size());

		return orderCancelHistoryList;
	}
	public int orderCancelHistoryAllCount(String customerId, String searchWord, String startDate, String endDate) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		mapData.put("startDate", startDate);
		mapData.put("endDate", endDateFormat(endDate));
		
		int count =sqlSession.selectOne(NAMESPACE + "orderCancelHistoryAllCount",mapData);
		return count;
	}
	/* myCart */
	public List<Map<String, Object>> myCart(String customerId) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		
//		Logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> myCartList = sqlSession.selectList(NAMESPACE + "myCart", mapData);
		Logger.info("myCart조회조건:{}...결과:{}건", mapData, myCartList.size());

		return myCartList;
	}
	
	/* likeProduct */
	public List<Map<String, Object>> likeProduct(int pageStartNum,String customerId, String searchWord) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("page", pageStartNum);
		mapData.put("searchWord", addPersentage(searchWord));
		
//		Logger.info("endDate format{}", endDateFormat(endDate));
		List<Map<String, Object>> likeProductList = sqlSession.selectList(NAMESPACE + "likeProduct", mapData);
//		Logger.info("likeProduct조회조건:{}...결과:{}건", mapData, likeProductList.size());

		return likeProductList;
	}
	public int likeProductCount(String customerId, String searchWord) {
		Map<String, Object> mapData = new HashMap<>();
		mapData.put("customerId", customerId);
		mapData.put("searchWord", addPersentage(searchWord));
		int count = sqlSession.selectOne(NAMESPACE+"likeProductCount",mapData);
		return count;
	}
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		Map<String, Object> result = sqlSession.selectOne(NAMESPACE+"orderHistoryAll",customerId);
		return result;
	}
	*/
	
	public List<Map<String, Object>> selectEcoInfoAll (String customerId){
		List<Map<String, Object>> ecodash = sqlSession.selectList(NAMESPACE+"selectEcoInfoAll", customerId);
		return ecodash; 
	}

	public List<Map<String, Object>> selectCouponCtn( String customerId ){
		List<Map<String, Object>> couponCtn = sqlSession.selectList(NAMESPACE + "selectCouponCtn", customerId);
		return couponCtn; 
	}
	public int updateCouponCnt (String subscriptionId) {
		int updateResult = sqlSession.update(NAMESPACE+"updateCouponCnt",subscriptionId);
		return updateResult;
	}
	
	public int insertPickupRequest(String customerId, String subscriptionId) {
		System.out.println(subscriptionId);
		System.out.println(customerId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("isFoodWaste", Math.random() < 0.5);
		map.put("subscriptionId", subscriptionId);
		Logger.info(map.toString());
		return sqlSession.insert(NAMESPACE+"insertPickupRequest",map);
	}
	
	public List<PickupVO> PickUpList(int page ,String customerId){
		System.out.println("pageStartNum"+page);
		System.out.println("customerId"+customerId);
		Map<String, Object> paginateParam = new HashMap<>();
		paginateParam.put("customerId", customerId);
		paginateParam.put("page", page);
		
		
		List<PickupVO> pickList = sqlSession.selectList(NAMESPACE+"PickUpList",paginateParam);
		Logger.info("확인:" + pickList.toString());
		return pickList;
		
	}
	public int PickUpCount(String customerId){
		Logger.info("PickUpCount 확인: "+customerId);
		int  pickUpCount = sqlSession.selectOne(NAMESPACE+"PickUpCount",customerId);
		return pickUpCount;
	}
	public PickupVO PickUpDetail(String pickUpId) {
		return sqlSession.selectOne(NAMESPACE+"PickUpDetail",pickUpId);
	}
}
