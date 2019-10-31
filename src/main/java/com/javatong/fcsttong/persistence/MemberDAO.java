package com.javatong.fcsttong.persistence;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.MemberVO;

public interface MemberDAO {
	public MemberVO login(MemberDTO memberDTO) throws Exception;
	
	public void join(MemberDTO memberDTO) throws Exception;
	
	public void addAttach(String U_PICTURE) throws Exception;
	
	public int usercount() throws Exception;
	
	public String dupliccheck(String U_EMAIL) throws Exception;
}
