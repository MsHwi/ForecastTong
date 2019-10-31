<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!String v_areano ="1100000000"; %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자외선지수</title>
<style type="text/css">
#body {width: 100%; height: 400px; border: 1px solid blue;}
 
iframe {
	border: 0 solid #ffffff;
	height: 790px;
/* 	height: 100%; */
	width: 100%;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 2px solid #eee;
	border-left: 2px solid #eee;
	width: 100%;
	font-family: "dotum";
	font-size: 10px;
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 120px;
	height: 31px;
	line-height: 31px;
	border: 2px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 2px solid #FFFFFF;
}

.utryjisu_container {
	border: 2px solid #eee;
	border-top: none;
	width: 100%;
	height: 790px;
	background: #FFFFFF;
}

.utryjisutab_content {
	padding: 0px;
	font-size: 10px;
	display: none;
	height: 790px;
}

.utryjisu_container .utryjisutab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.utryjisu_container .utryjisutab_content  ul li {
	padding: 0px;
	list-style: none;
}

</style>

<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"> 
//화면이 보여진후 동작하도록 설정한다.
window.onload = function() {
	
	 var v_areano1 = $("#favLocalSelect1").val();
	 //alert("utryjisu.. ready()222 v_areano1 : " + v_areano1);
	 localJisuSelService_call(v_areano1);
	 $("ul.tabs li:first").click(); 
	 
}
$(function(){
	//alert("ultryjisu.jsp~~");

	//alert("eamil : " + ${sessionScope.login.getU_EMAIL()});
	//var email = sessionScope.getAttribute("login").getU_EMAIL();

	//alert("email : " + gv_email);
	// 관심지역조회 ++++++++++++++++++++++++++
 	$("#favLocalSelect1").empty(); // 위에서<ul>태그 하위에 추가한 data배열등을 삭제. ?????

    var v_email1 = $("#sessionEmailStr").val();
    if(v_email1 == "") v_email1 = "fc_default_user";
    //var v_areano = "1100000000";

   var url = "/lifefc/Selfavlocal.do?emailStr="+v_email1;	 
   
   //alert("favLocalSelect onLoad (url): "  + url);
   $('#favLocalSelect1').load(url);  // 관심지역 <select> 태그에 <option>으로 추가처리
    
	 //관심지역 select 콤보박스 change 이벤트처리
   $("#favLocalSelect1").change(function(){
   		var v_areano1 = $("#favLocalSelect1").val();// val()메소드 :   value값(option의 value값)을 취한다.
 
   		localJisuSelService_call(v_areano1);
   
		// 관심지역 select 콤보박스 change 이벤트 발생시에
		// 오늘/내일/모레탭중 오늘 탭이 자동으로 마우스 클릭 이벤트처리하여 오늘 탭이 자동 표시되도록 함.
  		 $("ul.tabs li:first").click(); 
   
   });
 
}); 
 
  function localJisuSelService_call(v_areano1){
	   //alert("utryjisu.jsp localJisuSelService_call().... v_areano : " + v_areano1); 
    
  		var url = "/lifefc/UtryJisuSelService.do?areano=" + v_areano1 +"&tabno=1";
		
		//alert("생활기상 조회하여 mainFrame 영역에 load하라.  "  );
		  $("mainDiv").remove(); 
		 //$("#mainDiv").empty(); // 위에서<ul>태그 하위에 추가한 data배열등을 삭제.
		 $("#mainDiv").load(url);
		 //alert("localJisuSelService_call() ..after ..");
		
  }	 
    
</script>

<script type="text/javascript"> 
// 동네찾기
function openPopup() {	
	
	var gotojsp = $("#backjuso").val();
	//alert(gotojsp);
	
	$.ajax({
		type : "get", //POST
		url : './lifefc_forecast/loc_ajax.jsp?backjuso='+gotojsp,
		dataType : "html",
		success : function(data) {
			//alert("loc_ajax.jsp > data : " +data);
			var lay_pop3 = $("#popupWrapper");
			var pos = $("#loc_menu").position();
			lay_pop3.css('top', (pos.top + 70) + 'px');
			lay_pop3.css('left', (pos.left+50) + 'px');
			lay_pop3.show();
			lay_pop3.html(data);
			
		},

		error : function(request, status) {
			$("#popupWrapper").hide();
			alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
		}
	});
}


