package com.javatong.fcsttong.middlefcstservice;


public interface ForecastService {

	public void add(com.javatong.fcsttong.domain.ForecastDTO forecastDTO) throws Exception;

	public com.javatong.fcsttong.domain.ForecastDTO read(String id) throws Exception;
}
