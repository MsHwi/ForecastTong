package com.javatong.fcsttong.middlefcstservice;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.javatong.fcsttong.domain.ForecastDTO;
import com.javatong.fcsttong.domain.TemperatureDTO;

@Component
public class ScheduledAddToday {

	@Inject
	private ForecastService forecastService;

	@Inject
	private TemperatureService temperatureService;

	public void addTemperatureToday(String regId, String areano) throws Exception {

		TemperatureDTO temperatureDTO = new TemperatureDTO();
		URLMain urlMain = new URLMain();
		URLReadTemperature readTemperature = new URLReadTemperature();

		String[] result = readTemperature.url_read(urlMain.setTodayTemperatureURL(regId, areano));
		temperatureDTO.setM_t_id(URLConf.tmFc + regId);
		temperatureDTO.setM_t_time(URLConf.tmFc);
		temperatureDTO.setM_t_tamin3(result[0]);
		temperatureDTO.setM_t_tamax3(result[1]);
		temperatureDTO.setM_t_tamin4(result[2]);
		temperatureDTO.setM_t_tamax4(result[3]);
		temperatureDTO.setM_t_tamin5(result[4]);
		temperatureDTO.setM_t_tamax5(result[5]);
		temperatureDTO.setM_t_tamin6(result[6]);
		temperatureDTO.setM_t_tamax6(result[7]);
		temperatureDTO.setM_t_tamin7(result[8]);
		temperatureDTO.setM_t_tamax7(result[9]);
		temperatureDTO.setM_t_tamin8(result[10]);
		temperatureDTO.setM_t_tamax8(result[11]);
		temperatureDTO.setM_t_tamin9(result[12]);
		temperatureDTO.setM_t_tamax9(result[13]);
		temperatureDTO.setM_t_tamin10(result[14]);
		temperatureDTO.setM_t_tamax10(result[15]);
		temperatureDTO.setA_areano(areano);
		temperatureService.add(temperatureDTO);
	}

	public void addForecastToday(String stnId, String areano) throws Exception {

		ForecastDTO forecastDTO = new ForecastDTO();
		URLMain urlMain = new URLMain();
		URLReadForecast readForecast = new URLReadForecast();

		forecastDTO.setM_f_forecast(readForecast.url_read(urlMain.setTodayForecastURL(stnId, areano)));
		forecastDTO.setA_areano(areano);
		forecastDTO.setM_f_id(URLConf.tmFc + stnId);
		forecastDTO.setM_f_time(URLConf.tmFc);
		forecastService.add(forecastDTO);
	}
	
	@Scheduled(cron = "0 5 6,18 * * *")
	public void test() throws Exception {
		addForecastToday("109", "1100000000");
		addForecastToday("105", "4200000000");
		addForecastToday("133", "3000000000");
		addForecastToday("131", "4300000000");
		addForecastToday("184", "5000000000");
		addForecastToday("156", "2900000000");
		addForecastToday("146", "4500000000");
		addForecastToday("159", "2600000000");
		addForecastToday("143", "2700000000");
		
		addTemperatureToday("11B10101", "1100000000");
		addTemperatureToday("11B20201", "2800000000");
		addTemperatureToday("11B20601", "4100000000");
		addTemperatureToday("11B20305", "4100000000");
		addTemperatureToday("11D10301", "4200000000");
		addTemperatureToday("11D10401", "4200000000");
		addTemperatureToday("11D20501", "4200000000");
		addTemperatureToday("11C20401", "3000000000");
		addTemperatureToday("11C20101", "4400000000");
		addTemperatureToday("11C20404", "3600000000");
		addTemperatureToday("11C10301", "4300000000");
		addTemperatureToday("11G00201", "5000000000");
		addTemperatureToday("11G00401", "5000000000");
		addTemperatureToday("11F20501", "2900000000");
		addTemperatureToday("21F20801", "4600000000");
		addTemperatureToday("11F20401", "4600000000");
		addTemperatureToday("11F10201", "4500000000");
		addTemperatureToday("21F10501", "4500000000");
		addTemperatureToday("11H20201", "2600000000");
		addTemperatureToday("11H20101", "3100000000");
		addTemperatureToday("11H20301", "4800000000");
		addTemperatureToday("11H10701", "2700000000");
		addTemperatureToday("11H10501", "4700000000");
		addTemperatureToday("11H10201", "4700000000");
		System.out.println(URLConf.tmFc+" 중기 예보 데이터 저장 완료");
	}
}
