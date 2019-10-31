package com.javatong.fcsttong.memberservice;

import javax.servlet.http.HttpSession;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberDTO memberDTO) throws Exception;
	
	public void join(MemberDTO memberDTO) throws Exception;
	
	public void addAttach(String U_PICTURE) throws Exception;
	
	public void logout(HttpSession session);
	
	public int usercount() throws Exception;
	
	public String dupliccheck(String U_EMAIL) throws Exception;
}
