package com.javatong.fcsttong.persistence;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Repository;

import com.javatong.fcsttong.domain.BigDataDTO;

@Repository
public class BigDataDAOImpl implements BigDataDAO {

	private static String prefix = "D:/ForecastTong/mt_obsr/";
	private static String suffix = ".csv\",encoding = 'UTF-8',stringsAsFactors=F)";

	@Override
	public String[] make_trendprod() {

		String product_listStr[] = null;

		try {
			REXP product_list = null;
			String url = "'http://openapi.11st.co.kr/openapi/OpenApiService.tmall?key=134c6987f737e4c20d47d6cd60f11e55&apiCode=ProductSearch&keyword=1800707140'";
			RConnection rc = new RConnection();
			rc.voidEval("Sys.setenv(JAVA_HOME=\"c:/Program Files/Java/jdk1.8.0_121/jre\")");
			rc.voidEval("library(XML)");
			rc.voidEval("doc <- xmlParse(" + url + ", encoding='euc-kr', options= NOCDATA)");
			rc.voidEval("prod_name <-xpathSApply(doc, '//ProductName', xmlValue, encoding='UTF-8')");
			rc.voidEval("prod_price <-xpathSApply(doc, '//ProductPrice', xmlValue, encoding='UTF-8')");
			rc.voidEval("prod_image <-xpathSApply(doc, '//ProductImage300', xmlValue, encoding='UTF-8')");
			rc.voidEval("product_list <- cbind(prod_name,prod_price,prod_image)");
			product_list = rc.eval("product_list");
			product_listStr = product_list.asStrings();
			System.out.println(product_listStr);

			System.out.println("---------------------------------- 상품정보 리스트 생성 완료");
			rc.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return product_listStr;
	}

	@Override
	public BigDataDTO get_TemperData() throws Exception {

		BigDataDTO bigDataDTO = new BigDataDTO();

		try {
			RConnection rc = new RConnection();

			rc.voidEval("Sys.setenv(JAVA_HOME=\"c:/Program Files/Java/jdk1.8.0_121/jre\")");
			rc.eval("library(\"data.table\")");
			rc.eval("temperData<- fread(\"" + prefix + "temperature" + suffix);
			for (int i = 0; i <= 6; i++) {
				rc.eval("avg_temp201" + i + " <- round(mean(temperData$avg_temp201" + i + ", na.rm=TRUE),1)");
				rc.eval("max_temp201" + i + " <- round(max(temperData$max_temp201" + i + ", na.rm=TRUE),1)");
				rc.eval("min_temp201" + i + " <- round(min(temperData$min_temp201" + i + ", na.rm=TRUE),1)");
			}
			rc.eval("avg_temp <- cbind(avg_temp2010, avg_temp2011, avg_temp2012, avg_temp2013, avg_temp2014, avg_temp2015, avg_temp2016)");
			rc.eval("max_temp <- cbind(max_temp2010, max_temp2011, max_temp2012, max_temp2013, max_temp2014, max_temp2015, max_temp2016)");
			rc.eval("min_temp <- cbind(min_temp2010, min_temp2011, min_temp2012, min_temp2013, min_temp2014, min_temp2015, min_temp2016)");
			REXP avg_temp = rc.eval("avg_temp");
			REXP max_temp = rc.eval("max_temp");
			REXP min_temp = rc.eval("min_temp");

			bigDataDTO.setAvg_temp(avg_temp.asDoubles());
			bigDataDTO.setMax_temp(max_temp.asDoubles());
			bigDataDTO.setMin_temp(min_temp.asDoubles());

			System.out.println("---------------------------------- 온도 DATA 가져오기 완료");
			System.out.println(bigDataDTO.toString());
			rc.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return bigDataDTO;
	}

	@Override
	public BigDataDTO get_RSData() throws Exception {

		BigDataDTO bigDataDTO = new BigDataDTO();

		try {
			RConnection rc = new RConnection();

			rc.voidEval("Sys.setenv(JAVA_HOME=\"c:/Program Files/Java/jdk1.8.0_121/jre\")");
			rc.eval("library(\"data.table\")");
			rc.eval("RSData<- fread(\"" + prefix + "rainsnow" + suffix);
			for (int i = 0; i <= 6; i++) {
				rc.eval("daily_rain201" + i + " <- round(mean(RSData$daily_rain201" + i + ", na.rm=TRUE),1)");
				rc.eval("most_snow201" + i + " <- round(max(RSData$most_snow201" + i + ", na.rm=TRUE),1)");
			}
			rc.eval("daily_rain <- cbind(daily_rain2010, daily_rain2011, daily_rain2012, daily_rain2013, daily_rain2014, daily_rain2015, daily_rain2016)");
			rc.eval("most_snow <- cbind(most_snow2010, most_snow2011, most_snow2012, most_snow2013, most_snow2014, most_snow2015, most_snow2016)");

			REXP daily_rain = rc.eval("daily_rain");
			REXP most_snow = rc.eval("most_snow");

			bigDataDTO.setDaily_rain(daily_rain.asDoubles());
			bigDataDTO.setMost_snow(most_snow.asDoubles());

			System.out.println("---------------------------------- 강수량 DATA 가져오기 완료");
			System.out.println(bigDataDTO.toString());
			rc.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return bigDataDTO;
	}

	@Override
	public BigDataDTO get_WindData() throws Exception {

		BigDataDTO bigDataDTO = new BigDataDTO();

		try {
			RConnection rc = new RConnection();

			rc.voidEval("Sys.setenv(JAVA_HOME=\"c:/Program Files/Java/jdk1.8.0_121/jre\")");
			rc.eval("library(\"data.table\")");
			rc.eval("WindData<- fread(\"" + prefix + "wind" + suffix);
			for (int i = 0; i <= 6; i++) {
				rc.eval("avg_wind201" + i + " <- round(mean(WindData$avg_wind201" + i + ", na.rm=TRUE),1)");
				rc.voidEval("ux <- unique(WindData$most_winddir201"+ i+")");
				rc.voidEval("most_winddir201"+i+"<- ux[which.max(tabulate(match(WindData$most_winddir201"+i+", ux)))]");
			}
			rc.eval("avg_wind <- cbind(avg_wind2010, avg_wind2011, avg_wind2012, avg_wind2013, avg_wind2014, avg_wind2015, avg_wind2016)");
			rc.eval("most_winddir <- cbind(most_winddir2010, most_winddir2011, most_winddir2012, most_winddir2013, most_winddir2014, most_winddir2015, most_winddir2016)");

			REXP avg_wind = rc.eval("avg_wind");
			REXP most_winddir = rc.eval("most_winddir");

			bigDataDTO.setAvg_wind(avg_wind.asDoubles());
			bigDataDTO.setMost_winddir(most_winddir.asIntegers());

			System.out.println("----------------------------------  DATA 가져오기 완료");
			System.out.println(bigDataDTO.toString());
			rc.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return bigDataDTO;
	}

	@Override
	public BigDataDTO get_HIData() throws Exception {
		BigDataDTO bigDataDTO = new BigDataDTO();

		try {
			RConnection rc = new RConnection();

			rc.voidEval("Sys.setenv(JAVA_HOME=\"c:/Program Files/Java/jdk1.8.0_121/jre\")");
			rc.eval("library(\"data.table\")");
			rc.eval("HIData<- fread(\"" + prefix + "humidsolar" + suffix);
			for (int i = 0; i <= 6; i++) {
				rc.eval("avg_humid201" + i + " <- round(mean(HIData$avg_humid201" + i + ", na.rm=TRUE),1)");
				rc.eval("sum_ilsa201" + i + " <- round(sum(HIData$sum_ilsa201" + i + ", na.rm=TRUE),1)");
				rc.eval("sum_iljo201" + i + " <- round(sum(HIData$sum_iljo201" + i + ", na.rm=TRUE),1)");
			} 
			rc.eval("avg_humid <- cbind(avg_humid2010, avg_humid2011, avg_humid2012, avg_humid2013, avg_humid2014, avg_humid2015, avg_humid2016)");
			rc.eval("sum_ilsa <- cbind(sum_ilsa2010, sum_ilsa2011, sum_ilsa2012, sum_ilsa2013, sum_ilsa2014, sum_ilsa2015, sum_ilsa2016)");
			rc.eval("sum_iljo <- cbind(sum_iljo2010, sum_iljo2011, sum_iljo2012, sum_iljo2013, sum_iljo2014, sum_iljo2015, sum_iljo2016)");
			
			REXP avg_humid = rc.eval("avg_humid");
			REXP sum_ilsa = rc.eval("sum_ilsa");
			REXP sum_iljo = rc.eval("sum_iljo");

			bigDataDTO.setAvg_humid(avg_humid.asIntegers());
			bigDataDTO.setSum_ilsa(sum_ilsa.asDoubles());
			bigDataDTO.setSum_iljo(sum_iljo.asDoubles());

			System.out.println("---------------------------------- 습도, 일사 DATA 가져오기 완료");
			System.out.println(bigDataDTO.toString());
			rc.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return bigDataDTO;
	}
}
