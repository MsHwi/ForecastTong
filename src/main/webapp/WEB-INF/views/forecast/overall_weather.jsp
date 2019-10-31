<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>예보통 | 빅데이터 기반 날씨정보 제공 사이트</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="../css/page/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/page/ionicons.min.css">
<link rel="stylesheet" href="../css/page/jquery-jvectormap.css">
<link rel="stylesheet" href="../css/page/AdminLTE.min.css">
<link rel="stylesheet" href="../css/page/_all-skins.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">
#loading 
{
 width: 100%;   
 height: 100%;   
 top: 0px;
 left: 0px;
 position: fixed;   
 display: block;   
 opacity: 0.7;   
 background-color: #fff;   
 z-index: 99;   
 text-align: center; 
 }  
  
#loading-image 
{   
 position: absolute;   
 top: 50%;   
 left: 50%;  
 z-index: 100; 
 } 
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div id="loading"><img id="loading-image" src="../img/loading.gif" alt="Loading..." /></div>
<div class="wrapper">
	<header class="main-header">
	<!-- 로고 부분 -->
	<!-- 화면 조정 시 로고 -->
	<a href="/member/gotoMain" class="logo"><span class="logo-mini"><img src="../img/logo_icon.png" style="width: 30px; height: 30px;"/></span>
	<!-- 정상 시 로고 -->
	<span class="logo-lg"><img src="../img/logo_icon.png" style="width: 30px; height: 30px;"/><b>Forecast</b>Tong</span></a>
	<!-- 상단바 부분 -->
	<nav class="navbar navbar-static-top">
	<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"><i class="fa fa-bars-lg" aria-hidden="true"></i><span class="sr-only">Toggle navigation</span></a>
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- 세션을 받아와서 회원가입 or 회원정보 표기 확인  -->
			<c:if test="${!empty sessionScope.login.getU_NAME()}">
			<li class="dropdown user user-menu">
			<li class="dropdown user user-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<c:if test="${empty sessionScope.login.getU_PICTURE()}">
			<img src="../img/none.png" class="user-image" alt="User Image" style="width: 25px; height: 25px"/>
			<span class="hidden-xs"><b>&nbsp;${sessionScope.login.getU_NAME()}</b></span></a>
			<ul class="dropdown-menu">
				<li class="user-header"><img src="../img/none.png" class="img-circle" alt="User Image" style="width: 100px; height: 100px"/>
				<p>
					<b>[$sessionScope.login.getU_NAME()}] 회원님, 안녕하세요?</b>
				</p>
				</li>
				<li class="user-footer">
				<div class="pull-left">
					<a href="#" class="btn btn-default btn-flat">이미지 변경</a>
				</div>
				<div class="pull-right">
					<a href="#" class="btn btn-default btn-flat">창 닫기</a>
				</div>
				</li>
			</ul>
			</c:if>
			<c:if test="${!empty sessionScope.login.getU_PICTURE()}">
			<img src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}" class="user-image" alt="User Image" style="width: 25px; height: 25px"/>
			<span class="hidden-xs"><b>
			&nbsp;${sessionScope.login.getU_NAME()}</b></span>
			</a>
			<ul class="dropdown-menu">
				<li class="user-header"><img src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}" class="img-circle" alt="User Image" style="width: 100px; height: 100px"/>
				<p>
					<b> [${sessionScope.login.getU_NAME()}] 회원님, 안녕하세요? </b>
				</p>
				</li>
				<li class="user-footer">
				<div class="pull-left">
					<a href="../member/edit.jsp" class="btn btn-default btn-flat">이미지 변경</a>
				</div>
				<div class="pull-right">
					<a href="#" class="btn btn-default btn-flat">창 닫기</a>
				</div>
				</li>
			</ul>
			</c:if>
			</li>
			<li><a href="/member/logout"><b>로그아웃</b></a></li>
			</c:if>
			<c:if test="${empty sessionScope.login.getU_NAME()}">
			<li><a href="" data-toggle="modal" data-target="#modal-default"><b>로그인</b></a></li>
			<li><a href="/member/gotoJoin"><b>회원가입</b></a></li>
			</c:if>
		</ul>
	</div>
	</nav>
	</header>
	<aside class="main-sidebar">
	<section class="sidebar">
	<div class="user-panel">
		<div class="pull-left image">
			<c:if test="${empty sessionScope.login.getU_PICTURE()}">
			<img src="../img/none.png" class="img-circle" alt="User Image"/>
			</c:if>
			<c:if test="${!empty sessionScope.login.getU_PICTURE()}">
			<img src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}" class="img-circle" alt="User Image"/>
			</c:if>
		</div>
		<div class="pull-left info">
			<c:if test="${!empty sessionScope.login.getU_NAME()}">
			<p>
				${sessionScope.login.getU_NAME()}
			</p>
			<a href="#"><i class="fa fa-circle text-success"></i>Online</a>
			</c:if>
			<c:if test="${empty sessionScope.login.getU_NAME()}">
			<p>
				로그인이 필요합니다
			</p>
			<a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
			</c:if>
		</div>
	</div>
	<ul class="sidebar-menu" data-widget="tree">
		<li class="header"><b>메인 카테고리</b></li>
		<li class="active treeview menu-open"><a href="#"><i class="fa fa-bullhorn"></i><span>예보</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i>
		</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="/member/gotoAllfcst"><i class="fa fa-circle-o"></i>종합예보</a></li>
			<li><a href="/lifefc/"><i class="fa fa-circle-o"></i>생활기상지수</a></li>
		</ul>
		</li>
		<li class="treeview"><a href="#"><i class="fa fa-pie-chart"></i><span>빅데이터 분석</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i>
		</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="/bigdata/gotoElanal"><i class="fa fa-circle-o"></i> 요소별 분석</a></li>
			<li><a href="/bigdata/gotoStatanal"><i class="fa fa-circle-o"></i> 통계분석 결과</a></li>
		</ul>
		</li>
		<li><a href="#"><i class="fa fa-th"></i><span>App 소개</span><span class="pull-right-container"><small class="label pull-right bg-green">new</small>
		</span>
		</a></li>
		<li class="treeview"><a href="#"><i class="fa fa-bullhorn"></i><span>고객의 소리</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i>
		</span>
		</a>
		<ul class="treeview-menu">
			<li><a href="/ForecastTong/BoardList.do"><i class="fa fa-circle-o"></i>공지사항</a></li>
			<li><a href=""><i class="fa fa-circle-o"></i>Q&A</a></li>
		</ul>
		</li>
		<c:if test="${!empty sessionScope.login.getU_NAME()}">
		<li class="treeview"><a href="#"><i class="fa fa-child"></i>
		<span>마이페이지</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i>
		</span>
		</a>
		<ul class="treeview-menu">
			<li class="preventClick"><a href="../member/edit.jsp"><i class="fa fa-circle-o"></i>회원정보 수정</a></li>
			<li class="preventClick"><a href="" ><i class="fa fa-circle-o"></i>회원탈퇴</a></li>
		</ul>
		</li>
		</c:if>
	</ul>
	</section>
	</aside>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<h4>
		<b>종합예보 페이지 </b>
		</h4>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">예보</a></li>
			<li class="active">종합예보</li>
		</ol>
		</section>
		<!-- Main content -->
		<section class="content">
		<!-- Main row -->
		<div class="row">
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
						<b>지도로 보는 날씨</b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div id="map" style="height: 690px;" class="map">
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
						<b>중기예보</b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div id="div_showmiddlefcst">
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.col -->
			</div>
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
						<b>초단기/동네예보</b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div id="popupWrapper">
						</div>
						<div id="div_search">
						</div>
						<div id="div_showgribfcst">
						</div>
						<div id="div_showlocalfcst">
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.col -->
			</div>
		</div>
		<!-- /.row -->
		<!-- /.content -->
		<input type="hidden" id="tempsession" readonly="readonly" value="${sessionScope.login.getU_ID()}"/>
	</div>
	<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright &copy; 2017 <a href="https://adminlte.io">JavaTong(자바통)</a>. </strong> All rights reserved. </footer>
