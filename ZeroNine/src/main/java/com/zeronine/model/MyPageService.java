package com.zeronine.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.zeronine.dto.PagingVO;
import com.zeronine.dto.PickupVO;

@Service("myPageService")
public class MyPageService {

	@Autowired
	MyPageDAOMybatis myPageDAO;
	
	
	int pageLimit = 5;
	int blockLimit = 5;

	/*
	 * public List<DeliveryVO> selectAll(){ return deliveryDAO.selectAll(); }
	 */
	
	/* order history */
	public List<Map<String, Object>> orderHistoryAll(int page,String customerId, String searchWord, String startDate, String endDate) {
		int pageStartNum = (page - 1) * pageLimit;
		return myPageDAO.orderHistoryAll(pageStartNum,customerId, searchWord, startDate, endDate);
	}
	
	public int orderHistoryCount(String customerId, String searchWord, String startDate, String endDate) {
		return myPageDAO.orderHistoryCount(customerId,searchWord,startDate,endDate);
	}
	
public PagingVO orderHistorygetPages(int page,String customerId, String searchWord, String startDate, String endDate) {
		
		int orderHistoryCount = myPageDAO.orderHistoryCount(customerId, searchWord, startDate, endDate);

		int maxPageNumber = (int) (Math.ceil((double) orderHistoryCount / pageLimit));

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

	/* order cancel history */
	public List<Map<String, Object>> orderCancelHistoryAll(String customerId, String searchWord, String startDate, String endDate) {
		return myPageDAO.orderCancelHistoryAll(customerId, searchWord, startDate, endDate);
	}

	/* like product */
	public List<Map<String, Object>> myCart(String customerId) {
		return myPageDAO.myCart(customerId);		
	}
	
	/* like product */
	public List<Map<String, Object>> likeProduct(String customerId, String searchWord) {
		return myPageDAO.likeProduct(customerId, searchWord);		
	}
	
	/*
	public Map<String, Object> orderHistoryAll(String customerId){
		return deliveryDAO.orderHistoryAll(customerId);
	}
	*/
	
	public List<Map<String, Object>> selectEcoInfoAll (String customerId){
		List<Map<String, Object>> ecodash = myPageDAO.selectEcoInfoAll(customerId);
		System.out.println("이것은 service에서 보여주는 정보"+ecodash);
		return ecodash;
	}
	
	public int insertPickupRequest(String customerId, String subscriptionId) {
		return myPageDAO.insertPickupRequest(customerId, subscriptionId);
	}

	public List<Map<String, Object>> selectCouponCtn(String customerId ){
		List<Map<String, Object>> couponCtn = myPageDAO.selectCouponCtn( customerId );
		System.out.println("이것은 service에서 보여주는 정보"+couponCtn);
		return couponCtn;
	}
	public int updateCouponCnt (String subscriptionId) {
		return myPageDAO.updateCouponCnt(subscriptionId);
	}
	
public PagingVO getPages(int page,String customerId) {
		
		
		int countPickUp = myPageDAO.PickUpCount(customerId);

		int maxPageNumber = (int) (Math.ceil((double) countPickUp / pageLimit));

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
	
	public List<PickupVO> PickUpList(int page ,String customerId){
		int pageStartNum = (page - 1) * pageLimit;
		System.out.println("pageStartNum"+pageStartNum);
		return myPageDAO.PickUpList(pageStartNum,customerId);
	}
	
	public int PickUpCount(String customerId){
		int result = myPageDAO.PickUpCount(customerId);
		return result;
	}
	public PickupVO PickUpDetail(String pickUpId) {
		return myPageDAO.PickUpDetail(pickUpId);
	}

}
