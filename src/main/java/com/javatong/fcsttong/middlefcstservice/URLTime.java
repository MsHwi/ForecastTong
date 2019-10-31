package com.javatong.fcsttong.middlefcstservice;

import java.text.SimpleDateFormat;
import java.util.Date;

public class URLTime {

	Date date = new Date();
	SimpleDateFormat dateFormat;
	String today;
	String time;
	String standard;
	String timeKey;

	public String getDate() {
		dateFormat = new SimpleDateFormat("yyyyMMdd");
		today = dateFormat.format(date);
		return today;
	}

	public String getTime() {
		dateFormat = new SimpleDateFormat("HHmm");
		time = dateFormat.format(date);
		return time;
	}

	public String timeCal(String timenow) {
		int now = Integer.parseInt(timenow);
		if (now <= 1800) {
			standard = "0600";
		} else {
			standard = "1800";
		}
		return standard;
	}

	public String getTimeKey() {
		timeKey = getDate() + timeCal(getTime());
		return timeKey;
	}

}
