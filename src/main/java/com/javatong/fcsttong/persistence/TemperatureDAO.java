package com.javatong.fcsttong.persistence;

import com.javatong.fcsttong.domain.LocalDTO;
import com.javatong.fcsttong.domain.TemperatureDTO;

public interface TemperatureDAO {
	public void add(TemperatureDTO temperatureDTO) throws Exception;

	public TemperatureDTO read(String id) throws Exception;
}
