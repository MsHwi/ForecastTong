<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!-- 디폴트 지역코드 선언 -->
<%!String v_areano ="1100000088"; %>
<%!String v_loginid="hee1"; %>
<%   
    v_loginid = (String) session.getAttribute("loginid");
    v_areano = (String) session.getAttribute("areano");
	
	System.out.println(" index.jsp 에서  설정한 값 - v_loginid : " + v_loginid);
	System.out.println("index.jsp 에서  설정한 값 - v_areano : " + v_areano);
%>
<%-- <c:set var="v_loginid"  value = "${session.getAttribute('loginid')}"  /> --%>
<%-- <c:out value="${lifejisuinfo.aft_tomrw_fcstStage}" /> --%>
<style type="text/css">
#anno_time {
	font-size: 12px;
}


#tempcss {
	background-color:#acaca2;
	color:white;
	border-radius:2px;
	font-size: 12px;
	font-weight: bold;
}

th, td {
	text-align: center;
	padding: 2px 2px 2px 2px; 
	border: 1px solid #f4f4f4;
	font-size:12px;
}

th {
	white-space: nowrap;
	background-color: #f4f4f4;
}

#localjisuview_table {
    background-color: transparent;
    border-top: 2px solid #0958a5;
    width:100%;
}

img {
    size: 40%;
}

</style>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<br/>
<!-- <div id="container"  style="float: left; width: 100%;height: 70%;"> -->
  
 <c:set var="loopCnt" value="0" />
<%-- <%=request.getSession().getAttribute("tabno" )   %> --%>
<c:forEach var="jisuinfo" items="${lifeFCList}" varStatus="status">

	<c:if test="${ loopCnt==0 }" >
 
<%-- 	getAttribute<%= --%>
<!-- // // 	   String anno_time_val1 =  session.get"temp")   ; -->
<!-- // //  request.getSession().getAttribute("temp")  ; -->
<!-- //  String param = request.getParameter("temp"); -->
  
<%-- 	anno_time_val1 : <%= anno_time_val1%><br/> --%>
	<c:set var="anno_time_val" value="${jisuinfo.noti_time}" />
	<c:set var="area_nm_val" value="${jisuinfo.area_nm}" />
	<c:set var="area_no_val" value="${jisuinfo.area_no}" />
	</c:if>
<%-- 	${jisuinfo.area_nm} <c:out value="${jisuinfo.area_nm}"/> --%>
<%-- 	loopCnt ${ loopCnt  } --%>
	 <c:set var="loopCnt" value="${loopCnt+1}" />
</c:forEach>
 
<%-- 검색 지역 : <span id="SearchlocName">${jisuinfo.area_nm} (${jisuinfo.area_no}) --%>
<%--    <%=search_areanm %> --%>
<!--    </span>   -->
 <div id="todayDiv">
<!-- span id="viewTime" 값셋팅은 ajax<utryjisu_view.jsp>에서 불러오는 js  2016년 11월 1일 (화) | 18:00 -->
<div align="right">
<span><font id="tempcss" >예보발표시각</font>&nbsp;<font id="anno_time">${anno_time_val}</font></span>
 </div>
 </div>
 <br/>
 <script type="text/javascript">

var annotime =  $("#anno_time").text();//new Date();
//alert("annotime : " +annotime);
var yyyy = annotime.substring(0,4); //년
var mm = annotime.substring(4,6); //월
var dd = annotime.substring(6,8); //일
var hh = annotime.substring(8,10); //시
// The parameters are year, month, day, hours, minutes, seconds.
var filetime = new Date(yyyy, mm-1, dd, hh, 00, 00);
//alert("all_time_title()..." + filetime);
var week = new Array('일','월','화','수','목','금','토');

var anno_time = yyyy+"년 "+mm+"월 "+dd+"일("+week[filetime.getDay()]+") "+hh+":00 발표";
//발표시간 입력
// $("#anno_time").html();
//  alert("anno_time : " + anno_time);
$("#anno_time").text(anno_time);

</script>
<%-- 	검색지역 : <span id="SearchlocName"> ${area_nm_val}    ${area_no_val}   </span> --%>
	<table id="localjisuview_table"> 
<!-- 	<thead> -->
			<tr >
				<th>날짜</th>
<!-- 				<th>발생일시</th> -->
<!-- 				18시 이후에는 당일지수(현황)은 표시되지 않아야 함. -->
				<th colspan="2">당일현황(지수)</th>
				<th colspan="2">내일현황(지수)</th>
				<th colspan="2">모레현황(지수)</th>
<!-- 				<th style="borbor:1px black;   width: 100%; height: 10px;"></th>	 -->
			</tr>
<!-- 		</thead> -->
<!--        <tbody style="width:100%; border-bottom-color: black;"    > -->
<!--         지역별생활지수 결과 -->
		<c:forEach var="jisuinfo" items="${lifeFCList}" varStatus="status">
<!-- 		생활지수 이미지 결과 -->
		<c:forEach var="jisuRsltInfo" items="${lifeFCRsltList}" varStatus="status">
		 
		 <c:if test="${jisuinfo.jisu_nm  == jisuRsltInfo.jisu_nm}"> 
	
			<!-- 		데이터를 반복 출력한다. -->
			<tr  > <!-- 한셀<td>이 아닌 한행<tr>에서 마우스가 클릭되었을때 view.jsp 로 이동하고자 할때 -->
				<th style="color:#0958a5;font-size:14px;"><c:out value="${jisuinfo.jisu_nm}"/></th>
				<td> <c:out value="${jisuinfo.today_fcstStage}" />(<c:out value="${jisuinfo.today_fcst}" />)</td>
				<td>
				 <img src="${jisuRsltInfo.today_img_src}" width="100px" height="70px" />
				</td>
				<td><c:out value="${jisuinfo.tomrw_fcstStage}" />(<c:out value="${jisuinfo.tomrw_fcst}" />)</td>
				<td>
				<img src="${jisuRsltInfo.tomrw_img_src}" width="100px" height="70px"  />

				</td>
				<td><c:out value="${jisuinfo.aft_tomrw_fcstStage}" />(<c:out value="${jisuinfo.aft_tomrw_fcst}" />)</td>
				<td> 
				<img src="${jisuRsltInfo.aft_tomrw_img_src}" width="100px" height="70px"  /> 

				</td>
<!-- 				<td style="borbor:1px black;   width: 100%; height: 10px;"></td>	 -->
			</tr>		
			
			<!--         데이터 출력의 끝    -->

		</c:if>
 
		</c:forEach>

		</c:forEach> 
<!--  	</tbody>  		 -->
	</table>
<%-- 	<input type="text" id="temptime" value="${anno_time_val}"/> --%>