package com.javatong.fcsttong.lifefcstservice;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.persistence.LifeFCDAO;

@Service
public class UtryJisuSelService {
	@Inject
	LifeFCDAO lifeFCDao;
	
    public Model execute(String areano, String tabno, Model model) {
    	System.out.println("------- < UtryJisuSelService.execute()> Start ---------");
		//LifeFCDAO lifeFCDao = new LifeFCDAO();

		//List<?> lifeFCList = new ArrayList<Object>();
		LifeFCDTO lifeFCDto = new LifeFCDTO();

//		String areano = request.getParameter("areano");
//		String tabno = request.getParameter("tabno");
	 		
		if (areano == null) {
			areano = "1100000000";
		}
		System.out.println("UtryJisuSelService.execute() -> tabno : " + tabno + " , areano : " + areano);
		
		lifeFCDto.setArea_no(areano);  
		lifeFCDto.setCode("A07"); // 지수코드 : 자외선 - 'A07'
		
		lifeFCDto = lifeFCDao.selectJisuinfo(lifeFCDto); // 특정지역의 식중독 지수만 조회 : 당일, 내일, 모레
		   
		 System.out.println("UtryJisuSelService.execute() : "+lifeFCDto);
		 System.out.println("<OUT> notitime: "+lifeFCDto.getNoti_time());
		 
		String imageSrc ="";
		String statusLvlCd="";
		String[] statusMent = null;
		switch(tabno) {
		case "1" : 
			imageSrc = getImageSrc(lifeFCDto.getToday_fcstStage()) ;
			statusLvlCd = getFcStatusLvl(lifeFCDto.getToday_fcstStage()) ;
			statusMent = getFcStatusMent(lifeFCDto.getToday_fcstStage()) ; 
			break;
		case "2" : 
			imageSrc = getImageSrc(lifeFCDto.getTomrw_fcstStage()) ; 
			statusLvlCd = getFcStatusLvl(lifeFCDto.getTomrw_fcstStage()) ; 
			statusMent = getFcStatusMent(lifeFCDto.getTomrw_fcstStage()) ; 
			break;
		case "3" : 
			imageSrc = getImageSrc(lifeFCDto.getAft_tomrw_fcstStage()) ;
			statusLvlCd = getFcStatusLvl(lifeFCDto.getAft_tomrw_fcstStage()) ; 
			statusMent = getFcStatusMent(lifeFCDto.getAft_tomrw_fcstStage()) ; 
			break;			
		}

		 
		model.addAttribute("lifeFCDto", lifeFCDto);
		model.addAttribute("tabno", tabno); // 클릭된 (오늘/내일/모레)탭번호
		try {
			model.addAttribute("formatted_notitime", get_frm_notitime(lifeFCDto.getNoti_time()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// 예보상태별 대응요령 
		model.addAttribute("image_src", imageSrc); // 예보상태별 이미지소스 디렉토리
		model.addAttribute("status_lvl_cd", statusLvlCd); // 예보상태별 예보레벨코드(낮음(레벨코드:1)... 아주 높음(레벨코드 :5) 
		model.addAttribute("status_lvl_ment", statusMent);// 예보상태별 대응요령 
		
		System.out.println("<OUT> tabno: "+tabno);
		System.out.println("<OUT> imageSrc: "+imageSrc);
		System.out.println("<OUT> statusLvlCd: "+statusLvlCd);
		System.out.println("<OUT> statusMent: "+statusMent);
		/*ActionCommand actionCommand = new ActionCommand();

		//actionCommand.setRedirect(false);

		System.out.println(" UtryJisuSelService./lifefc/utryjisu_view.jsp [forward] ");
		actionCommand.setPath("/lifefc_forecast/utryjisu_view.jsp");
		System.out.println(" UtryJisuSelService./lifefc/utryjisu_view.jsp [forward OK!!] ");
		*/	
		System.out.println("UtryJisuSelService.execute() Rslt > model - " + model);
		System.out.println("------- < UtryJisuSelService.execute()> end ---------");
		  
		return model;
  }
    
	public String get_frm_notitime(String notitime) throws ParseException{
		System.out.println("get_frm_notitime() >> notitime : " + notitime);
        // String formatted_annotime = notitime;
         SimpleDateFormat old_format = new SimpleDateFormat("yyyyMMddhh");
         SimpleDateFormat new_format = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 hh시");
 
 		Date old_date = old_format.parse(notitime);
 		String formatted_annotime = new_format.format(old_date);
 		System.out.println("formatted_annotime : " + formatted_annotime);
 		 
		    return formatted_annotime;
	 }	
	 // 기상상태에 대한 이미지 SRC위치값을 반환함
	public String getImageSrc(String fc_status_nm)  {
	    String imageSrc ="";
		switch(fc_status_nm) {
		case "낮음" : imageSrc="/img/jisu/g_05_낮음(자외선).png"; break;
		case "보통" : imageSrc="/img/jisu/g_06_보통(자외선).png"; break;
		case "높음" : imageSrc="/img/jisu/g_07_높음(자외선).png"; break;
		case "매우높음" : imageSrc="/img/jisu/g_08_매우높음(자외선).png"; break;
		case "위험" : imageSrc="/img/jisu/g_09_위험(자외선).png"; break;
		
		}

		return imageSrc;
	} 
	 
	// 기상상태에 대한  상태레벨 코드값을 반환함
	public String getFcStatusLvl(String fc_status_nm)  {
	   String statusLvl ="";
		switch(fc_status_nm) {
		case "낮음" : statusLvl= "1"; break;
		case "보통" : statusLvl= "2";break;
		case "높음" : statusLvl= "3"; break;
		case "매우높음" : statusLvl= "4"; break;
		case "위험" : statusLvl= "5"; break;
		
		}

		return statusLvl;
	}
	
	// 기상상태에 대한  상태레벨 대응요령을 반환함
		public String[] getFcStatusMent(String fc_status_nm)  {
		   String[][] statusMent = {
				   {"햇볕 노출에 대한 보호조치가 필요하지 않음","햇볕에 민감한 피부를 가진 분은 자외선 차단제를 발라야 함" },  
				   {"2～3시간 내에도 햇볕에 노출 시에 피부 화상을 입을 수 있음","모자, 선글라스 이용","자외선 차단제를 발라야 함"}, 
				   {"햇볕에 노출 시 1～2시간 내에도 피부 화상을 입을 수 있어 위험함","한낮에는 그늘에 머물러야 함","외출 시 긴 소매 옷, 모자, 선글라스 이용","자외선 차단제를 정기적으로 발라야 함"},
				   {"햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 매우 위험함","오전 10시부터 오후 3시까지 외출을 피하고 실내나 그늘에 머물러야 함","외출 시 긴 소매 옷, 모자, 선글라스 이용","자외선 차단제를 정기적으로 발라야 함"},
				   {"햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 가장 위험함","가능한 실내에 머물러야 함","외출 시 긴 소매 옷, 모자, 선글라스 이용","자외선 차단제를 정기적으로 발라야 함"}		   
		   };
			switch(fc_status_nm) {
			case "낮음" : return statusMent[0];
			case "보통" : return statusMent[1];
			case "높음" : return statusMent[2];
			case "매우높음" : return statusMent[3];
			case "위험" : return statusMent[4];
			default : return null;
			}
           
			
		}	    
}
