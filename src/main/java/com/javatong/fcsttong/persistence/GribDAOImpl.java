package com.javatong.fcsttong.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.GribDTO;
import com.javatong.fcsttong.domain.LocalDTO;
@Repository
public class GribDAOImpl implements GribDAO {
	@Inject
	private SqlSession session;
	private static String namespace="com.javatong.mapper.GribMapper";
	
	@Override
	public LocalDTO bringAreano(LocalDTO localDTO) throws Exception {
		return session.selectOne(namespace+".bringAreano", localDTO);
	}
		@Override
	public void gribweather(GribDTO gribDTO) throws Exception {
		session.selectOne(namespace + ".gribweather", gribDTO);
	}
	@Override
	public GribDTO localSearch(String local ) throws Exception{
	return null;
//	session.selectOne(namespace + ".localSearch", local);
		}	
	
}