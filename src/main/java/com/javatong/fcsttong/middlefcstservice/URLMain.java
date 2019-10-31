package com.javatong.fcsttong.middlefcstservice;


public class URLMain {
	public static URLTime urlTime = new URLTime();

	public String setTodayForecastURL(String stnId, String areano) {
		URLConf.tmFc = urlTime.getTimeKey();
		String uRLForecast = URLConf.SITE_MIDDLE + URLConf.SITE_FORECAST + "?ServiceKey=" + URLConf.SERVICE_KEY
				+ "&stnId=" + stnId + "&tmFc=" + URLConf.tmFc + "&_type=json";
		return uRLForecast;
	}

	public String setTodayTemperatureURL(String regId, String areano) {
		URLConf.tmFc = urlTime.getTimeKey();
		String uRLTemperture = URLConf.SITE_MIDDLE + URLConf.SITE_TEMPERATURE + "?ServiceKey=" + URLConf.SERVICE_KEY
				+ "&regId=" + regId + "&tmFc=" + URLConf.tmFc + "&_type=json";
		return uRLTemperture;
	}

}
