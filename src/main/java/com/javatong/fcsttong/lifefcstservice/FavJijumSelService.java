package com.javatong.fcsttong.lifefcstservice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class FavJijumSelService {
	@Inject
	LifeFCDAO lifeFCDao;
	
    public Model execute(String emailStr, Model model) {
    	System.out.println("------- < FavJijumSelService.execute()> start ---------");
		//LifeFCDAO lifeFCDao = new LifeFCDAO();
		List<?> lifeFCList = new ArrayList<Object>();
    	 System.out.println("FavJijumSelService() --> emailStr: "+emailStr);
		 lifeFCList = lifeFCDao.selectFavJijumInfo(emailStr); // 특정지역의 식중독 지수만 조회 : 당일, 내일, 모레
		 System.out.println("FavJijumSelService.execute() : "+lifeFCList);
		 model.addAttribute("lifeFCList", lifeFCList);
		
		/*ActionCommand actionCommand = new ActionCommand();

		actionCommand.setRedirect(false);

		System.out.println(" FavJijumSelService./lifefc_forecast/fav_local_search_ajax.jsp [forward] ");
		actionCommand.setPath("./lifefc_forecast/fav_local_search_ajax.jsp");
		System.out.println(" FavJijumSelService./lifefc_forecast/fav_local_search_ajax.jsp [forward OK!!] ");
		*/
		System.out.println("------- < FavJijumSelService.execute()> end ---------");
		
		return model;    	
    }
}
