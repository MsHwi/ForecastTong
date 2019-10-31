package com.javatong.fcsttong.lifefcstservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class LifeFCDataCheck {
	@Inject
	LifeFCDAO lifeFCDao;
	
	 public String execute(String strJisuName ) {
			System.out.println("------- < LifeFCDataCheck.execute()> start ---------");
			 
			String rlstMsg="";
			 
			//String jisuGubun = request.getParameter("jisugubun");
//			System.out.println("LifeFCInfoCreate : strJisuName: " + strJisuName);
			rlstMsg = lifeFCDao.lifeFCDataCheck(strJisuName); // jisuGubun :
																	// 식중독/자외선
			System.out.println("LifeFCDataCheck.execute() : " + rlstMsg + " , strJisuName : "+ strJisuName);
		    //model.addAttribute("rsltFlag", rlstMsg);
			
			return rlstMsg;
				 
	 }
}
