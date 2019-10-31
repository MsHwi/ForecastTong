package com.javatong.fcsttong.lifefcstservice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.domain.LifeFCRsltDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class LifeFCUpdSelect {
	@Inject
	LifeFCDAO lifeFCDao;
	 
    public Model execute(String areano, String noti_time, String jisucode, Model model) {
    	System.out.println("------- < LifeFCUpdSelect.execute()> start ---------");
    	System.out.println(" areano : "+ areano + ", noti_time : " + noti_time + ",jisucode : " + jisucode);
 
    	LifeFCDTO lifeFCDto = new LifeFCDTO();
		lifeFCDto.setArea_no(areano);  
		lifeFCDto.setCode(jisucode); // 지수코드 : 식중독 'A01_2'	
		lifeFCDto.setNoti_time(noti_time);   

		lifeFCDto = lifeFCDao.lifeFcUpdSelect(lifeFCDto); // 특정지역의 식중독 지수만 조회 : 당일, 내일, 모레
		 System.out.println("LifeFCUpdSelect.execute() : "+lifeFCDto);
		 model.addAttribute("lifeFCDto", lifeFCDto);
 
		System.out.println("------- < LifeFCUpdSelect.execute()> end ---------");
		
		return model;
    }
}
