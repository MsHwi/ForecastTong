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
public class LifeFCInfoSelect {
	@Inject
	LifeFCDAO lifeFCDao;
	
	public Model execute(String jisugubun, Model model) {
		System.out.println("------- < LifeFCInfoSelect.execute()> Start ---------");
		
		List<LifeFCDTO> lifeFCList = new ArrayList<LifeFCDTO>();
		List<LifeFCRsltDTO> lifeFCRsltList = new ArrayList<LifeFCRsltDTO>();

		System.out.println("jisugubun: "+jisugubun);
 
		lifeFCList = lifeFCDao.selectlAllPartsJisuInfo(jisugubun); // 특정지역 식중독/자외선 지수조회
		System.out.println("LifeFCInfoSelect.execute()> > lifeFCList: "+lifeFCList);

		model.addAttribute("lifeFCList", lifeFCList);
 		//model.addAttribute("lifeFCRsltList", lifeFCRsltList);
		//model.addAttribute("temp", "hee");			
		System.out.println("------- < LifeFCInfoSelect.execute()> end ---------");
		return model;
	}
}
