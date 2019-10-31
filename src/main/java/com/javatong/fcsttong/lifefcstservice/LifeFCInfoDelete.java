package com.javatong.fcsttong.lifefcstservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class LifeFCInfoDelete {
	@Inject
	LifeFCDAO lifeFCDao;
	
	 public String execute(LifeFCDTO lifeFCDto) {
			System.out.println("------- < LifeFCInfoDelete.execute()> start ---------");
			 
			 //LifeFCDTO lifeFCDto = new LifeFCDTO();
			
			/*Map map = model.asMap();
			int num = (int) map.get("num");
			boardDTO.setNum(num);*/

			String rlstMsg = "";
			 
			//String jisuGubun = request.getParameter("jisugubun");
			//System.out.println("LifeFCInfoModify : lifeFCInfoModify: code - " + code);
			System.out.println("LifeFCInfoDelete :  lifeFCDto - " + lifeFCDto);
			//rlstMsg = lifeFCDao.createLifeFCJisuinfo(jisugubun); // jisuGubun :
			rlstMsg = lifeFCDao.deleteLifeFCJisuInfo(lifeFCDto); // 자외선/식중독 생활기상지수정보
																	// 식중독/자외선
			System.out.println("LifeFCInfoDelete.execute() : " + rlstMsg);
			//model.setAttribute("rsltFlag", rlstMsg);
			
			return rlstMsg;
				 
	 }	
}
