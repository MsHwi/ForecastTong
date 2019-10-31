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
public class FsnJisuSelService {
	@Inject
	LifeFCDAO lifeFCDao;
	
    public Model execute(String areano, String tabno, Model model) {
    	System.out.println("------- < FsnJisuSelService.execute()> Start ---------");
		//LifeFCDAO lifeFCDao = new LifeFCDAO();
		LifeFCDTO lifeFCDto = new LifeFCDTO();
		
		if (areano == null) {
			areano = "1100000000";
		}
		System.out.println("FsnJisuSelService.execute() -> tabno : " + tabno + " , areano : " + areano);
		
		lifeFCDto.setArea_no(areano);  
		lifeFCDto.setCode("A01_2"); // 지수코드 : 식중독 'A01_2'
		
		lifeFCDto = lifeFCDao.selectJisuinfo(lifeFCDto); // 특정지역의 식중독 지수만 조회 : 당일, 내일, 모레
		   
		 System.out.println("FsnJisuSelService.execute() : "+lifeFCDto);
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

		System.out.println(" FsnJisuSelService./lifefc/fsnjisu_view.jsp [forward] ");
		actionCommand.setPath("./lifefc_forecast/fsnjisu_view.jsp");
		System.out.println(" FsnJisuSelService./lifefc/fsnjisu_view.jsp [forward OK!!] ");
		*/	
		System.out.println("FsnJisuSelService.execute() Rslt > model - " + model);
		System.out.println("------- < FsnJisuSelService.execute()> end ---------");
		  
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
		case "관심" : imageSrc="/img/jisu/g_01_관심(식중독).png"; break;
		case "주의" : imageSrc="/img/jisu/g_02_주의(식중독).png"; break;
		case "경고" : imageSrc="/img/jisu/g_03_경고(식중독).png"; break;
//		case "매우높음" : imageSrc="/img/jisu/g_08_매우높음(자외선).png"; break;
		case "위험" : imageSrc="/img/jisu/g_04_위험(식중독).png"; break;
		
		}
		System.out.println("FsnJisuSelService. : getImageSrc() >> fc_status_nm : " + fc_status_nm);
		System.out.println("FsnJisuSelService : getImageSrc() >> getImageSrc : " + imageSrc);

		return imageSrc;
	} 
	 
	// 기상상태에 대한  상태레벨 코드값을 반환함
	public String getFcStatusLvl(String fc_status_nm)  {
	   String statusLvl ="";
		switch(fc_status_nm) {
		case "관심" : statusLvl= "1"; break;
		case "주의" : statusLvl= "2";break;
		case "경고" : statusLvl= "3"; break;
//		case "매우높음" : statusLvl= "4"; break;
		case "위험" : statusLvl= "4"; break;
		
		}

		return statusLvl;
	}
	
	// 기상상태에 대한  상태레벨 대응요령을 반환함
		public String[] getFcStatusMent(String fc_status_nm)  {
		   String[][] statusMent = {
				   {"식중독 발생가능성은 낮으나  식중독예방에 지속적인 관심 요망"," 화장실 사용 후, 귀가 후, 조리 전에 손 씻기를 생활화" },  
				   {"식중독 발생가능성이 중간 단계이므로 식중독예방에 주의가 요망됨","조리음식은 중심부까지 75℃(어패류 85℃)로 1분 이상 완전히 익히고 외부로 운반할 때에는 가급적 아이스박스 등을 이용하여 10℃이하에서 보관 및 운반"}, 
				   {"식중독 발생가능성이 높으므로 식중독 예방에 경계가 요망됨","조리도구는 세척, 소독 등을 거쳐 세균오염을 방지하고 유통기한, 보관방법 등을  확인하여 음식물 조리. 보관에 각별히 주의하여야 함"},
//				   {"햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 매우 위험함","오전 10시부터 오후 3시까지 외출을 피하고 실내나 그늘에 머물러야 함","외출 시 긴 소매 옷, 모자, 선글라스 이용","자외선 차단제를 정기적으로 발라야 함"},
				   {"식중독 발생가능성은 낮으나 식중독예방에 지속적인 관심 요망","설사, 구토 등 식중독 의심 증상이 있으면 의료기관을 방문하여 의사 지시에 따름","식중독 의심 환자는 식품 조리 참여에 즉시 중단하여야 함"}		   
		   };
			switch(fc_status_nm) {
			case "관심" : return statusMent[0];
			case "주의" : return statusMent[1];
			case "경고" : return statusMent[2];
//			case "매우높음" : return statusMent[3];
			case "위험" : return statusMent[3];
			default : return null;
			}
           
			
		}
}
