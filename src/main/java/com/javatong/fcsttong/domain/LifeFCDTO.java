package com.javatong.fcsttong.domain;

public class LifeFCDTO {
//	   --> 멤버변수 선언. 컬럼과 일치
//	   --> 접근제한자를 사용해서 외부 수정을 불가하게 만든다.
//	   --> 멤버변수 활용을 선택한다. ==> 예> 수정(데이터저장_get())과 호출 (데이터호출:toString)
	
//	String in_area_no; // 지점코드
//	String in_date;     // 발표시간
	
	//생활지수정보변수선언
//	String in_area_no; // 지점코드
//	String in_date;     // 발표시간
	
	//생활지수정보변수선언
	private String area_nm; // 지점명
	private String jisu_nm; // 지수명

	private String id; // 지수코드
	private String code; // 지수코드
	private String area_no; //지점코드
	private String noti_time; // 발표시간
	
//	private String stageName; // 지수범위에 대한 <단계>정보
	
	// 생활기상정보 <등록>처리시 사용
	private int today_fcst; //(오늘예측코드값)

	private int tomrw_fcst;// (내일예측코드값)
	private int aft_tomrw_fcst;// (모레예측코드값)
	 
	//조회
	private String today_fcstStage; //(오늘예측코드값)에 대한 <단계 :식중독 : 위험/경고/주의/관심, 자외선 : 낮음/보통/.../위험>정보
	private String tomrw_fcstStage;// (내일예측코드값)
	private String aft_tomrw_fcstStage;// (모레예측코드값)	
	
	// 최종 발표시간, 최종 생성건수
	private String last_noti_time;
	private int nRowCnt;
	
	private String sel_group_nm; // 지점값보기 조회시 사용 : 조회 그룹구분값
	private String img_dir_nm; // 이미지 디렉토리 주소
	private String fcst_lvl; // 예측값의 level
	
	/*public LifeFCDTO() {
		// TODO Auto-generated constructor stub
	}*/

	public String getArea_nm() {
		return area_nm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setArea_nm(String area_nm) {
		this.area_nm = area_nm;
	}

	public String getJisu_nm() {
		return jisu_nm;
	}

	public void setJisu_nm(String jisu_nm) {
		this.jisu_nm = jisu_nm;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getArea_no() {
		return area_no;
	}

	public void setArea_no(String area_no) {
		this.area_no = area_no;
	}

	public String getNoti_time() {
		return noti_time;
	}

	public void setNoti_time(String noti_time) {
		this.noti_time = noti_time;
	}

	public int getToday_fcst() {
		return today_fcst;
	}

	public void setToday_fcst(int today_fcst) {
		this.today_fcst = today_fcst;
	}

	public int getTomrw_fcst() {
		return tomrw_fcst;
	}

	public void setTomrw_fcst(int tomrw_fcst) {
		this.tomrw_fcst = tomrw_fcst;
	}

	public int getAft_tomrw_fcst() {
		return aft_tomrw_fcst;
	}

	public void setAft_tomrw_fcst(int aft_tomrw_fcst) {
		this.aft_tomrw_fcst = aft_tomrw_fcst;
	}

	public String getToday_fcstStage() {
		return today_fcstStage;
	}

	public void setToday_fcstStage(String today_fcstStage) {
		this.today_fcstStage = today_fcstStage;
	}

	public String getTomrw_fcstStage() {
		return tomrw_fcstStage;
	}

	public void setTomrw_fcstStage(String tomrw_fcstStage) {
		this.tomrw_fcstStage = tomrw_fcstStage;
	}

	public String getAft_tomrw_fcstStage() {
		return aft_tomrw_fcstStage;
	}

	public void setAft_tomrw_fcstStage(String aft_tomrw_fcstStage) {
		this.aft_tomrw_fcstStage = aft_tomrw_fcstStage;
	}

	public String getLast_noti_time() {
		return last_noti_time;
	}

	public void setLast_noti_time(String last_noti_time) {
		this.last_noti_time = last_noti_time;
	}

	public int getnRowCnt() {
		return nRowCnt;
	}

	public void setnRowCnt(int nRowCnt) {
		this.nRowCnt = nRowCnt;
	}

	public String getSel_group_nm() {
		return sel_group_nm;
	}

	public void setSel_group_nm(String sel_group_nm) {
		this.sel_group_nm = sel_group_nm;
	}

	public String getImg_dir_nm() {
		return img_dir_nm;
	}

	public void setImg_dir_nm(String img_dir_nm) {
		this.img_dir_nm = img_dir_nm;
	}

	public String getFcst_lvl() {
		return fcst_lvl;
	}

	public void setFcst_lvl(String fcst_lvl) {
		this.fcst_lvl = fcst_lvl;
	}

	@Override
	public String toString() {
		return "LifeFCDTO [area_nm=" + area_nm + ", jisu_nm=" + jisu_nm + ", id=" + id + ", code=" + code + ", area_no="
				+ area_no + ", noti_time=" + noti_time + ", today_fcst=" + today_fcst + ", tomrw_fcst=" + tomrw_fcst
				+ ", aft_tomrw_fcst=" + aft_tomrw_fcst + ", today_fcstStage=" + today_fcstStage + ", tomrw_fcstStage="
				+ tomrw_fcstStage + ", aft_tomrw_fcstStage=" + aft_tomrw_fcstStage + ", last_noti_time="
				+ last_noti_time + ", nRowCnt=" + nRowCnt + ", sel_group_nm=" + sel_group_nm + ", img_dir_nm="
				+ img_dir_nm + ", fcst_lvl=" + fcst_lvl + "]";
	}


 
}
