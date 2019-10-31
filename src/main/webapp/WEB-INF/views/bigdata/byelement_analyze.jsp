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
					<b>날씨 빅데이터 요소별 분석</b>
				</h4>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">고객의 소리</a></li>
					<li class="active">공지사항</li>
				</ol>
			</section>
			
	<section class="content">
      <div class="row">
        <div class="col-md-6">
          <!-- AREA CHART -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><b>온도 빅데이터</b></h3>
            </div>
            <div class="box-body">
              <div class="chart">
              	<div id='tempChart' style="max-width: 100%; height: auto;"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </div>

          <!-- DONUT CHART -->
          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title"><b>바람 빅데이터</b></h3>
            </div>
            <div class="box-body" style="max-width: 100%; height: auto;">

              <table class="table table-bordered">
              <tr><th>연도</th><th>2010</th><th>2011</th><th>2012</th><th>2013</th><th>2014</th><th>2015</th><th>2016</th></tr>
              <tr id="windpow_row"><th>풍속(평균)</th></tr>
              <tr id="winddir_row"><th>풍향(최빈)</th></tr>
              </table>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col (LEFT) -->
        <div class="col-md-6">
          <!-- LINE CHART -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"><b>강수량 빅데이터</b></h3>
            </div>
            <div class="box-body">
              <div class="chart">
              	<div id='rsChart' style="max-width: 100%; height: auto;"></div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- BAR CHART -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><b>습도/일사량/일조량 빅데이터</b></h3>
            </div>
            <div class="box-body" style="max-width: 100%; height: auto;">
              <table class="table table-bordered">
              <tr><th>연도</th><th>2010</th><th>2011</th><th>2012</th><th>2013</th><th>2014</th><th>2015</th><th>2016</th></tr>
              <tr id="humid_row"><th>습도</th></tr>
              <tr id="ilsa_row"><th>일사량(총)</th></tr>
              <tr id="iljo_row"><th>일조량(총)</th></tr>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
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

		// 기본적인 그래프 설정
		// title: 그래프 제목, data: 그래프 수치, varname: 변수이름
		
		function setConfig(title, data, varname, min, max, interval, num) {
			if(num==1) {
			var myConfig = 
			{"type": "line","background-color": "#003849","utc": true,
		    	"title": {"y": "7px",
		                "text": title,												// 제목 변수 설정해야 함
		                "background-color": "#003849", "font-size": "24px", "font-color": "white",  "height": "25px"
		            },
		        "plotarea": {"margin": "20% 8% 14% 12%", "background-color": "#003849"},
		        "legend": {"layout": "float", "background-color": "none", "border-width": 0,  "shadow": 0, "width":"75%",
		                "text-align":"middle", "x":"25%", "y":"10%", "item": {"font-color": "#f6f7f8","font-size": "14px"}
		            },
		        "scale-x": {"min-value": 1262332800000, "shadow": 0, "step": 32850000000, "line-color": "#f6f7f8",
		                "tick": {"line-color": "#f6f7f8"}, "guide": {"line-color": "#f6f7f8"}, "item": {"font-color": "#f6f7f8"},
		                "transform": {"type": "date", "all": "%Y", "guide": {"visible": false}, "item": {"visible": false}},
		                "label": {"visible": false}, "minor-ticks": 0
		            },
		        "scale-y": {
		        		"values": min+":"+max+":"+interval,									// 최대치를 두번째 변수에 할당
						"line-color": "#f6f7f8", "shadow": 0, "tick": {"line-color": "#f6f7f8"},
		                "guide": {"line-color": "#f6f7f8", "line-style": "dashed"},"item": {"font-color": "#f6f7f8"},
		                "label": {
		                    "text": title,
		                    "font-color": "#f6f7f8"
		                },
		                "minor-ticks": 0, "thousands-separator": ","
		            },
		         "crosshair-x": {"line-color": "#f6f7f8", "plot-label": {"border-radius": "5px",  "border-width": "1px",
		                    "border-color": "#f6f7f8",  "padding": "10px", "font-weight": "bold"},
		                	"scale-label": {"font-color": "#00baf0", "background-color": "#f6f7f8", "border-radius": "5px"}
		            },
		         "tooltip": {"visible": false},
		            	"plot": {"tooltip-text": "%t views: %v<br>%k", "shadow": 0, "line-width": "3px",
		                "marker": {"type": "circle", "size": 5},
		                "hover-marker": {"type": "circle","size": 6,"border-width": "2px"}
		            },
		         "series": [
		                {
		                    "values": data[0],
		                    "text": varname[0],									// 첫번째 변수명
		                    "line-color": "#009872",
		                    "legend-marker": {"type": "circle", "size": 5, "background-color": "#009872", "border-width": 1,
		                        "shadow": 0, "border-color": "#69dbf1"
		                    },
		                    "marker": {  "background-color": "#009872", "border-width": 1,  "shadow": 0, "border-color": "#69dbf1"
		                    }
		                },
		                {
		                    "values": data[1],
		                    "text": varname[1],
		                    "line-color": "#da534d",
		                    "legend-marker": {"type": "circle", "size": 5, "background-color": "#da534d", "border-width": 1,
		                        "shadow": 0, "border-color": "#69f2d0"
		                    },
		                    "marker": { "background-color": "#da534d",  "border-width": 1, "shadow": 0, "border-color": "#69f2d0"
		                    }
		                },
		                {
		                    "values": data[2],
		                    "text": varname[2],
		                    "line-color": "#007790",
		                    "legend-marker": {  "type": "circle", "size": 5,  "background-color": "#007790", "border-width": 1,
		                        "shadow": 0, "border-color": "#faa39f"
		                    },
		                    "marker": { "background-color": "#007790", "border-width": 1, "shadow": 0, "border-color": "#faa39f"
		                    }
		                }
		            ]
		        };
			} else if(num==2) {
				var myConfig = {type: 'mixed', 
					 	title: {
					 	  text: title,
					 	  align: 'center', fontSize: 22
					 	},
					 	legend: { Align: 'center', verticalAlign: 'bottom', adjustLayout: true},
					 	scaleX: {labels: ['2010', '2011', '2012', '2013', '2014', '2015', '2016'],},
					 	scaleY: {minValue: 1000, maxValue: 3600, step: 200, guide: {visible: false}},
					 	scaleY2: {minValue: 20, maxValue: 150, step: 20},
					 	crosshairX:{lineColor : '#424242', lineStyle: 'dotted', lineGapSize: '4px',
					 	  	plotLabel: {backgroundColor : "white", borderColor : "#e3e3e3", borderRadius : "5px", bold : true, fontSize : "12px",
						    fontFamily:"Lato", fontColor : "#2f2f2f", textAlign : 'right', padding : '15px', shadow : true, shadowAlpha : 0.2,
						    shadowBlur : 5, shadowDistance : 4,  shadowColor : "#a1a1a1", textAlign:'left'},
					    	scaleLabel:{backgroundColor:'#424242'}},
						series: [
							{
							  type: 'line', 
							  values: data[0], text: '일강수량', 
							  lineColor: '#42a5f5', marker: {visible: 'false'}, scales: 'scale-x, scale-y', zIndex: 2
							},
							{
							  type: 'bar',
							  values: data[1], text: '최심적설량', backgroundColor: '#ffa726', scales: 'scale-x, scale-y-2', zIndex: 1
							}
						]
					};
			} 
			return myConfig;
		}
	
	
		zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
		zingchart.THEME="classic";
	
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
		
		// 빅데이터 Bean에서 온도 관련 데이터만 추출하여 차트로 그리기
		
		$(function() {	
			$.ajax({
				type : "GET",
				url : "/bigdata/makeTempChart",
				dataType : "json",
				success:function(responseData, textStatus, xhr) {	
					var varname = ["평균온도", "최고온도", "최저온도"];			
					var minvalue = -40;
					var maxvalue = 50;
					var intervalue = 10; 
					var data = [responseData.avg_temp,responseData.max_temp,responseData.min_temp];
					var myConfig = setConfig("연도별 온도", data, varname, minvalue, maxvalue, intervalue, 1);
					zingchart.render({id : 'tempChart', data : myConfig});
				},
				error : function(request, status) {
					alert("차트 그리기에 실패했습니다.");
				}
			});
			
			$.ajax({
				type : "GET",
				url : "/bigdata/makeRSChart",
				dataType : "json",
				success:function(responseData, textStatus, xhr) {	
					var varname = ["일강수량", "최심적설"];			
					var minvalue = 0;
					var maxvalue = 120;
					var intervalue = 10; 
					var data = [responseData.daily_rain,responseData.most_snow];
					var myConfig = setConfig("연도별 강수량/적설량", data, varname, minvalue, maxvalue, intervalue, 2);
					zingchart.render({id : 'rsChart', data : myConfig});
				},
				error : function(request, status) {
					alert("차트 그리기에 실패했습니다.");
				}
			});
			
			$.ajax({
				type : "GET",
				url : "/bigdata/makeWindChart",
				dataType : "json",
				success:function(responseData, textStatus, xhr) {	
		
					var windpow_data = JSON.stringify(responseData.avg_wind).replace("[","").replace("]","");
					var windpow_dataArr = windpow_data.split(',');
					
					var winddir_data = JSON.stringify(responseData.most_winddir).replace("[","").replace("]","");
					var winddir_dataArr = winddir_data.split(',');
									
					for (var i = 0; i <= 6; i++) {
												
						$("#windpow_row").append("<td>" + windpow_dataArr[i] + "m/s</td>");
						$("#winddir_row").append("<td>" + winddir_dataArr[i] + "</td>");
					}
					
					$("#winddir_row > td").each(function(index) {
						var winddir = "";
						var windir_Value = $(this).text();
												
						if (windir_Value == 0 || windir_Value == 360) {
							var windir = "N";
						} else if (windir_Value > 0 && windir_Value < 90) {
							var windir = "NE";
						} else if (windir_Value == 90) {
							var windir = "E";
						} else if (windir_Value > 90 && windir_Value < 180) {
							var windir = "SE";
						} else if (windir_Value == 180) {
							var windir = "S";
						} else if (windir_Value > 180 && windir_Value < 270) {
							var windir = "SW";
						} else if (windir_Value == 270) {
							var windir = "W";
						} else if (windir_Value > 270 && windir_Value < 360) {
							var windir = "NW";
						}
						$(this).html("<img src='../img/eight_dir/"+windir+".gif' />");
					});

				},
				error : function(request, status) {
					alert("테이블 작성에 실패했습니다.");
				}
			});
			
			$.ajax({
				type : "GET",
				url : "/bigdata/makeHIChart",
				dataType : "json",
				success:function(responseData, textStatus, xhr) {	
					var humid_data = JSON.stringify(responseData.avg_humid).replace("[","").replace("]","");
					var humid_dataArr = humid_data.split(',');
					
					var sum_ilsa = JSON.stringify(responseData.sum_ilsa).replace("[","").replace("]","");
					var sum_ilsa_dataArr = sum_ilsa.split(',');
					
					var sum_iljo = JSON.stringify(responseData.sum_iljo).replace("[","").replace("]","");
					var sum_iljo_dataArr = sum_iljo.split(',');
					
					for (var i = 0; i <= 6; i++) {
												
						$("#humid_row").append("<td>" + humid_dataArr[i] + "</td>");
						$("#ilsa_row").append("<td>" + sum_ilsa_dataArr[i] + "</td>");
						$("#iljo_row").append("<td>" + sum_iljo_dataArr[i] + "</td>");
					}
				},
				error : function(request, status) {
					alert("차트 그리기에 실패했습니다.");
				}
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