package com.javatong.fcsttong.lifefcstservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class LifeFCInfoCreate {
	@Inject
	LifeFCDAO lifeFCDao;
	
	 public String execute(String jisugubun) {
			System.out.println("------- < LifeFCInfoCreate.execute()> start ---------");
			 
			String rlstMsg="";
			 
			//String jisuGubun = request.getParameter("jisugubun");
			System.out.println("LifeFCInfoCreate : jisuGubun: " + jisugubun);
			rlstMsg = lifeFCDao.createLifeFCJisuinfo(jisugubun); // jisuGubun :
																	// 식중독/자외선
			System.out.println("LifeFCInfoCreate.execute() : " + rlstMsg);
			//model.setAttribute("rsltFlag", rlstMsg);
			
			return rlstMsg;
				 
	 }
	 
}
