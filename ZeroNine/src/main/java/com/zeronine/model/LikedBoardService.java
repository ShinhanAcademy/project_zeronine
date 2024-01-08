package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.LikedProductVO;

@Service("LikedboardService")
public class LikedBoardService {

	@Autowired
	LikedBoardDAOMybatis likedboardDAO;

	public List<String> selectByBidlist(String custId) {
		return likedboardDAO.selectByBidlist(custId);
	}
	

}
