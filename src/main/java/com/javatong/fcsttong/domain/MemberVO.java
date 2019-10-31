package com.javatong.fcsttong.domain;

public class MemberVO {
	
	private int U_ID;
	private String U_EMAIL;	
	private String U_PWD;	
	private String U_NAME;	
	private String U_GENDER;	
	private String U_BIRTH;	
	private String U_PHONENUM;	
	private String U_PERMISSION;	
	private String U_PICTURE;	
	public int getU_ID() {
		return U_ID;
	}
	public void setU_ID(int u_ID) {
		U_ID = u_ID;
	}
	public String getU_EMAIL() {
		return U_EMAIL;
	}
	public void setU_EMAIL(String u_EMAIL) {
		U_EMAIL = u_EMAIL;
	}
	public String getU_PWD() {
		return U_PWD;
	}
	public void setU_PWD(String u_PWD) {
		U_PWD = u_PWD;
	}
	public String getU_NAME() {
		return U_NAME;
	}
	public void setU_NAME(String u_NAME) {
		U_NAME = u_NAME;
	}
	public String getU_GENDER() {
		return U_GENDER;
	}
	public void setU_GENDER(String u_GENDER) {
		U_GENDER = u_GENDER;
	}
	public String getU_BIRTH() {
		return U_BIRTH;
	}
	public void setU_BIRTH(String u_BIRTH) {
		U_BIRTH = u_BIRTH;
	}
	public String getU_PHONENUM() {
		return U_PHONENUM;
	}
	public void setU_PHONENUM(String u_PHONENUM) {
		U_PHONENUM = u_PHONENUM;
	}
	public String getU_PERMISSION() {
		return U_PERMISSION;
	}
	public void setU_PERMISSION(String u_PERMISSION) {
		U_PERMISSION = u_PERMISSION;
	}
	public String getU_PICTURE() {
		return U_PICTURE;
	}
	public void setU_PICTURE(String u_PICTURE) {
		U_PICTURE = u_PICTURE;
	}
	@Override
	public String toString() {
		return "MemberDTO [U_ID=" + U_ID + ", U_EMAIL=" + U_EMAIL + ", U_PWD=" + U_PWD + ", U_NAME=" + U_NAME
				+ ", U_GENDER=" + U_GENDER + ", U_BIRTH=" + U_BIRTH + ", U_PHONENUM=" + U_PHONENUM + ", U_PERMISSION="
				+ U_PERMISSION + ", U_PICTURE=" + U_PICTURE + "]";
	}
	
}
