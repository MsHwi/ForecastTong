package com.javatong.fcsttong.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.ForecastDTO;
import com.javatong.fcsttong.domain.LocalDTO;

@Repository
public class ForecastDAOImpl implements ForecastDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.javatong.fcsttong.mapper.forecastMapper";

	@Override
	public void add(ForecastDTO forecastDTO) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".add", forecastDTO);
	}

	@Override
	public ForecastDTO read(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", id);
	}

}