</script>
<script type="text/javascript">
	$(function() {
		// 오늘/내일/모레 탭에 대한 처리
		$(".utryjisutab_content").hide();
		$(".utryjisutab_content:first").show();

		$("ul.tabs li").click(function(e) {
		
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "darkred");
			$(".utryjisutab_content").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
			 //alert("getAttribute <rel>activeTab : " + activeTab);
			
			//hee--st
			 
			var value = e.target.getAttribute("rel");
			// alert("getAttribute <rel>value : " + value);
			
			var tabno="";
			if(value == "mainDiv2") { tabno="1"; }
			else if(value == "tab2") tabno="2";
			else if(value == "tab3") tabno="3";
			// alert("activeTab > tabno: " + tabno);
			var v_areano1 =  $("#favLocalSelect1").val() ;
			
<%-- 			var url = "./UtryJisuSelService.do?areano=<%=v_areano%>&tabno="+tabno; --%>
			var url = "/lifefc/UtryJisuSelService.do?areano="+v_areano1+"&tabno="+tabno;
			//alert("activeTab : " + activeTab);
			//alert("url : " + url);
			
			// active Tab에 url의 결과를 load한다.
			$('#' + activeTab).load(url);  
			//hee--end

		});
	});
	
	function winopen() {
		//alert("winopen");
		var url = "/lifefc/AllJijumJisuSelect.do?jisuname=자외선";//"./lifefc/loc_ajax.jsp";
		var winName = "post";
		var option = "width=600, height=500, top=150, left=700, "
		             + "scrollbars=no, toolbars=no,location=no";
		// 위에 있는 정보를 이용해서 우편번호 창을 열자
		window.open(url, winName, option);
	}
</script>
</head>
<body>

<span style="display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700;font-size:12px;">지역 선택</span>
<!-- <button type="button" id="loc_menu" onclick="openPopup();" style="width:100px;height:30px;float:right;margin-left:10px;background-color:#3c8dbc;border-color:#367fa9;border-radius:3px;border:1px solid transparent;color: #fff;"><b>관심동네등록</b></button> -->
<button id="btnAlfsnjisu"  onclick="winopen();" type="button" style="width:100px;height:30px;float:right;margin-left:10px;background-color:#3c8dbc;border-color:#367fa9;border-radius:3px;border:1px solid transparent;color: #fff;"><b>지점값보기</b></button> 

<br/><br/>
<div id="favLocalDiv3"  >
	<select id="favLocalSelect1" style="display: block;width:100%;height:34px;;font-size: 12px;line-height: 1.42857143;color: #555;background-color: #fff; background-image: none; border: 1px solid #ccc;">
	 </select>
	 <div id="popupWrapper" style="display: none; position: absolute;"></div> 
     <input type="hidden" name="backjuso" id="backjuso" value="utryjisu" />
     <input type="hidden" name="sessionEmailStr" id="sessionEmailStr" value=${sessionEmailStr} />
</div>  
<br/>
	<div id="utryjisu_container">
		<ul class="tabs">
			<li class="active" rel="mainDiv2">오늘</li>
			<li rel="tab2">내일</li>
			<li rel="tab3">모레</li>
		</ul>
		<div class="utryjisu_container">
			<div id="mainDiv2" class="utryjisutab_content" name ="mainDiv2">   
				<iframe src="/lifefc/UtryJisuSelService.do?areano=<%=v_areano%>&tabno=1"></iframe>
			</div>
			<div id="tab2" class="utryjisutab_content" name ="tab2">

			</div>
			<div id="tab3" class="utryjisutab_content" name ="tab3">
			</div>			
		</div>
	</div>
<%-- <div id="emailStrDiv"><input type="hidden" name="emailStr" id="emailStr" value="${sessionScope.emailStr}"></div> --%>
<%-- 세션 영역 : ${sessionScope.loginid}<br/> Set Project eltag 예제 참고--%>
<%-- 파라미터 호출 :${param.loginid} --%>
</body>
</html>