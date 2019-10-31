package com.javatong.fcsttong.persistence;

import com.javatong.fcsttong.domain.BigDataDTO;

public interface BigDataDAO {
	
	public String[] make_trendprod() throws Exception;
	
	public BigDataDTO get_TemperData() throws Exception;
	
	public BigDataDTO get_RSData() throws Exception;
	
	public BigDataDTO get_WindData() throws Exception;
	
	public BigDataDTO get_HIData() throws Exception;
}
