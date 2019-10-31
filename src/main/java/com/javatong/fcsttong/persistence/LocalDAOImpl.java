package com.javatong.fcsttong.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.LocalDTO;

@Repository
public class LocalDAOImpl implements LocalDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.javatong.mapper.localfcstMapper";

	@Override
	public List<?> showarealist(int userid) throws Exception {
		return sqlSession.selectList(namespace + ".showarealist", userid);
	}

	@Override
	public LocalDTO bring123(LocalDTO localDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".bring123", localDTO);
	}

	@Override
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".bringAreano", localDTO);
	}

	@Override
	public List<?> selsecondstage(String firststage) throws Exception {
		return sqlSession.selectList(namespace + ".selsecondstage", firststage);
	}

	@Override
	public List<?> selthirdstage(LocalDTO localDTO) throws Exception {
		return sqlSession.selectList(namespace + ".selthirdstage", localDTO);
	}

	@Override
	public void addinterestarea(LocalDTO localDTO) throws Exception {
		sqlSession.insert(namespace + ".addinterestarea", localDTO);
	}

	@Override
	public LocalDTO bringMiddleCode(LocalDTO localDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".bringMiddleCode", localDTO);
	}

}
