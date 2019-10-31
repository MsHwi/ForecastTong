package com.javatong.fcsttong.persistence;

import com.javatong.fcsttong.domain.ForecastDTO;
import com.javatong.fcsttong.domain.LocalDTO;

public interface ForecastDAO {

	public void add(ForecastDTO forecastDTO) throws Exception;

	public ForecastDTO read(String id) throws Exception;
}
