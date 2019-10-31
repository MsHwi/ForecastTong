package com.javatong.fcsttong.lifefcstservice;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledLifeFCInfoCreate {
	@Inject
	LifeFCInfoCreate lifeFCInfoCreate;
	@Inject
	LifeFCDataCheck lifeFCDataCheck;
	
	@Scheduled(cron = "0 15 6,9,11,18,19,20 * * *")
	public void test() throws Exception {	
		//--------------- < 생활지수 자외선 정보 생성 > ------------------------
		String jisugubun="자외선";
		String rsltMsg = lifeFCDataCheck.execute(jisugubun);		
		 
		if ("OK".equals(rsltMsg) == false) {
			System.out.println(jisugubun +" 생활지수정보 미생성 확인 [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]");
			rsltMsg = lifeFCInfoCreate.execute(jisugubun);
			
			if ("".equals(rsltMsg) == false) {
				System.out.println(jisugubun +" 생활지수정보 생성 실패  [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]");
			} else  { System.out.println(jisugubun + " 생활지수 자외선정보 생성   [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]"  ); }   			 
		} else  { System.out.println(jisugubun + " 생활지수 자외선정보  기존 생성 확인   [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]"  ); } 	
	    //--------------- < 생활지수 식중독 정보 생성 > ------------------------------
		 jisugubun="식중독";
		rsltMsg = lifeFCDataCheck.execute(jisugubun);		
		 
		if ("OK".equals(rsltMsg) == false) {
			System.out.println(jisugubun +" 생활지수정보 미생성 확인  [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]");
			rsltMsg = lifeFCInfoCreate.execute(jisugubun);
			
			if ("".equals(rsltMsg) == false) {
				System.out.println(jisugubun +" 생활지수정보 생성 실패  [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]");
			} else  { System.out.println(jisugubun + " 생활지수 식중독정보 생성   [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate]"  ); } 
			 
		} else  { System.out.println(jisugubun + " 생활지수 식중독정보  기존 생성 확인  [생활기상지수 스케줄러 : ScheduledLifeFCInfoCreate] "  ); }			
 
	}
	
}
