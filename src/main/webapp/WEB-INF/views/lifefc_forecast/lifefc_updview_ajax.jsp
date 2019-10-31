<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활지수정보 수정</title>
<!-- <link rel="stylesheet" href="./media/css/jquery.dataTables.min.css" /> -->
<!-- <script type="text/javascript" src="./media/js/jquery.dataTables.min.js" ></script>  -->
<!-- JQuery 라이브러리  -->
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() { 
	//alert("test1");
 });
 $(function(){
		//alert("submit_update/delete before");
		$("#submit_update").click(function(e) {	
			var url = "/lifefc/LifeFCModifyService.do" ;
			//alert("submit_update : " + url);
				$("#modifyform").attr("action", url);
				$("#modifyform").submit();	
				//$("#popup").hide();
				 location.reload();
				return true; 
		});	
		$("#submit_delete").click(function(e) {	
			var url = "/lifefc/LifeFCDeleteService.do" ;
			//alert("submit_update : " + url);
				$("#modifyform").attr("action", url);
				$("#modifyform").submit();	
				//$("#popup").hide();
				//location.reload();
				return true; 
		});		

	  }); //$(function() ... end	   
</script>
</head>
<body>
<div id="contentsArea">
<section id="titlename">
	<h1>${lifeFCDto.jisu_nm} 지수정보 수정</h1 >  
	<fieldset>	
	<form   id="modifyform" method="post" > 

    <p>
		<label for="area_no">지점코드 </label> 
		<input type="text" id="area_no"
					name="area_no" value="${lifeFCDto.area_no}"  readonly="readonly" />
	</p>	
     <p>
		<label for="area_nm">지점명 </label> 
		<input type="text" id="area_nm"
					name="area_nm" value="${lifeFCDto.area_nm}"  readonly="readonly" />
	</p>	
    <p>
		<label for="jisu_nm">지수명 </label> 
		<input type="text" id="jisu_nm"
					name="jisu_nm" value="${lifeFCDto.jisu_nm}"  readonly="readonly"  />
		<input type="text" id="code"
					name="code" value="${lifeFCDto.code}"  readonly="readonly"  />					
	</p>
	
    <p>
		<label for="noti_time">발표일시 </label> 
		<input type="text" id="noti_time"
					name="noti_time" value="${lifeFCDto.noti_time}"  readonly="readonly" />
	</p>
	
	<p>
		<label for="today_fcst">오늘현황 </label> 
		<input type="text" id="today_fcst"
					name="today_fcst" value="${lifeFCDto.today_fcst}" />
        <input type="text" id="today_fcstStage"
					name="today_fcstStage" value="${lifeFCDto.today_fcstStage}"  readonly="readonly" />						
	</p>
	<p>
		<label for="tomrw_fcst">내일현황 </label> 
		<input type="text" id="tomrw_fcst"
					name="tomrw_fcst" value="${lifeFCDto.tomrw_fcst}" />
        <input type="text" id="tomrw_fcstStage"
					name="tomrw_fcstStage" value="${lifeFCDto.tomrw_fcstStage}"  readonly="readonly" />						
	</p>	
	<p>
		<label for="aft_tomrw_fcst">모레현황 </label> 
		<input type="text" id="aft_tomrw_fcst"
					name="aft_tomrw_fcst" value="${lifeFCDto.aft_tomrw_fcst}" />
        <input type="text" id="aft_tomrw_fcstStage"
					name="aft_tomrw_fcstStage" value="${lifeFCDto.aft_tomrw_fcstStage}"  readonly="readonly" />					
	</p>	
<%-- 	<input type="hidden"  name="code" id="code" value="${lifeFCDto.code}"/> --%>
	<div id="btnJoinArea">
<!-- 						<button type="submit" class="btnOk">수정</button> -->
<!-- 						<button type="submit" class="btnDelete">삭제</button> -->
			<input type="submit" id="submit_update" value="수정" /> 
<!-- 			<button type="button" value="button" onclick="alert('작업중입니다!!');" id="btnPrev">삭제 </button> -->
			<input type="submit" id="submit_delete" value="삭제" />	
<!-- 						<input type="submit" id="btnUpdate" />수정  -->
<!-- 						<input type="submit" id="btnDelete" />삭제 						 -->
						<input type="reset" id="btnCancel" value="취소" /> 
						<button type="button" value="button"
						  onclick="history.back(1);" id="btnPrev">
<!-- 							onclick="location.href='/lifefc/LifefcAdminIndex.do'" id="btnPrev">  -->
							이전화면</button>
<!-- 						        onclick="history.back(1);" id="btnPrev">  onclick="location.href='./BoardList.do'"  -->							
	</div>
	
	</form>
	</fieldset>		
	</section>
</div>
</body>
</html>