package com.javatong.fcsttong.domain;

public class GribDTO {
	int code; // 코드넘버
	String thunder; //번개확률
	String windir; // 풍향
	String wind; //풍속
	String state; //날씨상태
	String humidity; //습도
	String ptype; // 강수량
	String temp; //기온
	String thunder1; //1시간 후 번개확률
	String windir1; // 1시간 후 풍향
	String wind1; //1시간 후 풍속
	String humidity1;// 1시간 후 습도
	String state1; //1시간 후 날씨상태
	String ptype1; //1시간 후 강수량
	String temp1; // 1시간 후 기온
	String ftime1; // 1시간 후 발표시간
	String fdate1; // 1시간 후 발표 날짜
	String thunder2; // 2시간 후 번개확률
	String windir2; // 2시간 후 풍향
	String wind2; // 2시간 후 풍속
	String humidity2; // 2시간 후 습도
	String state2; // 2시간 후 날씨상태
	String ptype2; // 2시간 후 강수량
	String temp2; // 2시간 후 기온
	String ftime2; // 2시간 후 발표시간
	String fdate2; // 2시간 후 발표날짜
	String thunder3; // 3시간 후 번개 확률
	String windir3; // 3시간 후 풍향
	String wind3; // 3시간 후 풍속
	String humidity3; // 3시간 후 습도
	String state3; // 3시간 후 날씨 상태
	String ptype3; // 3시간 후 강수량
	String temp3; // 3시간 후 기온
	String ftime3; // 3시간 후 발표시간
	String fdate3; // 3시간 후 발표 날짜
	int nx; // x 좌표 
	int ny; // y 좌표
	int secpw; // 비밀 번호 
	long secondpw;// 2번째 비밀번호
	long IP; // ip 주소
	long password; // 암호변경된 비밀번호
	long ipadress; // 암호변경된 ip 주소
	String id; // 아이디
	long prototype; // 복호화된 암호
	long password2; // 암호 변경된 2번째 비밀번호
	String place; //  본인이 직접 지정한 장소
	String place2; // 새로 지정한 장소
	String first; // 시, 도 주소
	String second; // 군, 구 주소
	String third; // 동, 리, 나머지 주소
	String gdate; // 기본 발표날짜
	String gtime; // 기본 발표시간 
	public String getThunder2() {
		return thunder2;
	}

	public void setThunder2(String thunder2) {
		this.thunder2 = thunder2;
	}

	public String getWindir2() {
		return windir2;
	}

	public void setWindir2(String windir2) {
		this.windir2 = windir2;
	}

	public String getWind2() {
		return wind2;
	}

	public void setWind2(String wind2) {
		this.wind2 = wind2;
	}

	public String getHumidity2() {
		return humidity2;
	}

	public void setHumidity2(String humidity2) {
		this.humidity2 = humidity2;
	}

	public String getState2() {
		return state2;
	}

	public void setState2(String state2) {
		this.state2 = state2;
	}

	public String getPtype2() {
		return ptype2;
	}

	public void setPtype2(String ptype2) {
		this.ptype2 = ptype2;
	}

	public String getTemp2() {
		return temp2;
	}

	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	public String getFtime2() {
		return ftime2;
	}

	public void setFtime2(String ftime2) {
		this.ftime2 = ftime2;
	}

	public String getFdate2() {
		return fdate2;
	}

	public void setFdate2(String fdate2) {
		this.fdate2 = fdate2;
	}

	public String getThunder3() {
		return thunder3;
	}

	public void setThunder3(String thunder3) {
		this.thunder3 = thunder3;
	}

	public String getWindir3() {
		return windir3;
	}

	public void setWindir3(String windir3) {
		this.windir3 = windir3;
	}

	public String getWind3() {
		return wind3;
	}

	public void setWind3(String wind3) {
		this.wind3 = wind3;
	}

	public String getHumidity3() {
		return humidity3;
	}

	public void setHumidity3(String humidity3) {
		this.humidity3 = humidity3;
	}

	public String getState3() {
		return state3;
	}

	public void setState3(String state3) {
		this.state3 = state3;
	}

	public String getPtype3() {
		return ptype3;
	}

	public void setPtype3(String ptype3) {
		this.ptype3 = ptype3;
	}

