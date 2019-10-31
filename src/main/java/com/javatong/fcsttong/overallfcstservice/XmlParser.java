package com.javatong.fcsttong.overallfcstservice;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParser {

	public List<Map<String, Object>> xmlparser(int x, int y, String areano) {
	
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String xmlurl = "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=" + x + "&gridy=" + y;

//		System.out.println(xmlurl);

		String[] dayweek = { "일", "월", "화", "수", "목", "금", "토" };
		int dayint = 0;
		int date=0;
		String dayweeks="";
		String tm = "";
		String xml = "";
		String temptm = "";
		StringBuilder sb = new StringBuilder();

		try {
			URL url = new URL(xmlurl);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			http.setConnectTimeout(100);
			http.setUseCaches(false);

			BufferedReader br = new BufferedReader(new InputStreamReader(http.getInputStream()));
			sb = new StringBuilder();
			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
				sb.append(line);
			}
			xml = sb.toString();
			br.close();
			http.disconnect();

//			System.out.println(sb);

		} catch (Exception e) {
			System.out.println("다운로드에러" + e.getMessage());
		}

		Map<String, Object> data = new HashMap<String, Object>();

		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentbuilder = factory.newDocumentBuilder();
			InputStream is = new ByteArrayInputStream(xml.getBytes());
			Document doc = documentbuilder.parse(is);
			Element element = doc.getDocumentElement();

			NodeList list0 = element.getElementsByTagName("header");

			for (int i = 0; i < list0.getLength(); i++) {
				for (Node node0 = list0.item(i).getFirstChild(); node0 != null; node0 = node0.getNextSibling()) {
					if (node0.getNodeName().equals("tm")) {
						temptm = node0.getTextContent().toString();

						String year = temptm.substring(0, 4);
						String month = temptm.substring(4, 6);
						String day = temptm.substring(6, 8);
						dayint = Integer.parseInt(day);
						String hour = temptm.substring(8, 10);
						String minute = temptm.substring(10, 12);
						Calendar calendar = Calendar.getInstance();
						calendar.set(Calendar.YEAR, Integer.parseInt(year));
						calendar.set(Calendar.MONTH, Integer.parseInt(month) - 1);
						calendar.set(Calendar.DATE, Integer.parseInt(day));
						date = calendar.get(Calendar.DAY_OF_WEEK);
						dayweeks = dayweek[date - 1];
						tm = year + "년 " + month + "월 " + day + "일 " + dayweeks + "요일 " + hour + ":" + minute + " 발표";

					}
				}
			}

			NodeList list1 = element.getElementsByTagName("data");

			for (int i = 0; i < list1.getLength(); i++) {
				for (Node node = list1.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {

					if (node.getNodeName().equals("hour")) {
						data = new HashMap<String, Object>();
						data.put("areano", areano);
						data.put("tm", tm);
						data.put("hour", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("day")) {
						switch (node.getTextContent().toString()) {
						case "0":
							data.put("day", "오늘(" + dayint + "일)");
							break;
						case "1":
							data.put("day", "내일(" + (dayint+1) + "일)");
							break;
						case "2":
							data.put("day", "모레(" + (dayint+2) + "일)");
							break;
						}
					}
					if (node.getNodeName().equals("temp")) {
						data.put("temp", Math.round(Double.parseDouble((node.getTextContent().toString()))));
					}
					if (node.getNodeName().equals("tmx")) {
						switch (node.getTextContent().toString()) {
						case "-999.0":
							data.put("tmx", "-");
							break;
						default:
							data.put("tmx", Math.round(Double.parseDouble((node.getTextContent().toString()))));
							break;
						}
					}
					if (node.getNodeName().equals("tmn")) {
						switch (node.getTextContent().toString()) {
						case "-999.0":
							data.put("tmn", "-");
							break;
						default:
							data.put("tmn", Math.round(Double.parseDouble((node.getTextContent().toString()))));
							break;
						}
					}
					if (node.getNodeName().equals("sky")) {
						data.put("sky", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("pty")) {
						data.put("pty", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("wfEn")) {
						String trimwfEn = node.getTextContent().toString().replaceAll(" ", "");
						data.put("wfEn", trimwfEn);
					}
					if (node.getNodeName().equals("pop")) {
						data.put("pop", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("ws")) {
						data.put("ws", Math.round(Double.parseDouble((node.getTextContent().toString()))));
					}
					if (node.getNodeName().equals("wdEn")) {
						data.put("wdEn", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("reh")) {
						data.put("reh", node.getTextContent().toString());
					}
					if (node.getNodeName().equals("r06")) {
						switch (node.getTextContent().toString()) {
						case "0.0":
							data.put("r06", "-");
							break;
						default:
							data.put("r06", node.getTextContent().toString());
							break;
						}
					}
					if (node.getNodeName().equals("s06")) {
						data.put("s06", node.getTextContent().toString());
						list.add(data);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

//		for (Map<String, Object> map : list) {
//			System.out.println(map);
//		}

		return list;
	}

}
