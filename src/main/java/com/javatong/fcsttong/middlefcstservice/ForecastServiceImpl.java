package com.javatong.fcsttong.middlefcstservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javatong.fcsttong.domain.ForecastDTO;
import com.javatong.fcsttong.persistence.ForecastDAO;

@Service
public class ForecastServiceImpl implements ForecastService {

	@Inject
	private ForecastDAO dao;

	@Override
	public void add(ForecastDTO forecastDTO) throws Exception {
		// TODO Auto-generated method stub
		dao.add(forecastDTO);
	}

	@Override
	public ForecastDTO read(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(id);
	}
}
