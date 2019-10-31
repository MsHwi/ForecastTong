package com.javatong.fcsttong.middlefcstservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.javatong.fcsttong.domain.TemperatureDTO;
import com.javatong.fcsttong.persistence.TemperatureDAO;

@Service
public class TemperatureServiceImpl implements TemperatureService {

	@Inject
	private TemperatureDAO dao;

	@Override
	public void add(TemperatureDTO temperatureDTO) throws Exception {
		// TODO Auto-generated method stub
		dao.add(temperatureDTO);
	}

	@Override
	public TemperatureDTO read(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(id);
	}

}
