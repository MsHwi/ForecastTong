package com.javatong.fcsttong.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.javatong.mapper.MemberMapper";

	@Override
	public MemberVO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace+".login", memberDTO);
	}

	@Override
	public int usercount() throws Exception {
		return sqlSession.selectOne(namespace+".usercount");
	}

	@Override
	public String dupliccheck(String U_EMAIL) throws Exception {
		return sqlSession.selectOne(namespace+".dupliccheck", U_EMAIL);
	}

	@Override
	public void join(MemberDTO memberDTO) throws Exception {
		sqlSession.insert(namespace+".join", memberDTO);
	}

	@Override
	public void addAttach(String U_PICTURE) throws Exception {
		sqlSession.insert(namespace+".addattach", U_PICTURE);	
	}

}
