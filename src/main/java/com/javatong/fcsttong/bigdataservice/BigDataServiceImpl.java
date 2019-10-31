package com.javatong.fcsttong.bigdataservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javatong.fcsttong.domain.BigDataDTO;
import com.javatong.fcsttong.persistence.BigDataDAO;

@Service
public class BigDataServiceImpl implements BigDataService {

	@Inject
	private BigDataDAO bigdataDAO;
	
	@Override
	public String[] make_trendprod() throws Exception {
		
		return bigdataDAO.make_trendprod();
	}

	@Override
	public BigDataDTO get_TemperData() throws Exception {

		return bigdataDAO.get_TemperData();
	}

	@Override
	public BigDataDTO get_RSData() throws Exception {
		
		return bigdataDAO.get_RSData();
	}

	@Override
	public BigDataDTO get_WindData() throws Exception {
		
		return bigdataDAO.get_WindData();
	}

	@Override
	public BigDataDTO get_HIData() throws Exception {
		
		return bigdataDAO.get_HIData();
	}
}
