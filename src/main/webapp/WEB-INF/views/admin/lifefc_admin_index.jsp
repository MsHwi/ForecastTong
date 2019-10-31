<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바통 기상예보</title>
<!-- <link rel="stylesheet" href="../media/css/jquery.dataTables.min.css" /> -->
<!-- <script src="../media/js/jquery.dataTables.min.js" type="text/javascript"></script>  -->
<!-- JQuery 라이브러리  -->
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<style type="text/css">
/* 제목의 배경을 검정, 글자를 흰색으로 한다. */
th {
	background: black;
	color: white;
/* 	cursor: pointer; /* 손가락 커서 */ */
}
</style>
<%
	session.setAttribute("jisugubun", "자외선");
%>
<%!String v_areano ="1100000000"; %>
<%!String loginid = "hee"; %>
<%
// session.setAttribute("loginid","admin");
// request.setAttribute("loginid", "admin");
 
session.setAttribute("loginid",loginid);
v_areano = (String) session.getAttribute("areano");
 
System.out.println("index.jsp 에서  설정한 값 - v_areano : " + v_areano);
%> 

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
	$("#submit_select").click(function(e) {	
		var url = "/lifefc/LifeFCInfoSelect.do" ;
		 //alert("submit_select : " + url);
		//	$("#procForm").attr("action", url);
		//	$("#procForm").submit();	
			//$("#popup").hide();
			//location.reload();
			
       $("#procForm").on("submit",function(){
    	    //alert("procForm submit: " + url);
        var d=$(this).serialize();
        // serialize() : 직렬화 - 폼(현재 오브젝트 -this )에 있는 값들을 모두 직렬화해서 붙여주는 기능임.
        // alert(d);
        $.ajax({
        	url : url,// 데이터 요청 URL member.jsp?data:k=v&Key=value
        	type : "post", // 전송방식 get/post
        	data : d, // 전송할 데이터를 정의하며 다음과 같이 직렬화해서 넘겨줘야 한다.  k=v&k=v : 입력한 이름 <== <form>태그를 이용해서 직렬화데이터를 넘겨죽도 한다.
        	success : function(result) { // result : url 를 호출하면 서버에서 돌려받는 값, success : 성공시 실행할 처리문

        		//alert("ajax result " + result);
        		$("#lifefcinfoDiv").html(result);
        		//$('#example').DataTable();
        		//location.reload();
        		//$('#lifefcinfoDiv').load(result);  
                // $("#txt1").text(result);        		
        	}
       		 , error : function() {
				alert("지수정보 조회 오류!!!~~~~");
			}
        });//$.ajax().. end
 				
		return false; // 테스트용으로 리턴하지 않을려고 false;
 	    }); // $("#procForm").on("submit" ... end				
	return true; 
	});		 	
		
	
  }); //$(function() ... end
</script>
</head>
<body>
	<h3>생활기상 관리자화면입니다.</h3>
<!-- 	<a href="../index.jsp">Home</a> -->
<%-- 	<a href="/lifefc/LocalJisuSelService.do?areano="<%=v_areano%>  >생활기상</a> --%>
	<hr />
 
<!-- 	<div class="lifefcLastinfo">최종 자외선 생성정보 조회 (최종 발생시간, 건수) Disp 영역 -->
<!-- 	</div> -->
 
	<fieldset class="procinfo">
		<form  id="procForm" method="post">
			<input type="radio" name="jisugubun" checked="checked" value="자외선" /> 자외선
		    <input type="radio" name="jisugubun" value="식중독" /> 식중독
		    
			<input type="submit" id="submit_create" value="생성" /> 
			<input type="submit" id="submit_select" value="조회" />
		</form>
 
	</fieldset>
	<br />
	 
	<div id="lifefcinfoDiv" style="width: 95%; height: 350px;" align="center">
		생활기상정보 조회 Disp 영역</div>
	 
 
</body>
</html>