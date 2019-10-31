<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>예보통 | 빅데이터 기반 날씨정보 제공 사이트</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="../css/page/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="../css/page/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="../css/page/jquery-jvectormap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../css/page/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../css/page/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
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
			<li><a href="../forecast/overall_weather.jsp"><i class="fa fa-circle-o"></i>종합예보</a></li>
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
<!-- 회원가입 메뉴 -->

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1><b>회원가입 페이지</b></h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">회원가입</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">회원가입 Form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" id="JoinForm" action="/upload/join" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label for="InputEmail">이메일 주소 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="CheckemailMsg" style="color:red;"></span></label><br/>
                  <input type="email" class="form-control" id="InputEmail" name="U_EMAIL" placeholder="이메일 주소" style="width:86%;float:left;"><span>
                      <button type="button" class="btn btn-primary" onclick="duplic_check();">중복 확인</button>
                   </span>
                </div>
                <div class="form-group">
                  <label for="InputPassword">비밀번호  <code>영문, 숫자 혼합하여 6~20자리 이내 </code></label>
                  <input type="password" class="form-control" id="InputPassword" placeholder="비밀번호" maxlength="20">
                </div>
                <div class="form-group">
                  <label for="InputPasswordconfirm">비밀번호 재확인 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="CheckpwMsg" style="color:red;"></span></label>
                  <input type="password" class="form-control" id="InputPasswordconfirm" name="U_PWD"  placeholder="비밀번호 재확인" maxlength="20">
                </div>
                <div class="form-group">
                  <label for="InputName">이름</label>
                  <input type="text" class="form-control" id="InputName" name="U_NAME" placeholder="이름" maxlength="17">
                </div>
                <div class="form-group">
                  <label for="InputPhonenum">핸드폰 번호 <code> 하이픈(-)은 제외하고 입력</code></label>
                  <input type="number" class="form-control" id="InputPhonenum" name="U_PHONENUM" placeholder="핸드폰 번호"  maxlength="11" oninput="maxLengthCheck(this)" />
                </div>
                <div class="form-group">
                	<label for="InputGender">성별</label><br/>
                	<label>
                      <input type="radio" name="U_GENDER" id="RadioMale" value="M" checked>
                     남자
                    </label>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<label>
                      <input type="radio" name="U_GENDER" id="RadioFemale" value="F">
                     여자
                    </label>
                </div>
               <div class="form-group">
                <label>생일</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker" name="U_BIRTH">
                </div><br/>
                <div class="form-group">
                <label>프로필 사진</label>
                  <input type="file" name="U_PICTURE" id="inputPicture" />
                  <p class="help-block"> 1MB 이내의 크기의 사진(gif, jpg, jpeg, png)만 가능합니다.</p>
              </div>
              </div>
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">회원가입</button>
              </div>
            </form>
          </div>
            </div>
          </div>
        </div>
      </div>

	<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright &copy; 2017 <a href="https://adminlte.io">JavaTong(자바통)</a>. </strong> All rights reserved. </footer>
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
					<form class="form-horizontal" action="../Login.do" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="loginEmail" name="loginEmail" placeholder="이메일">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="비밀번호">
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
	</div>
	<!-- jQuery 3 -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../js/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../js/adminlte.min.js"></script>
	<!-- Sparkline -->
	<script
		src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap  -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS -->
	<script src="bower_components/Chart.js/Chart.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../js/jquery.inputmask.js"></script>
	<script src="../js/jquery.inputmask.date.extensions.js"></script>
	<script src="../js/jquery.inputmask.extensions.js"></script>
	<script src="../js/bootstrap-datepicker.min.js"></script>
	<script>
  $(function () {
    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

    //Date picker
    $('#datepicker').datepicker({
    	autoclose: true
    })

	$('#InputPasswordconfirm').keyup(function(){
	    if($('#InputPassword').val() != $('#InputPasswordconfirm').val()){
			$('#CheckpwMsg').text("");
			$('#CheckpwMsg').html("<b>[입력한 비밀번호가 서로 틀립니다.]</b>");
		}else{
			var reg_password = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			if(!reg_password.test($("#InputPasswordconfirm").val())) {
				$('#CheckpwMsg').text("[비밀번호는 반드시 영문, 숫자 혼합하여 6~20자리 이내여야 합니다.]");
			 } else {
			$('#CheckpwMsg').text("");
			$('#CheckpwMsg').text("[값이 맞습니다. 회원가입이 가능합니다.]");
			}
		}
	});
	
	$('#InputPassword').keyup(function(){
		if($('#InputPassword').val() != $('#InputPasswordconfirm').val()){
			$('#CheckpwMsg').text("");
			$('#CheckpwMsg').html("<b>[입력한 비밀번호가 서로 틀립니다.]</b>");
		}
		var reg_password = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if(!reg_password.test($("#InputPassword").val())) {
			$('#CheckpwMsg').text("[비밀번호는 반드시 영문, 숫자 혼합하여 6~20자리 이내여야 합니다.]");
		 } 
	});
	
	$("#JoinForm").submit( function() {
// 		alert("공백 유효성 검사 시작");		
		if ($("#InputEmail").val() == "") {
			alert('이메일을 입력해 주세요.');
			$("#InputEmail").focus();
			return false;
        } else if($("#InputPasswordconfirm").val() == "") {
			alert('비밀번호를 입력해 주세요.');
			$("#InputPasswordconfirm").focus(); InputName
			return false;
		} else if($("#InputName").val() == "") {
			alert('이름을 입력해 주세요.');
			$("#InputName").focus();
			return false;
		} else if($("#InputPhonenum").val() == "") {
			alert('핸드폰 번호을 입력해 주세요.');
			$("#InputPhonenum").focus();
			return false;
		} else if($("#datepicker").val() == "") {
			alert('생일을 입력해 주세요.');
			return false;
		} else if($('#CheckemailMsg').text().indexOf("동일한") != -1) {
			alert('동일한 이메일로 가입하실 수 없습니다.');
			return false;
		} else if($('#CheckemailMsg').text().indexOf("있습니다") == -1) {
			alert('이메일 중복 확인을 하시기 바랍니다.');
			return false;
		} else if($('#CheckpwMsg').text().indexOf("이내여야") != -1 || $('#CheckpwMsg').text().indexOf("틀립니다") != -1) {
			alert('비밀번호를 다시 한번 확인해 주세요.');
			return false;
		} else {
			alert('회원가입이 완료되었습니다.');
		}
	});
	
	$("#inputPicture").change(function(){
	    // 필드 채워지면
	    if($(this).val() != ""){
	        // 확장자 체크
	            var ext = $(this).val().split(".").pop().toLowerCase();
	            if($.inArray(ext, ["gif","jpg","jpeg","png"]) == -1){
	                alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
	                $(this).val("");
	                return;
	            }
	            // 용량 체크
	            var fileSize = this.files[0].size;
	            var maxSize = 1024 * 1024;
	            if(fileSize > maxSize){
	                alert("파일용량 1MB을 초과했습니다.");
	                $(this).val("");
	            }
	            
	            // 가로,세로 길이
	            var file = this.files[0];
	            var _URL = window.URL || window.webkitURL;
	            var img = new Image();
	             
	            img.onload = function() {
	               alert(img.width + " " + img.height);
	                $("#img_width").val(img.width);
	                $("#img_height").val(img.height);
	            }
	    }
	});	
  })
  
  function duplic_check() {	  
	  var reg_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	  
	  if ($("#InputEmail").val() == "") {
		alert('이메일을 입력해 주세요.');
		$("#InputEmail").focus();
		return false;
	  } else if(!reg_email.test($("#InputEmail").val())) {
		  alert('이메일의 형식이 유효하지 않습니다.');
	  } else {
		alert("중복 확인 시작: "+$('#InputEmail').val());
		url = "/member/dupliccheck?user_email=" + $('#InputEmail').val();
		$('#CheckemailMsg').load(url);	
	  }  
  }
  
  function maxLengthCheck(object){
	   if (object.value.length > object.maxLength){
	    object.value = object.value.slice(0, object.maxLength);
	   }    
  }
  
</script>
</body>
</html>
