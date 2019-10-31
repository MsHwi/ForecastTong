<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! int count;%> 
<%
    count++;
    application.setAttribute("conutValue", count);
%>
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
<link rel="stylesheet" href="../css/page/weathertong.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/jquery.weathertong.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/fastclick.js"></script>
<script src="../js/adminlte.min.js"></script>
<script src="../js/jquery.sparkline.min.js"></script>
<script src="../js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/jquery-jvectormap-world-mill-en.js"></script>
<script src="../js/jquery.slimscroll.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.get("/member/usercount", function(data) {
			var usercount = data;
			$("#usercount").text(usercount);
		});
		
		$.ajax({
	        type: "POST",
	        url: "/overallfc/makemapjson",
	        cache: false,
	        dataType: "text",
	        error: function(xhr, textStatus, errorThrown) {
// 	                alert("전송에 실패했습니다.");
	        }
		});  

		$.ajax({
			type : "GET",
			url : "/bigdata/make_trendprod",
			dataType : "html",
			success : function(data) {
				var lay_pop4 = $("#prod_div");
				lay_pop4.show();
				lay_pop4.html(data);
			},
			error : function(request, status) {
				alert("데이터 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
			}
		});
	})
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div id="loading"><img id="loading-image" src="../img/loading.gif" alt="Loading..." /></div>
<div class="wrapper">
	<header class="main-header">
	<a href="#" class="logo"><span class="logo-mini"><img src="../img/logo_icon.png" style="width: 30px; height: 30px;"/></span>
	<span class="logo-lg"><img src="../img/logo_icon.png" style="width: 30px; height: 30px;"/><b>Forecast</b>Tong</span></a>
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
					<b>[${sessionScope.login.getU_NAME()}] 회원님, 안녕하세요?</b>
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
	<div class="content-wrapper">
		<section class="content-header">
		<h4>
		<b>예보통(ForecastTong) </b>&nbsp;<small>Version 1.0</small>
		</h4>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">예보통(ForecastTong)</li>
		</ol>
		</section>
		<!-- Main content -->
		<section class="content">
		<!-- Info boxes -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-blue">
					<span class="info-box-icon"><i class="fa fa-database"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">BIG DATA Repository</span><span class="info-box-number">2.91GB</span>
						<div class="progress">
							<div class="progress-bar" style="width: 100%">
							</div>
						</div>
						<span class="progress-description"> 빅데이터SET 크기 </span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<!-- fix for small devices only -->
			<div class="clearfix visible-sm-block">
			</div>
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-green">
					<span class="info-box-icon"><i class="fa fa-download"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Download</span><span class="info-box-number">2,000</span>
						<div class="progress">
							<div class="progress-bar" style="width: 100%">
							</div>
						</div>
						<span class="progress-description"> 마켓 다운로드 횟수 </span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-red">
					<span class="info-box-icon"><i class="fa fa-line-chart"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Visitors</span><span class="info-box-number" id="hitsCount"><%= count%></span>
						<div class="progress">
							<div class="progress-bar" style="width: 100%">
							</div>
						</div>
						<span class="progress-description"> 방문자 수(로그인 수) </span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box bg-yellow">
					<span class="info-box-icon"><i class="fa fa-child"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">New Members</span><span class="info-box-number" id="usercount">${usercount}</span>
						<div class="progress">
							<div class="progress-bar" style="width: 100%">
							</div>
						</div>
						<span class="progress-description"> 가입한 회원수 </span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<div class="col-md-6">
				<!-- MAP & BOX PANE -->
				<div class="box box-solid">
					<div class="box-header with-border">
						<h5 class="box-title">
						<b>알림판</b>
						</h5>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
								<!--                   <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li> -->
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="../img/main_image01.jpg" alt="First slide">
								</div>
								<div class="item">
									<img src="../img/main_image02.jpg" alt="Second slide">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"><span class="fa fa-angle-left"></span>
							</a><a class="right carousel-control" href="#carousel-example-generic" data-slide="next"><span class="fa fa-angle-right"></span>
							</a>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-3">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
						<b>날씨 관련 관심도</b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body" style="height: auto;">
						<img id="weather_wc" src="../img/bigdata/wordcloud.PNG" style="max-width: 100%; height: auto;"/>
						<div class="callout callout-info"><b>이미지를 클릭하시면 크게 보입니다.</b></div>
						<span style="float:right;font-size:15px"><label>2017-08-03 기준</label></span>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.col -->
			</div>
			<div class="col-md-3">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
						<b>트렌드 기반 상품 추천</b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="box_pd">
						<div id="prod_div">
						</div>
						</div>	
					</div>
						<!-- /.box-body -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.row -->
			<!-- /.content -->
			<div class="row">
				<img src="../img/test.jpg" style="width: 100%; height: 300px;"/>
			</div>
		</div>
	<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright &copy; 2017 <a href="#">JavaTong(자바통)</a>. </strong> All rights reserved. </footer>
	</div>
	<!-- /.content-wrapper -->


	<div id='pop_up_banner' style='display:none;z-index:4000;'>
		<span class='button b-close' style='border-radius:7px 7px 7px 7px;box-shadow:none;font:bold 131% sans-serif;padding:0 6px 2px;position:absolute;right:-7px;top:-7px; background-color:#2b91af; color:#fff; cursor: pointer; display: inline-block; text-align: center;'><span onclick="$('#pop_up_banner').hide();$('#mask').hide()">X</span></span> <!-- 닫기 버튼 (스타일은 알아서 지정) -->
		<div class='content'><img id="weather_wc" src="../img/bigdata/wordcloud.PNG" /></div> <!-- 컨텐츠가 들어갈 영역 지정 (이미지, html 등.. 여러가지를 동적으로 부를수 있다. -->
	</div>
	<div id="mask"></div> 

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
	</body>
	</html>