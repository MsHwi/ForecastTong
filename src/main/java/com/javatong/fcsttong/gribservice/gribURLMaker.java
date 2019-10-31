package com.javatong.fcsttong.gribservice;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class gribURLMaker {
	public String makeRTURL(int x, int y) throws Exception {
		Calendar time = Calendar.getInstance();
		Date date = time.getTime();
		time.setTime(date);
		time.add(Calendar.HOUR, -1);
		time.add(Calendar.MINUTE, +30);
		date = time.getTime();
//		System.out.println(date);
		String base_date = (new SimpleDateFormat("yyyyMMdd").format(date));
		String base_time = (new SimpleDateFormat("HHmm").format(date));

//		System.out.println(base_time);
		String urlstr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?"
				+ "ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D"
				+ "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + x
				+ "&ny=" + y + "&numOfRows=120&_type=json";

		URL url = new URL(urlstr);

		URLConnection urlConnection = url.openConnection();

		// out.println(urlstr);
		urlConnection.setDoOutput(true);

		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));

		// System.out.println(br);
		String tempStr;
		String content = "";

		while ((tempStr = br.readLine()) != null) {
			content += tempStr.trim();
		}

//		System.out.println(content);

		return content;
	}
}
