package com.zeronine.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zeronine.dto.DeliveryVO;

@Service("deliveryService")
public class DeliveryService {

	@Autowired
	DeliveryDAOMybatis deliveryDAO;
	
	public List<DeliveryVO> selectAll(){
		return deliveryDAO.selectAll();
	}
}
