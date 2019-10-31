package com.javatong.fcsttong.controller;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javatong.fcsttong.domain.ForecastDTO;
import com.javatong.fcsttong.domain.LocalDTO;
import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.TemperatureDTO;
import com.javatong.fcsttong.gribservice.GribService;
import com.javatong.fcsttong.gribservice.forcastURLMaker;
import com.javatong.fcsttong.gribservice.gribURLMaker;
import com.javatong.fcsttong.memberservice.MemberService;
import com.javatong.fcsttong.middlefcstservice.ForecastService;
import com.javatong.fcsttong.middlefcstservice.TemperatureService;
import com.javatong.fcsttong.middlefcstservice.URLTime;
import com.javatong.fcsttong.overallfcstservice.MakeMapJSON;
import com.javatong.fcsttong.overallfcstservice.OverallFCService;

import com.javatong.fcsttong.overallfcstservice.XmlParser;

@Controller
@RequestMapping("/overallfc")
public class OverallFCController {
	private static final Logger logger = LoggerFactory.getLogger(LifeFCController.class);

	@Inject
	private OverallFCService overallfcservice;

	@Inject
	private ForecastService forecastService;

	@Inject
	private TemperatureService temperatureService;
	
	@Inject
	private GribService gribService;

	@RequestMapping(value = "/showarealist", method = RequestMethod.GET)
	public String showarealist(@RequestParam("userid") String userid, Model model) throws Exception {
		if (userid.equals("없음")) {
		} else {
			int useridInt = Integer.parseInt(userid);
			List<?> interestAreaList = new ArrayList<Object>();

			interestAreaList = overallfcservice.showarealist(useridInt);
			model.addAttribute("interestAreaList", interestAreaList);
		}
		return "/forecast/interestareaajax";
	}

	@RequestMapping(value = "/showlocalfcst", method = RequestMethod.GET)
	public String showlocalfcst(@ModelAttribute("localDTO") LocalDTO localDTO, Model model) throws Exception {
		XmlParser xmlParser = new XmlParser();
		List<Map<String, Object>> weatherlist = null;
		LocalDTO areanoDTO = overallfcservice.bring123(localDTO);
		String areano = areanoDTO.getA_AREANO();
		LocalDTO xyDTO = overallfcservice.bringAreano(localDTO);
		int x = xyDTO.getA_X();
		int y = xyDTO.getA_Y();
		weatherlist = xmlParser.xmlparser(x, y, areano);
		model.addAttribute("weatherlist", weatherlist);
		return "/forecast/localfsctajax";
	}

	@RequestMapping(value = "/showmiddlefcst", method = RequestMethod.GET)
	public String showmiddle(@ModelAttribute("localDTO") LocalDTO localDTO, Model model) throws Exception {
		URLTime urlTime = new URLTime();
		String time = urlTime.getTimeKey();
		LocalDTO middleCode = overallfcservice.bringMiddleCode(localDTO);
		ForecastDTO forecastDTO = forecastService.read(time + middleCode.getA_FORECODE());
		TemperatureDTO temperatureDTO = temperatureService.read(time + middleCode.getA_TEMPCODE());
		model.addAttribute("ForecastDTO", forecastDTO);
		model.addAttribute("TemperatureDTO", temperatureDTO);
		return "/forecast/middlefsctajax";
	}

	@RequestMapping(value = "/makemapjson", method = RequestMethod.POST)
	public void makemapjson(HttpServletRequest request, Model model) throws Exception {
		System.out.println("------------------------------------- JSON 데이터 생성준비");
		MakeMapJSON makeMapJSON = new MakeMapJSON();
		FileOutputStream fileOutputStream = null;
		byte[] bs = makeMapJSON.execute();
		try {
			String realfilepath = request.getRealPath("/") + "/resources/json/mapweather.json";
			fileOutputStream = new FileOutputStream(realfilepath, false);
			fileOutputStream.write(bs);
			System.out.println("------------------------------------- JSON 데이터 생성");
		} catch (Exception io) {
			io.printStackTrace();
		} finally {
			try {
				fileOutputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/getmapjson", method = RequestMethod.POST)
	public String getmapjson(HttpServletRequest request, Model model) throws Exception {
		System.out.println("------------------------------------- 맵JSON 가져오기 준비");
		JSONParser parser = new JSONParser();
		String realfilepath = request.getRealPath("/") + "/resources/json/mapweather.json";
		Object mapajaxdata = parser.parse(new FileReader(realfilepath));
		System.out.println("JSON Data:" + mapajaxdata);
		System.out.println("------------------------------------- 맵JSON 가져오기 완료");
		model.addAttribute("mapajaxdata", mapajaxdata);
		return "/forecast/mapajax";
	}

	@RequestMapping(value = "/getfirstlocjson", method = RequestMethod.GET)
	public String getfirstlocjson(HttpServletRequest request, Model model) throws Exception {
		System.out.println("------------------------------------- 관심지역JSON 가져오기 준비");
		JSONParser parser = new JSONParser();
		String realfilepath = request.getRealPath("/") + "/resources/json/firstloc.json";
		Object firstlocajaxdata = parser.parse(new FileReader(realfilepath));
		System.out.println("JSON Data:" + firstlocajaxdata);
		System.out.println("------------------------------------- 관심지역JSON 가져오기 완료");
		model.addAttribute("firstlocajaxdata", firstlocajaxdata);
		return "/forecast/firstlocajax";
	}

	@RequestMapping(value = "/selsecondstage", method = RequestMethod.GET)
	public String selsecondstage(@RequestParam("firststage") String firststage, Model model) throws Exception {

		List<?> secondlist = new ArrayList<Object>();
		secondlist = overallfcservice.selsecondstage(firststage);
		model.addAttribute("secondlist", secondlist);
		return "/member/sel_secondstage";
	}

	@RequestMapping(value = "/selthirdstage", method = RequestMethod.GET)
	public String selthirdstage(@ModelAttribute("localDTO") LocalDTO localDTO, Model model) throws Exception {

		List<?> thirdlist = new ArrayList<Object>();
		thirdlist = overallfcservice.selthirdstage(localDTO);
		System.out.println(thirdlist.toString());
		model.addAttribute("thirdlist", thirdlist);
		return "/member/sel_thirdstage";
	}

	@RequestMapping(value = "/addinterestarea", method = RequestMethod.POST)
	public String addinterestarea(@ModelAttribute("localDTO") LocalDTO localDTO, Model model) throws Exception {
		LocalDTO areanoDTO = overallfcservice.bring123(localDTO);
		String areano = areanoDTO.getA_AREANO();
		localDTO.setA_AREANO(areano);
		System.out.println(localDTO.toString());
		overallfcservice.addinterestarea(localDTO);

		return "/forecast/overall_weather";
	}
	
	@RequestMapping(value="/showgribfcst", method=RequestMethod.GET)
	public String gribweather(@ModelAttribute("local") LocalDTO localDTO, Model model ) throws Exception{
				
		forcastURLMaker forcasturl = new forcastURLMaker();
		gribURLMaker griburl = new gribURLMaker();
		String gribcontent =null;
		String forcastcontent =null;
		LocalDTO xyDTO = gribService.bringAreano(localDTO);
		int x = xyDTO.getA_X();
		int y = xyDTO.getA_Y();
		
		gribcontent= griburl.makeRTURL(x, y);
		forcastcontent= forcasturl.makeGribURL(x, y);
		
		model.addAttribute("gribcontent", gribcontent);
		model.addAttribute("forcastcontent", forcastcontent);
		return "/forecast/gribfsctajax";
	}

}