	public String getTemp3() {
		return temp3;
	}

	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}

	public String getFtime3() {
		return ftime3;
	}

	public void setFtime3(String ftime3) {
		this.ftime3 = ftime3;
	}

	public String getFdate3() {
		return fdate3;
	}

	public void setFdate3(String fdate3) {
		this.fdate3 = fdate3;
	}

	

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public String getGtime() {
		return gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getSecond() {
		return second;
	}

	public void setSecond(String second) {
		this.second = second;
	}

	public String getThird() {
		return third;
	}

	public void setThird(String third) {
		this.third = third;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getThunder() {
		return thunder;
	}

	public void setThunder(String thunder) {
		this.thunder = thunder;
	}

	public String getWindir() {
		return windir;
	}

	public void setWindir(String windir) {
		this.windir = windir;
	}

	public String getWind() {
		return wind;
	}

	public void setWind(String wind) {
		this.wind = wind;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getHumidity() {
		return humidity;
	}

	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getThunder1() {
		return thunder1;
	}

	public void setThunder1(String thunder1) {
		this.thunder1 = thunder1;
	}

	public String getWindir1() {
		return windir1;
	}

	public void setWindir1(String windir1) {
		this.windir1 = windir1;
	}

	public String getWind1() {
		return wind1;
	}

	public void setWind1(String wind1) {
		this.wind1 = wind1;
	}

	public String getHumidity1() {
		return humidity1;
	}

	public void setHumidity1(String humidity1) {
		this.humidity1 = humidity1;
	}

	public String getState1() {
		return state1;
	}

	public void setState1(String state1) {
		this.state1 = state1;
	}

	public String getPtype1() {
		return ptype1;
	}

	public void setPtype1(String ptype1) {
		this.ptype1 = ptype1;
	}

	public String getTemp1() {
		return temp1;
	}

	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}

	public String getFtime1() {
		return ftime1;
	}

	public void setFtime1(String ftime1) {
		this.ftime1 = ftime1;
	}

	public String getFdate1() {
		return fdate1;
	}

	public void setFdate1(String fdate1) {
		this.fdate1 = fdate1;
	}

	public int getNx() {
		return nx;
	}

	public void setNx(int nx) {
		this.nx = nx;
	}

	public int getNy() {
		return ny;
	}

	public void setNy(int ny) {
		this.ny = ny;
	}

	public int getSecpw() {
		return secpw;
	}

	public void setSecpw(int secpw) {
		this.secpw = secpw;
	}

	public long getSecondpw() {
		return secondpw;
	}

	public void setSecondpw(long secondpw) {
		this.secondpw = secondpw;
	}

	public long getIP() {
		return IP;
	}

	public void setIP(long iP) {
		IP = iP;
	}

	public long getPassword() {
		return password;
	}

	public void setPassword(long password) {
		this.password = password;
	}

	public long getIpadress() {
		return ipadress;
	}

	public void setIpadress(long ipadress) {
		this.ipadress = ipadress;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getPrototype() {
		return prototype;
	}

	public void setPrototype(long prototype) {
		this.prototype = prototype;
	}

	public long getPassword2() {
		return password2;
	}

	public void setPassword2(long password2) {
		this.password2 = password2;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPlace2() {
		return place2;
	}

	public void setPlace2(String place2) {
		this.place2 = place2;
	}

	@Override
	public String toString() {
		return "DeptDTO [code=" + code + ", thunder=" + thunder + ", windir=" + windir + ", wind=" + wind + ", state="
				+ state + ", humidity=" + humidity + ", ptype=" + ptype + ", temp=" + temp + ", thunder1=" + thunder1
				+ ", windir1=" + windir1 + ", wind1=" + wind1 + ", humidity1=" + humidity1 + ", state1=" + state1
				+ ", ptype1=" + ptype1 + ", temp1=" + temp1 + ", ftime1=" + ftime1 + ", fdate1=" + fdate1
				+ ", thunder2=" + thunder2 + ", windir2=" + windir2 + ", wind2=" + wind2 + ", humidity2=" + humidity2
				+ ", state2=" + state2 + ", ptype2=" + ptype2 + ", temp2=" + temp2 + ", ftime2=" + ftime2 + ", fdate2="
				+ fdate2 + ", thunder3=" + thunder3 + ", windir3=" + windir3 + ", wind3=" + wind3 + ", humidity3="
				+ humidity3 + ", state3=" + state3 + ", ptype3=" + ptype3 + ", temp3=" + temp3 + ", ftime3=" + ftime3
				+ ", fdate3=" + fdate3 + ", nx=" + nx + ", ny=" + ny + ", secpw=" + secpw + ", secondpw=" + secondpw
				+ ", IP=" + IP + ", password=" + password + ", ipadress=" + ipadress + ", id=" + id + ", prototype="
				+ prototype + ", password2=" + password2 + ", place=" + place + ", place2=" + place2 + ", first="
				+ first + ", second=" + second + ", third=" + third + ", gdate=" + gdate + ", gtime=" + gtime + "]";
	}
}
