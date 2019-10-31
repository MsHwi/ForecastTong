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
td {	font-size:9px; }

th {	font-size:11px; }
</style>    
<script type="text/javascript"> 
  $(function(){
	//alert("submit_create before");
	$("#submit_create").click(function(e) {	
		var url = "/lifefc/LifeFCInfoCreate.do" ;
		//alert("submit_create : " + url);
			$("#procForm").attr("action", url);
			$("#procForm").submit();	
			//$("#popup").hide();
			location.reload();
			return true; 
	});	
	$("#submit_updselect").click(function(e) {	
		var url = "/lifefc/LifeFCUpdSelect.do?areano=${lifejisuinfo.area_no}&noti_time=${lifejisuinfo.noti_time}&code=${lifejisuinfo.code}" ;
		// alert("life_forecase\lifefc_admin_index.jsp : submit_select : " + url);
		//	$("#procForm").attr("action", url);
		//	$("#procForm").submit();	
			//$("#popup").hide();
			//location.reload();
			var value = e.target.getAttribute("areano");
			alert("submit_updselect().. >>>>> value : " + value);
			
       $("#procUpdSelect").on("submit",function(){
    	    //alert("procForm submit: " + url);
        var d=$(this).serialize();
        // serialize() : 직렬화 - 폼(현재 오브젝트 -this )에 있는 값들을 모두 직렬화해서 붙여주는 기능임.
        // alert(d);
        $.ajax({
        	url : url,// 데이터 요청 URL member.jsp?data:k=v&Key=value
        	type : "get", // 전송방식 get/post
        	data : d, // 전송할 데이터를 정의하며 다음과 같이 직렬화해서 넘겨줘야 한다.  k=v&k=v : 입력한 이름 <== <form>태그를 이용해서 직렬화데이터를 넘겨죽도 한다.
        	success : function(result) { // result : url 를 호출하면 서버에서 돌려받는 값, success : 성공시 실행할 처리문

        		//alert("ajax result " + result);
        		$("#updSelectDisp").html(result);
        		//$('#example').DataTable();
        		//location.reload();
        		//$('#lifefcinfoDiv').load(result);  
                // $("#txt1").text(result);        		
        	}
       		 , error : function() {
				alert("지수정보 조회 오류!!!======");
			}
        });//$.ajax().. end
 				
		return false; // 테스트용으로 리턴하지 않을려고 false;
 	    }); // $("#procForm").on("submit" ... end				
	return true; 
	});		 	
		
	
  }); //$(function() ... end
</script> 

<%-- <% Integer loopCnt=0; %>   --%>
 <c:set var="loopCnt" value="0" />
 <table   style="border: 1; width: 100%; color: black;" class="display" id="example">
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
    <td> <a href="/lifefc/LifeFCUpdSelect.do?areano=${lifejisuinfo.area_no}&noti_time=${lifejisuinfo.noti_time}&code=${lifejisuinfo.code}">${lifejisuinfo.area_no}</a></td> 
<%--     <td> <form id="procUpdSelect" action="/lifefc/LifeFCUpdSelect.do?areano=${lifejisuinfo.area_no}&noti_time=${lifejisuinfo.noti_time}&code=${lifejisuinfo.code}" method="get"><button type="submit" id=${lifejisuinfo.area_no}>${lifejisuinfo.area_no}</button></form></td> --%>
<%--   <td><form id="procUpdSelect" method="get">
       <button type="submit" id="submit_updselect">${lifejisuinfo.area_no}</button>
       <input type="hidden" name="areano" id="areano" value=${lifejisuinfo.area_no}/>
       <input type="hidden" name="loopCnt" id="loopCnt" value=${loopCnt}/>
<!--         <input type="hidden" name="backjuso" id="backjuso" value="fsnjisu" /> -->
   </form></td>
 --%>   
    <td>  ${lifejisuinfo.area_nm}</td><td>${lifejisuinfo.jisu_nm}</td>
    <td>  ${lifejisuinfo.noti_time}</td>
    <td>  ${lifejisuinfo.today_fcstStage} ( ${lifejisuinfo.today_fcst} )</td>
	<td>  ${lifejisuinfo.tomrw_fcstStage} ( ${lifejisuinfo.tomrw_fcst} )</td>
	<td><c:out value="${lifejisuinfo.aft_tomrw_fcstStage}" />( ${lifejisuinfo.aft_tomrw_fcst} )</td>
				    
  </tr>
 </c:forEach>
 </table> 
 <div id="updSelectDisp"></div>
<!-- 
 <script type="text/javascript"> 
  $(function(){
	$('#example').DataTable();
  });
</script>
 -->