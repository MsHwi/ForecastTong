<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	SimpleDateFormat fm = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat fmh = new SimpleDateFormat("HH");
	SimpleDateFormat fmd = new SimpleDateFormat("MM/dd");
	Date date = new Date();
	String d = fm.format(date);
	String time = "";

	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DATE, +3);
	String after3day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after4day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after5day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after6day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after7day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after8day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after9day = fmd.format(calendar.getTime());
	calendar.add(Calendar.DATE, +1);
	String after10day = fmd.format(calendar.getTime());

	if (Integer.parseInt(fmh.format(date)) < 18) {
		time = "오전 06시";
	} else {
		time = "오후 18시";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 날씨 정보</title>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
</head>
<body>
<label>기상 전망</label>
<div id="time_fcst" style="float:right;margin-bottom:10px;">
		<span style="background-color:#acaca2;color:white;border-radius:2px;">예보발표시각</span>
		<%=d%> <%=time%> 발표
</div>
<br/>
<div style="border:2px solid #6fa8df;padding:4px 8px 8px 8px;">
&nbsp;<c:out value="${ForecastDTO.m_f_forecast}"></c:out>
</div>
<hr/>
<label>최저/최저기온</label>
	<table class="table table-bordered" style="text-align:center;">
	<tr>
		<th style="background-color:#f4f7ff;text-align:center">날짜</th><td><b><%=after3day%></b></td><td><b><%=after4day%></b></td><td><b><%=after5day%></b></td><td><b><%=after6day%></b></td>
		<td><b><%=after7day%></b></td><td><b><%=after8day%></b></td><td><b><%=after9day%></b></td><td><b><%=after10day%></b></td>	
	</tr>
	<tr>
		<th style="background-color:#f4f7ff;text-align:center">최저기온</th>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin3}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin4}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin5}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin6}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin7}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin8}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin9}"></c:out>℃</b></td>
		<td style="color:#f68c1a;"><b><c:out value="${TemperatureDTO.m_t_tamin10}"></c:out>℃</b></td>
	</tr>
	<tr>
		<th style="background-color:#f4f7ff;text-align:center">최고기온</th>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax3}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax4}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax5}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax6}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax7}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax8}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax9}"></c:out>℃</b></td>
		<td style="color:#0a79cb;"><b><c:out value="${TemperatureDTO.m_t_tamax10}"></c:out>℃</b></td>
	</tr>
	</table>
</body>
</html>