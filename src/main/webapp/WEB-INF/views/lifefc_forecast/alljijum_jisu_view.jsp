<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국 지점 지수정보조회</title>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<style type="text/css">
 

td {
	font-size:12px;
}

th {
	font-size:13px;
}

 

</style>
<script type="text/javascript">
$(function(){ // jquery는 많은 기능을 함수로 만들어 놓은 것이므로  함수를 사용함을 의미
});
// $(document).one("ready", function() {
$(document).ready(function(){
//$(document).one("ready", function() {
	// alert("onLoad..");
 
});
</script>
</head>
<body>
	<!-- 타이틀 작성 <h2> -->
<c:set var="loopCnt" value="1" />	
<c:forEach var="jisuinfo" items="${lifeFCList}" varStatus="status">
<c:if test="${ loopCnt==1 }" >		
	<h3>${jisuinfo.jisu_nm}지수</h3>
</c:if>	

<c:set var="loopCnt" value="${loopCnt+1}" />
</c:forEach>	
	<!-- 글번호/ 제목 / 작성자/ 작성일 /조회수 -->
	<table border="1" width="100%">
		<thead width="100%" style="background-color: gray; color: white;">
			<tr>
				<th>지점</th>
				<th>지수값</th>
				<th>지점</th>
				<th>지수값</th>
				<th>지점</th>
				<th>지수값</th>								
			</tr>
		</thead>
		<tbody>
		<!-- 		데이터를 반복 출력한다. -->
		<tr  > <!-- 한셀<td>이 아닌 한행<tr>에서 마우스가 클릭되었을때 view.jsp 로 이동하고자 할때 -->
		<c:set var="loopCnt" value="1" />
        	
		<c:forEach var="jisuinfo" items="${lifeFCList}" varStatus="status">
				<th>${jisuinfo.area_nm}</th> <!-- 지점 -->
<!-- 지수값 표시 셀의 배경색-->		
	
<c:choose>
<c:when test="${ jisuinfo.today_fcstStage == '관심' }">
<c:set  var="cell_bg_color" value="background-color:gray;" />
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '주의' }">
<c:set  var="cell_bg_color" value="background-color:olive;" /> 
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '경고' }">
<c:set  var="cell_bg_color" value="background-color:orange;" />
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '낮음' }">
<c:set  var="cell_bg_color" value="background-color:gray;" />
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '보통' }">
<c:set  var="cell_bg_color" value="background-color:olive;" /> 
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '높음' }">
<c:set  var="cell_bg_color" value="background-color:orange;" /> 
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '매우높음' }">
<c:set  var="cell_bg_color" value="background-color:red;" /> 
</c:when>
<c:when test="${ jisuinfo.today_fcstStage == '위험' }">
<c:set  var="cell_bg_color" value="background-color:magenta;" /> 
</c:when>
<c:otherwise> 
<c:set  var="cell_bg_color" value="background-color:yellow;" /> 
</c:otherwise>
</c:choose>	

<%-- <c:out value="${cell_bg_color}"></c:out>	 --%>
<td style="${cell_bg_color}"   align="center"> <!-- 지수값 표시 셀의 배경색-->	
    ${jisuinfo.today_fcstStage}(${jisuinfo.today_fcst}) </td> 	<!-- ㅈ수값 -->
			
			<c:if test="${ loopCnt > 2 && loopCnt%3==0 }" >		
			</tr>	
			<tr>		
			</c:if>
			<c:set var="loopCnt" value="${loopCnt+1}" />		
		</c:forEach>

		</tbody>		 
	</table>
</body>
</html>