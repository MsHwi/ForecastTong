package com.javatong.fcsttong.persistence;

import java.util.List;

import com.javatong.fcsttong.domain.LocalDTO;

public interface LocalDAO {
	public List<?> showarealist(int userid) throws Exception;
	
	public LocalDTO bring123(LocalDTO localDTO) throws Exception;
	
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception;
	
	public List<?> selsecondstage(String firststage) throws Exception;
	
	public List<?> selthirdstage(LocalDTO localDTO) throws Exception;
	
	public void addinterestarea(LocalDTO localDTO) throws Exception;
	
	public LocalDTO bringMiddleCode(LocalDTO localDTO) throws Exception;
	}
