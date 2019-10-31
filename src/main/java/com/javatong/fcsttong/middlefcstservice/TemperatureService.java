package com.javatong.fcsttong.middlefcstservice;

import com.javatong.fcsttong.domain.TemperatureDTO;

public interface TemperatureService {

	public void add(TemperatureDTO temperatureDTO)throws Exception;

	public TemperatureDTO read(String id)throws Exception;
}
