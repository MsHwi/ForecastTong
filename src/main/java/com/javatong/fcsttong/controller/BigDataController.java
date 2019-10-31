package com.javatong.fcsttong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javatong.fcsttong.bigdataservice.BigDataService;
import com.javatong.fcsttong.domain.BigDataDTO;

@Controller
@RequestMapping("/bigdata")
public class BigDataController {
	private static final Logger logger = LoggerFactory.getLogger(LifeFCController.class);

	@Inject
	private BigDataService bigdataservice;
	
	// Ajax로부터 호출되어 메인화면에 트렌드 기반 추천상품 정보를 보여줌
	@RequestMapping(value = "/make_trendprod", method = RequestMethod.GET)
	public String make_trendprod(Model model) throws Exception {
		String[] product_list = bigdataservice.make_trendprod();
//		System.out.println(product_list);
			
		// product_list[0]: 상품명, product_list[1]: 가격, product_list[2]: 이미지
		
		HashMap<String, String> product_map = new HashMap<String, String>();
		product_map.put("prod_name", product_list[0]);
		product_map.put("prod_cost", product_list[1]);
		product_map.put("prod_image", product_list[2]);
		
		List<Map> final_product_list = new ArrayList<Map>();
		final_product_list.add(product_map);
		
		System.out.println(final_product_list);

		model.addAttribute("final_product_list", final_product_list);
		
		return "/bigdata/make_trendprod";
	}
	
	@RequestMapping(value = "/gotoElanal", method = RequestMethod.GET)
	public String gotoElanal() throws Exception {
		return "/bigdata/byelement_analyze";
	}
	
	@RequestMapping(value = "/gotoStatanal", method = RequestMethod.GET)
	public String gotoStatanal() throws Exception {
		return "/bigdata/statistical_analysis";
	}
	
	@RequestMapping(value = "/makeTempChart", method = RequestMethod.GET)
	@ResponseBody
	public BigDataDTO makeTempChart() throws Exception {
		BigDataDTO data = new BigDataDTO();
		
		data = bigdataservice.get_TemperData();
		
		return data;
	}
	
	@RequestMapping(value = "/makeRSChart", method = RequestMethod.GET)
	@ResponseBody
	public BigDataDTO makeRSChart() throws Exception {
		BigDataDTO data = new BigDataDTO();
		
		data = bigdataservice.get_RSData();
		
		return data;
	}
	
	@RequestMapping(value = "/makeWindChart", method = RequestMethod.GET)
	@ResponseBody
	public BigDataDTO makeWindChart() throws Exception {
		BigDataDTO data = new BigDataDTO();
		
		data = bigdataservice.get_WindData();
		
		return data;
	}
	
	@RequestMapping(value = "/makeHIChart", method = RequestMethod.GET)
	@ResponseBody
	public BigDataDTO makeHIChart() throws Exception {
		BigDataDTO data = new BigDataDTO();
		
		data = bigdataservice.get_HIData();
		
		return data;
	}
	
}
