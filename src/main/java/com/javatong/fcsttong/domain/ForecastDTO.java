package com.javatong.fcsttong.domain;

public class ForecastDTO {
	
	private String m_f_id;
	private String m_f_time;
	private String m_f_forecast;
	private String a_areano;
	public String getM_f_id() {
		return m_f_id;
	}
	public void setM_f_id(String m_f_id) {
		this.m_f_id = m_f_id;
	}
	public String getM_f_time() {
		return m_f_time;
	}
	public void setM_f_time(String m_f_time) {
		this.m_f_time = m_f_time;
	}
	public String getM_f_forecast() {
		return m_f_forecast;
	}
	public void setM_f_forecast(String m_f_forecast) {
		this.m_f_forecast = m_f_forecast;
	}
	public String getA_areano() {
		return a_areano;
	}
	public void setA_areano(String a_areano) {
		this.a_areano = a_areano;
	}
	@Override
	public String toString() {
		return "ForecastDTO [m_f_id=" + m_f_id + ", m_f_time=" + m_f_time + ", m_f_forecast=" + m_f_forecast
				+ ", a_areano=" + a_areano + "]";
	}
	
	
}