</div>
<!-- /.content-wrapper -->
<div id="container">
</div>
<!-- 로그인 모달창  -->
<div class="modal fade" id="modal-default">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
				<b>로그인</b>
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" action="/member/loginsuccess" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="loginEmail" name="U_EMAIL" placeholder="이메일">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="loginPassword" name="U_PWD" placeholder="비밀번호">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" id="keep_login">이메일 저장 </label>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
			<!-- /.modal-footer -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- jQuery 3 -->
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
		$(window).load(function() {    
		 	$('#loading').hide();  
		});

		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
		$(document).ready(function() {
			var uemail = getCookie("uemail");
			if (uemail) {
				$("#keep_login").attr("checked", true);
				$("#loginEmail").val(uemail);
			}
			$("#keep_login").change(function() {
				if ($("#keep_login").is(":checked")) {
					var temp = $("#loginEmail").val();
					setCookie("uemail", temp, 7);
				} else {
					deleteCookie("uemail");
				}
			});
			if($('#tempsession').val() != "") {
				 var userid = $('#tempsession').val();
			 } else {
				var userid = "없음"
			 }			
			$.ajax({
				type : "GET",
				url : "/overallfc/showarealist?userid=" + userid,
				dataType : "html",
				success : function(data) {
					var lay_pop = $("#div_search");
					lay_pop.show();
					lay_pop.html(data);
					showForecast();
				},
					error : function(request, status) {
					}
			});
			var filter = "win16|win32|win64|mac|macintel"; 
			if ( navigator.platform ) { 
				if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
					alert('mobile 환경에서는 세로 방향모드에 최적화되어 있습니다. 회전모드를 \'ON\'해 주십시오.'); 
				} else {
// 					alert('pc 접속'); 
				} 
			}		
		})
		function setInterestloc() {
			$.ajax({
				type : "POST",
				url : '../member/sel_firststage.jsp',
				dataType : "html",
				success : function(data) {
					var lay_pop3 = $("#popupWrapper");
					var pos = $("#popupWrapper").position();
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
		function showForecast(mapstr) {
// 			alert("파라미터 확인: "+mapstr);
			if(mapstr) {
				var strArr = mapstr.split(' ');
				alert("'"+strArr[0]+" "+strArr[1]+" "+strArr[2]+"'의 날씨를 검색합니다.");
			} else {
				if($("#interestarea_sel option:eq(0)").val() == "0") {
					var str = "서울특별시 구로구 구로제5동";
					alert("로그인을 하지 않았으므로 기본 주소(서울특별시 구로구 구로제5동)로 날씨를 조회합니다.");
//	 				alert(str);
					var strArr = str.split(' ');	
				} 
				else {
					var str = $("#interestarea_sel option:selected").text();
//	 				alert(str);
					var strArr = str.split(' ');	
				}	
			}
						
			$.ajax({
				type : "GET",
				url : "/overallfc/showlocalfcst?A_FST_STAGE=" + strArr[0]
						+ "&A_SCND_STAGE=" + strArr[1] + "&A_THIRD_STAGE=" + strArr[2],
				dataType : "html",
				success : function(data) {
					var lay_pop2 = $("#div_showlocalfcst");
					lay_pop2.show();
					lay_pop2.html(data);
				},
				error : function(request, status) {
					alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
				}
			});

			$.ajax({
				type : "GET",
				url : "/overallfc/showgribfcst?A_FST_STAGE=" + strArr[0]
						+ "&A_SCND_STAGE=" + strArr[1] + "&A_THIRD_STAGE=" + strArr[2],
				dataType : "html",
				success : function(data) {
					var lay_pop3 = $("#div_showgribfcst");
					lay_pop3.show();
					lay_pop3.html(data);
				},
				error : function(request, status) {
					alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
				}
			});

			$.ajax({
				type : "GET",
				url : "/overallfc/showmiddlefcst?A_FST_STAGE=" + strArr[0]
						+ "&A_SCND_STAGE=" + strArr[1] + "&A_THIRD_STAGE=" + strArr[2],
				dataType : "html",
				success : function(data) {
					var lay_pop4 = $("#div_showmiddlefcst");
					lay_pop4.show();
					lay_pop4.html(data);
				},
				error : function(request, status) {
					alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
				}
			});
		}
	</script>
<!-- Bootstrap 3.3.7 -->
<script src="../js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="../js/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="../js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/jquery-jvectormap-world-mill-en.js"></script>
<script type="text/javascript" src="../js/jquery.xdomainajax.js"></script>
<!-- SlimScroll -->
<script src="../js/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<!-- 	<script src="bower_components/Chart.js/Chart.js"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../js/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../js/demo.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=cae852c94e7e9c6eaae4798d6397add7"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cae852c94e7e9c6eaae4798d6397add7&libraries=services"></script>
<script>
		var addr = new Array(); 
		var stn_name = new Array(); 
		var sky = new Array();
		var pty = new Array(); 
		var t1h = new Array();
		var lon = new Array();
		var lat = new Array(); 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new daum.maps.LatLng(35.96340, 127.79285), // 지도의 중심좌표
	        level: 13, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.HYBRID
	    };
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		map.setDraggable(false);
		map.setZoomable(false);
				
		var request = $.ajax({
			url: '/overallfc/getmapjson',
			type: 'POST',
			dataType: 'text',
			global:false,
			cache:false,
			headers: { "cache-control": "no-cache","pragma": "no-cache" },
			async:false,
			success : function(data) {
// 				alert(data);
			},
			error: function(){	alert('error');}
		});
	       var parsedJson = JSON.parse(JSON.stringify(request)); 
	       var responseTextJson = JSON.parse(parsedJson.responseText);
// 		   alert(parsedJson.responseText);
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   addr[i] = item.addr;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   stn_name[i] = item.stn_name;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   sky[i] = item.sky;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   pty[i] = item.pty;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   t1h[i] = item.t1h;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   lon[i] = item.lon;
		   }
		   for (var i = 0; i < responseTextJson.rows.length; i++) { 
			   var item = responseTextJson.rows[i];
			   lat[i] = item.lat;
		   }
		   for (var i = 0; i <22; i ++) {
			   var imageSrc;
			    if(sky[i] == 1) {
					imageSrc = "../img/weather/Clear_D.png"; 
				} else if(sky[i] == 2) {
	 				imageSrc = "../img/weather/PartlyCloudy_D.png"; 
				} else if(sky[i] == 3) {
					imageSrc = "../img/weather/MostlyCloudy_D.png"; 
				} else if(sky[i] == 4) {
					imageSrc = "../img/weather/Cloudy.png"; 
				} else if(pty[i] == 1) {
					imageSrc = "../img/weather/Rain.png"; 
				} else if(pty[i] == 2) {
					imageSrc = "../img/weather/SnowRain.png"; 
				} else if(pty[i] == 3) {
					imageSrc = "../img/weather/Snow.png"; 
				}
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new daum.maps.Size(35, 35); 
			    // 마커 이미지를 생성합니다    
			    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new daum.maps.LatLng(lat[i], lon[i]), // 마커를 표시할 위치
			        title : addr[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    var infowindow = new daum.maps.InfoWindow({
			        content: '<div style="padding:5px;"><b>'+stn_name[i]+'<font color="red">&nbsp;&nbsp;'+t1h[i]+'</font>&nbsp;&nbsp;<font color="blue">[날씨 클릭]'+'</font></b></div>' // 인포윈도우에 표시할 내용
			    });
				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				    daum.maps.event.addListener(marker, 'click', makeClickListener(marker));
				}
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}
				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
				function makeClickListener(marker) {
				    return function() {
				    	var mapstr = marker.getTitle();
				    	showForecast(mapstr);
				    };
				}
	</script>
</body>
</html>