package com.javatong.fcsttong.overallfcstservice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javatong.fcsttong.domain.LocalDTO;
import com.javatong.fcsttong.persistence.LocalDAO;


@Service
public class OverallFCServiceImpl implements OverallFCService {

	@Inject
	private LocalDAO localDAO;
	
	@Override
	public List<?> showarealist(int userid) throws Exception {
		
		return localDAO.showarealist(userid);
	}

	@Override
	public LocalDTO bring123(LocalDTO localDTO) throws Exception {
		
		return localDAO.bring123(localDTO);
	}

	@Override
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception {
		
		return localDAO.bringAreano(localDTO);
	}

	@Override
	public List<?> selsecondstage(String firststage) throws Exception {
		
		return localDAO.selsecondstage(firststage);
	}

	@Override
	public List<?> selthirdstage(LocalDTO localDTO) throws Exception {

		return localDAO.selthirdstage(localDTO);
	}

	@Override
	public void addinterestarea(LocalDTO localDTO) throws Exception {
		
		localDAO.addinterestarea(localDTO);
	}

	@Override
	public LocalDTO bringMiddleCode(LocalDTO localDTO) throws Exception {
		// TODO Auto-generated method stub
		return localDAO.bringMiddleCode(localDTO);
	}

}
