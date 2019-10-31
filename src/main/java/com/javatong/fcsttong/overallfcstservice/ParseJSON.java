package com.javatong.fcsttong.overallfcstservice;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ParseJSON {
	public String parseJSON(String urlStr) throws Exception {
		String jsondata="";
		URL url = new URL(urlStr);
		URLConnection urlConnection = url.openConnection();
		urlConnection.setDoOutput(true);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
		String tempStr;
		String content = "";
		while ((tempStr = br.readLine()) != null) {
			content += tempStr.trim();
		}
		
		System.out.println("트래픽 초과 여부 URL(트래픽이 초과되면 '에러번호 22'가 뜹니다): " + content);

		int indexS = content.indexOf("{\"item\":");
		int indexE = content.indexOf(",\"numOfRows\"");
//		System.out.println(indexS+"와"+indexE);
		String result = content.substring(indexS, indexE);
//		System.out.println(result);

		JSONParser parser = new JSONParser();
		JSONObject item = (JSONObject) parser.parse(result);

		JSONArray arr = (JSONArray) item.get("item");

		for (int i = 0; i < arr.size(); i++) {
			JSONObject tmp = (JSONObject) arr.get(i);// 인덱스 번호로 접근해서 가져온다.

			String category = (String) tmp.get("category");
			Object obsrValue = (Object) tmp.get("obsrValue");

			if (category.equals("SKY")) {
				category = (String) tmp.get("category");
				obsrValue = (Object) tmp.get("obsrValue");
//				System.out.println("카테고리 : " + category);
//				System.out.println("값 : " + obsrValue);
				jsondata+=obsrValue;

			} else if (category.equals("PTY")) {
				category = (String) tmp.get("category");
				obsrValue = (long) tmp.get("obsrValue");
//				System.out.println("카테고리 : " + category);
//				System.out.println("값 : " + obsrValue);
				jsondata+=obsrValue;
			} else if (category.equals("T1H")) {
				category = (String) tmp.get("category");
				obsrValue = tmp.get("obsrValue");
//				System.out.println("카테고리 : " + category);
//				System.out.println("값 : " + obsrValue);
				jsondata+=obsrValue;
			}
		}
		return jsondata;
	}
}
