package com.javatong.fcsttong.overallfcstservice;

import java.util.Date;

public class MakeURL {
	public String makeURL(int x, int y) {
		String url = "";
		Date today = new Date();
		int date = today.getDate();
		String dateStr = String.valueOf(date);
		int month = today.getMonth() + 1;
		String monthStr = String.valueOf(month);
		int year = today.getYear() + 1900;
		int hours = today.getHours();
		String hoursStr = String.valueOf(hours);
		int minutes = today.getMinutes();
		
//		System.out.println(hours+"시"+minutes+"분");
		
		if (minutes >= 0 && minutes <= 40) {
			// 40분보다 작으면 한시간 전 값
//			System.out.println("40분보다 이르다");
			hours = hours -1;
			hoursStr = String.valueOf(hours);
//			System.out.println(hours+"시"+minutes+"분");
			if (hours < 0) {
				// 자정 이전은 전날로 계산
				today.setDate(today.getDate() - 1);
				date = today.getDate();
				month = today.getMonth() + 1;
				year = today.getYear() + 1900;
				hours = 23;
				hoursStr = String.valueOf(hours);
			}
		}
		
		if (hours < 10) {
			hoursStr = "0" + hoursStr;
		}
		if (month < 10) {
			monthStr = "0" + monthStr;
		}
		if (date < 10) {
			dateStr = '0' + dateStr;
		}
		
 	    int _nx = x;   
 	    int _ny = y;

 	    String apikey = "gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D";
 	    String urlToday = year+""+monthStr+""+dateStr;
 	    String basetime = hoursStr + "00";
 	    String _fileName = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
	    _fileName += "?ServiceKey=" + apikey;
	    _fileName += "&base_date=" + urlToday;
	    _fileName += "&base_time=" + basetime;
	    _fileName += "&nx=" + _nx + "&ny=" + _ny;
	    _fileName += "&pageNo=1&numOfRows=10";
	    _fileName += "&_type=json";
//		System.out.println(_fileName);

		return _fileName;
	}
}
