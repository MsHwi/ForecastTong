package com.javatong.fcsttong.persistence;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
//import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.javatong.fcsttong.domain.LifeFCDTO;
//import com.javatong.fcsttong.domain.LocalDTO;

//@Service
@Repository
// public class LifeFCDAO extends JdbcDaoSupport { JDBC Template 사용시 extends
// JdbcDaoSupport 가 추가되어야 한다.
public class LifeFCDAO {

	@Inject
	private SqlSession sqlSession;

	//BasicDataSource basicDataSource;
	//
	/*
	 * @Autowired public void setBasicDataSource(BasicDataSource
	 * basicDataSource) { this.basicDataSource = basicDataSource; }
	 */

	private static String namespace = "com.javatong.mapper.LifeFCMapper";

	final String urlFsnLifeAddr = "http://203.247.66.146/iros/RetrieveLifeIndexService/getFsnLifeList?ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D";
	final String urlUltryLifeAddr = "http://203.247.66.146/iros/RetrieveLifeIndexService/getUltrvLifeList?ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D";

	public List<LifeFCDTO> selectFavJijumInfo(String loginId) {
		System.out.println("LifeFCDAO.selectFavJijumInfo() -> loginId : " + loginId);
		return sqlSession.selectList(namespace + ".selectFavJijumInfo", loginId);
	}

	// 특정지역 자외선/식중독지수정보 조회
	public List<LifeFCDTO> selectlOneLocalJisuInfo(String areano) {
		System.out.println("LifeFCDAO.selectlOneLocalJisuInfo() -> sfavAreaNo : " + areano);
		return sqlSession.selectList(namespace + ".selectlOneLocalJisuInfo", areano);

	}

	public LifeFCDTO selectJisuinfo(LifeFCDTO lifeFCDTO) {

		// mapper.xml 에서 getBoardList 가 parameterType 을 Map으로 해둠.
		/*
		 * Map map = new HashMap(); map.put("areano", areano);
		 * map.put("jisucode", strJisuCode); System.out.println("map : " + map);
		 */
		System.out.println("LifeFCDAO.selectJisuinfo() -> lifeFCDTO :" + lifeFCDTO);

		return sqlSession.selectOne(namespace + ".selectJisuinfo", lifeFCDTO);
	}
	
	public boolean insertLifeFCJisuInfo(List<LifeFCDTO> lifeFCList) throws Exception {
		System.out.println("LifeFCDAO.insertLifeFCJisuInfo() -> lifeFCList :" + lifeFCList);
		boolean rslt = true;
		int nLoopCnt = 0;
		//LifeFCDTO lifefcDTO = new LifeFCDTO();

		while (nLoopCnt < lifeFCList.size()) {
			LifeFCDTO lifefcDTO = (LifeFCDTO) lifeFCList.get(nLoopCnt);
			String lj_id = lifefcDTO.getArea_no() + lifefcDTO.getCode() + lifefcDTO.getNoti_time();
			lifefcDTO.setId(lj_id);
			try {
				sqlSession.insert(namespace + ".insertJisuinfo", lifefcDTO);
			} catch (Exception e) {
				System.out.println("insertLifeFCJisuInfo() 처리시 오류 : " + e.getMessage());
				rslt = false;
				//return e.getMessage();
				throw e;
			}

			++nLoopCnt;
		}
		return rslt;
	
	}

	public String updateLifeFCJisuInfo(LifeFCDTO lifefcDTO) {
		// System.out.println("LifeFCDAO.updateLifeFCJisuInfo()... >> start");
		System.out.println("LifeFCDAO.updateLifeFCJisuInfo() -> lifefcDTO :" + lifefcDTO);
		String rsltMsg = "";
		
		try {
		   sqlSession.update(namespace + ".updateLifeFCJisuInfo", lifefcDTO);
		} catch (Exception e) {
			rsltMsg = e.getMessage();	
		}
		// System.out.println("LifeFCDAO.updateLifeFCJisuInfo(). >> rsltMsg : "
		// + rsltMsg);
		return rsltMsg;
	}
	public List<LifeFCDTO> selectlAllPartsJisuInfo(String strJisuName) {
		ArrayList lifeFCList = new ArrayList();
		String code;
		if (strJisuName.equals("식중독")) {
			code = "A01_2";
		} else {
			code = "A07";
		}		
		return sqlSession.selectList(namespace + ".selectlAllPartsJisuInfo", code);
	}
    //지점값보기 조회 : 전체 지점의 당일의 자외선 또는 식중독지수 정보를 조회함.  
	public List<LifeFCDTO> allJijumJisuSelect(String strJisuName) {
		ArrayList lifeFCList = new ArrayList();
		String code;

			String sqle = null;
			if (strJisuName.equals("식중독")) {
				code = "A01_2";
			} else {
				code = "A07";
			}		
			return sqlSession.selectList(namespace + ".allJijumJisuSelect", code);
  
	}

	public String lifeFCDataCheck(String strJisuName) {
		//ArrayList lifeFCList = new ArrayList();
	 	String code;

			//String sqle = null;
			if (strJisuName.equals("식중독")) {
				code = "A01_2";
			} else {
				code = "A07";
			}	 	
			return sqlSession.selectOne(namespace + ".lifeFCDataCheck", code);
	}		
	
	//public LifeFCDTO selectJisuinfo2(String areano, String noti_time, String jisucode) {
	public LifeFCDTO lifeFcUpdSelect(LifeFCDTO lifeFcDTO) {
		
		return sqlSession.selectOne(namespace + ".lifeFcUpdSelect", lifeFcDTO);
	}
	
