package com.javatong.fcsttong.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javatong.fcsttong.domain.LifeFCDTO;
import com.javatong.fcsttong.domain.LifeFCRsltDTO;

import com.javatong.fcsttong.lifefcstservice.FavJijumSelService;
import com.javatong.fcsttong.lifefcstservice.FsnJisuSelService;
import com.javatong.fcsttong.lifefcstservice.LifeFCDataCheck;
import com.javatong.fcsttong.lifefcstservice.LifeFCInfoCreate;
import com.javatong.fcsttong.lifefcstservice.LifeFCInfoDelete;
import com.javatong.fcsttong.lifefcstservice.LifeFCInfoModify;
import com.javatong.fcsttong.lifefcstservice.LifeFCInfoSelect;
import com.javatong.fcsttong.lifefcstservice.LocalJisuSelService;
import com.javatong.fcsttong.lifefcstservice.UtryJisuSelService;
import com.javatong.fcsttong.lifefcstservice.AllJijumJisuSelect;
import com.javatong.fcsttong.lifefcstservice.LifeFCUpdSelect;


@Controller
@RequestMapping("/lifefc")
public class LifeFCController {
	private static final Logger logger = LoggerFactory.getLogger(LifeFCController.class);
	
	String lifefc_path = "/lifefc_forecast/";
	
	@Inject
	FavJijumSelService favJijumSelService;
	@Inject
	UtryJisuSelService utryJisuSelService;
	@Inject
	LocalJisuSelService localJisuSelService;
	@Inject
	FsnJisuSelService fsnJisuSelService;
	@Inject
	LifeFCInfoCreate lifeFCInfoCreate;
	@Inject
	LifeFCInfoModify lifeFCInfoModify;
	@Inject
	LifeFCInfoDelete lifeFCInfoDelete;
	@Inject
	LifeFCInfoSelect lifeFCInfoSelect;
	@Inject
	AllJijumJisuSelect  allJijumJisuSelect;
	@Inject
	LifeFCDataCheck lifeFCDataCheck;
	@Inject
	LifeFCUpdSelect lifeFCUpdSelect;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String lifeFcMain(Locale locale, Model model) { //RedirectAttributes rttr) {
		logger.info("/ >> lifeFcMain()- locale : "+locale);
		
		/*Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		*/
		//rttr.addFlashAttribute("msg", "success");
	   
		return lifefc_path+"lifefc_weather";
	}

	// 지점값보기 조회 : 전체 지점의 당일의 자외선 또는 식중독지수 정보를 조회함.   
	@RequestMapping(value = "/AllJijumJisuSelect.do", method = RequestMethod.GET)
	public String AllJijumJisuSelect(@RequestParam("jisuname") String jisuname, Model model) { //RedirectAttributes rttr) {
		logger.info("/AllJijumJisuSelect.do >>   jisuname : "+ jisuname);
		model = allJijumJisuSelect.execute(jisuname, model);		
		model.addAttribute("model", model);
		return lifefc_path+"alljijum_jisu_view";
	}
	
	//지역별 생활지수 화면 Call : 해당 화면으로 로그인한 로그인 이메일 주소를 넘긴다.
	@RequestMapping(value = "/LocalJisuSelView.do", method = RequestMethod.GET)
	public String localJisuSelView(@RequestParam("email") String email, Model model) { //RedirectAttributes rttr) {
		logger.info("/LocalJisuSelView.do >> localJisuSelView()- email : "+ email);
		model.addAttribute("sessionEmailStr", email);   	
		return lifefc_path+"localjisu";
	}	
	//식중독생활지수 화면 Call : 해당 화면으로 로그인한 로그인 이메일 주소를 넘긴다.
	@RequestMapping(value = "/FsnJisuSelView.do", method = RequestMethod.GET)
	public String fsnJisuSelView(@RequestParam("email") String email,  Model model) { //RedirectAttributes rttr) {
		logger.info("/FsnJisuSelView.do >> fsnJisuSelView()-email : " + email);
		
		//rttr.addFlashAttribute("msg", "SUCCESS");
		//return "redirect:"+lifefc_path+"fsnjisu";
		model.addAttribute("sessionEmailStr", email);
		return lifefc_path+"fsnjisu";
	}	
	
