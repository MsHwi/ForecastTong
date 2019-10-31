<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>예보통 | 빅데이터 기반 날씨정보 제공 사이트</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="../css/page/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/page/ionicons.min.css">
<link rel="stylesheet" href="../css/page/jquery-jvectormap.css">
<link rel="stylesheet" href="../css/page/AdminLTE.min.css">
<link rel="stylesheet" href="../css/page/_all-skins.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">
#loading {
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

#loading-image {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}

.zc-ref {
  display: none;
}

</style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div id="loading">
		<img id="loading-image" src="../img/loading.gif" alt="Loading..." />
	</div>
	<div class="wrapper">
		<header class="main-header">
			<!-- 로고 부분 -->
			<!-- 화면 조정 시 로고 -->
			<a href="/member/gotoMain" class="logo"><span class="logo-mini"><img
					src="../img/logo_icon.png" style="width: 30px; height: 30px;" /></span> <!-- 정상 시 로고 -->
				<span class="logo-lg"><img src="../img/logo_icon.png"
					style="width: 30px; height: 30px;" /><b>Forecast</b>Tong</span></a>
			<!-- 상단바 부분 -->
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"><i class="fa fa-bars-lg" aria-hidden="true"></i><span
					class="sr-only">Toggle navigation</span></a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- 세션을 받아와서 회원가입 or 회원정보 표기 확인  -->
						<c:if test="${!empty sessionScope.login.getU_NAME()}">
							<li class="dropdown user user-menu">
							<li class="dropdown user user-menu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <c:if
										test="${empty sessionScope.login.getU_PICTURE()}">
										<img src="../img/none.png" class="user-image" alt="User Image"
											style="width: 25px; height: 25px" />
										<span class="hidden-xs"><b>&nbsp;${sessionScope.login.getU_NAME()}</b></span></a>
								<ul class="dropdown-menu">
									<li class="user-header"><img src="../img/none.png"
										class="img-circle" alt="User Image"
										style="width: 100px; height: 100px" />
										<p>
											<b>[${sessionScope.login.getU_NAME()}] 회원님, 안녕하세요?</b>
										</p></li>
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
							<img
								src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}"
								class="user-image" alt="User Image"
								style="width: 25px; height: 25px" />
							<span class="hidden-xs"><b>
									&nbsp;${sessionScope.login.getU_NAME()}</b></span>
							</a>
							<ul class="dropdown-menu">
								<li class="user-header"><img
									src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}"
									class="img-circle" alt="User Image"
									style="width: 100px; height: 100px" />
									<p>
										<b> [${sessionScope.login.getU_NAME()}] 회원님, 안녕하세요? </b>
									</p></li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="../member/edit.jsp" class="btn btn-default btn-flat">이미지
											변경</a>
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
							<li><a href="" data-toggle="modal"
								data-target="#modal-default"><b>로그인</b></a></li>
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
							<img src="../img/none.png" class="img-circle" alt="User Image" />
						</c:if>
						<c:if test="${!empty sessionScope.login.getU_PICTURE()}">
							<img
								src="../img/${sessionScope.login.getU_NAME()}_${sessionScope.login.getU_PICTURE()}"
								class="img-circle" alt="User Image" />
						</c:if>
					</div>
					<div class="pull-left info">
						<c:if test="${!empty sessionScope.login.getU_NAME()}">
							<p>${sessionScope.login.getU_NAME()}</p>
							<a href="#"><i class="fa fa-circle text-success"></i>Online</a>
						</c:if>
						<c:if test="${empty sessionScope.login.getU_NAME()}">
							<p>로그인이 필요합니다</p>
							<a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
						</c:if>
					</div>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header"><b>메인 카테고리</b></li>
					<li class="active treeview menu-open"><a href="#"><i
							class="fa fa-bullhorn"></i><span>예보</span><span
							class="pull-right-container"><i
								class="fa fa-angle-left pull-right"></i> </span> </a>
						<ul class="treeview-menu">
							<li><a href="/member/gotoAllfcst"><i
									class="fa fa-circle-o"></i>종합예보</a></li>
							<li><a href="/lifefc/"><i class="fa fa-circle-o"></i>생활기상지수</a></li>
						</ul></li>
					<li class="treeview"><a href="#"><i
							class="fa fa-pie-chart"></i><span>빅데이터 분석</span><span
							class="pull-right-container"><i
								class="fa fa-angle-left pull-right"></i> </span> </a>
						<ul class="treeview-menu">
							<li><a href="/bigdata/byelement_analyze"><i
									class="fa fa-circle-o"></i> 요소별 분석</a></li>
							<li><a href="/bigdata/statistical_analysis"><i
									class="fa fa-circle-o"></i> 통계분석 결과</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-th"></i><span>App
								소개</span><span class="pull-right-container"><small
								class="label pull-right bg-green">new</small> </span> </a></li>
					<li class="treeview"><a href="#"><i class="fa fa-bullhorn"></i><span>고객의
								소리</span><span class="pull-right-container"><i
								class="fa fa-angle-left pull-right"></i> </span> </a>
						<ul class="treeview-menu">
							<li><a href="/ForecastTong/BoardList.do"><i
									class="fa fa-circle-o"></i>공지사항</a></li>
							<li><a href=""><i class="fa fa-circle-o"></i>Q&A</a></li>
						</ul></li>
					<c:if test="${!empty sessionScope.login.getU_NAME()}">
						<li class="treeview"><a href="#"><i class="fa fa-child"></i>
								<span>마이페이지</span><span class="pull-right-container"><i
									class="fa fa-angle-left pull-right"></i> </span> </a>
							<ul class="treeview-menu">
								<li class="preventClick"><a href="../member/edit.jsp"><i
										class="fa fa-circle-o"></i>회원정보 수정</a></li>
								<li class="preventClick"><a href=""><i
										class="fa fa-circle-o"></i>회원탈퇴</a></li>
							</ul></li>
					</c:if>
				</ul>
			</section>
		</aside>
	<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h4>
					<b>집중호우 관련 통계 분석</b>
				</h4>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">고객의 소리</a></li>
					<li class="active">공지사항</li>
				</ol>
			</section>
			
	<section class="content">
      <div class="row">
        <div class="col-md-12">
          <!-- AREA CHART -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><b>온도 빅데이터</b></h3>
            </div>
            <div class="box-body">
				
          	</div>
          <!-- /.box -->
          </div>
        </div>
        <!-- /.col (LEFT) -->
      </div>
      <!-- /.row -->
    </section>
		
	</div>
	<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2017 <a href="#">JavaTong(자바통)</a>.
			</strong> All rights reserved.
	</footer>
	<!-- /.content-wrapper -->

	<!-- 로그인 모달창  -->
	<div class="modal fade" id="modal-default">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<b>로그인</b>
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/member/loginsuccess"
						method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="loginEmail"
										name="U_EMAIL" placeholder="이메일">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="loginPassword"
										name="U_PWD" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" id="keep_login">이메일
											저장 </label>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box-footer -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
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
	<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
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
		});
		
		})
		
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
	<!-- SlimScroll -->
	<script src="../js/jquery.slimscroll.min.js"></script>
	<!-- ChartJS -->
	<!-- 	<script src="bower_components/Chart.js/Chart.js"></script> -->
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../js/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../js/demo.js"></script>
</body>
</html>