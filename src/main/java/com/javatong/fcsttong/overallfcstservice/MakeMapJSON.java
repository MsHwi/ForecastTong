package com.javatong.fcsttong.overallfcstservice;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class MakeMapJSON {

	public byte[] execute() throws Exception {

		String[][] rowsdata;

		rowsdata = new String[][] { { "인천광역시 중구 동인천동", "인천", "37.4751375", "126.6247793", "54", "125" },
				{ "서울특별시 동작구 신대방제2동", "서울", "37.4939732", "126.9176076", "54", "125" },
				{ "강원도 춘천시 신사우동", "춘천", "37.9096031", "127.7182827", "74", "134" },
				{ "강원도 강릉시 중앙동", "강릉", "37.7529208", "128.8912051", "93", "132" },
				{ "경상북도 울릉군 울릉읍", "울릉", "37.5023939", "130.8684884", "127", "127" },
				{ "경기도 수원시권선구 서둔동", "수원", "37.2682678", "126.9638279", "93", "132" },
				{ "충청남도 서산시 수석동", "서산", "36.7668076", "126.4620197", "51", "109" },
				{ "충청북도 청주시흥덕구 복대1동", "청주", "36.6365777", "127.4308378", "68", "107" },
				{ "대전광역시 유성구 온천2동", "대전", "36.3705728", "127.3320241", "66", "101" },
				{ "전라북도 전주시덕진구 덕진동", "전주", "35.8469226", "127.1180309", "63", "89" },
				{ "광주광역시 북구 운암2동", "전주", "35.1764254", "126.880048", "59", "75" },
				{ "전라남도 목포시 연산동", "목포", "34.82001", "126.37147", "50", "67" },
				{ "제주특별자치도 제주시 건입동", "제주", "33.5281027", "126.5161479", "53", "38" },
				{ "전라남도 신안군 흑산면", "흑산", "34.835027", "125.8104864", "33", "64" },
				{ "전라남도 여수시 중앙동", "여수", "34.7370013", "127.7324285", "74", "65" },
				{ "경상북도 안동시 평화동", "안동", "36.5719204", "128.7063495", "90", "106" },
				{ "대구광역시 동구 신암1동", "대구", "35.8859718", "128.6132364", "89", "91" },
				{ "경상북도 포항시남구 송도동", "포항", "36.0359072", "129.3710349", "68", "107" },
				{ "울산광역시 중구 중앙동", "울산", "35.5600167", "129.3115687", "102", "94" },
				{ "부산광역시 중구 대청동", "부산", "35.1050512", "129.0265698", "97", "74" },
				{ "경상남도 창원시마산합포구 가포동", "창원", "35.1637771", "128.5609065", "89", "75" },
				{ "인천광역시 옹진군 백령면", "백령도", "37.9526663", "124.6380837", "21", "135" } };

		MakeURL makeURL = new MakeURL();
		ParseJSON parseJSON = new ParseJSON();

		JSONObject jsonObject = new JSONObject();
		JSONArray weatherArray = new JSONArray();

		System.out.println("------------------------------------- JSON 데이터 생성준비");
		
		for (int i = 0; i < 22; i++) {

			String urlStr = makeURL.makeURL(Integer.parseInt(rowsdata[i][4]), Integer.parseInt(rowsdata[i][5]));
			String tempStr = parseJSON.parseJSON(urlStr);
			String ptyStr = tempStr.substring(0, 1);
			String skyStr = tempStr.substring(1, 2);
			String t1hStr = tempStr.substring(2, tempStr.length());

			JSONObject weatherInfo = new JSONObject();
			weatherInfo.put("addr", rowsdata[i][0]);
			weatherInfo.put("stn_name", rowsdata[i][1]);
			weatherInfo.put("lat", rowsdata[i][2]);
			weatherInfo.put("lon", rowsdata[i][3]);
			weatherInfo.put("gridx", rowsdata[i][4]);
			weatherInfo.put("gridy", rowsdata[i][5]);
			weatherInfo.put("sky", skyStr);
			weatherInfo.put("pty", ptyStr);
			weatherInfo.put("t1h", t1hStr);
			weatherArray.add(weatherInfo);
		}

		jsonObject.put("rows", weatherArray);

		String jsonInfo = jsonObject.toJSONString();
//		System.out.print(jsonInfo);

		byte[] bs = jsonInfo.getBytes();

		return bs;

	}
}
