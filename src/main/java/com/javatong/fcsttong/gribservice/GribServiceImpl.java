package com.javatong.fcsttong.gribservice;



import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.javatong.fcsttong.domain.LocalDTO;
import com.javatong.fcsttong.persistence.GribDAO;
import com.javatong.fcsttong.persistence.LocalDAO;


@Service
public class GribServiceImpl implements GribService {
	@Inject
	private GribDAO gribDAO;
	
	
	

	@Override
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception {
		
		return gribDAO.bringAreano(localDTO);
	}

	

}
