package com.javatong.fcsttong.persistence;

import com.javatong.fcsttong.domain.GribDTO;
import com.javatong.fcsttong.domain.LocalDTO;

public interface GribDAO {
	public void gribweather(GribDTO gribDTO)throws Exception;
	public GribDTO localSearch(String local)throws Exception;
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception;
}
