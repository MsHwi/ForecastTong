package com.javatong.fcsttong.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.LocalDTO;
import com.javatong.fcsttong.domain.TemperatureDTO;

@Repository
public class TemperatureDAOImpl implements TemperatureDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "com.javatong.fcsttong.mapper.temperatureMapper";

	@Override
	public void add(TemperatureDTO temperatureDTO) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".add", temperatureDTO);
	}

	@Override
	public TemperatureDTO read(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", id);
	}

}