	public String deleteLifeFCJisuInfo(LifeFCDTO lifeFcDTO) {
		System.out.println("LifeFCDAO.deleteLifeFCJisuInfo() ");
		String rsltMsg = "";
		try{
			sqlSession.update(namespace + ".deleteLifeFCJisuInfo", lifeFcDTO);
		} catch (Exception e) {
			rsltMsg = e.getMessage();
		} 
		return  rsltMsg;
	}
 

	public String createLifeFCJisuinfo(String jisuGubun) {
		String rsltMsg = "";
		rsltMsg = this.getJsonLifeFCInfo(jisuGubun);
		// System.out.println("LifeFCDAO.createLifeFCJisuinfo() >> rsltMsg : " +
		// rsltMsg);
		return rsltMsg;
	}


	public String getJsonLifeFCInfo(String jisuGubun) {
		// System.out.println("LifeFCDAO.getJsonLifeFCInfo()..");
		String rsltMsg = "";
		String url = null;
		String msgText = null;
		Object areaNo = null;
		Object time = null;
		if (jisuGubun.equals("자외선")) {
			url = "http://203.247.66.146/iros/RetrieveLifeIndexService/getUltrvLifeList?ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D&_type=json";
		} else if (jisuGubun.equals("식중독")) {
			url = "http://203.247.66.146/iros/RetrieveLifeIndexService/getFsnLifeList?ServiceKey=gM0F436bLU2PgtTPSgNCWSrE%2Fs2rDjhCI%2BudlFQdf%2F%2BCDyOqsg5eSU%2BjrsN%2FrCVe%2Ft1M4tmSkbEJ2enrgaBXKg%3D%3D&_type=json";
		}

		try {
			msgText = this.readJsonFromUrl(url);
		} catch (MalformedURLException arg7) {
			arg7.printStackTrace();
			rsltMsg = "LifeFCDAO.readJsonFromUrl()>>  MalformedURLException오류";
		} catch (IOException arg8) {
			arg8.printStackTrace();
			rsltMsg = "LifeFCDAO.readJsonFromUrl()>> readJsonFromUrl()호출 IO오류";
		}

		try {
		int ret = this.FCJsonHeadSet(msgText);
		// System.out.println(ret);
		if (ret == 0) {
			rsltMsg = "LifeFCDAO.readJsonFromUrl()>> 생성된 건이 없습니다.";
		} else if (ret > 0) {
			rsltMsg = "";
			System.out.println(ret + "건이 정상 생성되었습니다.");
		} else {
			rsltMsg = jisuGubun + "정보 생성시 오류가 발생되었습니다." + " [오류내용] " ;
		}
		} catch (Exception e){
			rsltMsg = e.getMessage();
		}

		// System.out.println(rsltMsg);
		return rsltMsg;
	}

	public int FCJsonHeadSet(String msgData) throws Exception {
		// System.out.println("LifeFCDAO.FCJsonHeadSet()..");
		ArrayList lifeFCList = new ArrayList();
		new JSONObject();
		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject;
		try {
			jsonObject = (JSONObject) jsonParser.parse(msgData);
		} catch (ParseException arg12) {
			arg12.printStackTrace();
			return -1;
		}

		jsonObject = (JSONObject) jsonObject.get("Response");
		JSONObject jsonHeadObj = (JSONObject) jsonObject.get("header");
		JSONObject jsonBodyObj = (JSONObject) jsonObject.get("body");
		JSONArray jArray = (JSONArray) jsonBodyObj.get("indexModels");
		int loopCnt = 0;

		for (Iterator iterator = jArray.iterator(); iterator.hasNext(); ++loopCnt) {
			LifeFCDTO lifefcDTO = new LifeFCDTO();
			JSONObject jsonObj_X = (JSONObject) iterator.next();
			
			lifefcDTO.setCode((String) jsonObj_X.get("code"));
			lifefcDTO.setNoti_time((String) jsonObj_X.get("date"));
			lifefcDTO.setArea_no((String) jsonObj_X.get("areaNo"));
			int today = "".equals(jsonObj_X.get("today")) ? 0 : Integer.parseInt((String) jsonObj_X.get("today"));
			lifefcDTO.setToday_fcst(today);
			lifefcDTO.setTomrw_fcst(Integer.parseInt((String) jsonObj_X.get("tomorrow")));
			lifefcDTO.setAft_tomrw_fcst(Integer.parseInt((String) jsonObj_X.get("theDayAfterTomorrow")));
			lifeFCList.add(lifefcDTO);
		}

		if (lifeFCList.size() == 0) {
			// System.out.println("생성할 데이터가 한 건도 없습니다.");
			loopCnt = -1;
		} else if (!this.insertLifeFCJisuInfo(lifeFCList)) {
			// System.out.println("오류 : 생활기상정보 생성(insert) 실패!;");
			loopCnt = -1;
		}

		return loopCnt;
	}

	public String readAll(BufferedReader rd) throws IOException {
		// System.out.println("LifeFCDAO.readAll()..");
		StringBuilder sb = new StringBuilder();

		String cp;
		while ((cp = rd.readLine()) != null) {
			sb.append(cp);
		}

		return sb.toString();
	}

	public String readJsonFromUrl(String urlStr) throws MalformedURLException, IOException {
		// System.out.println("LifeFCDAO.readJsonFromUrl()..");
		URL url = new URL(urlStr);
		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);
		InputStream is = (new URL(urlStr)).openStream();
		BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
		String msgText = this.readAll(rd);
		return msgText;
	}
 
}