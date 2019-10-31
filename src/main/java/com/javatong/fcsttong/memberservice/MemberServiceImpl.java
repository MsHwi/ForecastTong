package com.javatong.fcsttong.memberservice;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.MemberVO;
import com.javatong.fcsttong.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberDTO memberDTO) throws Exception {

		return memberDAO.login(memberDTO);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int usercount() throws Exception {

		return memberDAO.usercount();
	}

	@Override
	public String dupliccheck(String U_EMAIL) throws Exception {

		return memberDAO.dupliccheck(U_EMAIL);
	}

	@Transactional
	@Override
	public void join(MemberDTO memberDTO) throws Exception {

		memberDAO.join(memberDTO);

		String[] files = memberDTO.getU_PICTURE();
		if (files == null) {
			return;
		}
		for (String fileName:files) {
			memberDAO.addAttach(fileName);
		}
	}

	@Override
	public void addAttach(String U_PICTURE) throws Exception {

		memberDAO.addAttach(U_PICTURE);
	}

}
