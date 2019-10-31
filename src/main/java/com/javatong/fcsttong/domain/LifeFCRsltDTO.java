package com.javatong.fcsttong.domain;

public class LifeFCRsltDTO {
	//생활지수정보변수선언
	private String jisu_nm; // 오늘 이미지파일
	private String today_img_src; // 오늘 이미지파일
	private String today_stlvl_cd; // 오늘 생활지수 레벨코드
	private String tomrw_img_src; // 오늘 이미지파일
	private String tomrw_stlvl_cd; // 오늘 생활지수 레벨코드
	private String aft_tomrw_img_src; // 오늘 이미지파일
	private String aft_tomrw_stlvl_cd; // 오늘 생활지수 레벨코드	
	
	public String getJisu_nm() {
		return jisu_nm;
	}
	public void setJisu_nm(String jisu_nm) {
		this.jisu_nm = jisu_nm;
	}
	public String getToday_img_src() {
		return today_img_src;
	}
	public void setToday_img_src(String today_img_src) {
		this.today_img_src = today_img_src;
	}
	public String getToday_stlvl_cd() {
		return today_stlvl_cd;
	}
	public void setToday_stlvl_cd(String today_stlvl_cd) {
		this.today_stlvl_cd = today_stlvl_cd;
	}
	public String getTomrw_img_src() {
		return tomrw_img_src;
	}
	public void setTomrw_img_src(String tomrw_img_src) {
		this.tomrw_img_src = tomrw_img_src;
	}
	public String getTomrw_stlvl_cd() {
		return tomrw_stlvl_cd;
	}
	public void setTomrw_stlvl_cd(String tomrw_stlvl_cd) {
		this.tomrw_stlvl_cd = tomrw_stlvl_cd;
	}
	public String getAft_tomrw_img_src() {
		return aft_tomrw_img_src;
	}
	public void setAft_tomrw_img_src(String aft_tomrw_img_src) {
		this.aft_tomrw_img_src = aft_tomrw_img_src;
	}
	public String getAft_tomrw_stlvl_cd() {
		return aft_tomrw_stlvl_cd;
	}
	public void setAft_tomrw_stlvl_cd(String aft_tomrw_stlvl_cd) {
		this.aft_tomrw_stlvl_cd = aft_tomrw_stlvl_cd;
	}
	@Override
	public String toString() {
		return "LifeFCRsltDTO [jisu_nm=" + jisu_nm + ", today_img_src=" + today_img_src + ", today_stlvl_cd="
				+ today_stlvl_cd + ", tomrw_img_src=" + tomrw_img_src + ", tomrw_stlvl_cd=" + tomrw_stlvl_cd
				+ ", aft_tomrw_img_src=" + aft_tomrw_img_src + ", aft_tomrw_stlvl_cd=" + aft_tomrw_stlvl_cd + "]";
	}

 
}
