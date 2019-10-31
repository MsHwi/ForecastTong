package com.javatong.fcsttong.middlefcstservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONObject;

public class URLReadForecast {
	static String buffer = "";

	public String url_read(String url) {
		URL u;
		try {
			u = new URL(url);
			URLConnection connection = u.openConnection();
			connection.setDoOutput(true);
			BufferedReader br = new BufferedReader(new InputStreamReader(u.openStream(), "utf-8"));

			String inputLine;

			while ((inputLine = br.readLine()) != null)
				buffer += inputLine.trim();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject obj = new JSONObject(buffer);
		String result = obj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item")
				.getString("wfSv");
		return result;
	}
}
