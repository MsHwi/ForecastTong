package com.javatong.fcsttong.lifefcstservice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class AllJijumJisuSelect {
	//@Inject : @Autowired 어노테이션과 동일
	@Inject
	LifeFCDAO lifeFCDao;
	
    public Model execute(String jisuname, Model model) {
    	System.out.println("------- < AllJijumJisuSelect.execute()> start ---------");
		//LifeFCDAO lifeFCDao = new LifeFCDAO();
		List<?> lifeFCList = new ArrayList<Object>();
    	 System.out.println("AllJijumJisuSelect() --> jisuname: "+jisuname);
		 lifeFCList = lifeFCDao.allJijumJisuSelect(jisuname); // 특정지역의 식중독 지수만 조회 : 당일, 내일, 모레
		 System.out.println("AllJijumJisuSelect.execute() : "+lifeFCList);
		 model.addAttribute("lifeFCList", lifeFCList);
		 model.addAttribute("jisuname", jisuname);
		/*ActionCommand actionCommand = new ActionCommand();

		actionCommand.setRedirect(false);

		System.out.println(" AllJijumJisuSelect./lifefc/alljijum_jisu_view.jsp [forward] ");
		actionCommand.setPath("/lifefc_forecast/alljijum_jisu_view.jsp");
		System.out.println(" AllJijumJisuSelect./lifefc/alljijum_jisu_view.jsp [forward OK!!] ");
		*/
		System.out.println("------- < AllJijumJisuSelect.execute()> end ---------");
		
		return model;    	
    }
}
