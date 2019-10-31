package com.javatong.fcsttong.gribservice;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class forcastURLMaker {
	public String makeGribURL(int x, int y) throws Exception {
		// 단기예보 날씨정보 불러오기
		// 요청할 시간을 기상청 발표시간에 맞게 변경
		Calendar time1 = Calendar.getInstance();
		Date date1 = time1.getTime();
		// base_time3 = time.get(Calendar.HOUR_OF_DAY);
		time1.setTime(date1);
		time1.add(Calendar.HOUR, -1);
		time1.add(Calendar.MINUTE, +30);		// if (base_time3 > 18) {
		// time1.set(Calendar.HOUR_OF_DAY, 18);
		// time1.set(Calendar.MINUTE, 00);
		// }
		date1 = time1.getTime();
		String base_date1 = (new SimpleDateFormat("yyyyMMdd").format(date1));
		String base_time1 = (new SimpleDateFormat("HHmm").format(date1));
		String urlstr1 = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastTimeData?"
				+ "ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D"
				+ "&base_date=" + base_date1 + "&base_time=" + base_time1 + "&nx=" +x + "&ny="
				+ y + "&numOfRows=120&_type=json";
//		System.out.println(urlstr1);
		URL url1 = new URL(urlstr1);

		URLConnection urlConnection1 = url1.openConnection();
		urlConnection1.setDoOutput(true);
		BufferedReader br1 = new BufferedReader(new InputStreamReader(url1.openStream(), "utf-8"));
		String tempStr1;
		String content1 = "";
		while ((tempStr1 = br1.readLine()) != null) {
			content1 += tempStr1.trim();
		}
//		System.out.println(content1);

		return content1;
	}
}
