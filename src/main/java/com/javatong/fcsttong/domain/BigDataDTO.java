package com.javatong.fcsttong.domain;

import java.util.Arrays;

public class BigDataDTO {
	private double[] avg_temp;
	private double[] max_temp;
	private double[] min_temp;
	private double[] avg_wind;
	private int[] most_winddir;
	private double[] daily_rain;
	private double[] most_snow;
	private int[] avg_humid;
	private double[] sum_ilsa;
	private double[] sum_iljo;
	public double[] getAvg_temp() {
		return avg_temp;
	}
	public void setAvg_temp(double[] avg_temp) {
		this.avg_temp = avg_temp;
	}
	public double[] getMax_temp() {
		return max_temp;
	}
	public void setMax_temp(double[] max_temp) {
		this.max_temp = max_temp;
	}
	public double[] getMin_temp() {
		return min_temp;
	}
	public void setMin_temp(double[] min_temp) {
		this.min_temp = min_temp;
	}
	public double[] getAvg_wind() {
		return avg_wind;
	}
	public void setAvg_wind(double[] avg_wind) {
		this.avg_wind = avg_wind;
	}
	public int[] getMost_winddir() {
		return most_winddir;
	}
	public void setMost_winddir(int[] most_winddir) {
		this.most_winddir = most_winddir;
	}
	public double[] getDaily_rain() {
		return daily_rain;
	}
	public void setDaily_rain(double[] daily_rain) {
		this.daily_rain = daily_rain;
	}
	public double[] getMost_snow() {
		return most_snow;
	}
	public void setMost_snow(double[] most_snow) {
		this.most_snow = most_snow;
	}
	public int[] getAvg_humid() {
		return avg_humid;
	}
	public void setAvg_humid(int[] avg_humid) {
		this.avg_humid = avg_humid;
	}
	public double[] getSum_ilsa() {
		return sum_ilsa;
	}
	public void setSum_ilsa(double[] sum_ilsa) {
		this.sum_ilsa = sum_ilsa;
	}
	public double[] getSum_iljo() {
		return sum_iljo;
	}
	public void setSum_iljo(double[] sum_iljo) {
		this.sum_iljo = sum_iljo;
	}	
	// data가 바뀔 때마다 임시로 변경하여 변수를 검증해야 함
	@Override
	public String toString() {
		return "BigDataDTO [avg_humid=" + Arrays.toString(avg_humid) + ", sum_ilsa=" + Arrays.toString(sum_ilsa)
				+ ", sum_iljo=" + Arrays.toString(sum_iljo) + "]";
	}
}