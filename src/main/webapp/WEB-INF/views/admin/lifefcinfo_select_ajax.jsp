<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    trimDirectiveWhitespaces="true"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" href="../media/css/jquery.dataTables.min.css" /> -->
<!-- <script src="../media/js/jquery.dataTables.min.js" type="text/javascript"></script>  -->
<!-- JQuery 라이브러리  -->
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>   
<style type="text/css">
td {
	font-size:10px;
}

th {
	font-size:12px;
}

</style> 
 
<%-- <% Integer loopCnt=0; %>   --%>
 <c:set var="loopCnt" value="0" />
 <table border="1" width="100%" class="display" id="example">
  <tr>
    <th> No </th>
    <th> 지점코드</th><th> 지점명</th><th> 지수명</th><th> 발표일시</th><th> 오늘현황</th><th> 내일현황</th><th> 모레현황</th>
  </tr>
 <c:forEach var="lifejisuinfo" items="${lifeFCList}" varStatus="status">
  
 <c:if test="${ loopCnt==0 }" >
<%--  <% if(loopCnt==0) { %> --%>
  <input type="hidden"  name="jisucode" id="jisucode" value="${lifejisuinfo.code}"/>
<%--   <input type="hidden"  name="notitime" id="notitime" value="${lifejisuinfo.noti_time}"/> --%>
<%--   <% } %> --%>
</c:if>
<%--  <% loopCnt++; %> --%>
 <c:set var="loopCnt" value="${loopCnt+1}" />
<%--   <tr> <td><%=loopCnt %></td> "../LocalJisuSelService.do?areano=<%=v_areano %>"  --%>
 <tr> <td> ${loopCnt }</td>
    <td> <a href="/lifefc/LifeFCUpdSelect.do?areano=${lifejisuinfo.area_no}&noti_time=${lifejisuinfo.noti_time}&jisucode=${lifejisuinfo.code}"> ${lifejisuinfo.area_no}</a></td> 
    <td>${lifejisuinfo.area_nm}</td><td>${lifejisuinfo.jisu_nm}</td>
    <td>  ${lifejisuinfo.noti_time}</td>
    <td>  ${lifejisuinfo.today_fcstStage} ( ${lifejisuinfo.today_fcst} )</td>
	<td>  ${lifejisuinfo.tomrw_fcstStage} ( ${lifejisuinfo.tomrw_fcst} )</td>
	<td><c:out value="${lifejisuinfo.aft_tomrw_fcstStage}" />( ${lifejisuinfo.aft_tomrw_fcst} )</td>
				    
  </tr>
 </c:forEach>
 </table> 
<!-- 
 <script type="text/javascript"> 
  $(function(){
	$('#example').DataTable();
  });
</script>
 -->