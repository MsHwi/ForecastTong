package com.javatong.fcsttong.lifefcstservice;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class LifeFCInfoModify {
	@Inject
	LifeFCDAO lifeFCDao;
	
	 public String execute(LifeFCDTO lifeFCDto) {
			System.out.println("------- < LifeFCInfoModify.execute()> start ---------");
			 
			//LifeFCDTO lifeFCDto = new LifeFCDTO();
			
			/*Map map = model.asMap();
			int num = (int) map.get("num");
			boardDTO.setNum(num);*/

			String rlstMsg = "";
			 
			//String jisuGubun = request.getParameter("jisugubun");
			//System.out.println("LifeFCInfoModify : lifeFCInfoModify: code - " + code);
			System.out.println("LifeFCInfoModify :  lifeFCDto - " + lifeFCDto);
			//rlstMsg = lifeFCDao.createLifeFCJisuinfo(jisugubun); // jisuGubun :
			rlstMsg = lifeFCDao.updateLifeFCJisuInfo(lifeFCDto); // 자외선/식중독 생활기상지수정보
																	// 식중독/자외선
			System.out.println("LifeFCInfoModify.execute() : " + rlstMsg);
			//model.setAttribute("rsltFlag", rlstMsg);
			
			return rlstMsg;
				 
	 }	
}