	//자외선생활지수 화면 Call : 해당 화면으로 로그인한 로그인 이메일 주소를 넘긴다.
	@RequestMapping(value = "/UtryJisuSelView.do", method = RequestMethod.GET)
	public String utryJisuSelView(@RequestParam("email") String email, Model model) { //RedirectAttributes rttr) {
		logger.info("/UtryJisuSelView.do >> utryJisuSelView() - email : " + email);
		  
		//rttr.addFlashAttribute("msg", "SUCCESS");
		//return "redirect:"+lifefc_path+"utryjisu";
		model.addAttribute("sessionEmailStr", email);
		return lifefc_path+"utryjisu";
	}	
	
	/*@RequestMapping(value = "/favLocalSearchAjax.do", method = RequestMethod.POST)
	public String favLocalSearchAjax(Locale locale, Model model) { //) {
		logger.info("/favLocalSearchAjax.do >> favLocalSearchAjax() - model : "+ model);
		  
		//rttr.addFlashAttribute("msg", "SUCCESS");
		//return "redirect:"+lifefc_path+"utryjisu";
		
		return lifefc_path+"fav_local_search_ajax";
	}	*/
	
	@RequestMapping(value = "/Selfavlocal.do", method = RequestMethod.GET)
	//public ResponseEntity<String> selFavLocal(@RequestParam("emailStr") String emailStr, Model model) { //RedirectAttributes rttr) {
	public String selFavLocal(@RequestParam("emailStr") String emailStr, Model model) { //, RedirectAttributes rttr) { 
		logger.info("/Selfavlocal.do >> selFavLocal() emailStr : "+ emailStr);
		ResponseEntity<String> entity = null;
	    try {
	    	model = favJijumSelService.execute(emailStr, model);
	     // service.addReply(vo);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    //return entity;
	    
	    model.addAttribute("model", model);
	    model.addAttribute("msg", "SUCCESS");

		return lifefc_path+"fav_local_search_ajax";
		 //return "redirect:"+lifefc_path+"favLocalSearchAjax.do";
	}	
	
	@RequestMapping(value = "/LocalJisuSelService.do", method = RequestMethod.GET)
	public String localJisuSelService(@RequestParam("areano") String areano,  Model model) { //RedirectAttributes rttr) {
		logger.info("/LocalJisuSelService.do >>  areano : "+ areano);
		
		 String rsltMsg = lifeFCDataCheck.execute("자외선" );		
		
		//rttr.addFlashAttribute("msg", "success");
	   
		if ("OK".equals(rsltMsg) == false) {
			System.out.println("자외선" +" 생활지수정보 미생성 오류!");
			model.addAttribute("errorMsg", "생활지수 정보가 생성되지 않았습니다. 관리자에 문의하시기 바랍니다.");
			return lifefc_path+"lifefc_error_view";
		}	else {
			model = localJisuSelService.execute(areano, model);
			return lifefc_path+"localjisu_view";
		} 
		/*model = localJisuSelService.execute(areano, model);
		return lifefc_path+"localjisu_view";*/
	}	

	@RequestMapping(value = "/FsnJisuSelService.do", method = RequestMethod.GET)
	public String fsnJisuSelService(@RequestParam("areano") String areano, @RequestParam("tabno") String tabno, Model model) { //RedirectAttributes rttr) {
		logger.info("/FsnJisuSelService.do >>  areano : "+ areano);
		
		String jisugubun="식중독";
		String rsltMsg = lifeFCDataCheck.execute(jisugubun );		
		 
		//rttr.addFlashAttribute("msg", "success");
	   
		if ("OK".equals(rsltMsg) == false) {
			System.out.println(jisugubun +"생활지수정보 미생성 오류!");
			 
			model.addAttribute("errorMsg", jisugubun + "정보가 생성되지 않았습니다. 관리자에 문의하시기 바랍니다.");
			return lifefc_path+"lifefc_error_view";
		} 
		model = fsnJisuSelService.execute(areano, tabno, model);
		return lifefc_path+"fsnjisu_view";
		
	}	
	
	@RequestMapping(value = "/UtryJisuSelService.do", method = RequestMethod.GET)
	public String utryJisuSelService(@RequestParam("areano") String areano, @RequestParam("tabno") String tabno, Model model) { //RedirectAttributes rttr) {
		logger.info("/UtryJisuSelService.do >>  areano : "+ areano);

		String jisugubun="자외선";
		String rsltMsg = lifeFCDataCheck.execute(jisugubun );		
		 
		if ("OK".equals(rsltMsg) == false) {
			System.out.println(jisugubun +"생활지수정보 미생성 오류!");
			 
			model.addAttribute("errorMsg", jisugubun + "정보가 생성되지 않았습니다. 관리자에 문의하시기 바랍니다.");
			return lifefc_path+"lifefc_error_view";			
			 
		}	  
		model = utryJisuSelService.execute(areano, tabno, model);
		return lifefc_path+"utryjisu_view";
		
	}	

	@RequestMapping(value = "/lifefcErrorView.do", method = RequestMethod.POST)
	public String lifefcErrorView(Locale locale, Model model) { //) {
		logger.info("/lifefcErrorView.do >> lifefcErrorView() - model : "+ model);
		return lifefc_path+"lifefc_error_view";
	}
	@RequestMapping(value = "/LifefcAdminIndex.do", method = RequestMethod.GET)
	public String lifefcAdminIndex(Locale locale, Model model) { //) {
		logger.info("/lifefcAdminIndex.do >> lifefcAdminIndex() - model : "+ model);
		  
		//rttr.addFlashAttribute("msg", "SUCCESS");
		//return "redirect:"+lifefc_path+"utryjisu";
		return lifefc_path+"lifefc_admin_index";
	}	
 
	// 관리자모드 : 당일생성 지수정보 조회	
	@RequestMapping(value = "/LifeFCInfoSelect.do", method = RequestMethod.POST)
	public String lifeFCInfoSelect(@RequestParam("jisugubun") String jisugubun , Model model) {  
		logger.info("/LifeFCInfoSelect.do >>  jisugubun : "+ jisugubun);

		model = lifeFCInfoSelect.execute(jisugubun, model);
			 	
		System.out.println(" LifeFCInfoSelect./lifefc/lifefcinfo_select_ajax.jsp [forward OK!!] ");
		System.out.println("------- < LifeFCInfoSelect> end ---------");
		//return "/admin/lifefcinfo_select_ajax";
		return lifefc_path+"lifefcinfo_select_ajax";
	}

	// 관리자모드 : 당일생성 지수정보 조회	
	 	@RequestMapping(value = "/LifeFCUpdSelect.do", method = RequestMethod.GET)
		public String LifeFCUpdSelect(@RequestParam("areano") String areano , @RequestParam("noti_time") String noti_time ,@RequestParam("code") String code ,Model model) {  
			logger.info("/LifeFCUpdSelect.do >>  areano : "+ areano + ", noti_time : " + noti_time + ",code : " + code);
			model = lifeFCUpdSelect.execute(areano, noti_time, code, model);
 
			return lifefc_path+"lifefc_updview_ajax";
		}	

	// 관리자모드 : 지수정보 생성	
	@RequestMapping(value = "/LifeFCInfoCreate.do", method = RequestMethod.POST)
	public String lifeFCInfoCreate(@RequestParam("jisugubun") String jisugubun , Model model) { //, RedirectAttributes rttr) {  
		logger.info("/lifeFCInfoCreate.do >>  jisugubun : "+ jisugubun);
		String rlstMsg = lifeFCInfoCreate.execute(jisugubun );
		
		if ("".equals(rlstMsg) == false) {
			System.out.println(jisugubun +"정보 생성 실패");
			String errorMsg = jisugubun +"정보 생성 실패!"+rlstMsg;
			model.addAttribute("errorMsg", errorMsg);

			System.out.println("------- < LifeFCInfoCreate > end ---------");
			//return  "redirect:"+lifefc_path+"lifefcErrorView.do";
			return lifefc_path + "lifefc_error_view";
		} else {

			System.out.println("------- < LifeFCInfoCreate > end ---------");
			//return actionCommand;
			//return  lifefc_path+"utryjisu_view";
			 //return "redirect:"+lifefc_path+"lifefcAdminIndex.do";
			String errorMsg = jisugubun +"정보 생성 되었습니다.";
			model.addAttribute("errorMsg", errorMsg);
		    return lifefc_path + "lifefc_error_view";
		}			
		//return lifefc_path+"fsnjisu_view";
	}	
	
	// 관리자모드 : 지수정보 수정
	@RequestMapping(value = "/LifeFCModifyService.do", method = RequestMethod.POST)
	public String LifeFCModifyService(@ModelAttribute("lifeFCDto") LifeFCDTO lifeFCDto , Model model, RedirectAttributes rttr) {  
		logger.info("/LifeFCModifyService.do >>  lifeFCDto : "+ lifeFCDto);
		String rlstMsg = lifeFCInfoModify.execute( lifeFCDto);
		String code = lifeFCDto.getCode();
		
		if ("".equals(rlstMsg) == false) {
			System.out.println(code +"정보 수정 실패");
			String errorMsg = code +"정보 수정 실패!"+rlstMsg;
			model.addAttribute("errorMsg", errorMsg);

			//System.out.println(" LifeFCModifyService./lifefc/lifefc_admin_index.jsp [forward OK!!] ");
			System.out.println("------- < LifeFCModifyService > end --------- 수정결과 : " + errorMsg);
			//return  "redirect:"+lifefc_path+"lifefcErrorView.do";
			return lifefc_path + "lifefc_error_view";
		} else {

			//System.out.println(" LifeFCModifyService./lifefc/lifefc_admin_index.jsp [forward OK!!] ");
			String errorMsg = code +"정보 수정 성공!" ;
			model.addAttribute("errorMsg", errorMsg);			
			System.out.println("------- < LifeFCModifyService > end --------- 수정결과 : " + errorMsg);
			 
			 //return "redirect:"+lifefc_path+"lifefcAdminIndex.do";
			 return lifefc_path + "lifefc_admin_index";
		}			
		 
	}	
	
	// 관리자모드 : 지수정보 삭제
	@RequestMapping(value = "/LifeFCDeleteService.do", method = RequestMethod.POST)
	public String LifeFCDeleteService(@ModelAttribute("lifeFCDto") LifeFCDTO lifeFCDto , Model model, RedirectAttributes rttr) {  
		logger.info("/LifeFCDeleteService.do >>  lifeFCDto : "+ lifeFCDto);
		String rlstMsg = lifeFCInfoDelete.execute( lifeFCDto);
		String code = lifeFCDto.getCode();
		
		if ("".equals(rlstMsg) == false) {
			System.out.println(code +"정보 삭제 실패");
			String errorMsg = code +"정보 삭제 실패!"+rlstMsg;
			model.addAttribute("errorMsg", errorMsg);

			//System.out.println(" LifeFCModifyService./lifefc/lifefc_admin_index.jsp [forward OK!!] ");
			System.out.println("------- < LifeFCDeleteService > end --------- 삭제결과 : " + errorMsg);
			//return  "redirect:"+lifefc_path+"lifefcErrorView.do";
			return lifefc_path + "lifefc_error_view";
		} else {

			//System.out.println(" LifeFCModifyService./lifefc/lifefc_admin_index.jsp [forward OK!!] ");
			String errorMsg = code +"정보 수정 성공!" ;
			model.addAttribute("errorMsg", errorMsg);			
			System.out.println("------- < LifeFCDeleteService > end --------- 삭제결과 : " + errorMsg);
			 
			 //return "redirect:"+lifefc_path+"lifefcAdminIndex.do";
			 return lifefc_path + "lifefc_admin_index";
		}			
		 
	}
	
	@RequestMapping(value = "/LifeFcMainTest", method = RequestMethod.GET)
	public String lifeFcMainTest(Locale locale, Model model) { //RedirectAttributes rttr) {
		logger.info("/lifeFcMainTest.do >> lifeFcMainTest()- locale : "+locale);
		
		/*Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		*/
		//rttr.addFlashAttribute("msg", "success");
	   
		//return lifefc_path+"lifefc_weather";
		//return "redirect:"+lifefc_path+"lifefc_weather";
		return "main";
	}		
}