<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!String v_areano ="1100000000"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 생활지수</title>
<style type="text/css">
/* #body {width: 100%; height: 1000px; border: 1px solid blue;} */
 
iframe {
	border: 0 solid #ffffff;
	height: 790px;
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
	font-size: 12px;
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
	height: 1090px;
	background: #FFFFFF;
}

.utryjisutab_content {
	padding: 0px;
	font-size: 12px;
	display: none;
	height: 1100px;
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
	 //관심지역으로 selected 된 지역번호를 Get하여서 지수정보를 조회한다.
	 var v_areano1 = $("#favLocalSelect").val();
	  
	 localJisuSelService_call(v_areano1); // 지수정보 조회
	 $("ul.tabs li:first").click();  // 첫번째 Tab 자동 클릭 이벤트 발생
}

$(function(){
	 //alert("localjisu.jsp~~");
 
	//alert("eamil : " + ${sessionScope.login.getU_EMAIL()});
	//var email = sessionScope.getAttribute("login").getU_EMAIL();
 
	// 관심지역조회 ++++++++++++++++++++++++++
 	$("#favLocalSelect").empty(); // 위에서<ul>태그 하위에 추가한 data배열등을 삭제. ?????

    var v_email1 = $("#sessionEmailStr").val();
 	if(v_email1 == "") v_email1 = "fc_default_user";
    //var v_areano = "1100000000";// 서울특별시 지역코드
 
   var url = "/lifefc/Selfavlocal.do?emailStr="+v_email1;	 
    
   $('#favLocalSelect').load(url);  // 관심지역 <select> 태그에 <option>으로 추가처리
    
	 //관심지역 select 콤보박스 change 이벤트처리
   $("#favLocalSelect").change(function(){
   		var v_areano1 = $("#favLocalSelect").val();// val()메소드 :   value값(option의 value값)을 취한다.
 
   		localJisuSelService_call(v_areano1);
   
		// 관심지역 select 콤보박스 change 이벤트 발생시에
		// 오늘/내일/모레탭중 오늘 탭이 자동으로 마우스 클릭 이벤트처리하여 오늘 탭이 자동 표시되도록 함.
  		 $("ul.tabs li:first").click(); 
   
   });
 
	 
	 
   var foodpoison = [], ultraviolet = []
   for (var i = 0; i < 18; i += 1) {
	 foodpoison.push([0, 1])
	 foodpoison.push([1, 2])
	 foodpoison.push([2, 3])
   }
   var line_data1 = {
     data : foodpoison,
     color: '#3c8dbc'
   }
   var line_data2 = {
     data : ultraviolet,
     color: '#00c0ef'
   }
   $.plot('#line-chart', [line_data1, line_data2], {
     grid  : {
       hoverable  : true,
       borderColor: '#f3f3f3',
       borderWidth: 1,
       tickColor  : '#f3f3f3'
     },
     series: {
       shadowSize: 0,
       lines     : {
         show: true
       },
       points    : {
         show: true
       }
     },
     lines : {
       fill : false,
       color: ['#3c8dbc', '#f56954']
     },
     yaxis : {
       show: true
     },
     xaxis : {
       show: true
     }
   })
   //Initialize tooltip on hover
   $('<div class="tooltip-inner" id="line-chart-tooltip" style="background-color:black;color:white;font-size:13px;padding:5px 4px 4px 5px;border-radius:3px;"></div>').css({
     position: 'absolute',
     display : 'none',
     opacity : 0.8
   }).appendTo('body')
   $('#line-chart').bind('plothover', function (event, pos, item) {

     if (item) {
       var x = item.datapoint[0].toFixed(2),
           y = item.datapoint[1].toFixed(2)

       $('#line-chart-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
         .css({ top: item.pageY + 5, left: item.pageX + 5 })
         .fadeIn(200)
     } else {
       $('#line-chart-tooltip').hide()
     }

   })
	 
}); 
 
	function localJisuSelService_call(v_areano){
		// alert("localjisu.jsp localJisuSelService_call().... v_areano : " + v_areano); 
		var url = "/lifefc/LocalJisuSelService.do?areano=" + v_areano;
		 
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
		
		$.ajax({
			type : "get",
			url : './lifefc_forecast/loc_ajax.jsp?backjuso='+gotojsp,
	// 		url : './lifefc/loc_ajax.jsp',
			dataType : "html",
			success : function(data) {
				var lay_pop3 = $("#popupWrapper");
				var pos = $("#loc_menu").position();
				lay_pop3.css('top', (pos.top + 30) + 'px');
				lay_pop3.css('left', (pos.left) + 'px');
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
</head>
<body>
<c:set var="sessionjstl" value="${sessionScope.login.getU_PERMISSION()}" />
<span style="display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700;font-size:12px;">지역 선택</span>
<c:if test="${sessionjstl eq 'A'}"><span style="margin-right:5px;"><a href="/lifefc/LifefcAdminIndex.do"><button type="button" class="btn btn-block btn-primary" id="locfsct_show" style="width:100px;height:30px;float:right;margin-left:10px;background-color:#3c8dbc;border-color:#367fa9;border-radius:3px;border:1px solid transparent;color: #fff;"><b>관리자모드</b></button></a></span></c:if>
<!-- <button type="button" id="loc_menu" onclick="openPopup();" style="width:100px;height:30px;float:right;margin-left:10px;background-color:#3c8dbc;border-color:#367fa9;border-radius:3px;border:1px solid transparent;color: #fff;"><b>관심동네등록</b></button> -->
<br/><br/>

<div id="favLocalDiv">
	<select id="favLocalSelect"  style="display: block;width:100%;height:34px;;font-size: 12px;line-height: 1.42857143;color: #555;background-color: #fff; background-image: none; border: 1px solid #ccc;">
	</select>  					
</div>  
<!-- <div id="popupWrapper" style="display: none; position: absolute;"></div> -->

<br/>
<!--  <div id="line-chart" style="height: 300px;"></div> -->
<div id="favLocal_result" >
<div id="mainDiv" name ="mainDiv" style="height: 100%"> 	 
	<iframe id="localjisu_iframe" src="/lifefc/LocalJisuSelService.do?areano=<%=v_areano%>"></iframe>
 </div>	 
</div>
<input type="hidden" name="backjuso" id="backjuso" value="localjisu" />
<input type="hidden" name="sessionEmailStr" id="sessionEmailStr" value=${sessionEmailStr} />

<%-- <div id="emailStrDiv"><input type="hidden" name="emailStr" id="emailStr" value="${sessionScope.emailStr}"></div> --%>
</body>
</html>