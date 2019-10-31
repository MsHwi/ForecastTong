package com.javatong.fcsttong.lifefcstservice;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.domain.LifeFCRsltDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;


@Service
public class LocalJisuSelService {
	@Inject
	LifeFCDAO lifeFCDao;
	
    public Model execute(String areano, Model model) {
    	System.out.println("------- < LocalJisuSelService.execute()> Start ---------");
    	
		/*ApplicationContext context = new ClassPathXmlApplicationContext("config/lifeFCConfig.xml");
		LifeFCDAO lifeFCDao = (LifeFCDAO) context.getBean("lifeFCDao");
		*/
		//LifeFCDAO lifeFCDao = new LifeFCDAO();

		//List<?> lifeFCList = new ArrayList<Object>();
		//LifeFCDTO lifeFCDto = null;

		List<LifeFCDTO> lifeFCList = new ArrayList<LifeFCDTO>();
		List<LifeFCRsltDTO> lifeFCRsltList = new ArrayList<LifeFCRsltDTO>();


//		String areano = request.getParameter("areano");
//		String tabno = request.getParameter("tabno");
		System.out.println("areano: "+areano);
 
		lifeFCList = lifeFCDao.selectlOneLocalJisuInfo(areano); // 특정지역 식중독/자외선 지수조회
		System.out.println("LocalJisuSelService.execute()> > lifeFCList: "+lifeFCList);

		//LifeFCDTO dto = new LifeFCDTO();
		
		int i=0;
		for(LifeFCDTO dto:lifeFCList) {
//			String imageSrc ="";
//			String statusLvlCd="";
			LifeFCRsltDTO rsltDTO = new LifeFCRsltDTO();
			
			rsltDTO.setJisu_nm(dto.getJisu_nm());
			rsltDTO.setToday_img_src(getImageSrc(dto.getJisu_nm(),dto.getToday_fcstStage())) ;
			rsltDTO.setToday_stlvl_cd(getFcStatusLvl(dto.getJisu_nm(),dto.getToday_fcstStage())) ;

			rsltDTO.setTomrw_img_src(getImageSrc(dto.getJisu_nm(),dto.getTomrw_fcstStage())) ;
			rsltDTO.setTomrw_stlvl_cd(getFcStatusLvl(dto.getJisu_nm(),dto.getTomrw_fcstStage())) ;
			
			rsltDTO.setAft_tomrw_img_src(getImageSrc(dto.getJisu_nm(),dto.getAft_tomrw_fcstStage())) ;
			rsltDTO.setAft_tomrw_stlvl_cd(getFcStatusLvl(dto.getJisu_nm(),dto.getAft_tomrw_fcstStage())) ;
			
			lifeFCRsltList.add(rsltDTO);
			 
		}
		
		model.addAttribute("lifeFCList", lifeFCList);
 		model.addAttribute("lifeFCRsltList", lifeFCRsltList);
		model.addAttribute("temp", "hee");			
		System.out.println("------- < LocalJisuSelService.execute()> end ---------");
		return model;
		 
		/*ActionCommand actionCommand = new ActionCommand();

		actionCommand.setRedirect(false);

		System.out.println(" LocalJisuSelService./lifefc_forecast/localjisu_view.jsp [forward] ");
		actionCommand.setPath("/lifefc_forecast/localjisu_view.jsp");
		System.out.println(" LocalJisuSelService./lifefc_forecast/localjisu_view.jsp [forward OK!!] ");
		*/
		
		//return actionCommand;
		  
		//return model;
  }
    
	public String getImageSrc(String jisu_gubun, String fc_status_nm)  {
	    String imageSrc ="";
	    if("자외선".equals(jisu_gubun)) {
			switch(fc_status_nm) {
				case "낮음" : imageSrc="/img/jisu/g_05_낮음(자외선).png"; break;
				case "보통" : imageSrc="/img/jisu/g_06_보통(자외선).png"; break;
				case "높음" : imageSrc="/img/jisu/g_07_높음(자외선).png"; break;
				case "매우높음" : imageSrc="/img/jisu/g_08_매우높음(자외선).png"; break;
				case "위험" : imageSrc="/img/jisu/g_09_위험(자외선).png"; break;
			
			}
	    } else  if("식중독".equals(jisu_gubun)) {
			switch(fc_status_nm) {
			case "관심" : imageSrc="/img/jisu/g_01_관심(식중독).png"; break;
			case "주의" : imageSrc="/img/jisu/g_02_주의(식중독).png"; break;
			case "경고" : imageSrc="/img/jisu/g_03_경고(식중독).png"; break;
//			case "매우높음" : imageSrc="/img/jisu/g_08_매우높음(자외선).png"; break;
			case "위험" : imageSrc="/img/jisu/g_04_위험(식중독).png"; break;
			
			}	    
	    }

	    //System.out.println("getImageSrc : " + imageSrc);
		return imageSrc;
	} 
	 
	// 기상상태에 대한  상태레벨 코드값을 반환함
	public String getFcStatusLvl(String jisu_gubun, String fc_status_nm)  {
	   String statusLvl ="";
	   if("자외선".equals(jisu_gubun)) {
			switch(fc_status_nm) {
				case "낮음" : statusLvl= "1"; break;
				case "보통" : statusLvl= "2";break;
				case "높음" : statusLvl= "3"; break;
				case "매우높음" : statusLvl= "4"; break;
				case "위험" : statusLvl= "5"; break;			
			}
	   }else  if("식중독".equals(jisu_gubun)) {
			switch(fc_status_nm) {
			case "관심" : statusLvl= "1"; break;
			case "주의" : statusLvl= "2";break;
			case "경고" : statusLvl= "3"; break;
//			case "매우높음" : statusLvl= "4"; break;
			case "위험" : statusLvl= "4"; break;
			
			}	    
	    }

		return statusLvl;
	}    
}
